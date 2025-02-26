Return-Path: <linux-mips+bounces-7970-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8136CA4531F
	for <lists+linux-mips@lfdr.de>; Wed, 26 Feb 2025 03:35:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F2EB1188E826
	for <lists+linux-mips@lfdr.de>; Wed, 26 Feb 2025 02:35:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 781C021ADC7;
	Wed, 26 Feb 2025 02:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="S1gwcxb1"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20626183CA6;
	Wed, 26 Feb 2025 02:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740537321; cv=none; b=QbJ68SUFvRU3HuF08Vr3VtJfdoIvKbLu43GRXNhLiXksQ8zNtqWgGJPEM2n23hjfKKJSNqHJng8dhlCP+CkUNQvMJ/XzCSZvQP3FEnhMbINCT4eHyj4r/bxJn8TNqDDkuagqxkQus4lWnJ8xPXB5vj4bdOpI6hbzAm9NST1CVoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740537321; c=relaxed/simple;
	bh=D1D8rS483Kvk10lvdoELGqdaSPPJ8+RwRwWrcJv/f3I=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=CRk5uTgH6enoh6mYTEU88DEVo905Qv0x+CN8V10gPs98ILvhAGilvBQLsU7igpXSAJgXWLPSgdOZ7pRSBtvq4Z3Cur497RfPFCUsB8SQ+qxES9kB5tgBcT8oNgorDM4XNX2zg2laFGVop8SKapKBINpdud1cGHy/FKShKN4C9lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=S1gwcxb1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C1C5C4CEDD;
	Wed, 26 Feb 2025 02:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1740537320;
	bh=D1D8rS483Kvk10lvdoELGqdaSPPJ8+RwRwWrcJv/f3I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=S1gwcxb1U5NetK3xMsHF5vM6u60LvjvD37R2V7WH6p4gYsrCTXOx/Tm8FgtAbjivR
	 qz+7qiIisTFHmeHWl5R9WetoFdsZhGC4DSBkZuJtQrrOYkeMmMmZLGVAL4e/QXKk4q
	 rWdAk6qG/KIo4K2Hgo8x/4gNeZ32aVYhEb8keWT8=
Date: Tue, 25 Feb 2025 18:35:19 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: peterz@infradead.org, kevin.brodsky@arm.com, riel@surriel.com,
 vishal.moola@gmail.com, david@redhat.com, jannh@google.com,
 hughd@google.com, willy@infradead.org, yuzhao@google.com,
 muchun.song@linux.dev, will@kernel.org, aneesh.kumar@kernel.org,
 npiggin@gmail.com, arnd@arndb.de, dave.hansen@linux.intel.com,
 rppt@kernel.org, alexghiti@rivosinc.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-um@lists.infradead.org, x86@kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 5/6] x86: pgtable: convert to use tlb_remove_ptdesc()
Message-Id: <20250225183519.91a5b75b13c0df6954c68576@linux-foundation.org>
In-Reply-To: <36ad56b7e06fa4b17fb23c4fc650e8e0d72bb3cd.1740454179.git.zhengqi.arch@bytedance.com>
References: <cover.1740454179.git.zhengqi.arch@bytedance.com>
	<36ad56b7e06fa4b17fb23c4fc650e8e0d72bb3cd.1740454179.git.zhengqi.arch@bytedance.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 25 Feb 2025 11:45:55 +0800 Qi Zheng <zhengqi.arch@bytedance.com> wrote:

> The x86 has already been converted to use struct ptdesc, so convert it to
> use tlb_remove_ptdesc() instead of tlb_remove_table().
> 

This is dependent upon Rik's a37259732a7dc ("x86/mm: Make
MMU_GATHER_RCU_TABLE_FREE unconditional") from the x86 tree.  I'll add
Rik's patch to mm-unstable also and shall figure it out during the
merge window.

