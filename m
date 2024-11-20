Return-Path: <linux-mips+bounces-6778-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 606D09D3E5C
	for <lists+linux-mips@lfdr.de>; Wed, 20 Nov 2024 16:01:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F33E1F243C3
	for <lists+linux-mips@lfdr.de>; Wed, 20 Nov 2024 15:01:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20D1A1C9B8A;
	Wed, 20 Nov 2024 14:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lUz/nO6y"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F141A9B5A
	for <linux-mips@vger.kernel.org>; Wed, 20 Nov 2024 14:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732114315; cv=none; b=PsX2ZTX5XFjgJyRwJl3gTualyQBGKHzUnUhonGIP290aoLalBCb8nknr/r1fLX0WKDZKrlkWkH3ixxoXuO5Nuoz138auV9pIyJ5d20oLstloXsgyxldkKVOIfgqNy37IpOoWbv6nG4asEN6yV8zVJiBfn2jwr0qCfeqeN44jxCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732114315; c=relaxed/simple;
	bh=WcdNNvZ5a8o64aOF/eKAVOkQw503RzkjFC1eqVOTg2A=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=g9uJ91VnSTBN5RIwQi3upwb0tf/qz8QgoJvbWABJn94zkoAIB2wnaZtP6jo2+OyWaLFvU6ug63HKy2HqAGORSF8aGKiaFIBcaHy18biljn4Bj39ZT+XErQz1v5JQGpNRZO4LA28aBtH/rUHZ/ZYR3iNS4m8Qon3CxATNVQ5T1fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lUz/nO6y; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5cffb4ff7d9so672674a12.0
        for <linux-mips@vger.kernel.org>; Wed, 20 Nov 2024 06:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732114312; x=1732719112; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WcdNNvZ5a8o64aOF/eKAVOkQw503RzkjFC1eqVOTg2A=;
        b=lUz/nO6yUG2AV5bxOYgc7+8aAKjnhnKpBe4NOuyi7C6QLdgXfqpATxYTtiZBqWPloM
         ldC/C7zJX6akqUADDBjGWd0P+oKV5/blvv3yx9xgiFZMtdtMPlSnI2t30uB903raU9S/
         XAZZV777HONGzKAQlLqKVDfnYhp/5LMa5Nsu6TFtHz6+MGQVYwE1UsQ7I5Lp5+lqVMGr
         ZA/VEdaYYeReS8t58/JWuVFyFe8inFilb2+NkSi7Ipv9smK4mFNDLE1gaxhQtTgzSzXB
         uSyhxkl5ybiDzByXUawpxnWEZb1yvMW6MSu/kW7hUz4ASyx4oL6yga+eaT1QH4MbPYj9
         mZJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732114312; x=1732719112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WcdNNvZ5a8o64aOF/eKAVOkQw503RzkjFC1eqVOTg2A=;
        b=g4LvmMvmz/V40vrmmGqwkypPClm/t90hp8rGHZEtuHokgxT0PCeWVNsC3ocHrsWsbz
         7zIVj+mh3O1cjwM4KTWM0JrRTfebafTx8l+7zYCQHcyz4e7ZbFwjbzIs/46ABZG7rhc0
         1luQJuO3SG2bU8qqBil0OaLf7EJ7aMlMnUKDtzvqK6fqPV2BabCNdIIvhAkp5BUJfclA
         jv8ax7DBWBLUZzfbmE9RC6uiZ5zwm9vPPla/ShsvleOdy804TEZH4ALySBIdrCnWnloF
         XZ5+ZmXVB9FQtuq672Xlqnu2Glt9GVJLhLE/1u8VYj9e7IQkQEJIwCamFQ7kYd3KDOeb
         MAdw==
X-Gm-Message-State: AOJu0Yy7+zm5oeiE4u+UPP7HH3vxq020dIW55ev4gG1S/yLsh9aoKiWg
	XJIuiWJ4+HSizWNKCDP2rEASZC9hTg5OK0s0866hsCOiZu6G93jjPXIYPpNmNj46ipejOWxxk0G
	shrcpvt6KAbMsazJlnNpA590j5Lw7fc5k
X-Google-Smtp-Source: AGHT+IGODLcdVxIszHjw5bNE1cPJcTHxDeMHZQBnfU21AJyhOk0dLuA1pX0nk8FVlaAanQ5QK+C9L6RtX+iSUyLR6Bc=
X-Received: by 2002:a17:907:6eab:b0:a9a:7f92:782 with SMTP id
 a640c23a62f3a-aa4dd74b2eemr313915866b.52.1732114311605; Wed, 20 Nov 2024
 06:51:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: DiTBho Down in The Bunny hole <downinthebunnyhole@gmail.com>
Date: Wed, 20 Nov 2024 15:51:43 +0100
Message-ID: <CAAZ8i80xBp+OLTD8F4DPpEw7JEy=GZ3BamHsGjKYsj6sV6aPPg@mail.gmail.com>
Subject: Linux on SGI/IP30, XIO-PCI status?
To: linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

hi
I haven't used my octane recently, it's been sitting for 3 years,
since I was busy with life and other stuff.

I remember the XIO-PCI was not supported with kernel 5 and early 6,
has this been improved recently?

I'd like to use a XIO-PCI "shoe box" to interface a few PCI_cards,
especially a programmable PCI-FPGA board.

Please let me know.

D.

