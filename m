Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF71BECBEC
	for <lists+linux-mips@lfdr.de>; Sat,  2 Nov 2019 00:28:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727576AbfKAX2P (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 1 Nov 2019 19:28:15 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:34957 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727574AbfKAX2O (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 1 Nov 2019 19:28:14 -0400
Received: by mail-pf1-f195.google.com with SMTP id d13so8051323pfq.2;
        Fri, 01 Nov 2019 16:28:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:to:cc:cc:cc:subject
         :references:in-reply-to;
        bh=cS4FjHovoa9iGebRrfyMIYWfQWXcuPGHDu34OuRwB9U=;
        b=Y6SK6uPAOpE+oKRtHFDJZrZG3wDroX6pKZ0greCt5OMd4WJ0DNXaVvw6caqEVzbaUx
         qHbxq89vvYFcRIPdgk6lQjqYTOREe1865J1x2bsCjujhRnb4Qwrm2UUmMXV3dBovPVAN
         Tq5DPMRPcalKNzte48ZK3K/SHfFLur3wRcu/13RJHnkT/TKbw0BRYPaF4YOmZLNTo6Ag
         9Ugn4lSATpfJLph2YBowN6Hk17NVIqCIiD28uhlLTW8cUzvD2LyQLwNnR8CepKrhJ3k2
         V3ymB7vfRjsyIGJCJ4SRrthoXl2dmDV5/Oftcnl8wvZsUmIncicTwBsDop9F5dCBv7dY
         cuRw==
X-Gm-Message-State: APjAAAVKmJr6xyIN2LImFmXwmJMolSU6rppD10WL6khu2MKtm1VtROPi
        KuWzIYUylP6njIrfkN3uqk8=
X-Google-Smtp-Source: APXvYqxyWu5VJ+Mh3KaFxhEhry9upHWvRtIn+yyvAxPWBNWdthUH985WtUA9TniaDVN/Uq0/QmJ+7w==
X-Received: by 2002:a17:90a:2942:: with SMTP id x2mr9437263pjf.119.1572650894035;
        Fri, 01 Nov 2019 16:28:14 -0700 (PDT)
Received: from localhost ([2601:646:8a00:9810:9d6:9cca:ff8c:efe0])
        by smtp.gmail.com with ESMTPSA id 19sm8783182pjd.23.2019.11.01.16.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2019 16:28:13 -0700 (PDT)
Message-ID: <5dbcbf8d.1c69fb81.d579.a9f1@mx.google.com>
Date:   Fri, 01 Nov 2019 16:28:12 -0700
From:   Paul Burton <paulburton@kernel.org>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
CC:     paul.burton@mips.com, ralf@linux-mips.org, jhogan@kernel.org,
        chenhc@lemote.com
CC:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
CC:     linux-mips@vger.kernel.org
Subject: Re: [PATCH v3] MIPS: Loongson: Make default kernel log buffer size as  128KB for Loongson3
References:  <1571220180-5478-1-git-send-email-yangtiezhu@loongson.cn>
In-Reply-To:  <1571220180-5478-1-git-send-email-yangtiezhu@loongson.cn>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Tiezhu Yang wrote:
> When I update kernel with loongson3_defconfig based on the Loongson 3A3000
> platform, then using dmesg command to show kernel ring buffer, the initial
> kernel messages have disappeared due to the log buffer is too small, it is
> better to change the kernel log buffer size from 16KB to 128KB which is
> enough to save the boot messages.
> 
> Since the default LOG_BUF_SHIFT value is 17, the default kernel log buffer
> size is 128KB, just delete the CONFIG_LOG_BUF_SHIFT line.

Applied to mips-next.

> commit 8a5a49987130
> https://git.kernel.org/mips/c/8a5a49987130
> 
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> Signed-off-by: Paul Burton <paulburton@kernel.org>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paulburton@kernel.org to report it. ]
