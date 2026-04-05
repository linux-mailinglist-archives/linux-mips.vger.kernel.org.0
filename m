Return-Path: <linux-mips+bounces-14042-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLFBEbTJ0WmaNQcAu9opvQ
	(envelope-from <linux-mips+bounces-14042-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sun, 05 Apr 2026 04:32:20 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 940E639D1C9
	for <lists+linux-mips@lfdr.de>; Sun, 05 Apr 2026 04:32:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4A989300C917
	for <lists+linux-mips@lfdr.de>; Sun,  5 Apr 2026 02:32:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AD433264ED;
	Sun,  5 Apr 2026 02:32:14 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913411A6820;
	Sun,  5 Apr 2026 02:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775356334; cv=none; b=uQ8vT9ZoRxEslPLkRBqilSArGMyen3JfjH0f9Cm2Te1iz3okpNAirDedYqWLarNXKmqrpOdBwF3akdNjAiL9L9ZeY608EENku+6B/Yxu9ZXnP3ooXzScoSS5YW5IuGKxKDKXWCMhl5nrIvJ74la/1QF4LRSIN27SDASUSoBBtLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775356334; c=relaxed/simple;
	bh=3ipgEsSQ6QLb9KUKRZ0++WLCQRF0lGSkABtPEXh7XPg=;
	h=From:Date:Message-ID:To:Cc:Subject:MIME-Version:Content-Type; b=SnJjZ7WNCcQk5lAdfYhFBLV5etZ23fIBYxXx/0shgz5vvwi29VaYxodmCtY35aKS51vIevvqtzK+bJYT5Kc82l0Cy1P+mcdjc87DCuZuKyu8qhAyEIrbyftv91UzKfX2ywzs9ozUAj8NvR7n3lfEjS0IQNnPZ80rOjHphAsGZmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from 0000-cover-letter.eml (unknown [111.196.245.197])
	by APP-01 (Coremail) with SMTP id qwCowABH8GupydFpPVU5DA--.42795S2;
	Sun, 05 Apr 2026 10:32:09 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
Date: Sun, 5 Apr 2026 10:20:00 +0800
Message-ID: <20260405102000.0-mips-cmdline-series-pengpeng@iscas.ac.cn>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, pengpeng@iscas.ac.cn
Subject: [PATCH 0/8] MIPS: bound early command-line construction
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowABH8GupydFpPVU5DA--.42795S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJrW3XF45tF1kZFyDZF4kXrb_yoW8Gw15pa
	n5tFW3JF9xXFyUu3sFvrW5Xa4fZ3s0ka4qqr15XrykAa4DAa92yF4rtr4rua4jgrsa9343
	JFW7tw1kWF13Ar7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkm14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
	0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_JF0_
	Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxV
	WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI
	7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
	1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI
	42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUehL0UUUUU
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-Spamd-Result: default: False [-0.46 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[iscas.ac.cn];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14042-lists,linux-mips=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pengpeng@iscas.ac.cn,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.889];
	TAGGED_RCPT(0.00)[linux-mips];
	R_DKIM_NA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,iscas.ac.cn:email,iscas.ac.cn:mid]
X-Rspamd-Queue-Id: 940E639D1C9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Pengpeng Hou <pengpeng@iscas.ac.cn>
Date: Sun, 5 Apr 2026 10:20:00 +0800
Subject: [PATCH 0/8] MIPS: bound early command-line construction

These eight fixes harden a set of MIPS early boot paths that build the
kernel command line in fixed-size buffers with unchecked appends.

The affected paths take firmware- or PROM-provided arguments and extend
`arcs_cmdline` or `fw_getcmdline()` with repeated `strcat()`, in-place
`sprintf()`, or equivalent unchecked copies. A long enough firmware
argument set can therefore run past the fixed command-line buffer during
early boot.

This series switches those constructions over to bounded concatenation
while keeping the existing boot-time behavior otherwise unchanged.

Patches:
- 1/8 MIPS: dec: bound PROM command-line appends
- 2/8 MIPS: sni: bound PROM command-line appends
- 3/8 MIPS: lemote-2f: bound machtype command-line append
- 4/8 MIPS: txx9: bound command-line reconstruction
- 5/8 MIPS: arc: bound firmware command-line construction
- 6/8 MIPS: cavium-octeon: bound default console command-line append
- 7/8 MIPS: malta-init: bound default console command-line append
- 8/8 MIPS: malta-setup: bound pci_clock command-line append

Base:
- `origin/master`
- `3aae9383f42f`

Checks:
- all 8 patches apply cleanly to the latest `origin/master`
- `checkpatch --strict` is clean on all 8 exported patch files

Thanks,
Pengpeng



