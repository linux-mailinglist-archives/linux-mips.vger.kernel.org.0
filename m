Return-Path: <linux-mips+bounces-9964-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA26B17607
	for <lists+linux-mips@lfdr.de>; Thu, 31 Jul 2025 20:15:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B6033AEEFC
	for <lists+linux-mips@lfdr.de>; Thu, 31 Jul 2025 18:15:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3A1223312D;
	Thu, 31 Jul 2025 18:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="AjWj6DuU"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606E515E5D4
	for <linux-mips@vger.kernel.org>; Thu, 31 Jul 2025 18:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753985748; cv=none; b=AfJBtpf8yKzczBu/cWVQxkdRVM+P7+tIFpwuBmAF6A4MUoQHgoZww59AV1xv/jR1+Ci7NNsfDgfTWfAeSOWxa2h93vCEeCsApC7vxvq76aBzh3gr5lLYE1g7Nxy+ecMaVHGrFmXGvmm0orwWCd6yeBafFjwWngzU3GlzQJY4TUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753985748; c=relaxed/simple;
	bh=RCj9kXQC4IhWtvndRd38e613bmkzv+xVOrNE+F/EeOk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iyLhvix+UyBJiW/4/IjcKnnBODAbQPyXQBStysILEuSw8QHTzE4kV+jA5RRmz38sBaAHBQxIEUNXp2lDT8VmUvTYE7xm+2lKthKGPpZLyH/IWrncmEXt19nObkwwaqlKZMCV9OKhJIz0QO/BBsrAKAkUjDBC68mj8vY0fi5euJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=AjWj6DuU; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-61539e2065dso3702470a12.1
        for <linux-mips@vger.kernel.org>; Thu, 31 Jul 2025 11:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1753985744; x=1754590544; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4A4McOc7Yjfkn3jJT361607pPpeEy5Y04HOcqe8Ja8M=;
        b=AjWj6DuUdpmPTPeaQy+bWJ9qTWXaCUahYT/ZewXekDiZkhCaoxajPLMffZkKah9wYB
         tnZt3uRcznO2RbdOR43Gofd+JogwDW0QXHR8TXZhv4oqz/4EKy9DNedmzOApOjXulska
         BFZjde2Zy46ZGlfU4Sjbfm+RkpaAJjnPfq7cM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753985744; x=1754590544;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4A4McOc7Yjfkn3jJT361607pPpeEy5Y04HOcqe8Ja8M=;
        b=oqbR35moiKZm6/dy9R5bXIaXTMq4aFCTwOrIaYbfT8GHWpJi2sBsiLxoJAziF7T3dX
         rz1xi6IUT3EY3HCA5IiiLiqL2uQuibtC75t31+Zu62oCLal+BC2z2l4e4w6ui0EsVVTg
         Mvdvk5wc06pUqAqnzesQ5tznWXJVrSWjZqG7OHLwzzlKPDiheZZ6t8rA05F++EsSJprL
         tcI1fRV1Kq2qrixGVEHWqBzTf1Mi+BwoQqAlxYOi0YsPq147UrqwC6vHXZvDaEwTJnqf
         KxEz94MECfxTKIihMEd48HH5yqof4DiYwJxh4EjCpFu9HC/nJReuJtYWjy1+4qF0sn9U
         0abg==
X-Gm-Message-State: AOJu0YwGfO5c6fdVLfZZT4t9vLhATrL1Io75GXgz8BUu7CbKpG0xyDQ1
	C+/Mao1NKtD/CHTJwYsnsIDYmO0SD51Kw6ZG5fStWitmL4OX+SYrkuvJNIrNILcVkO34a2NvsrJ
	aB1zgZ7s=
X-Gm-Gg: ASbGncvxDd8zcm1GtG4+zr2TBiC9KXd9lQQBZvc7f+3X4rZkMb82IAvVQxtUrtHZZPw
	QXj1q1CvWTLZVFowPK5yXv6CgBo4AaU2rH6PUrWZFpaykujvtfclhnW+hDwu9QohR++YCC9QqFn
	r97anH0noFQOZ/lmM4kkSItTBbDMuWk3NM/UjVEVojpuVKYXCtevuaVrx907eCQowyJ5C5rDQ/j
	AeH9VZj68EZjNYmgmGP3Zq/G/lTauhpRkomwUhi9G99X3Cpf5fie6HIWK/JVwurH6fgkqYsrmQr
	fZ/SkgSB0w2+DnVYq0/4lSUGXB6Ic0UGTHjOmNykl8O7UDYJUOOZIAJiJvD4dwydBooKc0oM7oN
	XPB3WgvIcelxkguWuoIP3RorT/ZYkGNfwPrUN5Q9P4Om5ioAaXMHs5kardySjTzuWdUSzT+EP
X-Google-Smtp-Source: AGHT+IGZ4a6a6AEX6tOthGMc+pqr1cmu4BKJSYTxKZFFHcl5Y/BGdBQzbxSoLG8T92aQ/a/J9wDrgQ==
X-Received: by 2002:a17:907:d9e:b0:af8:fef0:9b23 with SMTP id a640c23a62f3a-af91be35c13mr335343866b.20.1753985744243;
        Thu, 31 Jul 2025 11:15:44 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a1e8ea6sm144164466b.66.2025.07.31.11.15.43
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Jul 2025 11:15:43 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-61580eb7995so2711038a12.0
        for <linux-mips@vger.kernel.org>; Thu, 31 Jul 2025 11:15:43 -0700 (PDT)
X-Received: by 2002:a05:6402:5d88:b0:615:1ffe:7e13 with SMTP id
 4fb4d7f45d1cf-615aea0c1ccmr2078927a12.16.1753985743135; Thu, 31 Jul 2025
 11:15:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aIomWdeNOQwaKPu1@alpha.franken.de>
In-Reply-To: <aIomWdeNOQwaKPu1@alpha.franken.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 31 Jul 2025 11:15:26 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh+kN-LsKbi_ZA1_+LTA4ts=0C+5Xn5SrLBAoE_BKKy-w@mail.gmail.com>
X-Gm-Features: Ac12FXyk30C4KbT-WTBlFqKvTkl0PXJuo-r5p6aknRzi38U7KD1MQ9xkTaCkqgA
Message-ID: <CAHk-=wh+kN-LsKbi_ZA1_+LTA4ts=0C+5Xn5SrLBAoE_BKKy-w@mail.gmail.com>
Subject: Re: [GIT PULL] MIPS changes for v6.17
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 30 Jul 2025 at 07:04, Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> DT updates for ralink, mobileye and ralink

Quoting Blazing Saddles:
  "You said ralink twice"
  "I like ralink"

But judging from the diffstat I suspect you meant qualcomm the second time.

           Linus

