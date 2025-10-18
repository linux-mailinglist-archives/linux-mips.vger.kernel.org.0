Return-Path: <linux-mips+bounces-11774-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11307BEC6C5
	for <lists+linux-mips@lfdr.de>; Sat, 18 Oct 2025 05:59:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ACD94421F23
	for <lists+linux-mips@lfdr.de>; Sat, 18 Oct 2025 03:59:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB7E42737F3;
	Sat, 18 Oct 2025 03:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="krIfENMf"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72BAB1E492A;
	Sat, 18 Oct 2025 03:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760759948; cv=none; b=osqxNuvbcIfRFuc0Aver4DFgX39xpmzCnWKTeDByyZRaJqaWIuW4OmELMzFvSaJGT9PpW5ozpwxBTvWKvkH+fha/LBTSgHzulRkK0gQMCBse/EHH28DaeHgZYGoo0pQ2wyifIL9zj4JInaz+DTzhDP5KkSX8f8NvawGG2rorCH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760759948; c=relaxed/simple;
	bh=EU6U5Z1y6eCiRh+fXNU8O/thPLmzUksR4n4H3faDx18=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Vk9Yh0I64yw9NaYjh8qOfCU16Zxhzf5u5gZYChvgHohSahMz0nn2elYCvOPTB2wBmYdzpTQapIZZ3hHogXyzJHCddiRmmsF7xzT+oJtppgpUQQBYx3DL6DTFNJWk0WNJABiC8dUSMXAaf3KuFkrhzyNC8hae3WfTmqCCUModCvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=krIfENMf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E640C4CEF8;
	Sat, 18 Oct 2025 03:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760759947;
	bh=EU6U5Z1y6eCiRh+fXNU8O/thPLmzUksR4n4H3faDx18=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=krIfENMfuFjiHhOD9R6DJZJbEI9qyq58vTH4tVORoQRTS2pGY5lkJEIZDY6cO/JsF
	 7rV4qf/QB3xJavBLHP0t1tOOd2ijiKeeH7r5PBJer2K+56mKaBeK4gxS6ShjW6W321
	 VkvkNEiUhE+GJg+MsRokLA9CNBFgs7U0v7KF5BOur/qWmLZ7DKTce6BLHyqQ3UmI3d
	 h3G0koy5DXW63vce1vAszW8CD0JUM4rwNfwwIrL7aT81malR9QIBv5/P/aZVWwdmzB
	 yRQW1/nRqFaZ64tNvz5lQ6FqKOjnXl5DoM5YdsFKHtq3AqF25dzypI1i46AMW/sKZH
	 62a7C0hJMLpqQ==
Date: Fri, 17 Oct 2025 21:59:03 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Trevor Woerner <twoerner@gmail.com>
cc: linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
    linux-aspeed@lists.ozlabs.org, linux-arm-msm@vger.kernel.org, 
    openbmc@lists.ozlabs.org, linux-hexagon@vger.kernel.org, 
    loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
    linux-stm32@st-md-mailman.stormreply.com, linux-mips@vger.kernel.org, 
    linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
    linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org, 
    sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] defconfig: cleanup orphaned CONFIG_SCHED_DEBUG
In-Reply-To: <20250828103828.33255-1-twoerner@gmail.com>
Message-ID: <e88ab2ff-dc16-dab7-0ff3-702f093563ce@kernel.org>
References: <20250828103828.33255-1-twoerner@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 28 Aug 2025, Trevor Woerner wrote:

> In commit b52173065e0a ("sched/debug: Remove CONFIG_SCHED_DEBUG") this
> Kconfig option was removed since CONFIG_SCHED_DEBUG was made unconditional
> by patches preceding it.
> 
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---

[ ... ]

>  arch/riscv/configs/nommu_k210_defconfig        | 1 -
>  arch/riscv/configs/nommu_k210_sdcard_defconfig | 1 -
>  arch/riscv/configs/nommu_virt_defconfig        | 1 -

[ ... ]

Acked-by: Paul Walmsley <pjw@kernel.org>  # for arch/riscv


- Paul

