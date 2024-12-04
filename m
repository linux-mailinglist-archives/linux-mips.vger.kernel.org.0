Return-Path: <linux-mips+bounces-6866-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C53349E3E80
	for <lists+linux-mips@lfdr.de>; Wed,  4 Dec 2024 16:41:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 80FCA2832D4
	for <lists+linux-mips@lfdr.de>; Wed,  4 Dec 2024 15:41:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A600D1FBCB2;
	Wed,  4 Dec 2024 15:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="ykL9vsVr";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="XK6qJgnD";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="ykL9vsVr";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="XK6qJgnD"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A001F9F7A;
	Wed,  4 Dec 2024 15:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733326876; cv=none; b=eHeNgwEXiL4iRsMIwYPBuhpOIg5GNN4qzavpKJhAaYp0mB/25DxhZDbvNiRS1Oj/xS2ImVYWdKDWwmaihOtm0vuwMxXwU/k3aqNSxfnM5HwAilmZMNldplqaZLpPaUDrvWgjO1fZaI+RBOMknmKeOIqlxdDYutcTovEShAzx2QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733326876; c=relaxed/simple;
	bh=34J/aDfQ/XZbHuRKE4Gs0ZSt/n/12GNQCAcgyi2GggU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CcprjrL0R7X7jxNII89zhpobj4uZTnaKCRP+9xBrEpOLKp2vMIPs9pukEZbKErhboIDHt3VWxUvgcNqGmBhcm1q7Zjqg1Zk1Z4dpTelyFdxaxT7LRr/ciC9wk9w8CL3V87PjplNi3pFqobhR2igekQvKuPoUjUCPGpEsJR3t4P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=ykL9vsVr; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=XK6qJgnD; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=ykL9vsVr; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=XK6qJgnD; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DD0E52118E;
	Wed,  4 Dec 2024 15:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1733326872; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=reoOQBgkrA4sZl3NYvbkPNgWXCt4Gy/cJQyTHRwW5FM=;
	b=ykL9vsVrnInFTiF9JAa/o7ISOzsKwCTNoSzsQl3boxALf4BYA2YQd/En26/4qCX40zop5e
	kG+DAPfrFmdaRzCgPpjeJ6XxEz+1+sS4CMz6Ftg4Cop1CwHZYvReW7+UySZC3Z/Fv535Y+
	YNy5EOQXoiVEfxxXzu/BMvKhpzxaNVI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1733326872;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=reoOQBgkrA4sZl3NYvbkPNgWXCt4Gy/cJQyTHRwW5FM=;
	b=XK6qJgnDOEvqvFbyMCgq4D3G6qQlL+fDQozOTjMp3rDSHnH6c0lR7EwD8UWQ/vb9RfMoM4
	HsZaUKij7HvEaFCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1733326872; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=reoOQBgkrA4sZl3NYvbkPNgWXCt4Gy/cJQyTHRwW5FM=;
	b=ykL9vsVrnInFTiF9JAa/o7ISOzsKwCTNoSzsQl3boxALf4BYA2YQd/En26/4qCX40zop5e
	kG+DAPfrFmdaRzCgPpjeJ6XxEz+1+sS4CMz6Ftg4Cop1CwHZYvReW7+UySZC3Z/Fv535Y+
	YNy5EOQXoiVEfxxXzu/BMvKhpzxaNVI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1733326872;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=reoOQBgkrA4sZl3NYvbkPNgWXCt4Gy/cJQyTHRwW5FM=;
	b=XK6qJgnDOEvqvFbyMCgq4D3G6qQlL+fDQozOTjMp3rDSHnH6c0lR7EwD8UWQ/vb9RfMoM4
	HsZaUKij7HvEaFCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BAE48139C2;
	Wed,  4 Dec 2024 15:41:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id g3tELRh4UGfYYgAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Wed, 04 Dec 2024 15:41:12 +0000
Message-ID: <f64f8a9e-fda8-4f7a-85a2-0113de2feb6c@suse.cz>
Date: Wed, 4 Dec 2024 16:41:12 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: avoid zeroing user movable page twice with
 init_on_alloc=1
To: Zi Yan <ziy@nvidia.com>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Miaohe Lin <linmiaohe@huawei.com>, Kefeng Wang <wangkefeng.wang@huawei.com>,
 John Hubbard <jhubbard@nvidia.com>, "Huang, Ying" <ying.huang@intel.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Alexander Potapenko
 <glider@google.com>, Kees Cook <keescook@chromium.org>,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
References: <20241011150304.709590-1-ziy@nvidia.com>
 <CAMuHMdV1hRp_NtR5YnJo=HsfgKQeH91J537Gh4gKk3PFZhSkbA@mail.gmail.com>
 <DAFE2913-0B32-484F-83BE-080C60362DB8@nvidia.com>
Content-Language: en-US
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <DAFE2913-0B32-484F-83BE-080C60362DB8@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.cz:mid]
X-Spam-Score: -4.30
X-Spam-Flag: NO

On 12/4/24 16:24, Zi Yan wrote:
> On 4 Dec 2024, at 5:41, Geert Uytterhoeven wrote:
> 
> The provided config does not have THP on, so the changes to mm/huge_memory.c
> and mm/memory.c do not apply.
> 
> Can you try the patch below and see if the machine boots? Thanks.

Hmm looks like mips has some involved clear_user_page()
in arch/mips/include/asm/page.h

So maybe the clearing done as part of page allocator isn't enough here.

> 
> diff --git a/include/linux/highmem.h b/include/linux/highmem.h
> index 6e452bd8e7e3..bec9bd715acf 100644
> --- a/include/linux/highmem.h
> +++ b/include/linux/highmem.h
> @@ -224,7 +224,13 @@ static inline
>  struct folio *vma_alloc_zeroed_movable_folio(struct vm_area_struct *vma,
>  				   unsigned long vaddr)
>  {
> -	return vma_alloc_folio(GFP_HIGHUSER_MOVABLE | __GFP_ZERO, 0, vma, vaddr);
> +	struct folio *folio;
> +
> +	folio = vma_alloc_folio(GFP_HIGHUSER_MOVABLE, 0, vma, vaddr);
> +	if (folio)
> +		clear_user_highpage(&folio->page, vaddr);
> +
> +	return folio;
>  }
>  #endif
> 
> 
> Best Regards,
> Yan, Zi
> 


