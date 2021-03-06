﻿//using Chat.Data;
using Chat.Models;
using Chat.Repository;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Chat.Repositories
{
    public class UserRepository : IRepository<User>
    {
        private DbContext context;
        private DbSet<User> entitySet;

        public UserRepository(DbContext dbContext)
        {
            if (dbContext == null)
            {
                throw new ArgumentException("An instance of DbContext is required to use this repository.", "context");
            }

            this.context = dbContext;
            this.entitySet = this.context.Set<User>();
        }

        public User Add(User entity)
        {
            var dbUser = this.entitySet.FirstOrDefault(u => u.Username == entity.Username || u.Nickname == entity.Nickname);

            if (dbUser != null)
            {
                if (dbUser.Username == entity.Username)
                {
                    throw new ServerErrorException("Username already exists");
                }
                else
                {
                    throw new ServerErrorException("Nickname already exists");
                }
            }

            this.entitySet.Add(entity);
            this.context.SaveChanges();

            return entity;
        }

        public User LoginUser(User entity)
        {
            var user = this.entitySet.FirstOrDefault(u => u.Username == entity.Username && u.Password == entity.Password);

            if (user == null)
            {
                throw new ServerErrorException("Username or Password Invalid","username/password");
            }

            this.Update(user.Id, user);
            
            return user;
        }

        public int LoginUserKey(string sessionKey)
        {
            var user = this.entitySet.FirstOrDefault(u => u.SessionKey == sessionKey);
            if (user == null)
            {
                throw new ServerErrorException("User not found","sessionKey");
            }

            return (int)user.Id;
        }

        public void LogoutUser(string sessionKey)
        {
            var user = this.entitySet.FirstOrDefault(u => u.SessionKey == sessionKey);
            if (user == null)
            {
                throw new ServerErrorException("Logout failed. User not logged or not found", "sessionKey");
            }
            user.SessionKey = null;
            context.SaveChanges();
        }

        public User Update(int id, User entity)
        {
            var sessionKey = GenerateSessionKey((int)entity.Id);
            entity.SessionKey = sessionKey;
            context.SaveChanges();

            return entity;
        }

        public void UpdateImageUrl(string sessionKey, string url)
        {
            var user = this.entitySet.FirstOrDefault(u => u.SessionKey == sessionKey);
            if (user == null)
            {
                throw new ServerErrorException("Updating User image failed.", "sessionKey");
            }
            user.ImageUrl = url;

            context.SaveChanges();
        }

        public void Delete(int id)
        {
            var user = this.entitySet.FirstOrDefault(u => u.Id == id);

            if (user == null)
            {
                throw new ServerErrorException("Deleting User failed. User not found.", "id");
            }

            this.entitySet.Remove(user);
            this.context.SaveChanges();
        }

        public User Get(int id)
        {
            var user = this.entitySet.FirstOrDefault(u => u.Id == id);
            if (user == null)
            {
                throw new ServerErrorException("Getting user failed. User not found.", "id");
            }

            return user;
        }

        public IQueryable<User> All()
        {
            var users = from user in this.entitySet
                        where user.SessionKey != null
                        select user;

            return users;
        }

        private static string GenerateSessionKey(int userId)
        {
            int SessionKeyLen = 50;
            string SessionKeyChars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
            Random rand = new Random();
            StringBuilder keyChars = new StringBuilder(50);
            keyChars.Append(userId.ToString());
            while (keyChars.Length < SessionKeyLen)
            {
                int randomCharNum;
                lock (rand)
                {
                    randomCharNum = rand.Next(SessionKeyChars.Length);
                }
                char randomKeyChar = SessionKeyChars[randomCharNum];
                keyChars.Append(randomKeyChar);
            }
            string sessionKey = keyChars.ToString();
            return sessionKey;
        }
    }
}
