Return-Path: <linux-mips+bounces-7981-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D3DA4586D
	for <lists+linux-mips@lfdr.de>; Wed, 26 Feb 2025 09:33:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9D853AC4DF
	for <lists+linux-mips@lfdr.de>; Wed, 26 Feb 2025 08:33:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A37B1E1DEC;
	Wed, 26 Feb 2025 08:32:52 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CB6C258CEA;
	Wed, 26 Feb 2025 08:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740558772; cv=none; b=Q9fFJA/IQw9EYczN5w1vVSvtSGWcb9lYTc8eI28hNlevfVbqGTxKXTQnlO+RV+w9G4rm3KhKTRYYKaZLp7oMSkvfaMNyk1g+byQei7feWZ2PvF4hs9F4sGJcRiUkQCvep44bYq38l9hMdalohbgEyH22BozR+RnuSVJjrFzdOgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740558772; c=relaxed/simple;
	bh=7pU1bTs6zExJNZzR8vWaDHfqRCQs2gbgxqw5feS2tCU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jMW+wUS4liRn9oR5EUVbK4F9562Q8NTLxk6/e268HOft2FVdheCpw6b1sNIxbeU/mlfT1G3HQyN3J4Vhx6tIhJYj0k11mQN9CIHzQPaJLE7Ph7lpXQfXoifIXZyaGISOMEKyLZbphR7LXzhwQF8pgFgp8H//smK4ve2+zzR8/ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D78141516;
	Wed, 26 Feb 2025 00:33:05 -0800 (PST)
Received: from [10.57.78.248] (unknown [10.57.78.248])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 37E3B3F673;
	Wed, 26 Feb 2025 00:32:42 -0800 (PST)
Message-ID: <528335f4-0648-4d49-992b-10c4d1949d0c@arm.com>
Date: Wed, 26 Feb 2025 09:32:40 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] mm: pgtable: remove tlb_remove_page_ptdesc()
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
 <3df04c8494339073b71be4acb2d92e108ecd1b60.1740454179.git.zhengqi.arch@bytedance.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <3df04c8494339073b71be4acb2d92e108ecd1b60.1740454179.git.zhengqi.arch@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/02/2025 04:45, Qi Zheng wrote:
> The tlb_remove_ptdesc()/tlb_remove_table() is specially designed for page
> table pages, and now all architectures have been converted to use it to
> remove page table pages. So let's remove tlb_remove_page_ptdesc(), it
> currently has no users and should not be used for page table pages.
>
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>

Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>

