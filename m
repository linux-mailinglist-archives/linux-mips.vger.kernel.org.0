Return-Path: <linux-mips+bounces-13625-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YKozHGlRtGk4kAAAu9opvQ
	(envelope-from <linux-mips+bounces-13625-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 13 Mar 2026 19:03:21 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D525A288775
	for <lists+linux-mips@lfdr.de>; Fri, 13 Mar 2026 19:03:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E6F143016801
	for <lists+linux-mips@lfdr.de>; Fri, 13 Mar 2026 17:59:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F8053D6CDF;
	Fri, 13 Mar 2026 17:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dG8JAUhc"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0BE3D7D95
	for <linux-mips@vger.kernel.org>; Fri, 13 Mar 2026 17:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773424777; cv=none; b=MAAgaEhV+LpmzHwnz0517Q3ne7PDGYiZTn84zoGlGJmAjDicsbO9GP8y3dRTBHrVfW9sk8jdG3AFAJx/ng+xq958RzxHL7Q4YbM1+bhpKzrdfB1KXkWZPpN+gTWTKvTKgLjg58qcYvSB36ypOjcqSmMZc7UiTtoE1hDFAD0Ncu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773424777; c=relaxed/simple;
	bh=eNBO4Mqeku4zM2ERXRLx0VHuZYbRpZgig/kvFXey0Tg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FNO/DgNTdx/+Hw/EJ5tDW4pfEtn7yqQeegHZsGBMPVPKbQNdRVNXvPkcgHO+fEg4oa0Eo+9XaEo8AXQZHp1vQr/kxcfENzvSo5xgI/pEL2nPBxzXgqmeLty6JghDA+wBBcG3JwsPE6jRuMv7NkLfXSPtjJSSAMD+YCWm9N1n8RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dG8JAUhc; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ad9f316d68so12164075ad.2
        for <linux-mips@vger.kernel.org>; Fri, 13 Mar 2026 10:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773424771; x=1774029571; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YSagBdU3nLD/MUTObvb+C15QJct8NlPUmNC9xuYlYCI=;
        b=dG8JAUhc2WnX8PL4q8zVgqdvWznr77okSz+GzDpVc6uTIyvuANbp3/3tAP290+gS+9
         IPt6b+njbLO/0+B5fMowWrm4cI3S6LWKYNvx7pt3nAtNvHtYiLYTcjP1WlyeIrdTjElg
         s+eYAwp/ExrQC069ivqRaSBwXPQHOfw7SkNb46ENTy6b4CFYhBAnXi4xhQ1KVUVd5KIl
         j1TGvwrrGtdKWNolG9GpANF1uKXF2wCAE6c8qcve7jD2IvxRptcWyAkUXD4WEtB8Oe4K
         CF8uguvyjuRbQK3ySvWbtFrQTcydyF2ExzsNMf1jX7dBZST8AeMjk0rYR+JrzcDIWNQw
         tYtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773424771; x=1774029571;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YSagBdU3nLD/MUTObvb+C15QJct8NlPUmNC9xuYlYCI=;
        b=SZZ6wENXKTjMlnVf6UD1RA+QbmrGvpV01SIEjhkvmBCCELR4+spJQDLMrYnu5kyemM
         1B1ZgAaPgG34rq1+ouVTw2HmvKXI8PHJTjugPpkXOni0FyRuQxgZ9sovJkfcfQF2k3ip
         DRPpGGfvp/suLuLX2UDOiqKKMwB7EicJPDNHpHxVVApOHbLqm3KGZzzAdfj3VvPF/hw5
         bBf9RCET5FBCTMQP5aOQ+YuSYaSn5GhV1F1LU6vX6ZE4sQCB04miOPHJ8iDVjA09ndKe
         cSeRlkZp6T5laKERnGDGgCwEXWRgUiTEj77M75q7uCVC//abkFmxxg1im1WJyNli94Yz
         j+ug==
X-Forwarded-Encrypted: i=1; AJvYcCVFJUdYAvfJ4LEPV8KdnUz96p1uvnr6vK5Cp5ZiWnwXSd6ieUcN2arPmkGgGfPRGenxGcnSGO3syUNW@vger.kernel.org
X-Gm-Message-State: AOJu0Yw26sLGrcEZhoC4g1OfZS3BxXhmYG3YgFbNrBChFZh0lIl1R3DW
	8hX0XzbPEL4RvPYUzn9ohalNRzgZ5xoK6p0soil4OgDhCYUuA7P/TOHo
X-Gm-Gg: ATEYQzwLidSfurgMAETWxMgBCj2zKgp3z0WAKnULnaEVMmNRBz7JTlCsaXvrUSDo3ea
	Ose63c1S18XaIMcx+KxLNhFRF3G1TEbueXVGnyyWk8QCwAVlbDOm6Obd5Kbg2WNt9r1dM3yprCM
	n7r2kdBCgIawBPqKzfA8Lp16rMDy7KonaQ5Zo6b1iIWS2rnklMvOnUMbQgRYp3kYEj7FWLWtGe4
	J291npTngPsLIzfbraeZ9c7iGz+Hed6Q7v1NcV3IcxC+bpAuYWMZlckT6w3fl2svJ52CEEDRYvE
	C6e+fp6KvoujH2YDH+yJIXCd9CFT9F6IA7gZ9yGx9SMQE4K/djvkILVSqBvnFL934iE+iaPyJmX
	PCAXtWjPE7+/aReO7h9UWVEVaepS/MC29fHd9RaJJBD9/E+as2Mr8lBgSW3RWfA2x9FyJpdXzWx
	RL8JBzHNSZrAZKPXDe1Uh9fhoEzJ+bmR1AhPazkx6L
X-Received: by 2002:a17:903:41cf:b0:2ad:d0ff:2ed4 with SMTP id d9443c01a7336-2aeca9415e7mr46224575ad.6.1773424770587;
        Fri, 13 Mar 2026 10:59:30 -0700 (PDT)
Received: from DESKTOP-TIT0J8O.localdomain ([59.93.235.206])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece56ca17sm31276355ad.13.2026.03.13.10.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 10:59:30 -0700 (PDT)
Date: Fri, 13 Mar 2026 21:58:56 +0400
From: Ahmed Naseef <naseefkm@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Caleb James DeLisle <cjd@cjdns.fr>, linux-pci@vger.kernel.org,
	linux-mips@vger.kernel.org, ryder.lee@mediatek.com,
	bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
	mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, ansuelsmth@gmail.com,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] PCI: Skip bridge window reads when window is not
 supported
Message-ID: <abRQYM1If/6Vv/tI@DESKTOP-TIT0J8O.localdomain>
References: <20260312165332.569772-4-cjd@cjdns.fr>
 <20260313162000.GA1385506@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260313162000.GA1385506@bhelgaas>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13625-lists,linux-mips=lfdr.de];
	FREEMAIL_CC(0.00)[cjdns.fr,vger.kernel.org,mediatek.com,google.com,kernel.org,gmail.com,collabora.com,lists.infradead.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[naseefkm@gmail.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: D525A288775
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 11:20:00AM -0500, Bjorn Helgaas wrote:
> On Thu, Mar 12, 2026 at 04:53:32PM +0000, Caleb James DeLisle wrote:
> > pci_read_bridge_io() and pci_read_bridge_mmio_pref() read bridge window
> > registers unconditionally. If the registers are hardwired to zero
> > (not implemented), both base and limit will be 0. Since (0 <= 0) is
> > true, a bogus window [mem 0x00000000-0x000fffff] or [io 0x0000-0x0fff]
> > gets created.
> > 
> > pci_read_bridge_windows() already detects unsupported windows by
> > testing register writability and sets io_window/pref_window flags
> > accordingly. Check these flags at the start of pci_read_bridge_io()
> > and pci_read_bridge_mmio_pref() to skip reading registers when the
> > window is not supported.
> > 
> > Suggested-by: Bjorn Helgaas <helgaas@kernel.org>
> > Link: https://lore.kernel.org/all/20260113210259.GA715789@bhelgaas/
> > Signed-off-by: Ahmed Naseef <naseefkm@gmail.com>
> > Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
> 
> I'd like to apply this, but I don't understand what's going on here.
> 
Thank you for testing this and sharing your instrumentation
patches. I applied the config access logging patch to the
EN7528 and captured the register trace (full log below).

> I instrumented a kernel to return zero for all reads of Root Port
> prefetchable window registers, and it worked correctly: It didn't
> create a bogus [mem 0x00000000-0x000fffff] window (see below for a
> possible explanation), didn't claim to have assigned a prefetchable
> window, and the 64-bit prefetchable BAR of the downstream device was
> correctly placed in the non-prefetchable window.
> 
> I'm booting this in qemu, and the current behavior with a functional
> prefetchable window is this:
> 
>   pci 0000:00:1c.3: PCI bridge to [bus 04]
>   pci 0000:00:1c.3:   bridge window [io  0x4000-0x4fff]
>   pci 0000:00:1c.3:   bridge window [mem 0xfe200000-0xfe3fffff]
>   pci 0000:00:1c.3:   bridge window [mem 0xfd000000-0xfd1fffff 64bit pref]
>   pci 0000:04:00.0: [1033:0194] type 00 class 0x0c0330 PCIe Endpoint
>   pci 0000:04:00.0: BAR 0 [mem 0xfe200000-0xfe203fff 64bit]
> 
> With the instrumented kernel where the prefetchable window registers
> are effectively hardwired to zero, I see this:
> 
>   pci 0000:00:1c.3: PCI bridge to [bus 04]
>   pci 0000:00:1c.3:   bridge window [io  0x4000-0x4fff]
>   pci 0000:00:1c.3:   bridge window [mem 0xfe200000-0xfe3fffff]
>   pci 0000:04:00.0: [1033:0194] type 00 class 0x0c0330 PCIe Endpoint
>   pci 0000:04:00.0: BAR 0 [mem 0xfe200000-0xfe203fff 64bit]
> 
> So the 04:00.0 BAR 0 was put in the non-prefetchable window as we
> would expect when there's no prefetchable window.
> 

This shows "64bit" without "pref" , so unless I'm
mistaken, the BAR is non-prefetchable. The issue only
triggers when a downstream device has prefetchable BARs,
like the mt7615e :

  pci 0001:01:00.0: BAR 0 [mem 0x00000000-0x000fffff 64bit pref]
  pci 0001:01:00.0: BAR 2 [mem 0x00000000-0x00003fff 64bit pref]
  pci 0001:01:00.0: BAR 4 [mem 0x00000000-0x00000fff 64bit pref]


> Either there's something else going on with EcoNet EN7528 or I don't
> understand the explanation.
> 

The config trace shows the following sequence:

1) pci_read_bridge_windows() correctly detects the
   prefetchable window is not supported:

  rd 0x0024 0x00000000   # PCI_PREF_MEMORY_BASE
  wr 0x0024 0xffe0fff0   # write test
  rd 0x0024 0x00000000   # read back: still 0 -> pref_window = 0
  wr 0x0024 0x00000000   # restore

2) Later, pci_read_bridge_bases() reads the same registers
   again without checking pref_window:

  rd 0x0024 0x0000       # PCI_PREF_MEMORY_BASE
  rd 0x0026 0x0000       # PCI_PREF_MEMORY_LIMIT
                          # base(0) <= limit(0) -> bogus resource

3) The allocator assigns the bogus prefetchable window and
   routes the mt7615e's prefetchable BARs through it:

  bridge window [mem 0x28100000-0x282fffff pref]: assigned
  BAR 0 [mem 0x28100000-0x281fffff 64bit pref]: assigned
  BAR 2 [mem 0x28200000-0x28203fff 64bit pref]: assigned
  BAR 4 [mem 0x28204000-0x28204fff 64bit pref]: assigned

4) The kernel programs the bridge, but the write doesn't
   stick:

  wr 0x0024 0x28202810   # program pref window
  ...
  rd 0x0024 0x00000000   # read back: still 0

   Compare with the non-prefetchable  window, which
   works:

  wr 0x0020 0x28002800   # program non-prefetchable window
  ...
  rd 0x0020 0x28002800   # read back: correct


> Based on the link above, Root Port 1 doesn't implement a prefetchable
> window, but Linux thinks it does and puts a mt7615e WiFi device BAR in
> the non-existent window, so it doesn't work.  I assume RP 1 is
> 0001:00:01.0, and the mt7615e WiFi is 0001:01:00.0, and the mt7615e
> doesn't work:

Yes, that's correct.

> 
>   pci 0001:00:01.0: [14c3:0811] type 01 class 0x060400 PCIe Root Port
>   pci 0001:00:01.0: PCI bridge to [bus 00]
>   pci 0001:00:01.0:   bridge window [mem 0x00000000-0x000fffff]
>   pci 0001:00:01.0: bridge configuration invalid ([bus 00-00]), reconfiguring
>   pci 0001:00:01.0: PCI bridge to [bus 01-ff]
>   pci 0001:00:01.0: bridge window [mem 0x28000000-0x280fffff]: assigned
>   pci 0001:00:01.0: bridge window [mem 0x28100000-0x282fffff pref]: assigned
>   pci 0001:01:00.0: BAR 0 [mem 0x28100000-0x281fffff 64bit pref]: assigned
>   WARNING: CPU: 3 PID: 1777 at target-mipsel_24kc_musl/linux-econet_en7528/mt76-2025.11.06~eb567bc7/mt7615/eeprom.c:31 mt7615_eeprom_init+0x484/0x548 [mt7615_common]
>   mt7615e 0001:01:00.0: Firmware is not ready for download
> 
> The [mem 0x00000000-0x000fffff] window mentioned above is not a
> hardware problem.  This is the non-prefetchable window, which is
> required for all bridges, and if it hasn't been initialized and
> contains the power-up values, this is the window.  So all this is
> telling us is that there was no firmware that programmed the window
> before Linux.

Understood , no firmware initializes the bridge before Linux
on this platform.

> 
> FWIW, I'll attach my instrumentation patches below.  Maybe you can
> similarly instrument your kernel to see the actual config accesses to
> the RP in question.
> 
> Also, minor nit: Caleb appears to be the author, but the first
> sign-off is from Ahmed, so the Author vs Signed-off-by order is wrong;
> see
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id=v6.19#n449

I'm the original author of this patch (from our earlier
discussion). Caleb included it in his series.

I could be wrong about the BAR difference being the key
factor. Please let me know if I'm missing something.


---

Full config access trace:

[    0.636773] mtk-pcie 1fb81000.pcie: host bridge /pcie@1fb81000 ranges:
[    0.643978] mtk-pcie 1fb81000.pcie:       IO 0x001f600000..0x001f60ffff -> 0x0000000000
[    0.652749] mtk-pcie 1fb81000.pcie:      MEM 0x0020000000..0x0027ffffff -> 0x0020000000
[    1.153150] mtk-pcie 1fb81000.pcie: PCI host bridge to bus 0000:00
[    1.159915] pci_bus 0000:00: root bus resource [bus 00-ff]
[    1.165965] pci_bus 0000:00: root bus resource [io  0x0000-0xffff]
[    1.172716] pci_bus 0000:00: root bus resource [mem 0x20000000-0x27ffffff]
[    1.180497] pci 0000:00:00.0: [14c3:0810] type 01 class 0x060400 PCIe Root Port
[    1.188769] pci 0000:00:00.0: PCI bridge to [bus 00]
[    1.194240] pci 0000:00:00.0:   bridge window [mem 0x00000000-0x000fffff]
[    1.203834] pci 0000:00:00.0: bridge configuration invalid ([bus 00-00]), reconfiguring
[    1.213461] pci 0000:01:00.0: [14c3:7603] type 00 class 0x028000 PCIe Endpoint
[    1.221512] pci 0000:01:00.0: BAR 0 [mem 0x00000000-0x000fffff]
[    1.228966] pci 0000:01:00.0: PME# supported from D0 D3hot D3cold
[    1.236424] pci 0000:00:00.0: PCI bridge to [bus 01-ff]
[    1.242226] pci_bus 0000:01: busn_res: [bus 01-ff] end is updated to 01
[    1.249500] pci 0000:00:00.0: bridge window [mem 0x20000000-0x200fffff]: assigned
[    1.257674] pci 0000:00:00.0: bridge window [mem 0x20100000-0x201fffff pref]: assigned
[    1.266356] pci 0000:00:00.0: bridge window [io  0x0000-0x0fff]: assigned
[    1.273817] pci 0000:01:00.0: BAR 0 [mem 0x20000000-0x200fffff]: assigned
[    1.281279] pci 0000:00:00.0: PCI bridge to [bus 01]
[    1.286677] pci 0000:00:00.0:   bridge window [io  0x0000-0x0fff]
[    1.293420] pci 0000:00:00.0:   bridge window [mem 0x20000000-0x200fffff]
[    1.300848] pci 0000:00:00.0:   bridge window [mem 0x20100000-0x201fffff pref]
[    1.308771] pci_bus 0000:00: resource 4 [io  0x0000-0xffff]
[    1.314864] pci_bus 0000:00: resource 5 [mem 0x20000000-0x27ffffff]
[    1.321734] pci_bus 0000:01: resource 0 [io  0x0000-0x0fff]
[    1.327818] pci_bus 0000:01: resource 1 [mem 0x20000000-0x200fffff]
[    1.334727] pci_bus 0000:01: resource 2 [mem 0x20100000-0x201fffff pref]
[    1.342649] OF: /pcie@1fb81000/pcie@0,0: Missing device_type
[    1.349645] mtk-pcie 1fb81000.pcie: port0 link retrained
[    1.355955] mtk-pcie 1fb83000.pcie: host bridge /pcie@1fb83000 ranges:
[    1.363180] mtk-pcie 1fb83000.pcie:       IO 0x001f610000..0x001f61ffff -> 0x0000000000
[    1.371954] mtk-pcie 1fb83000.pcie:      MEM 0x0028000000..0x002fffffff -> 0x0028000000
[    1.519707] mtk-pcie 1fb83000.pcie: PCI host bridge to bus 0001:00
[    1.526503] pci_bus 0001:00: root bus resource [bus 00-ff]
[    1.532485] pci_bus 0001:00: root bus resource [mem 0x28000000-0x2fffffff]
[    1.540087] pci 0001:00:01.0: rd 0x0000 0x081114c3
[    1.545309] pci 0001:00:01.0: rd 0x000e 0x01
[    1.549957] pci 0001:00:01.0: rd 0x0006 0x0010
[    1.554845] pci 0001:00:01.0: rd 0x0034 0x50
[    1.559504] pci 0001:00:01.0: rd 0x0050 0x7805
[    1.564393] pci 0001:00:01.0: rd 0x0078 0x8001
[    1.569243] pci 0001:00:01.0: rd 0x0080 0x0010
[    1.574141] pci 0001:00:01.0: rd 0x0082 0x0142
[    1.578984] pci 0001:00:01.0: rd 0x009e 0x0000
[    1.583873] pci 0001:00:01.0: rd 0x0084 0x00008341
[    1.589105] pci 0001:00:01.0: rd 0x008c 0x01608c12
[    1.594412] pci 0001:00:01.0: rd 0x0008 0x06040002
[    1.599609] pci 0001:00:01.0: rd 0x0100 0x40010002
[    1.604883] pci 0001:00:01.0: rd 0x0000 0x081114c3
[    1.610111] pci 0001:00:01.0: rd 0x0100 0x40010002
[    1.615384] pci 0001:00:01.0: rd 0x00ac 0x00000000
[    1.620636] pci 0001:00:01.0: rd 0x008c 0x01608c12
[    1.625867] pci 0001:00:01.0: [14c3:0811] type 01 class 0x060400 PCIe Root Port
[    1.633916] pci 0001:00:01.0: rd 0x0004 0x0000
[    1.638758] pci 0001:00:01.0: wr 0x0004 0x0400
[    1.643647] pci 0001:00:01.0: rd 0x0004 0x0400
[    1.648497] pci 0001:00:01.0: wr 0x0004 0x0000
[    1.653387] pci 0001:00:01.0: rd 0x003d 0x01
[    1.658046] pci 0001:00:01.0: rd 0x003c 0x00
[    1.662749] pci 0001:00:01.0: rd 0x0004 0x0000
[    1.667594] pci 0001:00:01.0: rd 0x0010 0x00000000
[    1.672866] pci 0001:00:01.0: wr 0x0010 0xffffffff
[    1.678098] pci 0001:00:01.0: rd 0x0010 0x00000000
[    1.683368] pci 0001:00:01.0: wr 0x0010 0x00000000
[    1.688604] pci 0001:00:01.0: rd 0x0004 0x0000
[    1.693497] pci 0001:00:01.0: rd 0x0014 0x00000000
[    1.698722] pci 0001:00:01.0: wr 0x0014 0xffffffff
[    1.703993] pci 0001:00:01.0: rd 0x0014 0x00000000
[    1.709226] pci 0001:00:01.0: wr 0x0014 0x00000000
[    1.714502] pci 0001:00:01.0: rd 0x0004 0x0000
[    1.719348] pci 0001:00:01.0: rd 0x0038 0x00000000
[    1.724619] pci 0001:00:01.0: wr 0x0038 0xfffff800
[    1.729851] pci 0001:00:01.0: rd 0x0038 0x00000000
[    1.735122] pci 0001:00:01.0: wr 0x0038 0x00000000
[    1.740355] pci 0001:00:01.0: rd 0x0018 0x40000000
[    1.745617] pci 0001:00:01.0: PCI bridge to [bus 00]
[    1.751075] pci 0001:00:01.0: rd 0x001c 0x0000
[    1.755918] pci 0001:00:01.0: wr 0x001c 0xe0f0
[    1.760808] pci 0001:00:01.0: rd 0x001c 0x0000
[    1.765658] pci 0001:00:01.0: wr 0x001c 0x0000
[    1.770528] pci 0001:00:01.0: rd 0x0020 0x0000
[    1.775399] pci 0001:00:01.0: rd 0x0022 0x0000
[    1.780259] pci 0001:00:01.0:   bridge window [mem 0x00000000-0x000fffff]
[    1.787735] pci 0001:00:01.0: rd 0x0024 0x00000000
[    1.792986] pci 0001:00:01.0: wr 0x0024 0xffe0fff0
[    1.798219] pci 0001:00:01.0: rd 0x0024 0x00000000
[    1.803490] pci 0001:00:01.0: wr 0x0024 0x00000000
[    1.808724] pci 0001:00:01.0: rd 0x0094 0x00040000
[    1.814000] pci 0001:00:01.0: rd 0x0006 0x0010
[    1.818844] pci 0001:00:01.0: rd 0x0034 0x50
[    1.823546] pci 0001:00:01.0: rd 0x0050 0x7805
[    1.828392] pci 0001:00:01.0: rd 0x0078 0x8001
[    1.833282] pci 0001:00:01.0: rd 0x0080 0x0010
[    1.838134] pci 0001:00:01.0: rd 0x0084 0x00008341
[    1.843405] pci 0001:00:01.0: rd 0x0088 0x2810
[    1.848255] pci 0001:00:01.0: rd 0x0100 0x40010002
[    1.853525] pci 0001:00:01.0: rd 0x0400 0x0001001e
[    1.858758] pci 0001:00:01.0: rd 0x0100 0x40010002
[    1.864028] pci 0001:00:01.0: rd 0x0400 0x0001001e
[    1.869262] pci 0001:00:01.0: rd 0x003e 0x0000
[    1.874162] pci 0001:00:01.0: wr 0x003e 0x0002
[    1.879022] pci 0001:00:01.0: rd 0x0006 0x0010
[    1.883890] pci 0001:00:01.0: rd 0x0034 0x50
[    1.888549] pci 0001:00:01.0: rd 0x0050 0x7805
[    1.893438] pci 0001:00:01.0: rd 0x0078 0x8001
[    1.898288] pci 0001:00:01.0: rd 0x0080 0x0010
[    1.903178] pci 0001:00:01.0: rd 0x0006 0x0010
[    1.908028] pci 0001:00:01.0: rd 0x0034 0x50
[    1.912726] pci 0001:00:01.0: rd 0x0050 0x7805
[    1.917577] pci 0001:00:01.0: rd 0x0052 0x0080
[    1.922467] pci 0001:00:01.0: rd 0x0006 0x0010
[    1.927316] pci 0001:00:01.0: rd 0x0034 0x50
[    1.932026] pci 0001:00:01.0: rd 0x0050 0x7805
[    1.936864] pci 0001:00:01.0: rd 0x0078 0x8001
[    1.941754] pci 0001:00:01.0: rd 0x0080 0x0010
[    1.946605] pci 0001:00:01.0: rd 0x0006 0x0010
[    1.951494] pci 0001:00:01.0: rd 0x0034 0x50
[    1.956153] pci 0001:00:01.0: rd 0x0050 0x7805
[    1.961042] pci 0001:00:01.0: rd 0x0078 0x8001
[    1.965892] pci 0001:00:01.0: rd 0x0080 0x0010
[    1.970783] pci 0001:00:01.0: rd 0x0006 0x0010
[    1.975632] pci 0001:00:01.0: rd 0x0034 0x50
[    1.980311] pci 0001:00:01.0: rd 0x0050 0x7805
[    1.985204] pci 0001:00:01.0: rd 0x0078 0x8001
[    1.990050] pci 0001:00:01.0: rd 0x0080 0x0010
[    1.994948] pci 0001:00:01.0: rd 0x0100 0x40010002
[    2.000172] pci 0001:00:01.0: rd 0x0400 0x0001001e
[    2.005444] pci 0001:00:01.0: rd 0x0100 0x40010002
[    2.010695] pci 0001:00:01.0: rd 0x0400 0x0001001e
[    2.015927] pci 0001:00:01.0: rd 0x0100 0x40010002
[    2.021200] pci 0001:00:01.0: rd 0x0104 0x00000000
[    2.026431] pci 0001:00:01.0: rd 0x0110 0x00000000
[    2.031703] pci 0001:00:01.0: rd 0x0100 0x40010002
[    2.036936] pci 0001:00:01.0: rd 0x0100 0x40010002
[    2.042210] pci 0001:00:01.0: rd 0x0400 0x0001001e
[    2.047439] pci 0001:00:01.0: rd 0x0006 0x0010
[    2.052334] pci 0001:00:01.0: rd 0x0034 0x50
[    2.056986] pci 0001:00:01.0: rd 0x0050 0x7805
[    2.061876] pci 0001:00:01.0: rd 0x0078 0x8001
[    2.066726] pci 0001:00:01.0: rd 0x007a 0x01c3
[    2.071617] pci 0001:00:01.0: rd 0x0006 0x0010
[    2.076466] pci 0001:00:01.0: rd 0x0006 0x0010
[    2.081355] pci 0001:00:01.0: rd 0x0034 0x50
[    2.086014] pci 0001:00:01.0: rd 0x0050 0x7805
[    2.090903] pci 0001:00:01.0: rd 0x0078 0x8001
[    2.095753] pci 0001:00:01.0: rd 0x0080 0x0010
[    2.100648] pci 0001:00:01.0: rd 0x0100 0x40010002
[    2.105875] pci 0001:00:01.0: rd 0x0400 0x0001001e
[    2.111158] pci 0001:00:01.0: rd 0x0006 0x0010
[    2.115997] pci 0001:00:01.0: rd 0x0034 0x50
[    2.120695] pci 0001:00:01.0: rd 0x0050 0x7805
[    2.125545] pci 0001:00:01.0: rd 0x0078 0x8001
[    2.130415] pci 0001:00:01.0: rd 0x0080 0x0010
[    2.135305] pci 0001:00:01.0: rd 0x007c 0x0008
[    2.140333] pci 0001:00:01.0: rd 0x0100 0x40010002
[    2.145549] pci 0001:00:01.0: rd 0x0400 0x0001001e
[    2.150804] pci 0001:00:01.0: rd 0x0100 0x40010002
[    2.156031] pci 0001:00:01.0: rd 0x0400 0x0001001e
[    2.161303] pci 0001:00:01.0: rd 0x0100 0x40010002
[    2.166535] pci 0001:00:01.0: rd 0x0400 0x0001001e
[    2.171814] pci 0001:00:01.0: rd 0x0100 0x40010002
[    2.177038] pci 0001:00:01.0: rd 0x0400 0x0001001e
[    2.182310] pci 0001:00:01.0: rd 0x0100 0x40010002
[    2.187542] pci 0001:00:01.0: rd 0x0400 0x0001001e
[    2.192814] pci 0001:00:01.0: rd 0x0100 0x40010002
[    2.198045] pci 0001:00:01.0: rd 0x0400 0x0001001e
[    2.204240] pci 0001:00:01.0: rd 0x0018 0x40000000
[    2.209446] pci 0001:00:01.0: bridge configuration invalid ([bus 00-00]), reconfiguring
[    2.218262] pci 0001:00:01.0: rd 0x003e 0x0002
[    2.223130] pci 0001:00:01.0: wr 0x003e 0x0002
[    2.227976] pci 0001:00:01.0: wr 0x0018 0x40000000
[    2.233257] pci 0001:00:01.0: wr 0x001e 0xffff
[    2.238097] pci 0001:00:01.0: wr 0x003e 0x0002
[    2.242987] pci 0001:00:01.0: rd 0x0018 0x40000000
[    2.248219] pci 0001:00:01.0: rd 0x003e 0x0002
[    2.253108] pci 0001:00:01.0: wr 0x003e 0x0002
[    2.257958] pci 0001:00:01.0: wr 0x0006 0xffff
[    2.262853] pci 0001:00:01.0: rd 0x0006 0x0010
[    2.267699] pci 0001:00:01.0: rd 0x0034 0x50
[    2.272397] pci 0001:00:01.0: rd 0x0050 0x7805
[    2.277246] pci 0001:00:01.0: rd 0x0078 0x8001
[    2.282136] pci 0001:00:01.0: rd 0x0080 0x0010
[    2.287004] pci 0001:00:01.0: rd 0x0006 0x0010
[    2.291883] pci 0001:00:01.0: rd 0x0034 0x50
[    2.296535] pci 0001:00:01.0: rd 0x0050 0x7805
[    2.301424] pci 0001:00:01.0: rd 0x0078 0x8001
[    2.306274] pci 0001:00:01.0: rd 0x0080 0x0010
[    2.311164] pci 0001:00:01.0: rd 0x0006 0x0010
[    2.316014] pci 0001:00:01.0: rd 0x0034 0x50
[    2.320717] pci 0001:00:01.0: rd 0x0050 0x7805
[    2.325562] pci 0001:00:01.0: rd 0x0078 0x8001
[    2.330432] pci 0001:00:01.0: rd 0x0080 0x0010
[    2.335322] pci 0001:00:01.0: rd 0x0006 0x0010
[    2.340172] pci 0001:00:01.0: rd 0x0034 0x50
[    2.344871] pci 0001:00:01.0: rd 0x0050 0x7805
[    2.349720] pci 0001:00:01.0: rd 0x0078 0x8001
[    2.354617] pci 0001:00:01.0: rd 0x0080 0x0010
[    2.359461] pci 0001:00:01.0: rd 0x008c 0x01608c12
[    2.364732] pci 0001:00:01.0: rd 0x0092 0x1011
[    2.369713] pci 0001:00:01.0: wr 0x0018 0x40ff0100
[    2.375175] pci 0001:01:00.0: [14c3:7663] type 00 class 0x000280 PCIe Endpoint
[    2.383246] pci 0001:01:00.0: BAR 0 [mem 0x00000000-0x000fffff 64bit pref]
[    2.390849] pci 0001:01:00.0: BAR 2 [mem 0x00000000-0x00003fff 64bit pref]
[    2.398430] pci 0001:01:00.0: BAR 4 [mem 0x00000000-0x00000fff 64bit pref]
[    2.406031] pci 0001:00:01.0: rd 0x0088 0x2810
[    2.411473] pci 0001:01:00.0: supports D1 D2
[    2.416074] pci 0001:01:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    2.423461] pci 0001:00:01.0: rd 0x00a4 0x00000000
[    2.428718] pci 0001:00:01.0: rd 0x0092 0x1011
[    2.433539] pci 0001:01:00.0: 2.000 Gb/s available PCIe bandwidth, limited by 2.5 GT/s PCIe x1 link at 0001:00:01.0 (capable of 4.000 Gb/s with 5.0 GT/s PCIe x1 link)
[    2.449948] pci 0001:00:01.0: rd 0x0100 0x40010002
[    2.455157] pci 0001:00:01.0: rd 0x0400 0x0001001e
[    2.460391] pci 0001:00:01.0: rd 0x0100 0x40010002
[    2.465661] pci 0001:00:01.0: rd 0x0400 0x0001001e
[    2.471422] pci 0001:00:01.0: PCI bridge to [bus 01-ff]
[    2.477117] pci 0001:00:01.0: rd 0x001c 0x00
[    2.481812] pci 0001:00:01.0: rd 0x001d 0x00
[    2.486467] pci 0001:00:01.0: rd 0x0020 0x0000
[    2.491359] pci 0001:00:01.0: rd 0x0022 0x0000
[    2.496206] pci 0001:00:01.0: rd 0x0024 0x0000
[    2.501095] pci 0001:00:01.0: rd 0x0026 0x0000
[    2.505941] pci_bus 0001:01: busn_res: [bus 01-ff] end is updated to 01
[    2.513222] pci 0001:00:01.0: wr 0x001a 0x01
[    2.517882] pci 0001:00:01.0: wr 0x001e 0xffff
[    2.522769] pci 0001:00:01.0: wr 0x003e 0x0002
[    2.527647] pci 0001:00:01.0: bridge window [mem 0x28000000-0x280fffff]: assigned
[    2.535854] pci 0001:00:01.0: bridge window [mem 0x28100000-0x282fffff pref]: assigned
[    2.544537] pci 0001:00:01.0: bridge window [io  size 0x1000]: can't assign; no space
[    2.553124] pci 0001:00:01.0: bridge window [io  size 0x1000]: failed to assign
[    2.561156] pci 0001:01:00.0: BAR 0 [mem 0x28100000-0x281fffff 64bit pref]: assigned
[    2.569715] pci 0001:01:00.0: BAR 2 [mem 0x28200000-0x28203fff 64bit pref]: assigned
[    2.578250] pci 0001:01:00.0: BAR 4 [mem 0x28204000-0x28204fff 64bit pref]: assigned
[    2.586781] pci 0001:00:01.0: PCI bridge to [bus 01]
[    2.592188] pci 0001:00:01.0: wr 0x0030 0x0000ffff
[    2.597412] pci 0001:00:01.0: wr 0x001c 0x00f0
[    2.602305] pci 0001:00:01.0: wr 0x0030 0x00000000
[    2.607524] pci 0001:00:01.0:   bridge window [mem 0x28000000-0x280fffff]
[    2.615001] pci 0001:00:01.0: wr 0x0020 0x28002800
[    2.620233] pci 0001:00:01.0: wr 0x002c 0x00000000
[    2.625495] pci 0001:00:01.0:   bridge window [mem 0x28100000-0x282fffff pref]
[    2.633429] pci 0001:00:01.0: wr 0x0024 0x28202810
[    2.638661] pci 0001:00:01.0: wr 0x0028 0x00000000
[    2.643932] pci 0001:00:01.0: wr 0x002c 0x00000000
[    2.649165] pci 0001:00:01.0: wr 0x003e 0x0002
[    2.654057] pci_bus 0001:00: Some PCI device resources are unassigned, try booting with pci=realloc
[    2.663977] pci_bus 0001:00: resource 4 [mem 0x28000000-0x2fffffff]
[    2.670850] pci_bus 0001:01: resource 1 [mem 0x28000000-0x280fffff]
[    2.677705] pci_bus 0001:01: resource 2 [mem 0x28100000-0x282fffff pref]
[    2.685092] pci 0001:00:01.0: rd 0x0000 0x081114c3
[    2.690319] pci 0001:00:01.0: rd 0x0004 0x00100000
[    2.695591] pci 0001:00:01.0: rd 0x0008 0x06040002
[    2.700842] pci 0001:00:01.0: rd 0x000c 0x00010000
[    2.706075] pci 0001:00:01.0: rd 0x0010 0x00000000
[    2.711357] pci 0001:00:01.0: rd 0x0014 0x00000000
[    2.716578] pci 0001:00:01.0: rd 0x0018 0x40010100
[    2.721850] pci 0001:00:01.0: rd 0x001c 0x04200000
[    2.727081] pci 0001:00:01.0: rd 0x0020 0x28002800
[    2.732353] pci 0001:00:01.0: rd 0x0024 0x00000000
[    2.737585] pci 0001:00:01.0: rd 0x0028 0x00000000
[    2.742856] pci 0001:00:01.0: rd 0x002c 0x00000000
[    2.748088] pci 0001:00:01.0: rd 0x0030 0x00000000
[    2.753360] pci 0001:00:01.0: rd 0x0034 0x00000050
[    2.758592] pci 0001:00:01.0: rd 0x0038 0x00000000
[    2.763867] pci 0001:00:01.0: rd 0x003c 0x00020100
[    2.769097] pci 0001:00:01.0: rd 0x0088 0x2810
[    2.773992] pci 0001:00:01.0: rd 0x0090 0x0008
[    2.778835] pci 0001:00:01.0: rd 0x0098 0x0000
[    2.783725] pci 0001:00:01.0: rd 0x009c 0x0000
[    2.788575] pci 0001:00:01.0: rd 0x00a8 0x0000
[    2.793464] pci 0001:00:01.0: rd 0x00b0 0x0002
[    2.798316] pci 0001:00:01.0: rd 0x0100 0x40010002
[    2.803586] pci 0001:00:01.0: rd 0x0400 0x0001001e
[    2.808819] pci 0001:00:01.0: rd 0x0006 0x0010
[    2.813707] pci 0001:00:01.0: rd 0x0034 0x50
[    2.818367] pci 0001:00:01.0: rd 0x0050 0x7805
[    2.823260] pci 0001:00:01.0: rd 0x0078 0x8001
[    2.828106] pci 0001:00:01.0: rd 0x0080 0x0010
[    2.833004] pci 0001:00:01.0: rd 0x0100 0x40010002
[    2.838227] pci 0001:00:01.0: rd 0x0400 0x0001001e
[    2.843499] pci 0001:00:01.0: rd 0x0100 0x40010002
[    2.848732] pci 0001:00:01.0: rd 0x0104 0x00000000
[    2.854003] pci 0001:00:01.0: rd 0x0110 0x00000000
[    2.859235] pci 0001:00:01.0: rd 0x0104 0x00000000
[    2.864506] pci 0001:00:01.0: rd 0x010c 0x0000
[    2.869356] pci 0001:00:01.0: rd 0x0110 0x00000000
[    2.874632] pci 0001:00:01.0: rd 0x0114 0x800000ff
[    2.879860] pci 0001:00:01.0: rd 0x0100 0x40010002
[    2.885131] pci 0001:00:01.0: rd 0x0400 0x0001001e
[    2.891056] pci 0001:00:01.0: rd 0x040c 0x00000028
[    2.896268] pci 0001:00:01.0: rd 0x0408 0x00002800
[    2.901807] pci 0001:00:01.0: rd 0x0092 0x1011
[    2.906614] pci 0001:00:01.0: rd 0x0090 0x0008
[    2.911487] pci 0001:00:01.0: wr 0x0090 0x0028
[    2.916375] pci 0001:00:01.0: rd 0x0092 0x1012
[    2.921242] pci 0001:00:01.0: wr 0x0092 0x4000
[    2.926084] mtk-pcie 1fb83000.pcie: port1 link retrained


[   17.276926] pci 0000:00:00.0: enabling device (0000 -> 0003)
[   17.282837] mt7603e 0000:01:00.0: enabling device (0000 -> 0002)
[   17.289210] mt7603e 0000:01:00.0: ASIC revision: 76030010
[   17.301145] mt7603e 0000:01:00.0: Firmware Version: ap_pcie
[   17.306779] mt7603e 0000:01:00.0: Build Time: 20160107100755
[   17.350617] mt7603e 0000:01:00.0: firmware init done
[   17.520491] mt7603e 0000:01:00.0: registering led 'mt76-phy0'
[   17.708582] pci 0001:00:01.0: rd 0x007c 0x0008
[   17.713304] pci 0001:00:01.0: rd 0x0004 0x0000
[   17.717826] pci 0001:00:01.0: enabling device (0000 -> 0002)
[   17.723627] pci 0001:00:01.0: wr 0x0004 0x0002
[   17.728145] pci 0001:00:01.0: rd 0x003d 0x01
[   17.732504] pci 0001:00:01.0: rd 0x0004 0x0002
[   17.736995] pci 0001:00:01.0: rd 0x0004 0x0002
[   17.741522] pci 0001:00:01.0: wr 0x0004 0x0006
[   17.746040] mt7615e 0001:01:00.0: enabling device (0000 -> 0002)
[   17.752773] pci 0001:00:01.0: rd 0x0090 0x0008
[   17.763241] ------------[ cut here ]------------
[   17.767961] WARNING: CPU: 0 PID: 591 at target-mipsel_24kc_musl/linux-econet_en7528/mt76-2026.03.01~ee84094d/mt7615/eeprom.c:31 mt7615_eeprom_init+0x484/0x548 [mt7615_common]
[   17.783821] Modules linked in: mt7615e(O+) mt7615_common(O) mt7603e(O) mt76_connac_lib(O) mt76(O) mac80211(O) cfg80211(O) slhc nfnetlink nf_reject_ipv6 nf_reject_ipv4 nf_log_syslog nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c hwmon crc_ccitt compat(O) econet_eth(O) i2c_dev i2c_core cryptodev(O) nls_utf8 nls_iso8859_1 nls_cp437 sha512_generic seqiv sha3_generic jitterentropy_rng drbg hmac geniv rng cmac sd_mod scsi_mod scsi_common gpio_button_hotplug(O) vfat fat nls_base crc32c_generic
[   17.826914] CPU: 0 UID: 0 PID: 591 Comm: kmodloader Tainted: G           O       6.12.74 #0
[   17.826959] Tainted: [O]=OOT_MODULE
[   17.826967] Hardware name: DASAN H660GM-A (Airtel)
[   17.826978] Stack : 000001d5 00000004 0000000c 8188c80c 80e09b3c 8102cf8c 00000001 01000000
[   17.827045]         00000000 00000000 00000000 00000000 00000000 00000001 80e09ae8 80848c40
[   17.827097]         00000000 00000000 8184bd54 80e09970 ffffefff 00000000 8192e928 000001d6
[   17.827153]         80e099bc 000001d8 8192e958 fffffffa 00000001 00000000 8184bd54 00000000
[   17.827209]         00000000 83508374 81927330 00000400 00000003 fffc6467 00000000 81af0000
[   17.827264]         ...
[   17.827279] Call Trace:
[   17.827285] [<81006788>] show_stack+0x28/0xf0
[   17.827338] [<81756b3c>] dump_stack_lvl+0x70/0xb0
[   17.827364] [<8102d7f8>] __warn+0x9c/0x114
[   17.827408] [<8102d998>] warn_slowpath_fmt+0x128/0x188
[   17.827440] [<83508374>] mt7615_eeprom_init+0x484/0x548 [mt7615_common]
[   17.827488] [<8320c2c8>] mt7615_register_device+0xb0/0x230 [mt7615e]
[   17.827531] [<8320e140>] mt7615_mmio_probe+0x184/0x244 [mt7615e]
[   17.827564] [<8320c12c>] mt7615e_reg_map+0x2481fdc/0x24820c8 [mt7615e]
[   17.827643] [<81455d70>] pci_device_probe+0x90/0x130
[   17.827690] [<814b0adc>] really_probe+0xc4/0x350
[   17.827727] [<814b1044>] driver_probe_device+0x48/0x110
[   17.827753] [<814b12d4>] __driver_attach+0xb0/0x180
[   17.827778] [<814ae560>] bus_for_each_dev+0x70/0xb8
[   17.827801] [<814afbdc>] bus_add_driver+0xf8/0x224
[   17.827824] [<814b1ecc>] driver_register+0x88/0x154
[   17.827853] [<81000644>] do_one_initcall+0x50/0x2b8
[   17.827874] [<810b7fe8>] do_init_module+0x5c/0x234
[   17.827924] [<810ba2d8>] sys_init_module+0x170/0x22c
[   17.827954] [<8101104c>] syscall_common+0x34/0x58
[   17.827982]
[   17.827990] ---[ end trace 0000000000000000 ]---
[   18.001416] mt7615e 0001:01:00.0: registering led 'mt76-phy1'
[   18.184554] mt7615e 0001:01:00.0: Firmware is not ready for download


Ahmed Naseef
> 
> Bjorn
> 
> 
> commit 012e94d89d10 ("PCI: Log config accesses")
> Author: Bjorn Helgaas <bhelgaas@google.com>
> Date:   Sat Jan 24 12:46:02 2026 -0600
> 
>     PCI: Log config accesses
> 
> 
> diff --git a/drivers/pci/access.c b/drivers/pci/access.c
> index b123da16b63b..8b03af748238 100644
> --- a/drivers/pci/access.c
> +++ b/drivers/pci/access.c
> @@ -32,6 +32,49 @@ DEFINE_RAW_SPINLOCK(pci_lock);
>  # define pci_unlock_config(f)	raw_spin_unlock_irqrestore(&pci_lock, f)
>  #endif
>  
> +/* domain, bus, dev, fn */
> +static u64 pci_log_cfg_dev = (0LL << 32) | PCI_DEVID(0, PCI_DEVFN(0x1c, 3));
> +
> +#define PCI_CFG_FMT	"pci %04x:%02x:%02x.%d: %s %#06x "
> +#define PCI_CFG_FMT_1	PCI_CFG_FMT "%#04x\n"
> +#define PCI_CFG_FMT_2	PCI_CFG_FMT "%#06x\n"
> +#define PCI_CFG_FMT_4	PCI_CFG_FMT "%#010x\n"
> +
> +static void pci_log_cfg(struct pci_bus *bus, unsigned int devfn, char *op,
> +		        int pos, int len, u32 val, int res)
> +{
> +	u64 dev_match = ((u64) pci_domain_nr(bus) << 32) | devfn;
> +	u32 domain = pci_log_cfg_dev >> 32;
> +
> +	if (pci_log_cfg_dev != dev_match)
> +		return;
> +
> +	if (res) {
> +		pr_info(PCI_CFG_FMT "failed (%d)\n",
> +			domain, bus->number, PCI_SLOT(devfn), PCI_FUNC(devfn),
> +			op, pos, res);
> +		return;
> +	}
> +
> +	switch (len) {
> +	case 1:
> +		pr_info(PCI_CFG_FMT_1,
> +			domain, bus->number, PCI_SLOT(devfn), PCI_FUNC(devfn),
> +			op, pos, val);
> +		break;
> +	case 2:
> +		pr_info(PCI_CFG_FMT_2,
> +			domain, bus->number, PCI_SLOT(devfn), PCI_FUNC(devfn),
> +			op, pos, val);
> +		break;
> +	default:
> +		pr_info(PCI_CFG_FMT_4,
> +			domain, bus->number, PCI_SLOT(devfn), PCI_FUNC(devfn),
> +			op, pos, val);
> +		break;
> +	}
> +}
> +
>  #define PCI_OP_READ(size, type, len) \
>  int noinline pci_bus_read_config_##size \
>  	(struct pci_bus *bus, unsigned int devfn, int pos, type *value)	\
> @@ -50,6 +93,7 @@ int noinline pci_bus_read_config_##size \
>  	else								\
>  		*value = (type)data;					\
>  	pci_unlock_config(flags);					\
> +	pci_log_cfg(bus, devfn, "rd", pos, len, (u32) *value, res);	\
>  									\
>  	return res;							\
>  }
> @@ -67,6 +111,7 @@ int noinline pci_bus_write_config_##size \
>  	pci_lock_config(flags);						\
>  	res = bus->ops->write(bus, devfn, pos, len, value);		\
>  	pci_unlock_config(flags);					\
> +	pci_log_cfg(bus, devfn, "wr", pos, len, value, res);		\
>  									\
>  	return res;							\
>  }
> commit 744b78273da8 ("PCI: Override pref window reads to return 0")
> Author: Bjorn Helgaas <bhelgaas@google.com>
> Date:   Fri Mar 13 10:39:27 2026 -0500
> 
>     PCI: Override pref window reads to return 0
> 
> 
> diff --git a/drivers/pci/access.c b/drivers/pci/access.c
> index 8b03af748238..675926bddc54 100644
> --- a/drivers/pci/access.c
> +++ b/drivers/pci/access.c
> @@ -40,6 +40,43 @@ static u64 pci_log_cfg_dev = (0LL << 32) | PCI_DEVID(0, PCI_DEVFN(0x1c, 3));
>  #define PCI_CFG_FMT_2	PCI_CFG_FMT "%#06x\n"
>  #define PCI_CFG_FMT_4	PCI_CFG_FMT "%#010x\n"
>  
> +static int pci_override_cfg_rd(struct pci_bus *bus, unsigned int devfn,
> +			       int pos, int len, u32 *value)
> +{
> +	u64 dev_match = ((u64) pci_domain_nr(bus) << 32) | devfn;
> +
> +	if (pci_log_cfg_dev != dev_match)
> +		return -ENODEV;
> +
> +	if (!(pos == 0x24 || pos == 0x26 || pos == 0x28 || pos == 0x2c))
> +		return -ENODEV;
> +
> +	*value = 0;
> +
> +#if 0
> +	u32 domain = pci_log_cfg_dev >> 32;
> +	switch (len) {
> +	case 1:
> +		pr_info("override " PCI_CFG_FMT_1,
> +			domain, bus->number, PCI_SLOT(devfn), PCI_FUNC(devfn),
> +			"rd", pos, *value);
> +		break;
> +	case 2:
> +		pr_info("override " PCI_CFG_FMT_2,
> +			domain, bus->number, PCI_SLOT(devfn), PCI_FUNC(devfn),
> +			"rd", pos, *value);
> +		break;
> +	default:
> +		pr_info("override " PCI_CFG_FMT_4,
> +			domain, bus->number, PCI_SLOT(devfn), PCI_FUNC(devfn),
> +			"rd", pos, *value);
> +		break;
> +	}
> +#endif
> +
> +	return 0;
> +}
> +
>  static void pci_log_cfg(struct pci_bus *bus, unsigned int devfn, char *op,
>  		        int pos, int len, u32 val, int res)
>  {
> @@ -87,7 +124,9 @@ int noinline pci_bus_read_config_##size \
>  		return PCIBIOS_BAD_REGISTER_NUMBER;			\
>  									\
>  	pci_lock_config(flags);						\
> -	res = bus->ops->read(bus, devfn, pos, len, &data);		\
> +	res = pci_override_cfg_rd(bus, devfn, pos, len, &data);		\
> +	if (res)							\
> +		res = bus->ops->read(bus, devfn, pos, len, &data);	\
>  	if (res)							\
>  		PCI_SET_ERROR_RESPONSE(value);				\
>  	else								\

