Return-Path: <linux-mips+bounces-6993-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 09EB19F0258
	for <lists+linux-mips@lfdr.de>; Fri, 13 Dec 2024 02:39:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 91ABD188E718
	for <lists+linux-mips@lfdr.de>; Fri, 13 Dec 2024 01:39:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0509F1F95E;
	Fri, 13 Dec 2024 01:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="NOajGzF7"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA1844C6C;
	Fri, 13 Dec 2024 01:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734053976; cv=none; b=gipHYLeu8gRnRDWvJlvqXDhUjpN7qo7OiX5z7wS79A32dPnR6YBprZxDuYTefBu6EICz1n4to91yMwCsXqhvIvDkEqSsOyNOraJbdH+KZU3dBmX0dM1YeSyqz7CQ/blEFoJimRYCfi9pEg/O0hlU2nDVUPwwk06jck3Vl/iSafA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734053976; c=relaxed/simple;
	bh=z6KasiqXW9OocT/gPdXD8wxFCgxz3hJU5rxa3NS7ujM=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=B7AtFy2Ac2um3oTsdQ+86tTvq9Avs4e8I5sC6wAb1R4rH3G+LzdiBOe86DGtEayXjsO9X1cSHGXSPPt6jzX4HVERMM1F3f3xFGtM7ZkSDi0QoRpyhTq3Fy8+9GGKit8YwTAsKBp3iR1eDUNhx+V/1E42sjsrp66zZHx04eFhkeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=NOajGzF7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA84DC4CECE;
	Fri, 13 Dec 2024 01:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1734053976;
	bh=z6KasiqXW9OocT/gPdXD8wxFCgxz3hJU5rxa3NS7ujM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NOajGzF7Oghi2j823OVBOAGjMfDE2y8sqhBtABteyi+xNwCVBGrHLGBc4kP8k/ZzS
	 nGpVqOiOxYmCXtpYVq8CDh3d/Emvq9T/1xFLC/6g4wNbedpjpYuIv/cuTxF0CeV0MY
	 ibJbSfQIh1u6+D2zMIFRD+W8TWrIVtCfqGegBRio=
Date: Thu, 12 Dec 2024 17:39:34 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Kalesh Singh <kaleshsingh@google.com>, lorenzo.stoakes@oracle.com,
 vbabka@suse.cz, yang@os.amperecomputing.com, riel@surriel.com,
 david@redhat.com, minchan@kernel.org, jyescas@google.com,
 linux@armlinux.org.uk, tsbogend@alpha.franken.de,
 James.Bottomley@hansenpartnership.com, ysato@users.sourceforge.jp,
 dalias@libc.org, glaubitz@physik.fu-berlin.de, davem@davemloft.net,
 andreas@gaisler.com, tglx@linutronix.de, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, chris@zankel.net,
 jcmvbkbc@gmail.com, bhelgaas@google.com, jason.andryuk@amd.com,
 leitao@debian.org, linux-alpha@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-mm@kvack.org, kernel-team@android.com,
 android-mm@google.com
Subject: Re: [PATCH mm-unstable v2 06/16] mm: csky: Introduce
 arch_mmap_hint()
Message-Id: <20241212173934.4dc429716acd4c71a76e15c2@linux-foundation.org>
In-Reply-To: <vc2uhcysgosapznbuookcj5677w43a4kzxbotwqub237ccawww@i3pbqiacdwsx>
References: <20241211232754.1583023-1-kaleshsingh@google.com>
	<20241211232754.1583023-7-kaleshsingh@google.com>
	<vc2uhcysgosapznbuookcj5677w43a4kzxbotwqub237ccawww@i3pbqiacdwsx>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 12 Dec 2024 16:40:10 -0500 "Liam R. Howlett" <Liam.Howlett@oracle.com> wrote:

> * Kalesh Singh <kaleshsingh@google.com> [241211 18:28]:
> > Introduce csky arch_mmap_hint() and define HAVE_ARCH_MMAP_HINT.
> > This is a preparatory patch, no functional change is introduced.
> 
> This also looks like it has changed the validation order and potentially
> introduced functional changes?
> 
> All these stem from the same cloned code (sparc32 iirc), but were not
> updated when the cloned code was updated.  This is why I am against
> arch_* code.  We should find a better way to unify the code so that
> there is nothing different.  You seem to have gotten some of the shared
> code together, but some still exists.
> 
> In the addresses, there are upper and lower limits, and sometimes
> "colours".  Could we not just define the upper/lower limits in each arch
> and if colour is used?  Maybe this is complicated with 32/64 handled
> both in the 64 bit code.
> 
> Is there any plan to unite this code further?
> 
> We have had errors for many years in cloned but not updated code.  I
> really wish there was more information in the cover letter on what is
> going on here.  I'd like to try and reduce the arch_ code to, basically
> nothing.
> 
> I was also disappointed that I wasn't Cc'ed because I've spent a lot of
> time in this code and this area.  I am probably the last one to crawl
> through and change any of this.

Thanks, I removed this version of this series from mm-unstable.

