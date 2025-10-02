Return-Path: <linux-mips+bounces-11595-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBC8BB58CB
	for <lists+linux-mips@lfdr.de>; Fri, 03 Oct 2025 00:38:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 997D74E1E06
	for <lists+linux-mips@lfdr.de>; Thu,  2 Oct 2025 22:38:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A347273D9F;
	Thu,  2 Oct 2025 22:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gimpelevich-san-francisco-ca-us.20230601.gappssmtp.com header.i=@gimpelevich-san-francisco-ca-us.20230601.gappssmtp.com header.b="qyJkP3IA"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63901E9B37
	for <linux-mips@vger.kernel.org>; Thu,  2 Oct 2025 22:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759444697; cv=none; b=mQ/JstU1TuZBgm/S5nZWKK0itR416E5OtUaA+foWM3LnxR6uVeJMsgnnwYLlx0XDeIZhqY/tPGynV9PNUoJ3IR+wulg4NtWU3biC0y9bggGdJj5qGXAOMMWl+BQdDAaMunFdp1oQvmTsmW3e8VD8VnEdJpkyULgV3/464b1pSD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759444697; c=relaxed/simple;
	bh=XC0sO2N0d+uo0Arvt22e4w8FJtUrLDpvY+BPCwyRgx4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Mime-Version; b=TXBOPRk2E7HwHSD3/XvFIt8sBNVQuNoXjzoWvDUgwh9Nu1BYQNoWvYvrgcRaS3C0DtbnSPqO4h7zigk3kxHFLXzRa1TVZx8I6rmlx2Tdw9Unfis64Gh0xWqPgU2RynLQmBEu3ttsf8hbr1l0ZUlzm2Y9paD0BUhAnutjJ1xrJ/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gimpelevich.san-francisco.ca.us; spf=pass smtp.mailfrom=gimpelevich.san-francisco.ca.us; dkim=pass (2048-bit key) header.d=gimpelevich-san-francisco-ca-us.20230601.gappssmtp.com header.i=@gimpelevich-san-francisco-ca-us.20230601.gappssmtp.com header.b=qyJkP3IA; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gimpelevich.san-francisco.ca.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gimpelevich.san-francisco.ca.us
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b6271ea3a6fso414101a12.0
        for <linux-mips@vger.kernel.org>; Thu, 02 Oct 2025 15:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gimpelevich-san-francisco-ca-us.20230601.gappssmtp.com; s=20230601; t=1759444695; x=1760049495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:disposition-notification-to
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XC0sO2N0d+uo0Arvt22e4w8FJtUrLDpvY+BPCwyRgx4=;
        b=qyJkP3IAIdi07QDtg0tHsZsArTI/JwcKVM8w9wcSgyDyFQNsZowbLaFY0Otz4lAwTN
         t5H607DUYqcqYdumiEygDEPIi9kAN7FHMN8kE/pGwkOe2lY9zBLnUoMn/+yuRc7JG1ZW
         Ldfag4oEOHJUR9AG1CZ9l+oMWjCvlih9vzaRU+Btq7zv2iiWC9A65VXeEYrNCZtCmWD7
         EtKpuC9Q6ISh/JJdNouATmKY01hJxZsoycWgb/oX68hqYNwCq1xqMmxCNcTSvPoHAf22
         I870jlaS07On4DR9s0i23PXDWtRzpyfwijlESzjf4N0F2SljNHO1LtlpV59DMTLil2QO
         3/ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759444695; x=1760049495;
        h=content-transfer-encoding:mime-version:disposition-notification-to
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XC0sO2N0d+uo0Arvt22e4w8FJtUrLDpvY+BPCwyRgx4=;
        b=F9TfHkoojOFWi0qttvWRh3+OOJhPTEIKkvO3vF+UGVMxK2cCfgXTLsWMWq5uIqYbGr
         AxVgyKl8GCdvs1hbVVEb0fOUj6kUGu41f7SRvSc2kQz1VoIxaRhPzfWVD974vjd1FlNS
         N7qC5NOANsv3cCQX1dIVgPttbyZGFQd6R0gls64bG5yfSuMaAiDbsrgewTMus3Uk0pAh
         rMlAivr3aVCLwSe2boSQP4xPI0/WBLd53ZGcV//o7VdOtScslhhmfIZipMYeRc4zyM4w
         eYGV6ZjzUjQnKZbWugODpWvXuIL49PUpg5Z3YXbCLLJhORVrMvqyumh3Gd+wojD0/vp5
         +GLw==
X-Forwarded-Encrypted: i=1; AJvYcCWszO+uJ7+AFH2LzoO814FRDvHRPtTtxiHJUWuNEB5RTQfsP3qbVs9RJbR2q8fwTHEMSq5sfJWNwsPu@vger.kernel.org
X-Gm-Message-State: AOJu0YyaRREcse5e7cYD1YYAp4rGk1S5+kLAqHYGrVg62tsc9vlrHXSs
	x0mjNiNdAhsKvLF84deo9pNqSu5YjgT5aBQDuK4EKykFwGsa+j6mH1j10rPwnSTFiA==
X-Gm-Gg: ASbGncscEBZj0q6YTn9zmTJQDSSZzA9xPxDj0t8pZ0cVJSauATK9mY06dA24bWc9kJV
	/QMH8v84tSZhJSK8bZvaGSSqRImL2f/pWAnEsJsQeAJ80yQeAVGDpDrwOZp8TWFozE/Fjp+1KML
	ZbOjhzsg+OiUpXdLhmsj0pF9M5prRfeL88g8ONdxgmNTmlofTRlUPN41Zy9H8+hLsSeeGleWqIw
	bXOq5u8CUaOq9BHzhXengjjESXIWwlie67IP2OWKf8cvMcSmYgO7+zlsnrDo4oNCMQgxLc38c4F
	dEzbdMghJZk0QWzKJONS26SW2J5a/89Cbfg8W2ofu7NH2s1ooxK+upaXq6ESZ/LnqNRUglrkgF/
	ZbW2DuhsYvoPLHrnhMuRDOsKUgb1Dc2qPgORVQjH7iF+iYM2qPO4arb8DQc5/iqWeNEmwvSfVSI
	E0qay2xxBzcTISY6UVHp93ue8iU/zMMKpGW6apjtC4Zj8=
X-Google-Smtp-Source: AGHT+IGEWpLAS0bs92zaBuI97EwGsBxqAWGzNiljhk82StCYnXBLZ6FnmN8hBjn83V3/i2Ef8tUENg==
X-Received: by 2002:a17:902:d544:b0:25c:d4b6:f111 with SMTP id d9443c01a7336-28e9a65258fmr10877855ad.47.1759444694910;
        Thu, 02 Oct 2025 15:38:14 -0700 (PDT)
Received: from ?IPv6:2001:5a8:429d:2100:4825:53c7:1977:212e? ([2001:5a8:429d:2100:4825:53c7:1977:212e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1b9e5asm31046705ad.74.2025.10.02.15.38.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 Oct 2025 15:38:14 -0700 (PDT)
Message-ID: <1759444692.24579.8.camel@chimera>
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
Date: Thu, 02 Oct 2025 15:38:12 -0700
In-Reply-To: <a2be781f-96b5-47d1-81fa-b20395ca293a@intel.com>
References: <20231110013817.2378507-1-danielwa@cisco.com>
	 <20231110013817.2378507-7-danielwa@cisco.com>
	 <00c11f75-7400-4b2a-9a5d-10fc62363835@intel.com> <aN7n_5oiPjk-dCyJ@goliath>
	 <c8b65db3-a6cf-479d-9a83-23cbc62db1ef@intel.com> <aN7vKgcUeQgCFglQ@goliath>
	 <a2be781f-96b5-47d1-81fa-b20395ca293a@intel.com>
Disposition-Notification-To: daniel@gimpelevich.san-francisco.ca.us
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 2025-10-02 at 14:55 -0700, Dave Hansen wrote:
> That's not a bad idea. Or, even if you can pick two amenable
> architectures to start with it will make it really obvious that this is
> useful. Two architectures means a *lot*, IMNHO. Two is a billion times
> better than one.

I think it's a bad idea, if I understand it correctly. The patchset
conceptually patches a mechanism of the kernel as a whole, but one which
just so happens to need to be implemented separately for each arch.
Breaking it down like you suggest creates an embarrassingly high
likelihood of different architectures' implementations of it going out
of sync, a previous situation that this patchset was partly intended to
address. I say keep it atomic. If it breaks on an arch or two but not
others and nobody notices right away, that would be better addressed
with a new patch when someone eventually does notice. Just my 2¢…


