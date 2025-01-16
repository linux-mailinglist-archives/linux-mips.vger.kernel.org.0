Return-Path: <linux-mips+bounces-7474-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8486BA1350C
	for <lists+linux-mips@lfdr.de>; Thu, 16 Jan 2025 09:14:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 36CB31882E42
	for <lists+linux-mips@lfdr.de>; Thu, 16 Jan 2025 08:14:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AF8E1D5CEA;
	Thu, 16 Jan 2025 08:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="cVzLE1Hh";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="cYfU2YjK"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE6D19AD8B;
	Thu, 16 Jan 2025 08:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737015129; cv=none; b=Ljj7zDxSIocXCxIS2fFCecC3Wh7F4GvReAb4wNp48QeziNWd1Php3zkhCCcOeaWp9yJ7GFPIvuaLOqsUu1Z1RRTmbSQefvt7YGcmkTmdtty4oLFJhgNirsvXdSwcIbgwkPjMPCCC3IPw9jclG/4RLPXEhTWYEMtNacF2yJkUCIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737015129; c=relaxed/simple;
	bh=87DUQAkMQtP6wu7zVv3R8Q8EM514dyATOSBIijElrdQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ELMRXmnCftLW1sOXas0iosjMh/vBh+qIBPWs1ZBAl4DlEj/+MrVSMzvCBgRSp8SvypO+SOSPlAKxGnSV/hbLS1bsrLuLfuItE++nr3L8D06UGm4pms/33wxkOjMLUg44CdYWhA3sFwaS8f1t0sPR+7ZE23USe1U5n1oVD4Ahz+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=cVzLE1Hh; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=cYfU2YjK; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1737015125;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AP5V8h9bz4N4y+UufT2Bd637DqN1KpVRAX/7F9z8sMc=;
	b=cVzLE1Hh6gWDZEJ7GeazV4QKljmFr7aSPP1ZM5v2l6SfYH6z48oOEjlHGWqaLrN7BHeAS4
	vUhSk8ki3zrxFCgsEjPooHv/kIZwjFfwHlCFDI71QvugzHY6HH5i5CtcIaf/POze3oemPX
	ImnbtU/x2dabRN4rlhJgKeiQaImkJYnZt+2MdlWO6vnMSiSCaSTLCFP7T9VoqnMKs7dV/T
	HxP0BJWxw/uBeLFnrEX44l40SsbhE2gqqgF38HopjjGGTbX9P490pEAWNwhLwW1AR42mgl
	3NYxBgbBsrjlA/LuwKMrXCJKm3dKDIb9m/uZtYmSr3FRAVz6D5pkEcolPIEMPw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1737015125;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AP5V8h9bz4N4y+UufT2Bd637DqN1KpVRAX/7F9z8sMc=;
	b=cYfU2YjK4EiPkUKB+SIf376TOC73FmI4Kkle9mwlGMroMpmlm56SN+vz9tPQPXmpZbUgG+
	sXN9CdZYeD3u4TBQ==
To: linux@treblig.org, florian.fainelli@broadcom.com
Cc: bcm-kernel-feedback-list@broadcom.com, x86@kernel.org,
 oe-kbuild-all@lists.linux.dev, linux-mips@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, "Dr.
 David Alan Gilbert" <linux@treblig.org>
Subject: Re: [PATCH v2] irqchip/irq-brcmstb-l2: Replace
 brcmstb_l2_mask_and_ack() by generic function
In-Reply-To: <20250116005920.626822-1-linux@treblig.org>
References: <20250116005920.626822-1-linux@treblig.org>
Date: Thu, 16 Jan 2025 09:12:04 +0100
Message-ID: <87ed13b2jv.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

David!

On Thu, Jan 16 2025 at 00:59, linux@treblig.org wrote:
> Replace brcmstb_l2_mask_and_ack() by the generic
> irq_gc_mask_disable_and_ack_set().
>
> brcmstb_l2_mask_and_ack() was added in commit 49aa6ef0b439
> ("irqchip/brcmstb-l2: Remove some processing from the handler") in
> September 2017 with a comment saying it was actually generic and someone
> should add it to the generic code.
>
> commit 20608924cc2e ("genirq: generic chip: Add
> irq_gc_mask_disable_and_ack_set()") did that a few weeks later, however no
> one went back and took the brcmstb variant out.

That's too late. The original patch is already applied and I'm not going
to redo the whole branch for this minor hickup. I've converted it to a
delta fix.

> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

You cannot add my Signed-off-by to a new submission.

Thanks,

        tglx

