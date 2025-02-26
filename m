Return-Path: <linux-mips+bounces-7978-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A69A45853
	for <lists+linux-mips@lfdr.de>; Wed, 26 Feb 2025 09:32:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 438B118924B2
	for <lists+linux-mips@lfdr.de>; Wed, 26 Feb 2025 08:32:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADDD420AF73;
	Wed, 26 Feb 2025 08:31:17 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 058D520E001;
	Wed, 26 Feb 2025 08:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740558677; cv=none; b=ONNUStue+PTFtws7f8hYP8QFQOe5UjBE3XlUQR9Dn9LdPXhiHY2k2eyTgnSZ03BYaLsIED4Al82Bj0daKaRSf414e5xCWBagLs2uVO6iScCi7sXCBPTlyIzB+u28TD7NE0zQGEJzbBwWxbet1PZ7JM/VmHp6CoyGHeOdPFvU9Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740558677; c=relaxed/simple;
	bh=t15i2Nu6IjmH90KiIySiPPJRC3rXNFYxxidwT82OIWQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s95FefinX7DjGp9AZCRdkY8Mp2JlF4/kza4NV4GrvxatKLIsimvITDEWivB7PaMFfVdRX3iRCndWl6OjtSUsd+ZF4Imj43V1tRs04vrWiXj5adFV4WhZ5Lwim80ri00Evh1NT980jbkYKNWICF3dS6CWrnpPSyVhyyqly+kmad8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 43D791C01;
	Wed, 26 Feb 2025 00:31:31 -0800 (PST)
Received: from [10.57.78.248] (unknown [10.57.78.248])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D0D573F673;
	Wed, 26 Feb 2025 00:31:08 -0800 (PST)
Message-ID: <2f4c6d8e-ecb4-42aa-8f42-3d386ac017f1@arm.com>
Date: Wed, 26 Feb 2025 09:31:06 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] mm: pgtable: change pt parameter of
 tlb_remove_ptdesc() to struct ptdesc *
To: Qi Zheng <zhengqi.arch@bytedance.com>, peterz@infradead.org,
 riel@surriel.com, vishal.moola@gmail.com, david@redhat.com,
 jannh@google.com, hughd@google.com, willy@infradead.org, yuzhao@google.com,
 muchun.song@linux.dev, akpm@linux-foundation.org, will@kernel.org,
 aneesh.kumar@kernel.org, npiggin@gmail.com, arnd@arndb.de,
 dave.hansen@linux.intel.com, rppt@kernel.org, alexghiti@rivosinc.com
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-um@lists.infradead.org, x86@kernel.org,
 linux-riscv@lists.infradead.org
References: <cover.1740454179.git.zhengqi.arch@bytedance.com>
 <60bb44299cf2d731df6592e446e7f694054d0dbe.1740454179.git.zhengqi.arch@bytedance.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <60bb44299cf2d731df6592e446e7f694054d0dbe.1740454179.git.zhengqi.arch@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/02/2025 04:45, Qi Zheng wrote:
> All callers of tlb_remove_ptdesc() pass it a pointer of struct ptdesc, so
> let's change the pt parameter from void * to struct ptdesc * to perform
> a type safety check.
>
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> Originally-by: Peter Zijlstra (Intel) <peterz@infradead.org>

Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>

