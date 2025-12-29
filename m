Return-Path: <linux-mips+bounces-12645-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 78613CE8331
	for <lists+linux-mips@lfdr.de>; Mon, 29 Dec 2025 22:16:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4522B300FE21
	for <lists+linux-mips@lfdr.de>; Mon, 29 Dec 2025 21:16:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC8A5189B84;
	Mon, 29 Dec 2025 21:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b="PT49dsBh"
X-Original-To: linux-mips@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEED1204F8B
	for <linux-mips@vger.kernel.org>; Mon, 29 Dec 2025 21:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767042998; cv=none; b=mTYzcDmleqo5ydfxDc7LlLTwjTBjaVyky06xNev8QEihHNeL2PdqDpuCul2yCva4n2wfxxbDt+VdHHOsYks1EbtqKx8pLNfyr3lfAZJMj+Cs0jjZWq0/2qmksZmOWxlYQUzm4ouHlcju553JVtVs9kLhay5tRi4qoYvKkxVaY6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767042998; c=relaxed/simple;
	bh=28z4ant+6e+kfRrE8GEcSoN5UXJX4w6d5ScL0WPXxcc=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type; b=N7623Xl7q6Gj6G7JReCASi9Sa3/g4UYexiMHLRHFgloPYPE9TdjyTLuo29Bltl8uqQnDsnPYbqVNPtSkV8r1FXiP3iOy5H8zQ2UuaWsokHoRLf+Edkn+hFBI9eRF3d+fuzRYc+jv7It5Z0one5kfemm69HOduVStcqX+mi13joA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b=PT49dsBh; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1767042974; x=1767647774;
	i=markus.stockhausen@gmx.de;
	bh=hA5Ebdh2bxPaB9VaXe8HSKyeMAoLjA1IFwXQHSWBN/w=;
	h=X-UI-Sender-Class:From:To:Cc:References:In-Reply-To:Subject:Date:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=PT49dsBh0JsCv2ofnUjThxJ347KEcZjVspaVQRuvaLvoyp+aPCZSY/54svie8wsc
	 0KxVbBATUadSyvBZ0cl+JNgrJzCfzp7qM2gNuICc/DZzk+M54IWTG/kw6cffGqSEw
	 cD7zy3BCvhbTKxK5q1pm8z8gSxQVG4DYvEX1L3ksU7SvfyAQZjWV8wp6eDI/4FO1a
	 Q55wEZf8QJ/Jwwgv/JJUbtnQMjZuXmaigWqt4y6oXgc1cTTn8bvVoICCURdXE/FYZ
	 icdb2TG7f5GthMTqjE0F0vkiGE7RAMB9K6lCuPJw89LkfN0s6/v9G+LJC8HM4gtww
	 DYm/tIm7dCigZP/oOA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from colnote55 ([94.31.93.28]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1McpNy-1w8q4K0hSE-00fDg6; Mon, 29
 Dec 2025 22:16:14 +0100
From: <markus.stockhausen@gmx.de>
To: "'Mike Rapoport'" <rppt@kernel.org>
Cc: <tglx@linutronix.de>,
	<linux-mm@kvack.org>,
	<linux-mips@vger.kernel.org>,
	<jelonek.jonas@gmail.com>,
	"'Chris Packham'" <Chris.Packham@alliedtelesis.co.nz>,
	<hauke@hauke-m.de>
References: <007d01dc78f2$1ca4bf90$55ee3eb0$@gmx.de> <aVLX9yLmIBPzI0MQ@kernel.org>
In-Reply-To: <aVLX9yLmIBPzI0MQ@kernel.org>
Subject: AW: HIGHMEM freeing patch breaks Realtek RTL930x builds
Date: Mon, 29 Dec 2025 22:16:12 +0100
Message-ID: <003f01dc7908$5d0266d0$17073470$@gmx.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQFaCkT/QJ6/mAqkcN3Pcnid9AcWCwK/dj1Ktif7s6A=
Content-Language: de
X-Provags-ID: V03:K1:aQIefrBEo7EkLSPFHf1py9vRW77vEn+X79eSyO7pjhuV6EneUCK
 KReikuPrqvWoWunse7F22+kUqzaz8RKU0ISqPJBobrKeAdoi+FRzND7hkJVqdqvr9468KhI
 nUhSGeFX1gwwO9UffKAM9a6eer4/0uBktqf8hS/B01LOkZSwMJv4ZyV5w0SC9eZfhpM8q0U
 zC/Pos3cd8sNygXwVYlAw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:YHCoBRlO2Fw=;7xKUjZXrDsYA0NpgpFX8dVwrMK3
 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
 4ZQvF/fFfOQ4OLSsc=

Hi Mike,

> The successful boot disables highmem:
> [    0.332305] Memory: 495640K/524288K available (8188K kernel code, 647=
K
rwdata, 1504K rodata, 9620K init, 244K bss, 27528K reserved, 0K
cma-reserved, 0K highmem)
>
> And the failing boot actually enables it:
> [    0.332285] Memory: 495640K/524288K available (8188K kernel code, 647=
K
rwdata, 1504K rodata, 9620K init, 244K bss, 27528K reserved, 0K
cma-reserved, 262144K highmem)
>
> so I believe that the partial revert should help.

Interesting find. That is strange. On 6.12 (where everything=20
works) the 256MB highmem are detected properly.

[    0.242252] Memory: 493784K/524288K available (8373K kernel code, 725K
rwdata, 1820K rodata, 10896K init, 248K bss, 29384K reserved, 0K
cma-reserved, 262144K highmem)

Additionally I identified some spooky highmem=20
initialization in vendors SDK prom.c. We never
used that before. I added bootlog+code snippet=20
to the github issue [1].

Just to be sure. Do you expect highmem to be still
detected/advertised with 6.15+? If yes I will bisect=20
where the highmem detection breaks prior to the=20
"suspicous" commit.

Markus

[1] https://github.com/openwrt/openwrt/issues/21323



