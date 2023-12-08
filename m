Return-Path: <linux-mips+bounces-600-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFAA80A534
	for <lists+linux-mips@lfdr.de>; Fri,  8 Dec 2023 15:13:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD36C28175B
	for <lists+linux-mips@lfdr.de>; Fri,  8 Dec 2023 14:13:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EFEE1DDD5;
	Fri,  8 Dec 2023 14:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="DlHwMQpa";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="nNtuGdKF"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5DDF10F1;
	Fri,  8 Dec 2023 06:13:21 -0800 (PST)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1702044800;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7ozIt0NpDzyo+Um0CWiKiW7MbyrySc7KdMzm0CGPzvo=;
	b=DlHwMQpaXXu9BhQft/LEkcmfYfndeA0JHHiXh79nshdASb0bAd2Z/klENPH+N4myV1G122
	4B3k4UTw63qVars0Nwp/WQxVw2Wx9blklGJCq9I8Vae6FgrA5hWRwy9l4emdKzWr9pVwhP
	+kYw8UjZIZsWpL5XuWrfwmaPKIT+I2UEtBdLJleL96glP86AHjLkjqjEXz97NISbeUFba5
	RQ6/kaEtsbWwsBIbeTQkZW6iS7154lQtl/u50Y2w3kJOH9UXWf2S32eBzfGfauphyD7ZoZ
	ympLna5q+pczEwnWH1nkk/OtXU+4rt6uXPAW6fYmkZjVM4jMEk4M84altptwwg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1702044800;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7ozIt0NpDzyo+Um0CWiKiW7MbyrySc7KdMzm0CGPzvo=;
	b=nNtuGdKFbQkUmGMEp2doPQYFowq/a6IiDjr7VB3UWAe8RUZPqQstA4RYB8U8SC1EroxuSh
	wRykCv5Ci1i0K6Aw==
To: Haoran Liu <liuhaoran14@163.com>, tsbogend@alpha.franken.de
Cc: fancer.lancer@gmail.com, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, Haoran Liu <liuhaoran14@163.com>
Subject: Re: [PATCH] [irqchip] mips-cpu: Add error handling in
 mips_cpu_register_ipi_domain
In-Reply-To: <20231130040642.36133-1-liuhaoran14@163.com>
References: <20231130040642.36133-1-liuhaoran14@163.com>
Date: Fri, 08 Dec 2023 15:13:19 +0100
Message-ID: <87o7f0sry8.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Nov 29 2023 at 20:06, Haoran Liu wrote:

The subject line:

  https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#patch-subject

> This patch enhances the mips_cpu_register_ipi_domain function in

# git grep 'This patch' Documentation/process/

> drivers/irqchip/irq-mips-cpu.c by adding error handling for the
> kzalloc

The file name is irrelevant. Please read and follow:

  https://www.kernel.org/doc/html/latest/process/maintainer-tip.html

> call. Previously, the function lacked proper handling for kzalloc
> failures, which could lead to potential null pointer dereference issues
> under low memory conditions.

The value of this "enhancement" is dubious. if that kzalloc() fails then
any subsequent allocation will fail too and the machine will crash
anyway.


