Return-Path: <linux-mips+bounces-14232-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yEMELAXM6GklQQIAu9opvQ
	(envelope-from <linux-mips+bounces-14232-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 22 Apr 2026 15:24:21 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC961446ADD
	for <lists+linux-mips@lfdr.de>; Wed, 22 Apr 2026 15:24:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 791693008C94
	for <lists+linux-mips@lfdr.de>; Wed, 22 Apr 2026 13:17:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 505AF3D331E;
	Wed, 22 Apr 2026 13:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.b="Y7/ELOLK"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D133D091F
	for <linux-mips@vger.kernel.org>; Wed, 22 Apr 2026 13:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776863863; cv=none; b=g+mzPU2v53tdM5ZUk+ynuPcdVtXyvf78mekELH939QrNXezfItzZ1aTqMXBkVoH6URu5bCP5+leSSl/ZHvJbqYwLVrjDZk8f8lsZilUiHTE0mtpYmlgGXZzfWjiej7yFYHZJXHYJ1/tadl75L91dMah+t1Wrp3YBfN/cSIQfYoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776863863; c=relaxed/simple;
	bh=4GxuuyMSlQ6NLADvS5Z35ENS8872BjLa9uyc5U0J7N0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R99CWC4TPnNunEK4XS3LT61gfgMjhwVq9EDVUk6z/9/rPRUri4HnmdrKWEsIWj3uk1AtxFsvuB6hG16AQ4ZpM01QJlpSbGUXrXBbmOxZmKcZH5/XzqWr4N2GLz6YexO+PxlL3Ya7KsWnuykGD9L7gIX5fsHjWz5MrIrRa2XvK1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org; spf=none smtp.mailfrom=blackwall.org; dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.b=Y7/ELOLK; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so50408595e9.0
        for <linux-mips@vger.kernel.org>; Wed, 22 Apr 2026 06:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1776863860; x=1777468660; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5JlgsJdPL7wtu5Mt7X6K/pCay7xHXG85EOpMzec21jg=;
        b=Y7/ELOLKnoTe2wwHbCwpojhW6wz4lD68qmQPn3TjWeFQPJxnOgOcuNSGM/doVPhAIS
         Yb0uv1QjTjDnyVBd294lVFHNBjpj/H7kgwQyIGFBsRjbhYJnRbT8QvwLv4hg/T9u/HeA
         YTFNj3rdfn+Yiqn1KKm2farh527kYj/rKED28Z9rkcrahE5j3WpBgJOKw7liqeoVJW42
         aPrPFgXXnMi7Po53c+ZN3cksKBP71WGUwyH9dpQaaBYQEkHhhOYlyRB+LjJrDXbQFdV4
         2ajdEKkNWks6yLEM+jRU+tETirV6s6COXVInsDSH2WmG7lgRxueSCkmKTVwFxT+qrd5o
         7CZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776863860; x=1777468660;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5JlgsJdPL7wtu5Mt7X6K/pCay7xHXG85EOpMzec21jg=;
        b=F8Ur+/eyu0vZeKSNNjol1GBdXhSVT+X4e8XnEM6CKKcMiSuBcCp0Zhsw8C0ecZ5Jag
         y+Uy1eH/ZP0FtQV+FCv72pFxLLrDDxhoJSGZiG9LHOMs6+/+rVrinE5zV2Cv1sGoMLZH
         T+FgRnL7IDr/vNWYcsVlMXipDgjDSwy3HWXbkqOFlC2oOy2vwj0J8P+FWI/D4wo9wNVC
         06QXIrXOiIr/rlkD7x+xJ2QohS36SKU8p4XusGsTlt/RkbjrlpEgb5VqGTlmoyU3HarA
         f8i5N18B1c7nDYfkUX44u5InC4lm+m60g7v3uSXMamSqBq9MLF9XvUaWIl/Hj5owFEOG
         ZRtg==
X-Forwarded-Encrypted: i=1; AFNElJ/reOGrh7jZEPSdAtWSFVlAm/rvNp6XEHHmUKANUuKZjxEeb/xAe1f0/ksAorJMP91M5JCl5rLGFdWQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwNMHcNYOv4+Lej+CYlK9LXLEenKsfNvcfnBZXm4pTgkjTLirGQ
	nAeM6bq1q2DB4dp+7AcEuMTy/iDXPoyS5VksPh8k1ffMD4969T2mKr11d0nvqESv+Hc=
X-Gm-Gg: AeBDievdCQJVWX/zx9YAVZ2Kt8bOVKZu28uKgA1B9WG4rMTflAyZidwe26dBzFc0Gr2
	vKztnRWXcEQfpeFATLNjfJYiNLdJTZXeUOH8G32IHc/KvsjN79ujGlVton56H0rw53/SzV49JkP
	EF0rGM96K4OMT3xY5VtmaespJv+f8aShm+5gvL2b4YvFUIr4ofhsrqTvZgM6dVXNRQp+1YgZLsc
	ObxZoK5b0wIoVWKyl2nd9P6yZyLSHPkVGGOjQ0iOTUnYtgtehpWb7TgvCxKE82fed70TFhbe2Bm
	k3gUkKnyxoTng6+FXHIMFPJnU0UAcP517vy2/hRO8X3ZLCPJmSST3nGN+ZLRqiSGxYvWZFxUgRT
	LGCdAZ/C9+Ve0IlzTqexevFORfIYNXuZH0yA/Hx2jcL2aOyfnQoQOxYPhKg/6uX5ek3AXPR0x3P
	HMUtI9NvK6FGOHWntNQWHfpnGdriJzgQ6WclXAPipY8P8yT9qWHZv0W7bpETAwvrzW
X-Received: by 2002:a05:600c:890c:b0:485:3ff1:d5ed with SMTP id 5b1f17b1804b1-488fb739cd9mr265621335e9.1.1776863859192;
        Wed, 22 Apr 2026 06:17:39 -0700 (PDT)
Received: from [192.168.0.161] (78-154-15-182.ip.btc-net.bg. [78.154.15.182])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e4d6casm41495844f8f.32.2026.04.22.06.17.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 06:17:38 -0700 (PDT)
Message-ID: <46196178-51e0-4744-9154-bbad895568d6@blackwall.org>
Date: Wed, 22 Apr 2026 16:17:36 +0300
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-deletions v2] net: remove unused ATM protocols and
 legacy ATM device drivers
Content-Language: en-US, bg
To: Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net
Cc: netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
 andrew+netdev@lunn.ch, horms@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, linux@armlinux.org.uk, tsbogend@alpha.franken.de,
 maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
 chleroy@kernel.org, 3chas3@gmail.com, idosch@nvidia.com,
 jani.nikula@intel.com, mchehab+huawei@kernel.org, tytso@mit.edu,
 herbert@gondor.apana.org.au, geert@linux-m68k.org, ebiggers@kernel.org,
 johannes.berg@intel.com, jonathan.cameron@huawei.com, kees@kernel.org,
 kuniyu@google.com, fourier.thomas@gmail.com, andriy.shevchenko@intel.com,
 rdunlap@infradead.org, akpm@linux-foundation.org, linux-doc@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 bridge@lists.linux.dev, dwmw2@infradead.org
References: <20260422041846.2035118-1-kuba@kernel.org>
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20260422041846.2035118-1-kuba@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[blackwall.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-14232-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[blackwall.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,google.com,redhat.com,lunn.ch,kernel.org,lwn.net,linuxfoundation.org,armlinux.org.uk,alpha.franken.de,linux.ibm.com,ellerman.id.au,gmail.com,nvidia.com,intel.com,mit.edu,gondor.apana.org.au,linux-m68k.org,huawei.com,infradead.org,linux-foundation.org,lists.ozlabs.org,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[36];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[blackwall.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[razor@blackwall.org,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips,netdev,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EC961446ADD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 22/04/2026 07:18, Jakub Kicinski wrote:
> Remove the ATM protocol modules and PCI/SBUS ATM device drivers
> that are no longer in active use.
> 
> The ATM core protocol stack, PPPoATM, BR2684, and USB DSL modem
> drivers (drivers/usb/atm/) are retained in-tree to maintain PPP
> over ATM (PPPoA) and PPPoE-over-BR2684 support for DSL connections.
> 
> Removed ATM protocol modules:
>   - net/atm/clip.c - Classical IP over ATM (RFC 2225)
>   - net/atm/lec.c - LAN Emulation Client (LANE)
>   - net/atm/mpc.c, mpoa_caches.c, mpoa_proc.c - Multi-Protocol Over ATM
> 
> Removed PCI/SBUS ATM device drivers (drivers/atm/):
>   - adummy, atmtcp - software/testing ATM devices
>   - eni - Efficient Networks ENI155P (OC-3, ~1995)
>   - fore200e - FORE Systems 200E PCI/SBUS (OC-3, ~1999)
>   - he - ForeRunner HE (OC-3/OC-12, ~2000)
>   - idt77105 - IDT 77105 25 Mbps ATM PHY
>   - idt77252 - IDT 77252 NICStAR II (OC-3, ~2000)
>   - iphase - Interphase ATM PCI (OC-3/DS3/E3)
>   - lanai - Efficient Networks Speedstream 3010
>   - nicstar - IDT 77201 NICStAR (155/25 Mbps, ~1999)
>   - solos-pci - Traverse Technologies ADSL2+ PCI
>   - suni - PMC S/UNI SONET PHY library
> 
> Also clean up references in:
>   - net/bridge/ - remove ATM LANE hook (br_fdb_test_addr_hook,
>     br_fdb_test_addr)
>   - net/core/dev.c - remove br_fdb_test_addr_hook export
>   - defconfig files - remove ATM driver config options
> 
> The removed code is moved to an out-of-tree module package (mod-orphan).
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
> v2:
>   - keep BR2684
>   - correct the claim that Traverse Technologies is defunct,
>     I'm still deleting the solos driver, chances are nobody uses it.
>     Easy enough to revert back in since core is still around.
>     The guiding principle is to keep USB modems and delete
>     the rest as USB ADSL2+ CPEs were most popular historically.
> v1: https://lore.kernel.org/20260421021943.1295109-1-kuba@kernel.org
> 
> CC: corbet@lwn.net
> CC: skhan@linuxfoundation.org
> CC: linux@armlinux.org.uk
> CC: tsbogend@alpha.franken.de
> CC: maddy@linux.ibm.com
> CC: mpe@ellerman.id.au
> CC: npiggin@gmail.com
> CC: chleroy@kernel.org
> CC: 3chas3@gmail.com
> CC: razor@blackwall.org
> CC: idosch@nvidia.com
> CC: jani.nikula@intel.com
> CC: mchehab+huawei@kernel.org
> CC: tytso@mit.edu
> CC: herbert@gondor.apana.org.au
> CC: geert@linux-m68k.org
> CC: ebiggers@kernel.org
> CC: johannes.berg@intel.com
> CC: jonathan.cameron@huawei.com
> CC: kees@kernel.org
> CC: kuniyu@google.com
> CC: fourier.thomas@gmail.com
> CC: andriy.shevchenko@intel.com
> CC: rdunlap@infradead.org
> CC: akpm@linux-foundation.org
> CC: linux-doc@vger.kernel.org
> CC: linux-mips@vger.kernel.org
> CC: linuxppc-dev@lists.ozlabs.org
> CC: bridge@lists.linux.dev
> CC: dwmw2@infradead.org
> CC: herbert@gondor.apana.org.au
> ---
>   MAINTAINERS                                   |    3 +-
>   Documentation/.renames.txt                    |    2 -
>   .../device_drivers/atm/fore200e.rst           |   66 -
>   .../networking/device_drivers/atm/index.rst   |    2 -
>   .../networking/device_drivers/atm/iphase.rst  |  193 -
>   drivers/atm/Kconfig                           |  325 --
>   drivers/net/Kconfig                           |    2 -
>   net/atm/Kconfig                               |   37 -
>   drivers/Makefile                              |    1 -
>   drivers/atm/Makefile                          |   32 -
>   net/atm/Makefile                              |    4 -
>   drivers/atm/eni.h                             |  136 -
>   drivers/atm/fore200e.h                        |  973 -----
>   drivers/atm/he.h                              |  845 ----
>   drivers/atm/idt77105.h                        |   92 -
>   drivers/atm/idt77252.h                        |  816 ----
>   drivers/atm/idt77252_tables.h                 |  781 ----
>   drivers/atm/iphase.h                          | 1452 -------
>   drivers/atm/midway.h                          |  266 --
>   drivers/atm/nicstar.h                         |  759 ----
>   drivers/atm/suni.h                            |  242 --
>   drivers/atm/tonga.h                           |   21 -
>   drivers/atm/zeprom.h                          |   35 -
>   net/atm/lec.h                                 |  155 -
>   net/atm/lec_arpc.h                            |   97 -
>   net/atm/mpc.h                                 |   65 -
>   net/atm/mpoa_caches.h                         |   99 -
>   net/bridge/br_private.h                       |    4 -
>   drivers/atm/adummy.c                          |  202 -
>   drivers/atm/atmtcp.c                          |  513 ---
>   drivers/atm/eni.c                             | 2321 ----------
>   drivers/atm/fore200e.c                        | 3012 -------------
>   drivers/atm/he.c                              | 2861 -------------
>   drivers/atm/idt77105.c                        |  376 --
>   drivers/atm/idt77252.c                        | 3797 -----------------
>   drivers/atm/iphase.c                          | 3283 --------------
>   drivers/atm/lanai.c                           | 2603 -----------
>   drivers/atm/nicstar.c                         | 2759 ------------
>   drivers/atm/nicstarmac.c                      |  244 --
>   drivers/atm/solos-attrlist.c                  |   83 -
>   drivers/atm/solos-pci.c                       | 1496 -------
>   drivers/atm/suni.c                            |  391 --
>   net/atm/clip.c                                |  960 -----
>   net/atm/lec.c                                 | 2274 ----------
>   net/atm/mpc.c                                 | 1538 -------
>   net/atm/mpoa_caches.c                         |  565 ---
>   net/atm/mpoa_proc.c                           |  307 --
>   net/bridge/br.c                               |    7 -
>   net/bridge/br_fdb.c                           |   29 -
>   net/core/dev.c                                |    7 -
>   arch/arm/configs/ixp4xx_defconfig             |    5 -
>   arch/mips/configs/gpr_defconfig               |   13 -
>   arch/mips/configs/mtx1_defconfig              |   13 -
>   arch/powerpc/configs/ppc6xx_defconfig         |    9 -
>   drivers/atm/.gitignore                        |    5 -
>   drivers/atm/nicstarmac.copyright              |   61 -
>   56 files changed, 2 insertions(+), 37237 deletions(-)
>   delete mode 100644 Documentation/networking/device_drivers/atm/fore200e.rst
>   delete mode 100644 Documentation/networking/device_drivers/atm/iphase.rst
>   delete mode 100644 drivers/atm/Kconfig
>   delete mode 100644 drivers/atm/Makefile
>   delete mode 100644 drivers/atm/eni.h
>   delete mode 100644 drivers/atm/fore200e.h
>   delete mode 100644 drivers/atm/he.h
>   delete mode 100644 drivers/atm/idt77105.h
>   delete mode 100644 drivers/atm/idt77252.h
>   delete mode 100644 drivers/atm/idt77252_tables.h
>   delete mode 100644 drivers/atm/iphase.h
>   delete mode 100644 drivers/atm/midway.h
>   delete mode 100644 drivers/atm/nicstar.h
>   delete mode 100644 drivers/atm/suni.h
>   delete mode 100644 drivers/atm/tonga.h
>   delete mode 100644 drivers/atm/zeprom.h
>   delete mode 100644 net/atm/lec.h
>   delete mode 100644 net/atm/lec_arpc.h
>   delete mode 100644 net/atm/mpc.h
>   delete mode 100644 net/atm/mpoa_caches.h
>   delete mode 100644 drivers/atm/adummy.c
>   delete mode 100644 drivers/atm/atmtcp.c
>   delete mode 100644 drivers/atm/eni.c
>   delete mode 100644 drivers/atm/fore200e.c
>   delete mode 100644 drivers/atm/he.c
>   delete mode 100644 drivers/atm/idt77105.c
>   delete mode 100644 drivers/atm/idt77252.c
>   delete mode 100644 drivers/atm/iphase.c
>   delete mode 100644 drivers/atm/lanai.c
>   delete mode 100644 drivers/atm/nicstar.c
>   delete mode 100644 drivers/atm/nicstarmac.c
>   delete mode 100644 drivers/atm/solos-attrlist.c
>   delete mode 100644 drivers/atm/solos-pci.c
>   delete mode 100644 drivers/atm/suni.c
>   delete mode 100644 net/atm/clip.c
>   delete mode 100644 net/atm/lec.c
>   delete mode 100644 net/atm/mpc.c
>   delete mode 100644 net/atm/mpoa_caches.c
>   delete mode 100644 net/atm/mpoa_proc.c
>   delete mode 100644 drivers/atm/.gitignore
>   delete mode 100644 drivers/atm/nicstarmac.copyright
> 

FWIW,
Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>



