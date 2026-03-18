Return-Path: <linux-mips+bounces-13748-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2P/8AuKkumlraAIAu9opvQ
	(envelope-from <linux-mips+bounces-13748-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 18 Mar 2026 14:13:06 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B192BBFF1
	for <lists+linux-mips@lfdr.de>; Wed, 18 Mar 2026 14:13:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1A1F23008D22
	for <lists+linux-mips@lfdr.de>; Wed, 18 Mar 2026 13:13:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E6F43D75A6;
	Wed, 18 Mar 2026 13:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NN91kXR1"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6AAA3921C7
	for <linux-mips@vger.kernel.org>; Wed, 18 Mar 2026 13:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773839580; cv=none; b=hPYze0GSG+qjfrLZw9Mh9izCsTRjtQQHKN5QBwgHKAgv0HacJS7Zp8AxtBoxHDnfAArmzZmC/vzC7U191/IZ7BQNbtGmbOAg0TLWyeJl2G8nh/isMfglXaDExC6ikYXEZR3Kyy4xFpIZ+nHUwv/GWwyqbrNGiP824/bfk6PRUgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773839580; c=relaxed/simple;
	bh=OdQCTcowNhAMMHZuTr+edOMBX9ASYFb/KgzSCNzEfFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VpdwEIcVlgEGcqMdMvF/k9Rtp9VI/DVz4eleNaY6RIlUHeMv1IiW+vTuYjZjgMYPHrvVxMn3Jw8qEzmeUpbGOJNXVWIqmzYgVTQtvp7z1QoSqDGDiiiqWBk0kQUhDcFTH+ewrH8QYMF4FNkQ4LBpeVhDkD3cDp+HnN0VIPB8OO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NN91kXR1; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-35a1230c60eso3582045a91.3
        for <linux-mips@vger.kernel.org>; Wed, 18 Mar 2026 06:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773839578; x=1774444378; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=a38AgtgrSL45qQSDWrOkOi7hxNfM+B9cZh1RZkzmCEM=;
        b=NN91kXR1KBFUWH2LCTrwNH9CAKvd2+gcA74C1KxOg2JmLznRUAUaDS/T5+mpLKhtHU
         5Wn33SyIlmjSVzR6BdMzvg6RCZd9mO+wWGxs5IU5yrk3UWc8BnUyoY2gtQUQKaNjanLA
         egn8stiMUBTB6dv1teQo5Kfdjxc45Fd+iJjkUFm/0RHRMFkzlSrh6Ch5XwA+EqNJtEdm
         gfYYZeqInlcAxOZksN3WkPCHqnMhiwe0/qumJbmvyiyHEMDbaODL7r+JNslBG9GIDSAE
         OUI2x1F52vDHysXhi7aRe1+lbwNw4aGQZ2z8hISzQ17Gnzij8p1i95HWhL2gwLEMR8Yx
         q2+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773839578; x=1774444378;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a38AgtgrSL45qQSDWrOkOi7hxNfM+B9cZh1RZkzmCEM=;
        b=W2kFzb2nmsIkwAiC0iJQRF7CB80CIejTY3rD7sovJsdwqssLn+0HPfvorLfS5vZBOR
         lidsYvMApkE9lG6yo2KMI+2kwSb86zo3QRNuWMlndjrxNDZSxrvJzmopjFNd0OAvNk61
         hE4H+1uxcqqS1W/0GS6GKWX2aAFI8ViCK950KTqSnTktfukUzgzuDnlSyAYL4Ed0/31K
         5Euh/PjleM3J55HyacThKeAtirOK8+Cz1PQY7XuHTURYeX9ajbwMg8YZYN0otLmm0083
         Sc8bzV88NDUBdubUKurnbObVfsRf5azyV//h3gwohWloKWGPmAIo3G2Ltma4GgDsJvfS
         1NXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuZ1M++2MdK1WPcnT3KbdLKKqFfsC2lCr6u9kh0UDO2mXtqc6aeQZvoq/HOrW6CIXah0icBqdWN8h6@vger.kernel.org
X-Gm-Message-State: AOJu0YycNk1xqwdUKe02NNvrM7OOcsgaZ1mFQ4OzeBBy7e3r4MQ1mnT3
	V9PC7UI1zTGG9JKMXAbkqVY812mCDYrgZgNSexcBW4mJ9SPLForlNmzP
X-Gm-Gg: ATEYQzzRFy+ryVn9VD1wbZ5PfuR8+m/6Gq1gyNVdpDHHyZ2fywJsAh4tGxTUI6GlceA
	bkEAOjQNnsL8VboetWb4QVl9SU2KW6HoYcllBGZdNZA9WOBtpg/yX4Oo0+eAuy3PCBDJtNw7B9I
	YLt/3DKA5GCAGYWEUVZgOX2Gz7OcKufGRfQzPN3sfvloC9qRMcVVGLdvXhcnZYdQ07klVr15sWf
	a7BAXdX2LdXj59bYgY+yaSwAAZY36vr0rlU7p2E5B9Urt26ZZRhQCwiMVubaUnEQe2p+gsXc7rK
	Te1fZgO3dBvhBKUt9G3dcs/hHQM/g3C6R+lbtcRS47b0RB7QwbQVlw3tXJrBDxzwBHI6nLbVgmA
	2LTE7+jMnrEdQwg2scAmazSHiF4S+D+4j8xUglDcesgZuPuN0eMSgAArIStfX8rGv9J6gnHPO6a
	le/15BsL9Uan3FaMtH3XWAB2D4wj8Lk84IsbQwX2E=
X-Received: by 2002:a17:90b:1d52:b0:35b:982a:28c7 with SMTP id 98e67ed59e1d1-35bb9e3cf19mr3027930a91.5.1773839578116;
        Wed, 18 Mar 2026 06:12:58 -0700 (PDT)
Received: from DESKTOP-TIT0J8O.localdomain ([49.47.198.15])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bada5c760sm6280105a91.5.2026.03.18.06.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 06:12:57 -0700 (PDT)
Date: Wed, 18 Mar 2026 17:12:49 +0400
From: Ahmed Naseef <naseefkm@gmail.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Caleb James DeLisle <cjd@cjdns.fr>,
	linux-pci@vger.kernel.org, linux-mips@vger.kernel.org,
	ryder.lee@mediatek.com, bhelgaas@google.com, lpieralisi@kernel.org,
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, ansuelsmth@gmail.com,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] PCI: Skip bridge window reads when window is not
 supported
Message-ID: <abqk0VUyLF+iqVXw@DESKTOP-TIT0J8O.localdomain>
References: <20260316155157.679533-4-cjd@cjdns.fr>
 <20260317212908.GA109023@bhelgaas>
 <abpFjQJ5RNcbzbmz@DESKTOP-TIT0J8O.localdomain>
 <fc927b7f-a820-d3c2-581c-ab6db562bcfb@linux.intel.com>
 <2d47f78f-22cf-78c8-8312-3ffb095d2693@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2d47f78f-22cf-78c8-8312-3ffb095d2693@linux.intel.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13748-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,cjdns.fr,vger.kernel.org,mediatek.com,google.com,gmail.com,collabora.com,lists.infradead.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[naseefkm@gmail.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,DESKTOP-TIT0J8O.localdomain:mid]
X-Rspamd-Queue-Id: 00B192BBFF1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 02:18:22PM +0200, Ilpo Järvinen wrote:
> On Wed, 18 Mar 2026, Ilpo Järvinen wrote:
> 
> > On Wed, 18 Mar 2026, Ahmed Naseef wrote:
> > 
> > > On Tue, Mar 17, 2026 at 04:29:08PM -0500, Bjorn Helgaas wrote:
> > > > On Mon, Mar 16, 2026 at 03:51:57PM +0000, Caleb James DeLisle wrote:
> > > > > pci_read_bridge_io() and pci_read_bridge_mmio_pref() read bridge window
> > > > > registers unconditionally. If the registers are hardwired to zero
> > > > > (not implemented), both base and limit will be 0. Since (0 <= 0) is
> > > > > true, a bogus window [mem 0x00000000-0x000fffff] or [io 0x0000-0x0fff]
> > > > > gets created.
> > > > > 
> > > > > pci_read_bridge_windows() already detects unsupported windows by
> > > > > testing register writability and sets io_window/pref_window flags
> > > > > accordingly. Check these flags at the start of pci_read_bridge_io()
> > > > > and pci_read_bridge_mmio_pref() to skip reading registers when the
> > > > > window is not supported.
> > > > 
> > > > The fundamental problem here is that assigned space to a bridge window
> > > > that isn't implemented.  I wish we understood the connection between
> > > > this "read window" path and the assignment path.
> > > > 
> > > > Maybe this patch fixes it because we enter pci_read_bridge_mmio_pref()
> > > > with res->flags being NULL, and we set IORESOURCE_MEM |
> > > > IORESOURCE_PREFETCH again, which makes it look like we can assign
> > > > space for it?
> > > 
> > > Yes, that's exactly right.
> > > 
> > > > 
> > > > If that's the case, I think it would improve the commit log to mention
> > > > the actual mechanism by which we avoid assigning space.
> > > > 
> > > 
> > > How about this:
> > > 
> > >   pci_read_bridge_io() and pci_read_bridge_mmio_pref() read
> > >   bridge window registers unconditionally. If the registers
> > >   are hardwired to zero (not implemented), both base and limit
> > >   will be 0. Since (0 <= 0) is true, these functions set
> > >   IORESOURCE_IO or IORESOURCE_MEM | IORESOURCE_PREFETCH on
> > >   the bridge resource. This causes the allocator to assign
> > >   space for the window even though the hardware can't
> > >   implement it.
> > > 
> > >   pci_read_bridge_windows() already detects unsupported windows
> > >   by testing register writability and sets io_window/pref_window
> > >   flags accordingly. Check these flags at the start of
> > >   pci_read_bridge_io() and pci_read_bridge_mmio_pref() to skip
> > >   reading registers when the window is not supported, so the
> > >   resource flags remain clear and the allocator does not assign
> > >   space for non-existent windows.
> > 
> > At least to me the proposed text reads much better than the original.
> > The original text required reading between the lines to connect the dots, 
> > whereas this new one clearly explains what causes what.
> 
> Hi again,
> 
> Reading the code I think the entire 0 <= 0 part is a red herring 
> when it comes to the current code, the flags are always set by the 
> functions!
> 
> The code would only add IORESOURCE_UNSET | IORESOURCE_DISABLED if the 
> base <= limit check fails but that's still wrong because it says to the 
> resource allocation code that it can enable that bridge window if it needs 
> to.
> 
> Prior to the commit 8278c6914306 ("PCI: Preserve bridge window resource 
> type flags") the base <= limit check did play some role (maybe the 
> original commit message was based on some older tree than the most current 
> one).

Thank you for catching that. We were testing on LTS kernel
6.12 (downstream OpenWrt) where the commit 8278c6914306
("PCI: Preserve bridge window resource type flags") is not
present . In that tree the flags are still only set inside
the base <= limit check, which is why the commit message
focused on that path.
  
For current mainline, how about this for the commit message:

  pci_read_bridge_io() and pci_read_bridge_mmio_pref()
  unconditionally set resource type flags (IORESOURCE_IO
  or IORESOURCE_MEM | IORESOURCE_PREFETCH) when reading
  bridge window registers. For windows that are not
  implemented in hardware, this causes the allocator to
  assign space for a window that doesn't exist.

  pci_read_bridge_windows() already detects unsupported
  windows by testing register writability and sets
  io_window/pref_window flags accordingly. Check these
  flags at the start of pci_read_bridge_io() and
  pci_read_bridge_mmio_pref() to skip them entirely when
  the window is not supported, so the resource flags
  remain clear and the allocator does not assign space
  for non-existent windows.


Ahmed Naseef

> 
> -- 
>  i.


