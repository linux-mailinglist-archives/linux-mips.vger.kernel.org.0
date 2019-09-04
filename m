Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 343CFA9690
	for <lists+linux-mips@lfdr.de>; Thu,  5 Sep 2019 00:38:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729863AbfIDWim (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 4 Sep 2019 18:38:42 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:43166 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727156AbfIDWim (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 4 Sep 2019 18:38:42 -0400
Received: by mail-lj1-f193.google.com with SMTP id d5so311975lja.10
        for <linux-mips@vger.kernel.org>; Wed, 04 Sep 2019 15:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KFDhCyHzhyiLnyceYcteUHqOXGgh38Kg6TIOg9RDlV8=;
        b=GnnwuO2FC8JvRpMBdQIyMOw63KWp0i8RWU7BAf9vhwmdfauk+kGPRrhGsnlnlPAmBt
         Cx6hzCIVK4L+kzxznEGXiVTPGueSaoLKTwELcbVCO2oVI6bZuWttjzsqT9tZPNkgY/TA
         7QyH0CjS5KTQcx4hIjs9o8ztIuxjlBT486QSI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KFDhCyHzhyiLnyceYcteUHqOXGgh38Kg6TIOg9RDlV8=;
        b=lgD7b6FZ6u2XMsGQk1wNtiU8kKY8x6ObGZq/LcZs3FGEt0Pq1wUyXzGJ1c/rykwTWV
         5DNf6ArdVat3LulQ3iaxMFVHtsIGMlAzmbq4NSHpS6ZuSeb1wJgsfCxacZowOLrGjtXE
         eIvgd9gaJOYQPn3pciWxwLk56E0QE388iztBXHAkuxrr/sL3MV95yDdJDhsA6g2Bzcgh
         OgUhJ5/sN0QskKRwtDOreIXpMfveOUJe3FXo6Ec2fo9EE9z3Vqps7QL+WEJzsAvXNA2A
         94jWI8/9gKDIgNuhH3onkUNKkNNkW9Byhlh0NlJi+M1+THAfn8ohm375R5r2tXhxMJri
         pZgQ==
X-Gm-Message-State: APjAAAXmWJgzAcvZZ7NU/6GUJczdFxK1eZLA5qoHSOXLrJZ9ox48/vgc
        qU6uZXI5irG+cBTAhx92iRK3GyUrNp0=
X-Google-Smtp-Source: APXvYqzNuUcvqr58uLB/Fb38h2rpT4pyT5CcGXTDjH88oTtADYDUyqCb0WOsfFZC4fJ4UswZ91Ct6Q==
X-Received: by 2002:a2e:504f:: with SMTP id v15mr7971ljd.67.1567636719763;
        Wed, 04 Sep 2019 15:38:39 -0700 (PDT)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com. [209.85.208.178])
        by smtp.gmail.com with ESMTPSA id o5sm42408lfn.42.2019.09.04.15.38.37
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2019 15:38:39 -0700 (PDT)
Received: by mail-lj1-f178.google.com with SMTP id x18so364481ljh.1
        for <linux-mips@vger.kernel.org>; Wed, 04 Sep 2019 15:38:37 -0700 (PDT)
X-Received: by 2002:a2e:814d:: with SMTP id t13mr24885ljg.72.1567636715921;
 Wed, 04 Sep 2019 15:38:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190904201933.10736-1-cyphar@cyphar.com> <20190904201933.10736-11-cyphar@cyphar.com>
 <CAHk-=wiod1rQMU+6Zew=cLE8uX4tUdf42bM5eKngMnNVS2My7g@mail.gmail.com>
 <20190904214856.vnvom7h5xontvngq@yavin.dot.cyphar.com> <CAHk-=wgcJq21Hydh7Tx5-o8empoPp7ULDBw0Am-du_Pa+fcftQ@mail.gmail.com>
 <20592.1567636276@warthog.procyon.org.uk>
In-Reply-To: <20592.1567636276@warthog.procyon.org.uk>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 4 Sep 2019 15:38:20 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg7Wq1kj8kZ+SSpfU_o991woW60NWca9yBA2ccs2eNx8Q@mail.gmail.com>
Message-ID: <CAHk-=wg7Wq1kj8kZ+SSpfU_o991woW60NWca9yBA2ccs2eNx8Q@mail.gmail.com>
Subject: Re: [PATCH v12 10/12] namei: aggressively check for nd->root escape
 on ".." resolution
To:     David Howells <dhowells@redhat.com>
Cc:     Aleksa Sarai <cyphar@cyphar.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Jeff Layton <jlayton@kernel.org>,
        "J. Bruce Fields" <bfields@fieldses.org>,
        Arnd Bergmann <arnd@arndb.de>, Shuah Khan <shuah@kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Christian Brauner <christian@brauner.io>,
        Jann Horn <jannh@google.com>,
        Kees Cook <keescook@chromium.org>,
        Eric Biederman <ebiederm@xmission.com>,
        Andy Lutomirski <luto@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Tycho Andersen <tycho@tycho.ws>,
        David Drysdale <drysdale@google.com>,
        Chanho Min <chanho.min@lge.com>,
        Oleg Nesterov <oleg@redhat.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Aleksa Sarai <asarai@suse.de>,
        Linux Containers <containers@lists.linux-foundation.org>,
        alpha <linux-alpha@vger.kernel.org>,
        Linux API <linux-api@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        linux-ia64@vger.kernel.org,
        Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
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

On Wed, Sep 4, 2019 at 3:31 PM David Howells <dhowells@redhat.com> wrote:
>
> It ought to be reasonably easy to make them per-sb at least, I think.  We
> don't allow cross-super rename, right?

Right now the sequence count handling very much depends on it being a
global entity on the reader side, at least.

And while the rename sequence count could (and probably should) be
per-sb, the same is very much not true of the mount one.

So the rename seqcount is likely easier to fix than the mount one, but
neither of them are entirely trivial, afaik.

               Linus
