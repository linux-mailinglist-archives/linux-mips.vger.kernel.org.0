Return-Path: <linux-mips+bounces-9269-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C2301AD7160
	for <lists+linux-mips@lfdr.de>; Thu, 12 Jun 2025 15:15:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E7B7177D71
	for <lists+linux-mips@lfdr.de>; Thu, 12 Jun 2025 13:13:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1438023D280;
	Thu, 12 Jun 2025 13:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="M06dl3FD";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="xOjACYNL"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0A123CF12;
	Thu, 12 Jun 2025 13:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749734025; cv=none; b=t/pbLOEsc8X/pw2zDb8I18dU+f9RvTTCBefDv3E9/HTqnSw9zbDnVH3uXIWBPvCaU77L/zb+UKoTs6Hetkg946U8G/R9zugfxcuSxKiP6YNu+MubROR+MF/murUpVC7bhbx6WB+Ob3qsMhPn1X1PomWdgNj7eGFeSuLAqEam55A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749734025; c=relaxed/simple;
	bh=Hpkszy4R4gKBs1ci8NemFAGhYsjN2JJG1PCs680W1Bk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=I1DVoNCdSkfilnskhtU1BgiLob+6+CVMC6EgINSUOt4rH+tIrwSib08BLuKen2soJKC/MUExXHNks26kgCyGulRP+SJpkKIfQa/rLH99uxnbqluoTelQmITGCBp3PUjC0cyZ6dLd2eiHdIZIjj9nG0UHdEOelnh7axqzxX5PRhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=M06dl3FD; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=xOjACYNL; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749734021;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Hpkszy4R4gKBs1ci8NemFAGhYsjN2JJG1PCs680W1Bk=;
	b=M06dl3FDgyblDeVNKZj/yTlCPQuTi5lglWWdG2fLDEa0yiWH+n/8DIu/xzlfNYZD+zaHUS
	NwYh/XCRLph1/KEpcPnzstacSex8ScncDgwgnpPXVn7g2jrog/Hj5ZDk+be2Goi7woxayD
	wmJKvsTFt5bkzz/ljwqQClfOluoE9C4lXuv9+XcY4E+JqZCjgeV+4tyDhoH9wWizEE1RTz
	RCdB05zcQ1Bw8mXZRn2yVxiG7QJ3jmNW7PvjZRdQIbOZyqRBzp5WCKRyrW0r7tbIpAI+bH
	abJ/PyV5aLeYKr4y2o2vq2Vp2nGWLBa+bwyfQzwoTKqn2+resawyMDuCIverYQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749734021;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Hpkszy4R4gKBs1ci8NemFAGhYsjN2JJG1PCs680W1Bk=;
	b=xOjACYNL5x1DYbrzNbVBtmHmwfo1EBoeFj+Lc947zL1lqIq/3pbaOQPzaSgmnTGMU9JGiu
	OEhLM1RDfhQlUFBQ==
To: Markus Stockhausen <markus.stockhausen@gmx.de>,
 tsbogend@alpha.franken.de, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, s.gottschall@dd-wrt.com
Cc: Markus Stockhausen <markus.stockhausen@gmx.de>
Subject: Re: [PATCH v2] irqchip/mips-gic: allow forced affinity
In-Reply-To: <20250526134149.3239623-1-markus.stockhausen@gmx.de>
References: <20250526134149.3239623-1-markus.stockhausen@gmx.de>
Date: Thu, 12 Jun 2025 15:13:41 +0200
Message-ID: <87bjqtrtkq.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, May 26 2025 at 09:41, Markus Stockhausen wrote:
>
> Signed-off-by: Markus Stockhausen <markus.stockhausen@gmx.de>
> Signed-off-by: Sebastian Gottschall <s.gottschall@dd-wrt.com>

This Signed-off-by chain is broken.

https://www.kernel.org/doc/html/latest/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin

and the following paragraphs explain it.

