Return-Path: <linux-mips+bounces-3981-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E5E91A217
	for <lists+linux-mips@lfdr.de>; Thu, 27 Jun 2024 11:02:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 26BA81C21729
	for <lists+linux-mips@lfdr.de>; Thu, 27 Jun 2024 09:02:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67568137757;
	Thu, 27 Jun 2024 09:02:37 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9512139568;
	Thu, 27 Jun 2024 09:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719478957; cv=none; b=JAD8ngpmdFSLXbo6qPoNk6lmvo/n1I2ziKyfrrb0YyChsYIVVYC63puqtM7+03/yDWtRkracmkej5jU/QgB946S6d4LLAmJ9SbzfOUyX1Jj25dLuG1ehTgrY6YDU/tIYWeCW/Xo8323al12xrU6k4gtl+0xkyMmWaP6Go8HFC9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719478957; c=relaxed/simple;
	bh=GZwp6yadKXVxKrVc/mC/Edbhad0OS2kZr6kU6uOv9z4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jCrdbEOF3W9n82MvrJWIUhk64fap8GTw/ugo6vg3r5QA4pOjWINEYKT/wsR9MiMhcvFVWPG0l6VQO1+xJKYPkzeEPP7hWBnMFNMYOKKNHKHUPcyuPexcV7IWzryjGHrUk0kKkVFgZpZ+5CIM0Ks+z1BAATWPg81mufmLgv2Q2yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1sMl1G-0002g0-00; Thu, 27 Jun 2024 11:02:18 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 830A1C0120; Thu, 27 Jun 2024 11:00:11 +0200 (CEST)
Date: Thu, 27 Jun 2024 11:00:11 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH fixes 3/4] MIPS: cps-vec: Replace MT instructions with
 macros
Message-ID: <Zn0qG5tsMBYcSWW+@alpha.franken.de>
References: <20240616-mips-mt-fixes-v1-0-83913e0e60fc@flygoat.com>
 <20240616-mips-mt-fixes-v1-3-83913e0e60fc@flygoat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240616-mips-mt-fixes-v1-3-83913e0e60fc@flygoat.com>

On Sun, Jun 16, 2024 at 02:25:04PM +0100, Jiaxun Yang wrote:
> Replace MT instructions with macros to deal with assemblers
> not supporting MT ASE properly.

how about simply enforcing the need for a correct toolchain instead
of making the code ugly ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

