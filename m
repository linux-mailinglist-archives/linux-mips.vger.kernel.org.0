Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F166B1E1746
	for <lists+linux-mips@lfdr.de>; Mon, 25 May 2020 23:44:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388325AbgEYVoO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 25 May 2020 17:44:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:47028 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388279AbgEYVoO (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 25 May 2020 17:44:14 -0400
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net [73.231.172.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8F181206C3;
        Mon, 25 May 2020 21:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590443054;
        bh=Nqbaxgpvx5uyazgnzFeWBQQFly0LKrKypsDhmFo/xlc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=EcayJDEBS4en947dek/H2KlOkLO6wCO+VdOmh/QJCziXLYUizbKCcBOSnvUEcxZRy
         Hu+gcJ2Bfy2DHs+pQ7gslA88Sw24TmUtoKUIi27UGT7gR+p86Nxlj7cpbVQCBfeP0d
         R4eQxu52iUf5wFYdwAzgc+VZJF2bbZ/sjVZqMkMY=
Date:   Mon, 25 May 2020 14:44:13 -0700
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
Subject: Re: [PATCH v6 3/4] mm/memory.c: Add memory read privilege on page
 fault handling
Message-Id: <20200525144413.8c13559ec87616aa2c77af41@linux-foundation.org>
In-Reply-To: <1590375160-6997-3-git-send-email-maobibo@loongson.cn>
References: <1590375160-6997-1-git-send-email-maobibo@loongson.cn>
        <1590375160-6997-3-git-send-email-maobibo@loongson.cn>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 25 May 2020 10:52:39 +0800 Bibo Mao <maobibo@loongson.cn> wrote:

> Here add pte_sw_mkyoung function to make page readable on MIPS
> platform during page fault handling. This patch improves page
> fault latency about 10% on my MIPS machine with lmbench
> lat_pagefault case.
> 
> It is noop function on other arches, there is no negative
> influence on those architectures.

Acked-by: Andrew Morton <akpm@linux-foundation.org>

Should I take these, or would the mips tree be preferred?  I'm OK
either way, but probably the MIPS tree would be better?
