Return-Path: <linux-mips+bounces-12167-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8DEC4826A
	for <lists+linux-mips@lfdr.de>; Mon, 10 Nov 2025 17:57:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C8DC18907E7
	for <lists+linux-mips@lfdr.de>; Mon, 10 Nov 2025 16:55:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0709231B110;
	Mon, 10 Nov 2025 16:52:09 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31AC330FC31;
	Mon, 10 Nov 2025 16:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762793528; cv=none; b=eFhcCn+wE56VH+F0eEFbWN6PvSn199L+atPj3TEmkm1kN4pqGIPCTCmzLtdB/9aijN4ipsrrs8Gmztv3zEVKwia5LqzIuBnbhTxDNEaYXUXVDMQJupYIQh7f3suvQTnht4XY9q7yk0xbzfmx1EKXUnDGlXJllBynn0DRMRdaBhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762793528; c=relaxed/simple;
	bh=R/IQpoRi1HuDKqQifvAwjIb9BDC5XbzLDfSTK+Q3BdU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jdDRpOzSK12UpKdo+98qNGGnoID7qURj6rqWCrxQkISiMSFZP3szTk13qAGWm2ImNcz5gT7Q8DfjLfC52w/YfTClk7xq3H3VVFKmVN2sd0Ee0+d6aKrf+/tJroGE4aslBKVNeuJaaE3SU/+yKlOXmEIJ8OzKibsYNfJMy7Tv+M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1vIV7V-0005rk-00; Mon, 10 Nov 2025 17:51:57 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 032D8C051B; Mon, 10 Nov 2025 17:51:37 +0100 (CET)
Date: Mon, 10 Nov 2025 17:51:37 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Nick Bowler <nbowler@draconx.ca>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: PROBLEM: boot hang on Indy R4400SC (regression)
Message-ID: <aRIYGUzHa-8U85Ei@alpha.franken.de>
References: <g3scb7mfjbsohdszieqkappslj6m7qu3ou766nckt2remg3ide@izgvehzcdbsu>
 <e4ed75c7-b108-437f-b44b-69a9b340c085@app.fastmail.com>
 <ea6p4efuwbrlqjiwkgjcd7ofj7aahfnnvnkooo2il36ggzrlcj@n6mcofpb2jep>
 <j5uutbx2oi2ccudo54o4hgxfmwfchwmd2ktig6xjgkqa7ho2pj@xb4luighppnc>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <j5uutbx2oi2ccudo54o4hgxfmwfchwmd2ktig6xjgkqa7ho2pj@xb4luighppnc>

On Sat, Nov 08, 2025 at 03:02:17PM -0500, Nick Bowler wrote:
> On Fri, Nov 07, 2025 at 03:12:31PM -0500, Nick Bowler wrote:
> > On Fri, Nov 07, 2025 at 07:29:25PM +0000, Jiaxun Yang wrote:
> > > Unfortunately my Indy won't go over ARCS prom so I'm not in a position
> > > to debug this on my side. I have inspected the code again and I can't
> > > see anything preventing it to work on R4000 family.
> > 
> > I'll try adding some extra prints to at least figure out where it is
> > actually hanging.
> 
> I did not have much success with adding prints, but looking more closely
> at the console output it seems that what is ultimately failing is the
> SCSI bus enumeration which does not complete unless I revert commit
> 35ad7e181541.

the problem is the tlb_probe() r4k_tlb_uniquify(), if the TLB contains

Index:  0 pgmask=4kb va=80000000 asid=00
	[pa=00000000 c=0 d=0 v=0 g=0] [pa=00000000 c=0 d=0 v=0 g=0]
Index:  1 pgmask=4kb va=80000000 asid=00
	[pa=00000000 c=0 d=0 v=0 g=0] [pa=00000000 c=0 d=0 v=0 g=0]
Index:  2 pgmask=4kb va=80000000 asid=00
	[pa=00000000 c=0 d=0 v=0 g=0] [pa=00000000 c=0 d=0 v=0 g=0]
Index:  3 pgmask=4kb va=80000000 asid=00
	[pa=00000000 c=0 d=0 v=0 g=0] [pa=00000000 c=0 d=0 v=0 g=0]
Index:  4 pgmask=4kb va=80000000 asid=00
	[pa=00000000 c=0 d=0 v=0 g=0] [pa=00000000 c=0 d=0 v=0 g=0]
[...]

which is coming from the Indy PROM. I only tested this patch on an R5k
Indy and the R5000 CPU doesn't have a problem with this.

I'm working on a fix for this.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

