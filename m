Return-Path: <linux-mips+bounces-3584-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B5210903D3D
	for <lists+linux-mips@lfdr.de>; Tue, 11 Jun 2024 15:27:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C4DB286FE0
	for <lists+linux-mips@lfdr.de>; Tue, 11 Jun 2024 13:27:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3933217C9F5;
	Tue, 11 Jun 2024 13:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dFVmWUBC"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D14217C7DA;
	Tue, 11 Jun 2024 13:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718112318; cv=none; b=kEVjrZrKeyr55X8LzTajfthJ266iDzpXsSPQ56PTfM8oPstyoCxPdLCfBpEWOj78a5z4lbyazsIc8ysVWBpdg+zscH9eLCjYaEA80NXhgurtGo8yH/A95yJikFbBozKhIycC6Iilw0ivkUrol7X6STrkHQ/gG79CKiFzqA6G2B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718112318; c=relaxed/simple;
	bh=X9NOyfa3dCkNY/khSuIWPRLy8MQpw99WaTLQn6NkI+4=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PV1yRT2oxCGbe8GMxWvas2QfSzxHBX5GXmQ6Ib5ojpaRUtrqsuvnFJq7XYGM4V4BUxx9UXTxoTJVi3gLSee5sNr2684n1GZQagqNpbjITHl2EBUbtyZ450Ufn9GfOYDXvyIrqMvGkeK41abPkOybtG5TEcyVugJhskzoKfp2+o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dFVmWUBC; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42138eadf64so9293315e9.3;
        Tue, 11 Jun 2024 06:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718112315; x=1718717115; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DVSiTE2jXaVjooef1DJVlsNyZqL8Li0jr778TTTgFg0=;
        b=dFVmWUBCXjmhnlk1Ve7H6IbmVZzL8EG53GYMy8vuMbzQ8JZnBOJnX7a898LEsqQX5v
         pUfICFaMuVc0eehtfbo+DcqLlrifxnJq+YaX++9naOGyWo3SgE4NGtPjZyPBBzBsnome
         1xzf5sLRW8DprL4W3Q36hAakF1JtlSFfTc7FFeuElJEQblyCYwOwnKsTMCw/9vlvlBKi
         ExZFs9NqmUxiBmdsdPLmBLbXSLPE6sPFZDsqnGIeRZ0h+JXQHmoMAcvElyjYW1PjzYhZ
         9Mhf0ZQ0Ouk2iemXWync2YkAhZ1U4CBZMEPoc0VC52NDy/GkTdX5OmC9mkl28Bzw7Ufs
         3F3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718112315; x=1718717115;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DVSiTE2jXaVjooef1DJVlsNyZqL8Li0jr778TTTgFg0=;
        b=AFbDXOPuUeOlZPNSHppQcSUcdOMvXVtusiRBQFKdi14Hu4oakZM1dUm4FQi8DPb3p5
         841K7d2GGnhngn2JlNdMXKTmJZPWsmhWWEFPv90/IFLZh1aU4nlZ6IaxUyOeH6Mk+vbp
         5CQj8t3b9PwrHR37DjnrSMl8OFiqnBV2hFA4OzThh+nwgWGbE/e6BtvoKJ+H27Omc10m
         U6qg+0+tbhoOMrLzk7SOL1R4t+goI37AKT3AhAJytbdUSAZCHxcfHxy/moZLVkrPAt70
         a1Z2ZQuFlKHRNMz+fRu4EDZeQTYKqjf1AGw/jVn+i7vV6nKVbH+eTRz7r/cwKwBcsQDN
         mhjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkJ/t2BUVgOtfPgYDimzzpP/Wpgilaspr9Vm0YL4wIgEMHMSa+218YzKnGSajPNIXyMV6dF3Uayu+VmD0K33B/EWLY+J12H1+tFiXczdbTNajhe787BOaLMEUrXs8qnU2pQE6y2jaGcoou3m4jDT2pzfwU1dVErDSdw2ViAmymcuxcRIM=
X-Gm-Message-State: AOJu0Yy+GcU10qp1+06FYE7wXAcX5CMcjS6ZVKfK8XyczUg3hr2oQY7k
	5CjxUIPGi/Px8yMSaA74b7BHg9YDpf7BrZ6WIh/PUU5v6+S+nXT3
X-Google-Smtp-Source: AGHT+IECMD93HO+GmAXhNnlQnO+eaYd8hT0OqylueO/63i6F59InbXdQi0b0Dn4jtzIuSUMlaydaoA==
X-Received: by 2002:a05:600c:4ec9:b0:41a:821b:37f7 with SMTP id 5b1f17b1804b1-42164a328a6mr88416085e9.27.1718112314570;
        Tue, 11 Jun 2024 06:25:14 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42212f0723dsm50446335e9.34.2024.06.11.06.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 06:25:14 -0700 (PDT)
Message-ID: <6668503a.050a0220.9ec4a.4777@mx.google.com>
X-Google-Original-Message-ID: <ZmhLZEJMStmh8bDs@Ansuel-XPS.>
Date: Tue, 11 Jun 2024 15:04:36 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Hauke Mehrtens <hauke@hauke-m.de>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	=?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>,
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/5] mips: bmips: BCM6358: make sure CBR is correctly
 set
References: <20240611113538.9004-1-ansuelsmth@gmail.com>
 <20240611113538.9004-2-ansuelsmth@gmail.com>
 <ZmhHw5QZCQ6G6EbK@alpha.franken.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZmhHw5QZCQ6G6EbK@alpha.franken.de>

On Tue, Jun 11, 2024 at 02:49:07PM +0200, Thomas Bogendoerfer wrote:
> On Tue, Jun 11, 2024 at 01:35:33PM +0200, Christian Marangi wrote:
> > It was discovered that some device have CBR address set to 0 causing
> > kernel panic when arch_sync_dma_for_cpu_all is called.
> > 
> > This was notice in situation where the system is booted from TP1 and
> > BMIPS_GET_CBR() returns 0 instead of a valid address and
> > !!(read_c0_brcm_cmt_local() & (1 << 31)); not failing.
> > 
> > The current check whether RAC flush should be disabled or not are not
> > enough hence lets check if CBR is a valid address or not.
> > 
> > Fixes: ab327f8acdf8 ("mips: bmips: BCM6358: disable RAC flush for TP1")
> 
> should I apply it to mips-fixes ? If not could you just ammend
> it with the following patch, where this is changed again ?
>

Ideally this should be backported to stable kernel since it does cause
kernel panic. This is why it's split and it's the first patch of the
series.

-- 
	Ansuel

