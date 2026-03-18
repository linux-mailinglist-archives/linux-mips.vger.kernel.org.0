Return-Path: <linux-mips+bounces-13781-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qLqTJ/Qku2nIfgIAu9opvQ
	(envelope-from <linux-mips+bounces-13781-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 18 Mar 2026 23:19:32 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A362C3532
	for <lists+linux-mips@lfdr.de>; Wed, 18 Mar 2026 23:19:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3E5AB30514AF
	for <lists+linux-mips@lfdr.de>; Wed, 18 Mar 2026 22:18:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C98F2F659F;
	Wed, 18 Mar 2026 22:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="s825/BBd"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E73324A07C;
	Wed, 18 Mar 2026 22:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773872313; cv=none; b=G9aY4E1h2CsepjhbrLQRuVA8sPyoUGrA5wRmnBD0UpG5dkurBMVtbKsBbfIP4yIMhi3Dh6t5bQvzOG6DncdMsZGACn/RctNtLmJQWEwF0iwUiIxJFgEpapdoPmc9qkmoeFPTwidXV35sgnu9zB5sz3/2G2p7A6b7GrYCR/erwyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773872313; c=relaxed/simple;
	bh=TmV/V9YMm4i5zRqyU+nxD+yEy1ZK68CLbqXKGMdpp+o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JRMw+XNu9SaCY8sJJMP3yMxdPz9/gWquFw9eqXMYXYWk2MH6INzA5e+tfGEDBLa/NOYvIPjNZgI1KLUqgSf3GxmZmWx/fJ0GDyvmpdCmQPKlko5kGyDcdgKkRLlXNno40RZwpQlNotM2AlqeSQ0JSroWbYzeKWSrtilWpGbFcr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=pass smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=s825/BBd; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 43A79339B4A;
	Wed, 18 Mar 2026 23:18:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1773872308; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=JlCNKNDd57xlnLgcJUum35WbvlkNpratfPUD2tOhhGA=;
	b=s825/BBdx0+wDRw7pbk+a+cOTbaSr3+WuOfzHLBQATxbf7Y1o11g8OkJ+dFPZR0w1s1fCu
	UAffRz25YzQmxFNgnfPqU0wXMTFkKnp4njOqHnASpIxlocBISbtHvZdYsJNqOajddB6VFT
	HrQqPbhKPX/pwJNy0mYlPgNSysOLbtiR93F7NLpxCuBSH8xM7QeYwJkB7KtzMiFivOJT9u
	ntoclRIe+sEhXbAe1Mo5mnzmJP7khvWA8IS12IpiFnsq09xwyluvbGhVdWDmYQ5v7Ft3L+
	yHZnbw0DGWcD3cskxL5XC/NwCVw+gr+HEOGS4OzRyqakMviG2ErYY2JBPnlxxA==
Message-ID: <e154155d-b525-4abc-a8f3-41ac0ead1875@cjdns.fr>
Date: Wed, 18 Mar 2026 23:18:20 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v2 3/3] PCI: Skip bridge window reads when window is not
 supported
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-mips@vger.kernel.org,
 naseefkm@gmail.com, ryder.lee@mediatek.com, bhelgaas@google.com,
 lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 ansuelsmth@gmail.com, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260318215832.GA476412@bhelgaas>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <20260318215832.GA476412@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[cjdns.fr,none];
	R_DKIM_ALLOW(-0.20)[cjdns.fr:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13781-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,mediatek.com,google.com,kernel.org,collabora.com,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cjd@cjdns.fr,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[cjdns.fr:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,cjdns.fr:dkim,cjdns.fr:email,cjdns.fr:mid]
X-Rspamd-Queue-Id: 01A362C3532
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 18/03/2026 22:58, Bjorn Helgaas wrote:
> On Mon, Mar 16, 2026 at 03:51:57PM +0000, Caleb James DeLisle wrote:
>> pci_read_bridge_io() and pci_read_bridge_mmio_pref() read bridge window
>> registers unconditionally. If the registers are hardwired to zero
>> (not implemented), both base and limit will be 0. Since (0 <= 0) is
>> true, a bogus window [mem 0x00000000-0x000fffff] or [io 0x0000-0x0fff]
>> gets created.
>>
>> pci_read_bridge_windows() already detects unsupported windows by
>> testing register writability and sets io_window/pref_window flags
>> accordingly. Check these flags at the start of pci_read_bridge_io()
>> and pci_read_bridge_mmio_pref() to skip reading registers when the
>> window is not supported.
>>
>> Suggested-by: Bjorn Helgaas <helgaas@kernel.org>
>> Link: https://lore.kernel.org/all/20260113210259.GA715789@bhelgaas/
>> Signed-off-by: Ahmed Naseef <naseefkm@gmail.com>
>> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
> I applied this to pci/resource for v7.1 with the following commit log:
>
>    PCI: Prevent assignment to unsupported bridge windows
>
>    Previously, pci_read_bridge_io() and pci_read_bridge_mmio_pref()
>    unconditionally set resource type flags (IORESOURCE_IO or IORESOURCE_MEM |
>    IORESOURCE_PREFETCH) when reading bridge window registers. For windows that
>    are not implemented in hardware, this may cause the allocator to assign
>    space for a window that doesn't exist.
>
>    For example, the EcoNET EN7528 SoC Root Port doesn't support the
>    prefetchable window, but since a downstream device had a prefetchable BAR,
>    the allocator mistakenly assigned a prefetchable window:
>
>      pci 0001:00:01.0: [14c3:0811] type 01 class 0x060400 PCIe Root Port
>      pci 0001:00:01.0: PCI bridge to [bus 01-ff]
>      pci 0001:00:01.0: bridge window [mem 0x28000000-0x280fffff]: assigned
>      pci 0001:00:01.0: bridge window [mem 0x28100000-0x282fffff pref]: assigned
>      pci 0001:01:00.0: BAR 0 [mem 0x28100000-0x281fffff 64bit pref]: assigned
>
>    pci_read_bridge_windows() already detects unsupported windows by testing
>    register writability and sets dev->io_window/pref_window accordingly.
>
>    Check dev->io_window/pref_window so we don't set the resource flags for
>    unsupported windows, which prevents the allocator from assigning space to
>    them.
>
>    After this commit, the prefetchable BAR is correctly allocated from the
>    non-prefetchable window:
>
>      pci 0001:00:01.0: bridge window [mem 0x28000000-0x281fffff]: assigned
>      pci 0001:01:00.0: BAR 0 [mem 0x28000000-0x280fffff 64bit pref]: assigned
>
> I also set the author to "Ahmed Naseef <naseefkm@gmail.com>" per
> https://lore.kernel.org/all/abRQYM1If/6Vv/tI@DESKTOP-TIT0J8O.localdomain
>
> You can make this work correctly next time by including a
> "From: Ahmed Naseef <naseefkm@gmail.com>" line as the very first line
> in the message body; see
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id=v6.19#n723

Thank you very much. I wasn't quite sure how to submit this so thanks 
and I will keep that in mind.

Thanks,

Caleb

>> ---
>>   drivers/pci/probe.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
>> index bccc7a4bdd79..4eacb741b4ec 100644
>> --- a/drivers/pci/probe.c
>> +++ b/drivers/pci/probe.c
>> @@ -395,6 +395,9 @@ static void pci_read_bridge_io(struct pci_dev *dev, struct resource *res,
>>   	unsigned long io_mask, io_granularity, base, limit;
>>   	struct pci_bus_region region;
>>   
>> +	if (!dev->io_window)
>> +		return;
>> +
>>   	io_mask = PCI_IO_RANGE_MASK;
>>   	io_granularity = 0x1000;
>>   	if (dev->io_window_1k) {
>> @@ -465,6 +468,9 @@ static void pci_read_bridge_mmio_pref(struct pci_dev *dev, struct resource *res,
>>   	pci_bus_addr_t base, limit;
>>   	struct pci_bus_region region;
>>   
>> +	if (!dev->pref_window)
>> +		return;
>> +
>>   	pci_read_config_word(dev, PCI_PREF_MEMORY_BASE, &mem_base_lo);
>>   	pci_read_config_word(dev, PCI_PREF_MEMORY_LIMIT, &mem_limit_lo);
>>   	base64 = (mem_base_lo & PCI_PREF_RANGE_MASK) << 16;
>> -- 
>> 2.39.5
>>

