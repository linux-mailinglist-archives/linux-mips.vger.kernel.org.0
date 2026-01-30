Return-Path: <linux-mips+bounces-13053-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EGNbBLOqfGkaOQIAu9opvQ
	(envelope-from <linux-mips+bounces-13053-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 30 Jan 2026 13:57:23 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E2DBACBA
	for <lists+linux-mips@lfdr.de>; Fri, 30 Jan 2026 13:57:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 25ADE300C9B4
	for <lists+linux-mips@lfdr.de>; Fri, 30 Jan 2026 12:57:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC9BB37F0FF;
	Fri, 30 Jan 2026 12:57:19 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85E9537E2F5;
	Fri, 30 Jan 2026 12:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769777839; cv=none; b=Gow5oj47g+6IQIXOGAd0j53erGb0irUhusln0JYUDt/pHyGMdmlhIESvGn9Cnn6h2PHrqsO1frmcS+6+i7qiklLydJqcCd89CeGzfFv4iEqOuPg68/axk+U7CJmoDLDIhA7IelcTC8eCMrAJU6ufzM61wVxVHzKqTCG5DtJqReY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769777839; c=relaxed/simple;
	bh=mPtaEym0fhYfjZwJtmBdsINw2GNzUKeb1p9XPJatUyY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J3tPD3yntBCtfKsiuNMmTuJd053mBK+3+7rhp+B+fw7mveuHsZq0+XfErrCvXf2/kZLPsbqyverp4GHt26qqv5+M9rgRjBNElK3O5KyAWrxXBoIT4Dl2Y0jSByTWqvRGE4wUNHVUWRDTqNX9Y8bL6+6UkxFz5kR8SAg0h0tQ0X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1vlnpE-0006Qd-00; Fri, 30 Jan 2026 13:42:12 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 123C3C05CE; Fri, 30 Jan 2026 13:40:45 +0100 (CET)
Date: Fri, 30 Jan 2026 13:40:45 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: John Garry <john.g.garry@oracle.com>
Cc: Huacai Chen <chenhuacai@kernel.org>, kernel@xen0n.name,
	jiaxun.yang@flygoat.com, tglx@linutronix.de, mingo@redhat.com,
	bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com,
	luto@kernel.org, peterz@infradead.org, arnd@arndb.de,
	x86@kernel.org, loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-arch@vger.kernel.org, vulab@iscas.ac.cn,
	gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org
Subject: Re: [PATCH v2 3/4] MIPS: Loongson: Make cpumask_of_node() robust
 against NUMA_NO_NODE
Message-ID: <aXymzRDYGatRUcp0@alpha.franken.de>
References: <20260107094007.966496-1-john.g.garry@oracle.com>
 <20260107094007.966496-4-john.g.garry@oracle.com>
 <CAAhV-H5RnDi1krGk4g7YuLuY+Pus6VcTadvBED4MCjX45m7YmQ@mail.gmail.com>
 <eac13252-cbc3-4396-895b-bd0800c7318e@oracle.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eac13252-cbc3-4396-895b-bd0800c7318e@oracle.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13053-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[franken.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tsbogend@alpha.franken.de,linux-mips@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 95E2DBACBA
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 12:21:45PM +0000, John Garry wrote:
> On 25/01/2026 03:55, Huacai Chen wrote:
> > Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>
> 
> Thanks
> 
> So can a loongarch or mips maintainer pick this up please?

I'll take MIPS patch.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

