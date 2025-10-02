Return-Path: <linux-mips+bounces-11597-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 94973BB59AC
	for <lists+linux-mips@lfdr.de>; Fri, 03 Oct 2025 01:21:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 967014E7AC9
	for <lists+linux-mips@lfdr.de>; Thu,  2 Oct 2025 23:20:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19CB0287259;
	Thu,  2 Oct 2025 23:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gimpelevich-san-francisco-ca-us.20230601.gappssmtp.com header.i=@gimpelevich-san-francisco-ca-us.20230601.gappssmtp.com header.b="mz5doHAh"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E37026B0AE
	for <linux-mips@vger.kernel.org>; Thu,  2 Oct 2025 23:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759447249; cv=none; b=emT7JfJIF2SCmv4xSHWw2R4qL19s8C7Z/FG6eHX1LzSFOpLquHd6pzD095hMG8iAddDVE7sVkgKriua8McHtuC+6gZFHp8l0G6NQuMuP4X1p4t1JgrTI7ue5p6ijSWh/eSvod/B/n2eqZXy7r9Ml2NdFTAPKxzhi1/e1CfvDglc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759447249; c=relaxed/simple;
	bh=sXiKQiWwINtaw/0i6ZrayWsPG/BbPIm1nQreVZ4vdDY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Mime-Version; b=oN0LpJ5CO7oeIerEzNv0RuXAwA8w70TT7SK6S8tbC9cufcz2fN5Qehz9CPJD6AcKOw+VDzH2rPLLqZ7NhOA3+qY97CoDNIGK3lcyYTspDfxjbnLU9Mw+WwEjfdtltFsTpDzTp0Id/2hC/skvQlyrGn6b8mM28RMqq8HSxTncfUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gimpelevich.san-francisco.ca.us; spf=pass smtp.mailfrom=gimpelevich.san-francisco.ca.us; dkim=pass (2048-bit key) header.d=gimpelevich-san-francisco-ca-us.20230601.gappssmtp.com header.i=@gimpelevich-san-francisco-ca-us.20230601.gappssmtp.com header.b=mz5doHAh; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gimpelevich.san-francisco.ca.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gimpelevich.san-francisco.ca.us
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3304a57d842so1551275a91.3
        for <linux-mips@vger.kernel.org>; Thu, 02 Oct 2025 16:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gimpelevich-san-francisco-ca-us.20230601.gappssmtp.com; s=20230601; t=1759447246; x=1760052046; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:disposition-notification-to
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gX9KJbRliuDiUhyueXfwx/TklBf4F3VVV79ND/TcypU=;
        b=mz5doHAhq5A8MhgmoD739FYFCwApcY34qUfictTf8y0NjFg0GrmJSledDn5pYCMbV+
         3j3x//1jJR9PVQh/4/79UK6fkQhZ/9qQuwqLjSyJzTZgp6LPr4yLuzEh9uYe0NN68SJX
         rU8JZGKXiAHxR8kcMgdihJTMuWYwRZ0N8XSoBagUz/k7asMxpPKXuZzERYHk/d2Wxi1k
         E6wl7pUWRFTpI6qxIeWC0GoEIFXvOrm5tQYLvtVKNyB1R8IeZbhsh0mY80T1KNZ2F+Fy
         b1hAzQz9mEPm2F7+ecc8ydrD0eHSu/SAT2BpqM3W1Eaa8DVLGxwH8Zpxios3qNGGkbEk
         RPiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759447246; x=1760052046;
        h=content-transfer-encoding:mime-version:disposition-notification-to
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gX9KJbRliuDiUhyueXfwx/TklBf4F3VVV79ND/TcypU=;
        b=oaoxFQ1UlTVmCWeOgxS/e9dkB/VXeA8/RFzMuPwIwAUtwTIaGDKvlikgJ6QJ4MZS2k
         08kbhgW0/9S/SCd8sCDlEwoxBSB1uTXD2fQ5fJd8fmf6FFlsQBr/dfvtWvCmvxqPEWw/
         OnqdaBSxMcQtiky1+U1c6drF15D/BRRknbF5mUuuY8rJKY37qXz3Mv7/nIy8NgJXZYry
         g5Ib1b7qpu3OcAkoi/6sFl7FWYJo2azOzxzjHn/+CWpeFtyF+s3tqUiEKJQYukCwhpPF
         hz3SgmL7o3Hljb8PeKFB0YhsstMK1oz5WxuOVy0sYC0joNHtRsieGtiYlN4Z9U9lvbZv
         Ljkw==
X-Forwarded-Encrypted: i=1; AJvYcCVEwMFarQb4HlnCy4ykwR5KaZ17CzsyrXtpxPjyAh9YyQIt0WPXMex7UP7BIT0aSuQwmgrbYBIKnqGZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzgQLRsJZQ4i2PW+SAu5lmwRpfNwEXIgo2NlPcJTm2IAn84V+vW
	vCvTvMOJXjERoOZpVW8tagjLRFFU4Zar+vv1MFkA7EuXzhr42YVFtHE7CsTFnHEopA==
X-Gm-Gg: ASbGnctfCUtg3KWu7E+JWOrlzfJu5HRShuLPoht8CoZWHFelpflrBt8uEPaRkfopo43
	JnlU+rG3hrWhBn+RG8rBGlls9yWu492DhdGd2vABwhmfQED9ZqKbxa5j5jGRc+0SPXnE6dcClbn
	D42xiYpgKKO33rY/yHjKuRc0qrtf6mp0iwk5TA3OyCItDf5nl0dTHLETAXwKTHsMV5IF2wxzJNi
	Dw1TF1QeKkyl/lY4gQ67H2UGGGUrio8Clj8QxtwaazqcUxknw4NderB6IZMFFuuCbHxIgJK2pE3
	Wvd5dOKROCZDNMxwYO33Z8KIUcolQUvV1ERtAXRUvK40P13wPTSx7vbTckJXImWpboV1RyBsk2e
	hkpiqFw1GG1PiUm0Gao+nDBx/6u3GfdwTaBj7S1VWU0OEdLoabo9QkZy35Xwrmq+tyAuCdH+GFf
	E/NEj80zsAZ5JzO6t0GDaHsB+7fXjpnPFs4Bp24OlOLJo=
X-Google-Smtp-Source: AGHT+IFxx2TCD6D7jFtBEJ3PbntsdESkjjeH5wij8/VnSkkJDYC5xpM48nDuzXv8UOwcied9Nu59sA==
X-Received: by 2002:a17:90b:17cc:b0:32e:5cba:ae11 with SMTP id 98e67ed59e1d1-339c27859aamr1054843a91.28.1759447246577;
        Thu, 02 Oct 2025 16:20:46 -0700 (PDT)
Received: from ?IPv6:2001:5a8:429d:8700:4825:53c7:1977:212e? ([2001:5a8:429d:8700:4825:53c7:1977:212e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339a6ff0dddsm5947685a91.18.2025.10.02.16.20.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 Oct 2025 16:20:46 -0700 (PDT)
Message-ID: <1759447244.24579.14.camel@chimera>
Subject: Re: [PATCH 6/8] CMDLINE: x86: convert to generic builtin command
 line
From: Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>
To: Dave Hansen <dave.hansen@intel.com>
Cc: "Daniel Walker (danielwa)" <danielwa@cisco.com>, Will Deacon
 <will@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, Rob
 Herring <robh@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Pratyush Brahma <quic_pbrahma@quicinc.com>, Tomas Mudrunka
 <tomas.mudrunka@gmail.com>, Sean Anderson <sean.anderson@seco.com>,
 "x86@kernel.org" <x86@kernel.org>, "linux-mips@vger.kernel.org"
 <linux-mips@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
 "xe-linux-external(mailer list)" <xe-linux-external@cisco.com>, Ruslan
 Ruslichenko <rruslich@cisco.com>,  Ruslan Bilovol
 <ruslan.bilovol@gmail.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Date: Thu, 02 Oct 2025 16:20:44 -0700
In-Reply-To: <dde17d82-3e56-4b9f-8b6d-dae3d523d44e@intel.com>
References: <20231110013817.2378507-1-danielwa@cisco.com>
	 <20231110013817.2378507-7-danielwa@cisco.com>
	 <00c11f75-7400-4b2a-9a5d-10fc62363835@intel.com> <aN7n_5oiPjk-dCyJ@goliath>
	 <c8b65db3-a6cf-479d-9a83-23cbc62db1ef@intel.com> <aN7vKgcUeQgCFglQ@goliath>
	 <a2be781f-96b5-47d1-81fa-b20395ca293a@intel.com>
	 <1759444692.24579.8.camel@chimera>
	 <dde17d82-3e56-4b9f-8b6d-dae3d523d44e@intel.com>
Disposition-Notification-To: daniel@gimpelevich.san-francisco.ca.us
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit

On Thu, 2025-10-02 at 16:10 -0700, Dave Hansen wrote:
> How is the approach to "keep it atomic" working out so far? ;)
> 
> The kernel isn't exactly developed in secret. It's also not hard at all
> to, say, once a week to peek at linux-next and do a lore search (or use
> lei) if anyone is desperately worried about the ~50 lines per
> architecture going out of sync.

With all due respect, the lack of action on this patchset is not at all
due to its scope, but purely due to the throwing-spaghetti-at-the-wall
approach to code review that you yourself just got done pointing out.
Addressing the latter problem would thereby also address the former.


