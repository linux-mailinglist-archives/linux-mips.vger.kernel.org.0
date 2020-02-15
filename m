Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1598B1600F9
	for <lists+linux-mips@lfdr.de>; Sat, 15 Feb 2020 23:56:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726389AbgBOW4A (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 15 Feb 2020 17:56:00 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:36748 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726275AbgBOW4A (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 15 Feb 2020 17:56:00 -0500
Received: by mail-pf1-f195.google.com with SMTP id 185so6892379pfv.3;
        Sat, 15 Feb 2020 14:56:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:to:cc:cc:cc:subject
         :references:in-reply-to;
        bh=ZnrpFRwuHcMrcf2f334c6cLcNZOAyH4smyDfWLzsbYI=;
        b=EDqICnpPB/CQU8EGUIsb0gMToUW8D9hu+953il6WTMZjj7YvRjjJr6uTi+cc59gfoT
         IeKnp+i/PskESjNQ7PJH2QFcUQm7AVI/yYijbH2hE+452KqKr8ZFNHM7uoQMvH7k8sqS
         u1j4clPxU9I6gSN0SCHfx1F5Yot+6DaeZNO8BVtSUzBvwEBJtsvH5GTVN2a8laJ3vwST
         SmvqXLTRTxQ33nf1mjpjUIEG/TvnQFPus7TObcvGyLgXhep35yd99pJL21uziwd0OGo6
         CyHc2SHDG5c0n/EY7aLzIwUwYA/DekTD4DTw1U2v3SnsMvMOKx6aEXs+6RSWu0YsIROm
         bCCQ==
X-Gm-Message-State: APjAAAWPm51kiZv66FmSSOgVTz+JZ4SxXP7j4kHNvvuEZ0+qhqeyLbzL
        T+JOdJVbJjnpgiNgA+jUZFc=
X-Google-Smtp-Source: APXvYqzpY/0nVKqmRYrgFbI6+fe3+rzxjiHsPtOCbGrfoV/fEL5KF4SeerjqO3dqvB8ayRcibiP02w==
X-Received: by 2002:a63:6d0b:: with SMTP id i11mr10217031pgc.266.1581807359743;
        Sat, 15 Feb 2020 14:55:59 -0800 (PST)
Received: from localhost ([2601:646:8a00:9810:5af3:56d9:f882:39d4])
        by smtp.gmail.com with ESMTPSA id w189sm11733073pfw.157.2020.02.15.14.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2020 14:55:59 -0800 (PST)
Message-ID: <5e4876ff.1c69fb81.7b887.cb6e@mx.google.com>
Date:   Sat, 15 Feb 2020 14:55:58 -0800
From:   Paul Burton <paulburton@kernel.org>
To:     Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>
CC:     paulburton@kernel.org, linux-mips@vger.kernel.org
CC:     chris.packham@alliedtelesis.co.nz, linux-kernel@vger.kernel.org,
        Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>
CC:     linux-mips@vger.kernel.org
Subject: Re: [PATCH] MIPS: cavium_octeon: Fix syncw generation.
References:  <20200211212455.3307-1-mark.tomlinson@alliedtelesis.co.nz>
In-Reply-To:  <20200211212455.3307-1-mark.tomlinson@alliedtelesis.co.nz>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Mark Tomlinson wrote:
> The Cavium Octeon CPU uses a special sync instruction for implementing
> wmb, and due to a CPU bug, the instruction must appear twice. A macro
> had been defined to hide this:
> 
>  #define __SYNC_rpt(type)     (1 + (type == __SYNC_wmb))
> 
> which was intended to evaluate to 2 for __SYNC_wmb, and 1 for any other
> type of sync. However, this expression is evaluated by the assembler,
> and not the compiler, and the result of '==' in the assembler is 0 or
> -1, not 0 or 1 as it is in C. The net result was wmb() producing no code
> at all. The simple fix in this patch is to change the '+' to '-'.

Applied to mips-fixes.

> commit 97e914b7de3c
> https://git.kernel.org/mips/c/97e914b7de3c
> 
> Fixes: bf92927251b3 ("MIPS: barrier: Add __SYNC() infrastructure")
> Signed-off-by: Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>
> Tested-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Signed-off-by: Paul Burton <paulburton@kernel.org>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paulburton@kernel.org to report it. ]
