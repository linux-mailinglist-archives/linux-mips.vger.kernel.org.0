Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EEC3ED2F63
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2019 19:15:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726679AbfJJRPM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 10 Oct 2019 13:15:12 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:43751 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726664AbfJJRPM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 10 Oct 2019 13:15:12 -0400
Received: by mail-lj1-f195.google.com with SMTP id n14so6978396ljj.10
        for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2019 10:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bqvz+afB1Rg3ieCrlwoBKML7ipcOdiXJ/q/XXxTUovI=;
        b=Xol/3a0t0AtCulvKJeuAKS1uo5PWCjeyeDeHYLSA1FXKSnOkgSTF276gwVNHa4nPiN
         l58RJ3zV8SDjz5HcQUbk/k9PwAg2ytkBSxmhuzf7L/EFmiieyqeQcJuKFBVQbWUjfXE1
         U4t1RhqK0BT10C1Atodrl5m0eWGZPM7fTB2Dk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bqvz+afB1Rg3ieCrlwoBKML7ipcOdiXJ/q/XXxTUovI=;
        b=RNbPSGXP+Lt5bjeLpkP0bJfYaZssEGvOhbLLxx8p3OeuVIIuElZD0cNua9z9xpMIZb
         mPzDqZHDYwVTo83mNltEZqAhW5P0z9D2sdWdg3EUzVpO25uutUOhUxvZBonf+pVROuJM
         AYla63xysjK6j/6rKICP5dWTDEYVoWLvNFDAUTgNK8z5vaAnk7qb0nVOn6JXvxaLFWdJ
         FY6E76J1rGr0xaF5d2F0qFElYA2y1A/xYB6TZecpounq9fOBKAHldT6BbRI6w8MsbUa1
         R34kZ4WR0kBjDxkA0Z13AOB8IioyFZcMgZ1H4Aix8jb7kikl4tPV5gBDScuvhp6aE1tI
         pucg==
X-Gm-Message-State: APjAAAWJsTawtbC3VEG+OsOtV43Uf1019eIJrup/l34kShyYbOqe6N6K
        nSMt4mBu5pxSRXswp3xPDhWACPXxInU=
X-Google-Smtp-Source: APXvYqzpcZQyDTNJaUPGAW5pOFDkVtA3qqZTORA6SM0jfbz5wjyO5LoX6uCRmbf/bveqK8Qc7uebkA==
X-Received: by 2002:a2e:9d83:: with SMTP id c3mr7064272ljj.237.1570727708862;
        Thu, 10 Oct 2019 10:15:08 -0700 (PDT)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com. [209.85.167.43])
        by smtp.gmail.com with ESMTPSA id e21sm1475043lfj.10.2019.10.10.10.15.08
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2019 10:15:08 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id u3so4963929lfl.10
        for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2019 10:15:08 -0700 (PDT)
X-Received: by 2002:a19:f709:: with SMTP id z9mr6611392lfe.170.1570727268603;
 Thu, 10 Oct 2019 10:07:48 -0700 (PDT)
MIME-Version: 1.0
References: <20191010054140.8483-1-cyphar@cyphar.com> <20191010054140.8483-3-cyphar@cyphar.com>
In-Reply-To: <20191010054140.8483-3-cyphar@cyphar.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 10 Oct 2019 10:07:32 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh8L50f31vW8BwRUXhLiq3eoCQ3tg8ER4Yp2dzuU1w5rQ@mail.gmail.com>
Message-ID: <CAHk-=wh8L50f31vW8BwRUXhLiq3eoCQ3tg8ER4Yp2dzuU1w5rQ@mail.gmail.com>
Subject: Re: [PATCH v14 2/6] namei: LOOKUP_IN_ROOT: chroot-like path resolution
To:     Aleksa Sarai <cyphar@cyphar.com>
Cc:     Al Viro <viro@zeniv.linux.org.uk>,
        Jeff Layton <jlayton@kernel.org>,
        "J. Bruce Fields" <bfields@fieldses.org>,
        Arnd Bergmann <arnd@arndb.de>,
        David Howells <dhowells@redhat.com>,
        Shuah Khan <shuah@kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Eric Biederman <ebiederm@xmission.com>,
        Andy Lutomirski <luto@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Jann Horn <jannh@google.com>, Tycho Andersen <tycho@tycho.ws>,
        David Drysdale <drysdale@google.com>,
        Chanho Min <chanho.min@lge.com>,
        Oleg Nesterov <oleg@redhat.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Christian Brauner <christian@brauner.io>,
        Aleksa Sarai <asarai@suse.de>,
        Linux Containers <containers@lists.linux-foundation.org>,
        alpha <linux-alpha@vger.kernel.org>,
        Linux API <linux-api@vger.kernel.org>,
        GNU C Library <libc-alpha@sourceware.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        linux-ia64@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org,
        linux-s390 <linux-s390@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        linux-xtensa@linux-xtensa.org, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Oct 9, 2019 at 10:42 PM Aleksa Sarai <cyphar@cyphar.com> wrote:
>
> --- a/fs/namei.c
> +++ b/fs/namei.c
> @@ -2277,6 +2277,11 @@ static const char *path_init(struct nameidata *nd, unsigned flags)
>
>         nd->m_seq = read_seqbegin(&mount_lock);
>
> +       /* LOOKUP_IN_ROOT treats absolute paths as being relative-to-dirfd. */
> +       if (flags & LOOKUP_IN_ROOT)
> +               while (*s == '/')
> +                       s++;
> +
>         /* Figure out the starting path and root (if needed). */
>         if (*s == '/') {
>                 error = nd_jump_root(nd);

Hmm. Wouldn't this make more sense all inside the if (*s =- '/') test?
That way if would be where we check for "should we start at the root",
which seems to make more sense conceptually.

That test for '/' currently has a "} else if (..)", but that's
pointless since it ends with a "return" anyway. So the "else" logic is
just noise.

And if you get rid of the unnecessary else, moving the LOOKUP_IN_ROOT
inside the if-statement works fine.

So this could be something like

    --- a/fs/namei.c
    +++ b/fs/namei.c
    @@ -2194,11 +2196,19 @@ static const char *path_init(struct
nameidata *nd, unsigned flags)

        nd->m_seq = read_seqbegin(&mount_lock);
        if (*s == '/') {
    -           set_root(nd);
    -           if (likely(!nd_jump_root(nd)))
    -                   return s;
    -           return ERR_PTR(-ECHILD);
    -   } else if (nd->dfd == AT_FDCWD) {
    +           /* LOOKUP_IN_ROOT treats absolute paths as being
relative-to-dirfd. */
    +           if (!(flags & LOOKUP_IN_ROOT)) {
    +                   set_root(nd);
    +                   if (likely(!nd_jump_root(nd)))
    +                           return s;
    +                   return ERR_PTR(-ECHILD);
    +           }
    +
    +           /* Skip initial '/' for LOOKUP_IN_ROOT */
    +           do { s++; } while (*s == '/');
    +   }
    +
    +   if (nd->dfd == AT_FDCWD) {
                if (flags & LOOKUP_RCU) {
                        struct fs_struct *fs = current->fs;
                        unsigned seq;

instead. The patch ends up slightly bigger (due to the re-indentation)
but now it handles all the "start at root" in the same place. Doesn't
that make sense?

             Linus
