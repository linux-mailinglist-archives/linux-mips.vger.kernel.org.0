Return-Path: <linux-mips+bounces-12933-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 635EBD20931
	for <lists+linux-mips@lfdr.de>; Wed, 14 Jan 2026 18:36:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9EC07300305F
	for <lists+linux-mips@lfdr.de>; Wed, 14 Jan 2026 17:34:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43F592D322E;
	Wed, 14 Jan 2026 17:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l7rOqzn0"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23FA302151
	for <linux-mips@vger.kernel.org>; Wed, 14 Jan 2026 17:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768412081; cv=none; b=DsNyKZ8dszLM66sLBko6YnOtJcnIM1gA+KMC6tVeELYi+3lu4/9li0D6vPA9avbHTja/trC8IUjYytdMzmXAWm+FmFMw1NRjaKGDHOVreagKlaCMBen0siAUeR+lEXYWdTdqV7jlN6BIyyqTy1Rmu3rDf9HoxRTkcAvmfFBQieY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768412081; c=relaxed/simple;
	bh=kObkP2DRo5mXrlxriPjEDWheb0/mwzFmw+8s1z659rQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GV/qPRlePD/HWzMyr7sZNoWtxDOD2xZ0EGynL6xhLUoikDYCIQ3Syq3W3QGN7hQ63NEONb6ocbS99KiGMdiXcOSogJfQCiK25pDh5JLy/XvZyaDThHObao6PVdRR56bPy3B5VS3C35AQi9pPYYkwKIoKYpr0XS8rNl8BjrjDMTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l7rOqzn0; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47f3b7ef761so494915e9.0
        for <linux-mips@vger.kernel.org>; Wed, 14 Jan 2026 09:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768412077; x=1769016877; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WJ7m2Kae0rt7KDMZbiJnTHcyU/qgip1RiScuagqlCWo=;
        b=l7rOqzn0s98s9MB2RKh1QOdNVoZwqowXwuRhj0ttHsgh4OEWHGT5D1yGEOYlSCiad4
         KCc8ZRuL+JqV2kSNEA/qMbGeDDTFJ7Q4JvEW8PTku+NMctiIJsaCc17ttuITW48fFCb3
         1gJKIvap4KfNBzzvVMFKpL07rKWcfqKWDCMOz02/BB7VngETXA8V0TWDazKEPjjoKuPB
         uHRyrE18wk0IsQolpbZGjM5Di0rqB4qsxU+F8fkcd/C5vBdwLMAkoDNihGhcUqy+KTqc
         1M+rqr6C65BOyA4B10Gkm8DryGY0XwTNDAKp9fjvZntpUjEbH8n4+uUM6lSQDj7JI8ce
         i/Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768412077; x=1769016877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WJ7m2Kae0rt7KDMZbiJnTHcyU/qgip1RiScuagqlCWo=;
        b=jRPnzPV5s9hA6kJ5+uObCu5La/HgjEFOOSoTrLXNKCgooBoIgMGjOmD+G075oMk7UO
         g9NWg8ZADX6ztQ4IEMNldEdrKSdj3eCDg2e3skA3UKA8k1WRH8yxCYGUK4+167f2DusG
         PmycgvpIZ8nk8NrwIqZXvXyyTczEvOp3fPe8NtJjYT2yM2Rw60/UnNTw/r7ekLEY3MQ2
         2EUaZXXo83axZnSDFDIq02HWOpzb61kDi6pfFzFqskBfjk7heq+Cg0tYBmAsMpTn9UsT
         NZ96osp6Mor71S55rKDrxaT+MouyX76eB4AbPuSYc+2AxtzT3mT8krqBGdcBwiaibLRn
         TqyQ==
X-Forwarded-Encrypted: i=1; AJvYcCV72HJ5D+wvQmfvUwEvo4SiGssw/DA8cqFyGVaPyi3nuOn/aDlsS7o3eRm8ULenQXPJ8cSvmbuEIrqs@vger.kernel.org
X-Gm-Message-State: AOJu0YxghdhdxGN+5nL41+E+cFFPjfhYpnCfn1scN5KvoOREXZmBCr0t
	dRhsT1giOmeYQqbD0Ub4VYXeU7jALG+RoGGpmqPEkiAF+cbLldvqd57O
X-Gm-Gg: AY/fxX6Vd7UasvZnuCysAEmcwbYPdVzeNtzLRQl9tXwixzMLIUD9bF1OuJxOnR7ynV+
	AkBok0v9boPaSMwKo0u3gAd6yS7TQnDzdjpkkHpbzLrIABLEX7Z5FF8lTYJxqczsLbugHQTxGn7
	UGQbiNX9WEH0XqV4ohSD0nsivrdWHE5F/GClnlP131x5ijeittmCuvFEG2q0vR6mu9xSw5piLty
	kfPTtPckqomrA2hBrvm6xpXEWroyCCCzvBibQgNrjdeRkOBY9TyPIy98z8q50vrgM+QUB7HM9rh
	gzm/tgUe0B+lAhLH1a/lA5f/NyarhsaSMAjc+9kd6vMxT5Bq9IzULwULDjUXMmtQJKDLzCIQmMx
	5IhUJ6viv3ur+cs9AM4752ftLgynfCWrigvKHUWnHPm/axzqsfQVn1tnHKV0tSQuXJweG1q745A
	3QJPGat1DaFU3tF0LGecRfyinTqnjtfv78iT+/H8macGE+WJTDrEdF
X-Received: by 2002:a05:600c:a46:b0:477:73e9:dc17 with SMTP id 5b1f17b1804b1-47ee338c00cmr46093135e9.35.1768412076765;
        Wed, 14 Jan 2026 09:34:36 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee2725b54sm27307345e9.1.2026.01.14.09.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 09:34:36 -0800 (PST)
Date: Wed, 14 Jan 2026 17:34:35 +0000
From: David Laight <david.laight.linux@gmail.com>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>, Nicolas Pitre
 <npitre@baylibre.com>, linux-mips@vger.kernel.org, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>
Subject: Re: mips64-linux-ld: div64.c:undefined reference to `__multi3'
Message-ID: <20260114173435.51cf556d@pumpkin>
In-Reply-To: <alpine.DEB.2.21.2601141530510.6421@angie.orcam.me.uk>
References: <202601140146.hMLODc6v-lkp@intel.com>
	<20260113200455.3dffe121@pumpkin>
	<alpine.DEB.2.21.2601140453090.6421@angie.orcam.me.uk>
	<20260114103103.216aa122@pumpkin>
	<alpine.DEB.2.21.2601141530510.6421@angie.orcam.me.uk>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 14 Jan 2026 15:50:09 +0000 (GMT)
"Maciej W. Rozycki" <macro@orcam.me.uk> wrote:

> On Wed, 14 Jan 2026, David Laight wrote:
> 
> > > > Looking at the git log for that file there is a comment that includes:
> > > > 	"we wouldn't expect any calls to __multi3 to be generated from
> > > > 	 kernel code".
> > > > Not true....
> > > > Not sure why the link didn't fail before though, something subtle must
> > > > have changed.
> > > > 
> > > > I think the fix is just to remove the gcc version check.    
> > > 
> > >  Or rather fix the version check.  The GCC fix went in with GCC 10:  
> > 
> > Does that mean the GCC 10 generates the multiply instructions and never calls
> > __multi3?
> > (Rather than just not using __multi3() for that specific example.)  
> 
>  Of course it still does call `__multi3' for 128x128bit multiplication.  
> It doesn't for widening 64x64bit one though, which was a missed case for 
> MIPS64r6 only, having been supported by GCC ever since MIPS III ISA.  I 
> think we do want to fail link in the 128x128bit case.

That's fine by me.
I only get blamed for the widening one :-)

...
>  Distinct RTL insns are produced, so all the usual RTL optimisations 
> apply (in addition to any tree optimisations already made):
> 
> mul_u64_u64_add_u64:
> 	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
> 	.mask	0x00000000,0
> 	.fmask	0x00000000,0
> 	.set	noreorder
> 	.set	nomacro
> 	dmul	$2,$5,$6	 # 9	[c=20 l=4]  muldi3_mul3_nohilo
> 	dmuhu	$5,$5,$6	 # 10	[c=44 l=4]  umuldi3_highpart_r6
> 	daddu	$7,$2,$7	 # 14	[c=4 l=4]  *adddi3/1
> 	sltu	$2,$7,$2	 # 16	[c=4 l=4]  *sltu_didi
> 	sd	$7,0($4)	 # 21	[c=4 l=4]  *movdi_64bit/4
> 	jr	$31	 # 44	[c=0 l=4]  *simple_return
> 	daddu	$2,$2,$5	 # 29	[c=4 l=4]  *adddi3/1
> 
> (hmm, I wonder why the cost for the high-part RTX is over twice that for 
> the low-part one; this seems outright wrong, also taking the possibility 
> of fusing into account).

They might be different, if the wide multiply is implemented with multiple
narrow ones then the high result bits don't need to be generated if only
the low result bits are needed.
If the data is clocked through a single multiplier that might be significant,
but probably not double (I think you need 3/4 of the products).
If the results of separate narrow multipliers have to be added together
then the carry-ripple of all the adds might make a small difference, but I'd
only expect 1 (perhaps 2) clocks for that.
If those are gcc's costs I suspect they may not match reality, after all they
usually only have to be 'good enough' or 'reasonable'.

I nearly got the 32x32 multiply to run in a single clock on my Nios-II
re-implementation, but the 64bit ripple carry delayed things too much for
the other logic that needed to happen to feed the product back into the ALU.
The product itself could be latched - so it wasn't far off.
I think I could have fed back the low bits, but that would have been
complicated. Detecting 'short' (18bit by 18bit) unsigned multiplies
would have been more use - they are common for array indexes.
(That was a 'fun' project... Nios-II is, AFICT, basically MIPS 32.)

	David

> 
>   Maciej
> 


