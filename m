Return-Path: <linux-mips+bounces-5321-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8630096AE6A
	for <lists+linux-mips@lfdr.de>; Wed,  4 Sep 2024 04:07:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 311131F258EA
	for <lists+linux-mips@lfdr.de>; Wed,  4 Sep 2024 02:07:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45D7C5C96;
	Wed,  4 Sep 2024 02:07:03 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6D98D529;
	Wed,  4 Sep 2024 02:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725415623; cv=none; b=Upc8wP+RhSbKZmKPvyL+uGhtoXROwF44kftgzVuItME1xcswdSOIxmkpRHuahN7sUcKaOwWQYqkaJjUmx25IiawRLsomLmHqUuyFOe8b4amy6t9w5L/xpjJr18rFj8HL3ZaQhnopp/77dOrIIqd4m0sQ4TdUbIsjt5oaGdvrHrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725415623; c=relaxed/simple;
	bh=JC8MiXJaFqF3kCo3iEayFC+jKeFykQ/oiq2zOeUzQ/c=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=F6v8Z8GEQ/zo7c4TxY9mFPFVGymVdwbrlYCyzKZDtsXGgdW8nbIfjf4QxciMw3GKdiUclemrQkQFE2OUxKD2en00pl0MxVXlmMcAKbSptwPxTVdwkDfJrVoiSXBcadDl/wlq1Umyda0UnEUU/W7XbMxkj1+5JB+gRqx8ToXd5As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 1715392009D; Wed,  4 Sep 2024 04:06:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 151F692009C;
	Wed,  4 Sep 2024 03:06:52 +0100 (BST)
Date: Wed, 4 Sep 2024 03:06:52 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Xi Ruoyao <xry111@xry111.site>
cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mips: Remove posix_types.h include from sigcontext.h
In-Reply-To: <20240828030413.143930-2-xry111@xry111.site>
Message-ID: <alpine.DEB.2.21.2409040229030.1802@angie.orcam.me.uk>
References: <20240828030413.143930-2-xry111@xry111.site>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 28 Aug 2024, Xi Ruoyao wrote:

> It seems only a relict: in a Linux 2.6.11-rc2 patch [1] the
> linux/types.h include was unexplainedly changed to a linux/posix_types.h
> include.  I can only assume it was just an error.  Finally headers_check
> complained "found __[us]{8,16,32,64} type without #include
> <linux/types.h>" and commit ae612fb05b0f ("headers_check fix: mips,
> sigcontext.h") added back the linux/types.h include, but it didn't
> remove the posix_types.h include.

 The original LMO change was this:

commit 1dc129df74a76ee16593c9220c3f7289ee627d03
Author: Ralf Baechle <ralf@linux-mips.org>
Date:   Sat Dec 18 01:09:29 2004 +0000

    Don't pull <linux/types.h> into userspace.

diff --git a/include/asm-mips/sigcontext.h b/include/asm-mips/sigcontext.h
index 844879d63b77..18939e84b6f2 100644
--- a/include/asm-mips/sigcontext.h
+++ b/include/asm-mips/sigcontext.h
@@ -41,8 +41,6 @@ struct sigcontext {
                                                                                 
 #if _MIPS_SIM == _MIPS_SIM_ABI64 || _MIPS_SIM == _MIPS_SIM_NABI32
 
-#include <linux/types.h>
-
 /*
  * Keep this struct definition in sync with the sigcontext fragment
  * in arch/mips/tools/offset.c
@@ -66,6 +64,9 @@ struct sigcontext {
 };
 
 #ifdef __KERNEL__
+
+#include <linux/posix_types.h>
+
 struct sigcontext32 {
 	__u32	sc_regmask;		/* Unused */
 	__u32	sc_status;

so not without explanation and clearly to address a userland compilation 
issue.  It seems that the original directive should have just been moved 
into the __KERNEL__ part without changing the file included though.

 So commit ae612fb05b0f was wrong too in that it should have just changed 
the directive in place rather than adding #include <linux/types.h> at the 
top, as it just brought the issue back that commit 1dc129df74a7 attempted 
to address.

 Meanwhile there was commit 269dd2b2526d, which messed things up further, 
as it should have used `unsigned long long' rather than `__u64' as the 
64-bit type (and leave `unsigned int' intact), so commit ae612fb05b0f 
couldn't actually have done a better fix without correcting commit 
269dd2b2526d first.

 We have since developed UAPI headers, so the issue of the userland use of 
<linux/types.h> has gone, but still I think we ought to clean up the mess 
in this header by switching back to standard ISO C `unsigned long long' 
and `unsigned int' types for members of 64-bit `struct sigcontext', and 
then the inclusion of <linux/types.h> can go too.

 That written I think your change makes sense by itself, but I suggest 
that you update the description and summarise the findings given here.  
I'm not sure if a copy of the LMO repo is available online at this time 
though.

  Maciej

