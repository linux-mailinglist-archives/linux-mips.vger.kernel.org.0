Return-Path: <linux-mips+bounces-6975-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7DB9EEDCB
	for <lists+linux-mips@lfdr.de>; Thu, 12 Dec 2024 16:51:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF3B9169BB3
	for <lists+linux-mips@lfdr.de>; Thu, 12 Dec 2024 15:46:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16EED2054F8;
	Thu, 12 Dec 2024 15:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="uJnWz775"
X-Original-To: linux-mips@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE7D14A82;
	Thu, 12 Dec 2024 15:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734018327; cv=none; b=ZN9b2RSDuWCz2fZTybkB8lRjzB9sbUvY1l4lnUJmMnirahn+G/MO93tvfVBr4Gf5/+7463o0G0mitbmXmeZT6NBJJ0rahyzdcjJ7oW4L1tPhRaMrAIBPvnyr1YDkwjOiJsq3kYYEC2HnDRtyIxcSHJz6KhLsm90mYbqONCngTkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734018327; c=relaxed/simple;
	bh=kDn3tkt3VamjHt+kRoXTukwZL9aFhqsGLgcQdhBHV1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CeVZGflCHZFWH+X/kdpwb9oai6WARMR4Q8xY5ayOiF0Y+o1sHQutu2iZ8euzbJpwVmWAHXELPLVH6WHLO1GUrqH9xqlEz4IlfXb2ZMQTuAMTiFndhkFy2v7NMdqX56dr5GKu4BOtJo/c3NNUTDPQv22oI58N+FXLz+3i3TdW18g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=uJnWz775; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=gLVuf3vyv80xWoO2o27xzYEmbbB8WpyOLkmBiyviyXE=; b=uJnWz775hrBH4mNu2PbI84umbx
	l/F2RNZ5jSV5KiaI2Pk7DXPT6/eYy8Tmc+NnTQHi+B3U8au3Uh2/7PHG57s2QL2qhGaEEylh1ClMy
	4AQMfIYJfrqjGgh9CvuaJi/yQPRfuchYc11ejbDYdviGkOQTVE9QLh/G8VJZhC+8C98yzkHycG+bk
	bGu3l0TKJXxQ5oNEfusVJfOpDBDhqQbAmyiHu2gyosA5gJOpSEA7j/JLUd9YsqqUSx8uphdHqPonn
	oyb30XErb1KiqBaoL2v8UpLN5wbEvKmPFJyxAMSufj8U2oMNj/lfKSW7dIdstyTZ1EZP+npAARWAu
	EV1dkJ1g==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1tLlNM-00000006Xse-3Ve9;
	Thu, 12 Dec 2024 15:45:16 +0000
Date: Thu, 12 Dec 2024 15:45:16 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: Re: [RFC PATCH 2/2] mm: make mmap_region() internal
Message-ID: <Z1sFDCx8m4-TPjqG@casper.infradead.org>
References: <cover.1734017293.git.lorenzo.stoakes@oracle.com>
 <80b7c4ba4f0a2b3084117975bd1af62a403ac881.1734017293.git.lorenzo.stoakes@oracle.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <80b7c4ba4f0a2b3084117975bd1af62a403ac881.1734017293.git.lorenzo.stoakes@oracle.com>

On Thu, Dec 12, 2024 at 03:36:47PM +0000, Lorenzo Stoakes wrote:
> +++ b/mm/vma.h
> @@ -242,9 +242,9 @@ bool vma_wants_writenotify(struct vm_area_struct *vma, pgprot_t vm_page_prot);
>  int mm_take_all_locks(struct mm_struct *mm);
>  void mm_drop_all_locks(struct mm_struct *mm);
>  
> -unsigned long __mmap_region(struct file *file, unsigned long addr,
> -		unsigned long len, vm_flags_t vm_flags, unsigned long pgoff,
> -		struct list_head *uf);
> +unsigned long mmap_region(struct file *file, unsigned long addr,
> +			  unsigned long len, vm_flags_t vm_flags, unsigned long pgoff,
> +			  struct list_head *uf);

Please don't line up the arguments with the paren.  Just leave it as two
tabs.


