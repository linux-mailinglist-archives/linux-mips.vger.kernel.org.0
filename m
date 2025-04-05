Return-Path: <linux-mips+bounces-8483-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C09AAA7CA7B
	for <lists+linux-mips@lfdr.de>; Sat,  5 Apr 2025 19:09:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7BC4A3B5A79
	for <lists+linux-mips@lfdr.de>; Sat,  5 Apr 2025 17:09:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92946191F84;
	Sat,  5 Apr 2025 17:09:21 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D2B14B07A;
	Sat,  5 Apr 2025 17:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743872961; cv=none; b=Y1XT6Zjo4hqqDBWpyRrlsi72YUw3eT4kjzNGE4eSBOlpkqBpJ1REOM3vWFSCRUS+5m0fBtKBZjILF4G17n+VstCI8NchR2bkYQxaTJdcXcaxMtFfoYiZvsSN/+tzrLPcgwIi1qj6lPo8NgIfYNgeIW2APN6BB3zsbv9aiAt/hTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743872961; c=relaxed/simple;
	bh=tmIf37hkJseqnFO4ijvf4xA+K3JIaSwLPz9+OPSHUO4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HuaWonn4wOGF1Lodg+c2ZK9OU8iK9TsBHktj8nIIoACvFzt/Sn3nWCPMHULErFdt64+DTHDIq2DVSf9Wzf80NpR7R2K0T93I/RB4hALEZv3FIU4Q3JOP23ysOF37Gqw60XdEC2zj9sEZRVD8n1xFMkvWCajfrJY8gcrRal+ZRds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from mop.sam.mop (unknown [82.8.138.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sam)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 5C1583430E5;
	Sat, 05 Apr 2025 17:09:14 +0000 (UTC)
From: Sam James <sam@gentoo.org>
To: linmag7@gmail.com, Al Viro <viro@ftp.linux.org.uk>
Cc: arnd@arndb.de, chris@zankel.net, dinguyen@kernel.org,
 glaubitz@physik.fu-berlin.de, ink@unseen.parts, jcmvbkbc@gmail.com,
 kees@kernel.org, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-um@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 loongarch@lists.linux.dev, mattst88@gmail.com, monstr@monstr.eu,
 richard.henderson@linaro.org, sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v2 1/1] mm: pgtable: fix pte_swp_exclusive
In-Reply-To: <87cyfejafj.fsf@gentoo.org>
Organization: Gentoo
References: <87cyfejafj.fsf@gentoo.org>
User-Agent: mu4e 1.12.9; emacs 31.0.50
Date: Sat, 05 Apr 2025 18:09:11 +0100
Message-ID: <87v7rik020.fsf@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Sam James <sam@gentoo.org> writes:

> Lovely cleanup and a great suggestion from Al.
>
> Reviewed-by: Sam James <sam@gentoo.org>
>
> I'd suggest adding a:
> Suggested-by: Al Viro <viro@zeniv.linux.org.uk>

Al, were you planning on taking this through your tree?

>
> thanks,
> sam

