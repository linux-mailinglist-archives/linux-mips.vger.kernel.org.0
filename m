Return-Path: <linux-mips+bounces-12152-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC29C4345E
	for <lists+linux-mips@lfdr.de>; Sat, 08 Nov 2025 21:02:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE92C1888968
	for <lists+linux-mips@lfdr.de>; Sat,  8 Nov 2025 20:02:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C90C623D7CF;
	Sat,  8 Nov 2025 20:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b="uXCbx/Ve"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2007A26ACB
	for <linux-mips@vger.kernel.org>; Sat,  8 Nov 2025 20:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762632142; cv=none; b=e4HTpsLpPD8PNlu1NXqakAuprBq9uoZ3AoX4Zq9hCm6vH8WO+Q+/DRgLmNApH5KHyHrRi7S8sfuE5bltre4g+GYQlWJnJ+V17Qz1SiM07WQ0Ox4LwLV66vQJoacJSKGcFn1I7eEPouJYTGkZ/a8Zbf6aHS5XrE1MYWLhpLEIxiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762632142; c=relaxed/simple;
	bh=vEZrLeBeJ7h1ipH89PqPi/zSNBxuNbQgKGCtCvuVOvs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MWjwKYnM+7IqPizLZHzLvUrHBSj7u8Ba+mrCoXbom2mJyeZZD2L5MNmmgu72wQHhwMpJ1YoQpl7vqaQdQBcOX7d91qrf+2dXo7x8vtzcvV0R13LRAj11VdWdcybVn6Lt9xARJUpaygwZ2i5OOOZ5F22BUYpEbAOClYraXuGLSXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca; spf=none smtp.mailfrom=draconx.ca; dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b=uXCbx/Ve; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=draconx.ca
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8af121588d9so262927285a.2
        for <linux-mips@vger.kernel.org>; Sat, 08 Nov 2025 12:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=draconx-ca.20230601.gappssmtp.com; s=20230601; t=1762632140; x=1763236940; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=afLIDtjU2jTYgwYOZlnNOt8tUMpTLcQFNlRa10jsVq4=;
        b=uXCbx/Ve2EP0neuZFLhGWMy7dXysEzjXrFPt9Cfj2/6+/JfLqnyirWi5b5PuhpFSP8
         txe5vj8WXnF4+p8ytuMPVWFJ4EPZiVxjNZoW7FKnA7rs3L5fntgkK/JBAK+s9TMGREes
         zsmyoT+OJC99bEsm8ArDdqfWNOb8ZsDqphUMDJsSc/27OTJRmXAzKUuaIaR6LCg0hPpa
         ECFUwdASC9W9yFA1Q8bqaAv1KJMHSus6yMUC9axWzxNBcTJ0OukccjH+elO7M0I05Fh7
         GRUqJkwfl2a/xfbD6Bpbu9R5wOh27yVuxG25Eypz809YlhWNLCLX1by7+KLTS9XoiPSp
         b+IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762632140; x=1763236940;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=afLIDtjU2jTYgwYOZlnNOt8tUMpTLcQFNlRa10jsVq4=;
        b=bGo4361YOi+eoxJkoticBW30CpNS0+GAZdyEIemKU2RifpEAOyNUPP711Mx5zUZVR4
         cXvfqzYd6BYhJ1VNYf7E081OJs/Pfoh7An0doQMz3+6RMGNCjqiZkTh3pASF0i3XVH/1
         WXjRaXJlyYna+T0fMPMa+n4bUcvu+NuaINHG6mOpAy0Iekk25AjH9Jm2DA8ws8R8Nn/u
         ndeKyjh8TXD+1q0PxutzmSaW9fni9O3X0o+4w2PvuPrKUtjp4l5oRWaMwc6OfrGi8JNa
         6wdxVsEMcRcBOFEmrXvl8ihMGs2Llz1YDQLVQw4NogXrbGUaN3VMMXTtL2h+qlHJc7f0
         +hMw==
X-Forwarded-Encrypted: i=1; AJvYcCVJBcCXSWxfaQ/DhnZaoKqS5pdk8kI0WIwQTUa4fi1Lzt3dqeIY833PT+N9du0P/IMr60BGux9y/BgL@vger.kernel.org
X-Gm-Message-State: AOJu0YzBXMaJ32xtoUEfWBhSPk0Q2U5Y9vSulf9PKJ5fMxEauvuRi0o6
	+nqxWhXXKTBPS3YCjbEJG0Q6m2yMsVXtWrzJlsGnlhQTyrFP/8OQK9umhK4SaPc4rpY=
X-Gm-Gg: ASbGnctk50nU5u67XRWm5QfrDrrEnWGxZGh0+DpqctMK6UqQNKYdscR+t0gvKs/uSqz
	wMA4ToV5Y4RQYB81So4u70SadEESpc6lBrHe9YRNgDQKueb2rVi2L/ZMasu4lkNP9BDDWgGdCUr
	QUCECnYZ//p4vYzebyoyCQrBvhL8m/F42zhHrp8PZeaxb23voMncGCj34deDsZ+SA/+W02CtEFm
	BhTAvu3BqETnhVMBjUOLzRT+iG1/CAZkP/W6CvSSLmdRkvHeHDCDXlvGP0IZvwy24x9it2cqS4z
	BphrnOGZQhj2YpkJi5ptaYh+cmpGVJhM3kEWcKx9dEFhdUKXvmwzF17mqtiXBkD4TvyBM954KrD
	tuiOSicCTulBbzy0Nad++1kreD0N9z8FNsOWBF8yqhiehGGjtA1R3FGiDDxfR+tPQKm+teCGiui
	tgegv0MXhvDd3EISSwJ0sM14uVlNHpdw==
X-Google-Smtp-Source: AGHT+IEP6njqvP7OJ8++MLrTcCjSZ1Kt6Z5ev6k1eTY7/VIni/FZ+4NbLV9Nf5JbGDhmp9iwi4d50A==
X-Received: by 2002:a05:620a:701b:b0:8a2:319d:27c3 with SMTP id af79cd13be357-8b257f683a0mr386978485a.73.1762632140037;
        Sat, 08 Nov 2025 12:02:20 -0800 (PST)
Received: from localhost (ip-24-156-181-135.user.start.ca. [24.156.181.135])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-8b2355e9a35sm659818685a.20.2025.11.08.12.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 12:02:18 -0800 (PST)
Date: Sat, 8 Nov 2025 15:02:17 -0500
From: Nick Bowler <nbowler@draconx.ca>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: linux-kernel@vger.kernel.org, regressions@lists.linux.dev, 
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: PROBLEM: boot hang on Indy R4400SC (regression)
Message-ID: <j5uutbx2oi2ccudo54o4hgxfmwfchwmd2ktig6xjgkqa7ho2pj@xb4luighppnc>
References: <g3scb7mfjbsohdszieqkappslj6m7qu3ou766nckt2remg3ide@izgvehzcdbsu>
 <e4ed75c7-b108-437f-b44b-69a9b340c085@app.fastmail.com>
 <ea6p4efuwbrlqjiwkgjcd7ofj7aahfnnvnkooo2il36ggzrlcj@n6mcofpb2jep>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea6p4efuwbrlqjiwkgjcd7ofj7aahfnnvnkooo2il36ggzrlcj@n6mcofpb2jep>

On Fri, Nov 07, 2025 at 03:12:31PM -0500, Nick Bowler wrote:
> On Fri, Nov 07, 2025 at 07:29:25PM +0000, Jiaxun Yang wrote:
> > Unfortunately my Indy won't go over ARCS prom so I'm not in a position
> > to debug this on my side. I have inspected the code again and I can't
> > see anything preventing it to work on R4000 family.
> 
> I'll try adding some extra prints to at least figure out where it is
> actually hanging.

I did not have much success with adding prints, but looking more closely
at the console output it seems that what is ultimately failing is the
SCSI bus enumeration which does not complete unless I revert commit
35ad7e181541.

So I presume that is why I also don't see the messages about mounting
the root filesystem (I suppose it is just waiting for a disk).

I see the drivers printing the usual info about each device, but not
everything.  Specifically, the lines that are missing are all of these
ones that would normally be printed:

    sda: sda1 sda2 sda9 sda11
   sd 0:0:1:0: [sda] Attached SCSI disk

    sdb: sdb1 sdb9 sdb11
   sd 0:0:2:0: [sdb] Attached SCSI disk

   sr 0:0:5:0: Attached scsi CD-ROM sr0

Other than that everything else seems alive.  Several other drivers
go through their initialization during the time the SCSI stuff is not
completing.  The 'random: crng init done' message is printed after a
while too.

I tried enabling CONFIG_SOFTLOCKUP_DETECTOR and CONFIG_WQ_WATCHDOG to
get some more information out but these options do not seem to do
anything in this scenario, nothing is printed even after ~10 minutes.

Thanks,
  Nick

