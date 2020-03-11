Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94F91181565
	for <lists+linux-mips@lfdr.de>; Wed, 11 Mar 2020 10:59:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728195AbgCKJ7Z (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 11 Mar 2020 05:59:25 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:40887 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726934AbgCKJ7Z (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 11 Mar 2020 05:59:25 -0400
Received: by mail-ot1-f66.google.com with SMTP id h17so1289788otn.7;
        Wed, 11 Mar 2020 02:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=w1JByWKdTvEc/E0ydHa6YNi6oG8qJB8lqqm0yGUUYU8=;
        b=J4tfXdUXj7O71TJm0BSRYezV4F23iyqsoosYX1Hq7+8Y7Gtf1/3nfCxW81jU5Ecweg
         UvEymHM7nXXqeUZEVG/2roDgsqIuuX8FYkFcq8EHQX82SZAOvvg4Qj/jRWRYVHX4dTPM
         cB9gxAWrfl6eF6TQYAmRjD1eU5j8ETyQbMS1ThW4DQkyDP2/AO5H+utX9TlkLwusFUMD
         8xMGERwS0bGmBHsijZZKd6VDHKjA4mtqoy0INFCmGGmJO+SS4n+Zqg7dyPASsyehFMta
         9WikdX0n0Kw3n4U/2wYM+s3lGmUjTTEOlJYBXFsN0dmz+Kfm5B7BVy7EPlXqtAbKVhRX
         kHnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w1JByWKdTvEc/E0ydHa6YNi6oG8qJB8lqqm0yGUUYU8=;
        b=eqfH9wMbaSbw6mPwWbfdvmbg7R3SGVTiOs+9nF2MEm+ZkdqUS4o5PJAOMO/zrHnZbS
         SnaUMslOc6FFReeaxdr/rKQs3+3geItwN23yGd+WbDoQdnF9UKN/hMjjGOOqrXxuus3/
         5v1SfsiLMALk6ph9CJyGbdq3lYyJ+JQF28fgpu6iKt4hQ2IbiKatJlHmf6DT9SF08b/N
         IBuO8JYY/oJcrFHvG9k6CWFA2Tn+/hktmH/mAGzoRomcA+eutUHUgEWMDgIEVb5gOldk
         WzHW2NybvPK5aLI5TRoxt+1EYbATdN/z+lc1r6Cy51GYQk8wDpScrLu6S4r+ac/kZ1lZ
         LBpQ==
X-Gm-Message-State: ANhLgQ1a9U1OwYskyXCMzclwMKynorDegQWzEVVrUrqxkkvQUswQq4PN
        1h9KjdF+xMY58F3/DAj31ypYpIoj72RzOH+aHUZUvQ==
X-Google-Smtp-Source: ADFU+vt1qfz62teArix4RWcoHrX3dgkejn6Zx6SB6aqWHXWYPwDFYUwdeFdSEUbc7NDSxUNEif9TkDmcIliVgY8eUMQ=
X-Received: by 2002:a05:6830:11d5:: with SMTP id v21mr1711403otq.290.1583920764878;
 Wed, 11 Mar 2020 02:59:24 -0700 (PDT)
MIME-Version: 1.0
References: <1583908414-22858-1-git-send-email-yangtiezhu@loongson.cn>
In-Reply-To: <1583908414-22858-1-git-send-email-yangtiezhu@loongson.cn>
From:   Manuel Lauss <manuel.lauss@gmail.com>
Date:   Wed, 11 Mar 2020 10:58:48 +0100
Message-ID: <CAOLZvyHEnnpWWhEAWx9RZASVjjQ=6HTREqwY+LK0hm=J4Wd8Xg@mail.gmail.com>
Subject: Re: [PATCH] MIPS: Loongson: Add model name to /proc/cpuinfo
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Linux-MIPS <linux-mips@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Xuefeng Li <lixuefeng@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

> Model name:            Loongson-3A R3 (Loongson-3A3000) @ 1449MHz

How is this different from the __cpu_name[] array?  Doesn't it serve
the same purpose?
E.g. on Alchemy, it lists the correct Model name. (I.e. "Au1000", "Au1250", ...)

Manuel
