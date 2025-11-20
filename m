Return-Path: <linux-mips+bounces-12314-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E54C74DFF
	for <lists+linux-mips@lfdr.de>; Thu, 20 Nov 2025 16:21:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id CAD17358242
	for <lists+linux-mips@lfdr.de>; Thu, 20 Nov 2025 15:08:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF21A2F0681;
	Thu, 20 Nov 2025 15:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="OLz+tdlO";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="D02NC6YP"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A3E22E5B0E;
	Thu, 20 Nov 2025 15:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763651165; cv=none; b=nimX1YKZvcQwFN+cXplxGIXPA463rsc3CulqTimqkX9Fsr67Fnwj/Ulvit0L9HjChQ3uMIrZXPrb8O6UvFOEWcOzwb83A23GP86VjwWTup2JweBCeUbBSQKKAlC604+e+aK9MyNxpZNLxUUTGv9bBf22bQJcPzevyyq9MkpZFLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763651165; c=relaxed/simple;
	bh=TRZgnWWhWokNCTh21dPzITYdwFXz/FKAuKLA1pr/dFI=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kuiWCRlbacIs966bw4QLGgu4tYoLUMLi7RIUU7v9z3ozc+sryC3bSRgN03KIrl/8/Kcb4xpbhSgxTPj/0G/sZXHPlRs6BgjhPPRwHFDmDbs7zP/NzVi1h2H7aoWSSbsdG4Xfo8Ii4haq484WI3Uyyzk1JYjc+qHczXS0B5VMlHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=OLz+tdlO; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=D02NC6YP; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1763651159;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TRZgnWWhWokNCTh21dPzITYdwFXz/FKAuKLA1pr/dFI=;
	b=OLz+tdlO+QXMQ4yPIk4iwDyGTubdTlbgyslhf+7+bcfswopBbDCyBcY4+bZ/GZ/wbOkXnt
	p3jWy92QiMoNroMZLY9jh/NQSJl9fDKZ6tJMfhfWq+J13br5UQFBeEA2KisqrtsA+ZmnfK
	uOtX3KTCH2+5veFZsuV0PjV1SOpXMHj7oVeUNBynLdQIu68h75NQLS7R0w8T6q7Cog4o9d
	Ziq5HvwDB/mb7/3F9orfH1HluGmsC2bxI7pLTpDw2VnzQq+ISn/YXjvvd6JpiG+jDfWjqy
	eb7yOfptjQt+DLuU55GJPHFBbe3igDuuYfmQE7hcINY69eiPev5kR9/CEY7Ing==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1763651159;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TRZgnWWhWokNCTh21dPzITYdwFXz/FKAuKLA1pr/dFI=;
	b=D02NC6YPM0KbO03bsfmWoG0gijLbuR/phmkjhYlOLEYCXG2DatGCYkdckHpBsR/gC68Syv
	ivyW5jJ/QH3TzPCA==
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Thomas =?utf-8?Q?Wei?=
 =?utf-8?Q?=C3=9Fschuh?=
 <thomas.weissschuh@linutronix.de>, Nam Cao <namcao@linutronix.de>,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] MIPS: kernel: Fix random segmentation faults
In-Reply-To: <20251120121030.28524-1-tsbogend@alpha.franken.de>
References: <20251120121030.28524-1-tsbogend@alpha.franken.de>
Date: Thu, 20 Nov 2025 16:05:58 +0100
Message-ID: <87qztskall.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Nov 20 2025 at 13:10, Thomas Bogendoerfer wrote:
> Commit 69896119dc9d ("MIPS: vdso: Switch to generic storage
> implementation") switches to a generic vdso storage, which increases
> the number of data pages from 1 to 4. But there is only one page
> reserved, which causes segementation faults depending where the VDSO
> area is randomized to. To fix this use the same size of reservation
> and allocation of the VDSO data pages.
>
> Fixes: 69896119dc9d ("MIPS: vdso: Switch to generic storage implementation")
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

I assume this goes through the MIPS tree to Linus.

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>

