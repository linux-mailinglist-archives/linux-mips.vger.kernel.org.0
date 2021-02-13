Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72E9B31AC90
	for <lists+linux-mips@lfdr.de>; Sat, 13 Feb 2021 16:18:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229625AbhBMPSd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 13 Feb 2021 10:18:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229649AbhBMPSc (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 13 Feb 2021 10:18:32 -0500
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C2BADC061574;
        Sat, 13 Feb 2021 07:17:51 -0800 (PST)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id 499989200BF; Sat, 13 Feb 2021 16:17:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id 464369200BC;
        Sat, 13 Feb 2021 16:17:50 +0100 (CET)
Date:   Sat, 13 Feb 2021 16:17:50 +0100 (CET)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
cc:     Jinyang He <hejinyang@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>,
        Wu Zhangjin <wuzhangjin@gmail.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        linux-kernel@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>,
        Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: Re: [PATCH 1/3] MIPS: ftrace: Fix N32 save registers
In-Reply-To: <83e49b6e-9c9d-407e-8ac1-f3fad63df915@www.fastmail.com>
Message-ID: <alpine.DEB.2.21.2102131609420.35623@angie.orcam.me.uk>
References: <1612080878-5426-1-git-send-email-hejinyang@loongson.cn> <b1a5eae4-2032-4ace-aa48-a21893e47528@www.fastmail.com> <d9548ffc-9d91-baf6-107a-af1b174db29b@loongson.cn> <83e49b6e-9c9d-407e-8ac1-f3fad63df915@www.fastmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 1 Feb 2021, Jiaxun Yang wrote:

> > Thank you for your reply, and now I know. Before that, I saw the macro
> > from arch/mips/include/asm/regdef.h and thought it needed to be modified
> > here. But that seems have no sence.
> > Please ignore this patch.
> 
> I guess that's for uapi consideration.

 Nope, it's not under arch/mips/include/uapi/, but this is a common MIPS 
header used across many projects (see the copyright notices at the top 
going back to 1985), so there has been no sense to make Linux-specific 
changes to it just for the sake of it given that it works as it stands.  
Don't fix what ain't broke.  Don't make changes just because you can.

  Maciej
