Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4F65BBB20
	for <lists+linux-mips@lfdr.de>; Mon, 23 Sep 2019 20:18:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440415AbfIWSSk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 23 Sep 2019 14:18:40 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:40127 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2440414AbfIWSSj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 23 Sep 2019 14:18:39 -0400
Received: by mail-lf1-f66.google.com with SMTP id d17so10884183lfa.7
        for <linux-mips@vger.kernel.org>; Mon, 23 Sep 2019 11:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=MZ2lLvVAj8wl/1PRSv9GS/7a80MR0W+vCbBFmNK2zW8=;
        b=VDL1koFlc/i2eabI5QJ87yDehJLeHLeKc+Wn7KTI1jPvb1B2gKWjVqfgjGVTW1Peh7
         VnINX6uNybuSAl/1cyj4c0YZyplLXMytHuGLTEQQC0nBWS6OH8hsZG20SSbmrUZQUcAJ
         boubqvO7pY8gE8wphkLkqxwCDihobZE7QpTKY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=MZ2lLvVAj8wl/1PRSv9GS/7a80MR0W+vCbBFmNK2zW8=;
        b=I7zYiR7Qh9mjIJi1PQvqWxlyHg2Q3iHwP1U5PQ2cYk3Xw83r9zI+E17tEAGGn8KR+X
         CZyWsLwNY7wX41jGUdZxRD6Ynjcoir8SmDkrL1fhoQP+xU+mJDf2ZlAo5YkvDxvp9nES
         X+RSQ+7rAmfEvKeIx0t4ZTNbAIgDKOOf0aJesGH8gAPmY3myzq2zFziMu2HElpJWslYE
         50eiLhFV8qx7Fz8iOky6wrLEGfmAfkyuDTUI5WasC6cdxS+udXPnu4jStjG/T+dv7QCH
         roHDK43Qk3EoHA3TVmvW5MeUrFM2sa8dfOC9b7U5hgv6kwpCZ+9P56fPlr/tef0sKf5I
         HwTg==
X-Gm-Message-State: APjAAAV5+NgDm6buwRQDQxyY2J96R1/RiYJz6clqYSLiutHFn+Umg5R4
        KveGrEq3h5D+Un3VI6Ww/2WkQQN4oQI=
X-Google-Smtp-Source: APXvYqw31puuUw27SQQdrxxyPG0cWWbeAEFM150lAWJ6KUmNUpo3+8oGiW5tz/KEPc2Rccwymy6C3A==
X-Received: by 2002:ac2:568c:: with SMTP id 12mr511065lfr.133.1569262717151;
        Mon, 23 Sep 2019 11:18:37 -0700 (PDT)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id e21sm2382130lfj.10.2019.09.23.11.18.35
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Sep 2019 11:18:36 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id 7so14698345ljw.7
        for <linux-mips@vger.kernel.org>; Mon, 23 Sep 2019 11:18:35 -0700 (PDT)
X-Received: by 2002:a2e:8789:: with SMTP id n9mr447393lji.52.1569262715339;
 Mon, 23 Sep 2019 11:18:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190921231022.kawfomtmka737arq@pburton-laptop>
 <CAHk-=wjmJbF3p9vZTW2nbeD4LkG-JZV+uqv8BnxzojJ5SZsLjw@mail.gmail.com> <20190923180728.flp6jx4jc2bh7cys@pburton-laptop>
In-Reply-To: <20190923180728.flp6jx4jc2bh7cys@pburton-laptop>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 23 Sep 2019 11:18:19 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiC_B8R6th+83vKwGT1H-8vtFrmMg+1mK_P8n3VeWAWRg@mail.gmail.com>
Message-ID: <CAHk-=wiC_B8R6th+83vKwGT1H-8vtFrmMg+1mK_P8n3VeWAWRg@mail.gmail.com>
Subject: Re: [GIT PULL] MIPS changes
To:     Paul Burton <paul.burton@mips.com>,
        David Howells <dhowells@redhat.com>,
        Al Viro <viro@zeniv.linux.org.uk>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Sep 23, 2019 at 11:07 AM Paul Burton <paul.burton@mips.com> wrote:
>
> Another issue is that there are currently 'expected' warnings dotted
> through the tree for various defconfigs

This is why I refuse to have _any_ warnings at all in my tree during
the merge window.

If you have expected warnings, you will ignore the new and valid ones.
So the only acceptable situation is "no warnings".

In honesty, I actually do have one warning in my tree:

  samples/vfs/test-statx.c:24:15: warning: =E2=80=98struct foo=E2=80=99 dec=
lared
inside parameter list will not be visible outside of this definition
or declaration
     24 | #define statx foo
        |               ^~~

but because it's in the sample code, it pretty much never gets rebuilt
for me unless I basically do a "git clean" to get rid of everything,
so I don't normally see it for any normal pull.

So I've ignored that one warning, although I've actually been tempted
to just remove the sample because of it.

Adding David and Al to the cc just in case they have some simple fixup
for it that is likely to work across different user headers.

I considered just adding a

     struct foo;

declaration, but the whole thing is incredibly ugly.

                  Linus
