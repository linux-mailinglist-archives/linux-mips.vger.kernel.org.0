Return-Path: <linux-mips+bounces-9651-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D56EAFB6CE
	for <lists+linux-mips@lfdr.de>; Mon,  7 Jul 2025 17:05:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A2544A33C0
	for <lists+linux-mips@lfdr.de>; Mon,  7 Jul 2025 15:04:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B8702E1724;
	Mon,  7 Jul 2025 15:04:06 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 720822BE037;
	Mon,  7 Jul 2025 15:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751900646; cv=none; b=UOGTq8atPwYob9zNwaKMTy9Y+/MpKYyeIys8caYv6biPL3xx2uO3NodcRuqpdi4a+kb0ju6Ka+qBA+R9J/I0sQBD8iiz5J8tdZaklTWmJkC2d62OwXCboMqu2iJgWALUb5JI/u1fehkxdmFedXFpH4sZth8gmqHJsEB1Pz7DIFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751900646; c=relaxed/simple;
	bh=wOra4377OWWLaTEqsu92sX4l6zXgHOrmvcCCFdouGLI=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ksWp/g4F2SDhHFWPVbSmwvbyN/6Rxb8h7xSudf8RYc6vFyr+pe/1ORHy0EMwn5P4t+QxTIL8kMIya068h+vOD0H9mSME2oLtsK+TWdHpaZ6NDLXv/vvHwq43C0382SWemHcQBDBNcR5mbe0s7jVDDpTa3wkMoeKByepzB2RrlSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 17F5392009D; Mon,  7 Jul 2025 16:57:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 11ACD92009B;
	Mon,  7 Jul 2025 15:57:02 +0100 (BST)
Date: Mon, 7 Jul 2025 15:57:01 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: WangYuli <wangyuli@uniontech.com>
cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
    zhanjun@uniontech.com, niecheng1@uniontech.com, guanwentao@uniontech.com
Subject: Re: Gentle ping: [PATCH v2 0/6] MIPS: Resolve build problems on
 decstation_64
In-Reply-To: <9ED003291C66C906+94d03a66-3573-4e3f-aaac-d7c55f750776@uniontech.com>
Message-ID: <alpine.DEB.2.21.2507071545400.56608@angie.orcam.me.uk>
References: <24EC7D2CA58B25F5+20250422101855.136675-1-wangyuli@uniontech.com> <9ED003291C66C906+94d03a66-3573-4e3f-aaac-d7c55f750776@uniontech.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi WangYuli,

> This is a gentle ping.
> 
> I've addressed all the feedback from previous discussions and tried resending
> multiple times, but haven't received any response

 Thank you for pinging.

 I've tried to verify your changes at run time and it's turned out that a 
generic change to the serial communication subsystem made a while ago has 
caused the port to become unbootable, and it now crashes early on in port 
registration.

 As I'd rather was sure no regression is introduced with your changes I am 
going to put them on hold until the issue with the serial ports has been 
fixed.  I know what to do there and just need to find a time slot to get 
that sorted.

 No worries, I'm not going to lose your changes.  Thank you for patience.

  Maciej

