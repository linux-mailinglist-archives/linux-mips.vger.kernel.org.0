Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF2681E1742
	for <lists+linux-mips@lfdr.de>; Mon, 25 May 2020 23:42:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731455AbgEYVmo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 25 May 2020 17:42:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:46724 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726393AbgEYVmn (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 25 May 2020 17:42:43 -0400
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net [73.231.172.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8DCAC206C3;
        Mon, 25 May 2020 21:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590442963;
        bh=ToLahLcHS5YuqpF5aWI2D5IGWDxwlGaQIecOqgl9Rgc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=N787yoS5m5UzcN6rHbKjgbFq6/yc6cPmNKh1vvBpEtoQywkkcFgbWdsObtac565F6
         IbxprCGv59bVg1JhmZJiv4PS12qwsuO5ndi/qfR7gJJG6mMxARDP6mn4Cfk2mQ0uOb
         l1PxyIjP+J5vdWOATl3HDUEwcifL/q0W2x1YIhRc=
Date:   Mon, 25 May 2020 14:42:41 -0700
From:   Andrew Morton <akpm@linux-foundation.org>
To:     Bibo Mao <maobibo@loongson.cn>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>,
        Paul Burton <paulburton@kernel.org>,
        Dmitry Korotin <dkorotin@wavecomp.com>,
        Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
        Stafford Horne <shorne@gmail.com>,
        Steven Price <steven.price@arm.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Rapoport <rppt@linux.ibm.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "Maciej W. Rozycki" <macro@wdc.com>, linux-mm@kvack.org,
        David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v6 1/4] MIPS: Do not flush tlb page when updating PTE
 entry
Message-Id: <20200525144241.f0e55183a846607cdbb0d819@linux-foundation.org>
In-Reply-To: <1590375160-6997-1-git-send-email-maobibo@loongson.cn>
References: <1590375160-6997-1-git-send-email-maobibo@loongson.cn>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 25 May 2020 10:52:37 +0800 Bibo Mao <maobibo@loongson.cn> wrote:

> It is not necessary to flush tlb page on all CPUs if suitable PTE
> entry exists already during page fault handling, just updating
> TLB is fine.
> 
> Here redefine flush_tlb_fix_spurious_fault as empty on MIPS system.
> 
> ...
>
> --- a/arch/mips/include/asm/pgtable.h
> +++ b/arch/mips/include/asm/pgtable.h
> @@ -478,6 +478,8 @@ static inline pgprot_t pgprot_writecombine(pgprot_t _prot)
>  	return __pgprot(prot);
>  }
>  
> +#define flush_tlb_fix_spurious_fault(vma, address) do { } while (0)
> +

static inline C would be preferred, if that works.  For a number of reasons:

- looks nicer

- more likely to get a code comment (for some reason)

- adds typechecking.  So right now a MIPS developer could do

	struct wibble a;
	struct wobble b;

	flush_tlb_fix_spurious_fault(&a, &b);

  and there would be no compiler warning.  Then the code gets merged
  upstream and in come the embarrassing emails!

- avoids unused-var warnings

	foo()
	{
		struct address_space a;
		struct vm_area_struct v;

		flush_tlb_fix_spurious_fault(&v, &a);
	}

will generate unused-variable warnings if
flush_tlb_fix_spurious_fault() is a macro.  Making
flush_tlb_fix_spurious_fault() inlined C prevents this.

