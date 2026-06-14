Return-Path: <linux-mips+bounces-15062-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2r8BJ6PTLmqt3wQAu9opvQ
	(envelope-from <linux-mips+bounces-15062-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sun, 14 Jun 2026 18:15:31 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 281656817ED
	for <lists+linux-mips@lfdr.de>; Sun, 14 Jun 2026 18:15:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=GmifCVwQ;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15062-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15062-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 67983300915A
	for <lists+linux-mips@lfdr.de>; Sun, 14 Jun 2026 16:15:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B862221DAE;
	Sun, 14 Jun 2026 16:15:21 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128F82472A6
	for <linux-mips@vger.kernel.org>; Sun, 14 Jun 2026 16:15:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781453721; cv=none; b=pBDux3M0r2Ru6d805NAq69AeleSQEzBTAAr2xXQoTN6y7xSq/UXcvZzi916AYRIfS3uHNXmrSVi2/iIz+3eNzRo+kqiNMRKBfGis3GL4uMqEfy4gvNn3wnJ2SelYPC1qbJaRCeAo+V6VwvAr8mRfy44pzk9XOnlwNHz4932IIQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781453721; c=relaxed/simple;
	bh=ZWpS9a7UI+nRWCLynLkdE/5Fa7aQVE9imBBoeHlqO+I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NxfUHUoiHh/xnjl6UTN25qig6PlfskKQcSCNhvd4isMducsAy6LWe/S452jBsbBJbh/u2KbJpu+3luBOlT+lCFgVuBbgAK4XMYDNSs0qT84atWIIp1+HuLZYq0S7Srzi3M7+30TWITEzZVkOunGJ9rmgNlilMY1JW2JKBjo3agw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GmifCVwQ; arc=none smtp.client-ip=209.85.210.175
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-842307472d4so934582b3a.0
        for <linux-mips@vger.kernel.org>; Sun, 14 Jun 2026 09:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781453719; x=1782058519; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oQi4xZ/RL1raijUtjAv0u6PGUwcFZ8P5P6g7tVewY3I=;
        b=GmifCVwQialoJvKFNgN1f0F6rKDVL6d9kGMDwj13kbvVplIucncUdUt5p1Ex1TR+HT
         YLhpeadNWpFKf/JrRTxBsoYyS5Oxlb9jmzUjX0Qg24VHzZFV4ikaYfYh0L320LpARgP5
         5KSumZpMO8/QdqRScrJM5Ilm4aDq0PudcWEeofdKAEBYTEnLnpE5LLEOev1B0adIYuUt
         mmhQwCQP55c/J4mnl+AEe/J9sntk258sKS/5Dt79AmT/1mYveQ7kvI2IhzlKrLROWcij
         KWX5iw2V9MKjozUXZoqc2bpapmWiitgu2sgINwpFxSxz9bjXcrnpyP9nQpgPPtZhTB86
         AmDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781453719; x=1782058519;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oQi4xZ/RL1raijUtjAv0u6PGUwcFZ8P5P6g7tVewY3I=;
        b=i36GVqM2TgGSsiZYRO9AwexRH0RmUgg4LnhaPpgY9O+1hNCKrT6VkfVYWTv4aIVi+7
         //puAQYGKjTJ+Drtuxz7chkHkdTdYX3viPHBw2Mk7uBEXUAlmgBPUoo9FawDcXKmkAOs
         G7oeot1tXa3iiu3tyfwKBRj7RFrMsPYzlSOfedqJKb+5197JqwpXrAsFPsdhzQZNqsuu
         Wk6zwpyr6QzwqLpOf7NiZ8iq9V3TvaQsfWw6Gxb/jt/g6COtn5DvP1bOOj2tQs7q39lp
         fPuEZDT4nKcr2u2vEWOSXKB/7YyfN5ZPT3kW9NQ8poVJaAa7eu52dotE2UfJ7PZZ0hGj
         ++7A==
X-Forwarded-Encrypted: i=1; AFNElJ82kh4gY8oyL21e3VGbypFP6JW07fAPt5OOYldBcR7U9vsZvhcE1IKbA7IYtPke488KHKzw6tD2cw9K@vger.kernel.org
X-Gm-Message-State: AOJu0YzDpmPTvjrbhhpn7pGYdGNxG4n4EVGHmY1MlyRyVikByVPQSfqB
	cn7+gDMfk/t0HZtoKGfZ6nC/+opWWjoJX5p/bzNRoZH01D2ibIqeDith
X-Gm-Gg: Acq92OEq9NCZuJOh5IM6qn3Iu+RAdgZFXWgY6ZuXi9LU6v9fAk5FqTbjFwOVHeesEG/
	rUeHHHKVByrAvCXnZsmvjj3yUkPLbLE+yYgFrJffq7VX1ojpxl9kzs1GeaIYb91PWbQxe8q04QJ
	v6NctB+EQmHKw5glIV8hiEPTDa1+nf9W41JNlB2WaiX3AsuJC2KIsBFHLQw4HHgfV4+iz6UNynW
	6Nn36egR4PAFX0YZzAkBXcMcShCwq+3Yw/CwW29Rx+ydTH7VojLDOnSMwzPGICv1cdFvwddKSM1
	gbGC2Y8Oj4uA3SyEjRrFW6A5wnKdG/XTa/QyciEUFbJA1aZ7AK7fJ+KNBy/VItB0o0srFntMoi9
	r1HaUSsojooWA/amakF7p06Y1Nf1wS9GlmjDp2Fjl4PXK6x6CptaH8oS73+yg5+WepA2ympFk6R
	quw9C1lA/1FtXcai4lyg==
X-Received: by 2002:a05:6a20:2443:b0:3b4:87c0:d7f with SMTP id adf61e73a8af0-3b783fc439cmr12622311637.32.1781453717759;
        Sun, 14 Jun 2026 09:15:17 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c866325d1d3sm6505293a12.11.2026.06.14.09.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 09:15:17 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: devicetree@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	Sang-Heon Jeon <ekffu200098@gmail.com>
Subject: [PATCH 0/3] of/fdt, LoongArch, MIPS: fix misleading reservation success message
Date: Mon, 15 Jun 2026 01:15:00 +0900
Message-ID: <20260614161503.2219681-1-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-15062-lists,linux-mips=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:saravanak@kernel.org,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:tsbogend@alpha.franken.de,m:devicetree@vger.kernel.org,m:loongarch@lists.linux.dev,m:linux-mips@vger.kernel.org,m:ekffu200098@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ekffu200098@gmail.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekffu200098@gmail.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 281656817ED

While reading the elfcorehdr reservation paths I noticed that
fdt_reserve_elfcorehdr(), LoongArch's arch_reserve_vmcore() and MIPS's
mips_reserve_vmcore() ignore the return value of memblock_reserve() and
print a success message even when the reservation fails.

memblock_reserve() is unlikely to fail this early in boot. However,
printing success on a failed reservation is misleading. I think it is
worth fixing, but feel free to drop it if you disagree.

The three call sites are in different trees, so I split the change into
one patch per arch/subsystem. The patches are independent and can be
applied separately.

Sang-Heon Jeon (3):
  of/fdt: fix misleading elfcorehdr reservation success message
  LoongArch: fix misleading elfcorehdr reservation success message
  MIPS: fix misleading elfcorehdr reservation success message

 arch/loongarch/kernel/setup.c | 5 ++++-
 arch/mips/kernel/setup.c      | 7 +++++--
 drivers/of/fdt.c              | 5 ++++-
 3 files changed, 13 insertions(+), 4 deletions(-)

-- 
2.43.0


