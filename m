Return-Path: <linux-mips+bounces-6808-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E30D09DAEA1
	for <lists+linux-mips@lfdr.de>; Wed, 27 Nov 2024 21:49:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F5C2164B40
	for <lists+linux-mips@lfdr.de>; Wed, 27 Nov 2024 20:49:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE613146A93;
	Wed, 27 Nov 2024 20:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="glaBRrHy"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE0A14F90
	for <linux-mips@vger.kernel.org>; Wed, 27 Nov 2024 20:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732740591; cv=none; b=gVUU0+a2uNdFIjmwYguX1goErPastOUTxtVDXeK2QOMUgFRQOAY3MggfyQ5y5HC3W45jFx2fcYjPZWouDNsJKDshbdXi0Wx88csZT0ukVtmcWertlev07IIS5JjK3b+nlfCY128bx9rkeqYIKw/NA1wu9jtYPZzIms16PMrz4G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732740591; c=relaxed/simple;
	bh=q9v48MPymLO45RCiqbjI1P6LhEQz9fd1rO5XCq0pMlI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=o9W5yjZo993HSFmqfcYS0odeg2bzQf/hNoByREOMANh4OtiEmIx6cwYMAc/wN0NS7jyXpSc+7fq7Oid3SMsL+Qc/1GatMIfGvnnvL3sxLpojowZ/6N+rmZRoHSBArcBxcO5d3PEQR4Hyd7B9azIq+Sel9s1jT4W/MIgWonI4TWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=glaBRrHy; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5cfcf4df87aso172921a12.1
        for <linux-mips@vger.kernel.org>; Wed, 27 Nov 2024 12:49:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732740588; x=1733345388; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=q9v48MPymLO45RCiqbjI1P6LhEQz9fd1rO5XCq0pMlI=;
        b=glaBRrHy2mHX6eQqR/4dknERmpy/5tOmduWmGpru47tFOKsX+Zu2N6ivpGP5Qi03C7
         j/WQpGE5K/WO1+GqhFbV2DhQCW0YTVniMYm9lVZYtN0+w4u3dEemYzLSpEGK3rBS1JIY
         +NxRXGhUolrIWMbtBNCTrxwiPOuF0XzcODBOswUDXzxs6caolOwvk8q/P6Aymntu72b6
         UcNyL2UYmekhXv+fXpgtCJFkT14NmHAfxOOIhH/s3ITn6x4sZAPR0SCuUlkpphCe6/P5
         O0pSjEQym7JcXvKEqoVAQQzPrUFXHAavFNFQ+ANxd85iRoig+9bOOaJtg1iJtb0djAkH
         9eBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732740588; x=1733345388;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q9v48MPymLO45RCiqbjI1P6LhEQz9fd1rO5XCq0pMlI=;
        b=KIhj7m1U1n0zj0G8aFa/oFhwT+oviJg7MHtIYANKjS5pHuNKMd2zTu8oru3JbT1IBh
         dO7FwOV5323kGwqLjgNw9WviI8jIrNoXxIdWMYjf8QlIQTWKUduGeieYQiXC5CYLoRON
         xYP+HVJ5avlb5pvehgri3fiwEWFcel+UJkfdMPGxmC3i6uoE2dQWvrxR68rutsqMcHwJ
         iJ0Tn7Nz5aHNF7Ixy+xcOtaVGI6U5ByygNiQjnBeACGMPnb5CgYiyLxBwVKkN/jf1JF0
         sTlo7zuuS89gXOZV9qNh2RC9CB7a0BikKN6rCSl+OkobM+7swSW5fAr41ZPm8xRjhEFJ
         NBEw==
X-Gm-Message-State: AOJu0YxbsQW/AQs6DNSftmF/SYS8d99x7CLIQLNuovvvNYDSndMXjGdf
	BLv+VxJDueXI3ri1QQX0beKwwBwPffVkni76W6bmD33iJxIJBhxtADsHmRy5CzbOSHtTAeuxf5b
	5/79I23g0gtazAB9SW4mkJb+OxHlqYWzb
X-Gm-Gg: ASbGncs2Y2ab4zHz1Vk0iZKlBQ9mzkZIAUTRF6luX2GM1XVpsytqW0h03AONwn8q2Ds
	T5vUK1h01HOhDKvW4+1hIAr2ZlACKs+YdW0xd3UHtmvv0D2Eh1r+z+QCl/kwMnPBE
X-Google-Smtp-Source: AGHT+IEqwxrcxmC43X9dmSX8mxZFQP+ZjbOszfZoB7WpvzFG3Fq8hVE9HeukKIgV26Iemm6B6Wpg52/vaiNBQPhbCGM=
X-Received: by 2002:a05:6402:430e:b0:5cf:e460:447e with SMTP id
 4fb4d7f45d1cf-5d080bc9554mr4449677a12.17.1732740587897; Wed, 27 Nov 2024
 12:49:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: DiTBho Down in The Bunny hole <downinthebunnyhole@gmail.com>
Date: Wed, 27 Nov 2024 21:49:45 +0100
Message-ID: <CAAZ8i80XG5eXSOuL+u23g9qs-vuTBMhjfzdiyeVoQJxkjHLSuA@mail.gmail.com>
Subject: SGI MIPS, IP30, XIO PCI, status?
To: linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

hi
I remember the XIO-PCI was not supported with kernel 5 and early 6.
Has this been improved recently?

I'd like to use a XIO-PCI "shoe box" to interface a few PCI_cards,
especially a programmable PCI-FPGA board.

What is the current status of the PCI support?

Please let me know.
D.

