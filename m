Return-Path: <linux-mips+bounces-14223-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJBsOBgr6Gm3GAIAu9opvQ
	(envelope-from <linux-mips+bounces-14223-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 22 Apr 2026 03:57:44 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1809B441361
	for <lists+linux-mips@lfdr.de>; Wed, 22 Apr 2026 03:57:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 52F1D300BC97
	for <lists+linux-mips@lfdr.de>; Wed, 22 Apr 2026 01:57:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A279872621;
	Wed, 22 Apr 2026 01:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ou4Sfg0q"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C422FFFA4
	for <linux-mips@vger.kernel.org>; Wed, 22 Apr 2026 01:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776823042; cv=none; b=Y414Tw7MMIjUZtixQrEi0x7/qn3Jzz+IADGgIrbW4gxYHHAEbf5kcU72qFOU0OgBXCi/wMbSq1S3eK5a3qT+GUslFQBthFmLz5COOPJkzkYtI0rkQbDbqbNsvczfBjl6KM9FGEwPqyA2Ym3IeLLqZUwdyuMd5tU39Dig4XCZlIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776823042; c=relaxed/simple;
	bh=Tehc36RW9TrLyQSOWa2CDpgHTG6XoSG/npaJpLAHl1A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AaLYpho+1QnHxoFelHmFvcpxAeEfW5apGUmxGQibwCV8Oaffq2vMJvaZ7EQao5i2tT162wJHczFa5MScM81l7KDrVD+Mna/eOtEpbjxRkpt9icCaY+pgk4NpItR2GZWmnSvH5nk6NVRWhEgvlaLdTZBWN7QMRXsuo+zyGOl80mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ou4Sfg0q; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2c15849aa2cso6644576eec.0
        for <linux-mips@vger.kernel.org>; Tue, 21 Apr 2026 18:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776823009; x=1777427809; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IyIQY/Q5seRRlJCaaQrUIlnTajmFOgTGoVqpOjVhF0g=;
        b=Ou4Sfg0qQ8cIP1duDN4fB4SL7/rABcVopCRzFIiyWpqsHVvCs4Nihf/buc/FI0MnHv
         EDAvCbfRzGFsLUGNqhyMRQJ/PWfCQcZfnRTDMFFITm675vRB/aapNvzRkjiEQRc2nn4b
         oKi61qwEqAyzJ/DazS9BWJw0voA4yHZkjjNfp1Lry7aKqQnUdqtWUGrBUnKk7OWk4GTS
         f6lUj6Xo4EzJcImOIZ+bjacIOrWov7dKJ3dDE4lafnrC5kjJzH1WXS1Cz2PN8jclwXQe
         KVfMFIVXVtsc7TiOoEYS0cviHC02PEYwYcsP64pVouu01WgVuk6RPQq2C6X8MLPTqRSD
         WS/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776823009; x=1777427809;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IyIQY/Q5seRRlJCaaQrUIlnTajmFOgTGoVqpOjVhF0g=;
        b=qXWIN8TZnkH36XadOsVJzdTzCTcvTXv+xui8xNsuWDwGMJ1hM6VUDXpP6L14CjUD4T
         X+7EeZBS9ED8rnQjexie+B9I2R2yopvGAiYOZDIOY07zA6QV8vHq5DeYtSZVBbqRzYSm
         lGTTSVrud2C39t+V/wocgY0bXvmJyhpTufvQM/TSdZ3CSSzQx1PobTYEUoOvVVFXIumC
         iJhFN9gTY/lw9l54O5RgCcbkrcmmjz4sUH4Xfgj2GXY2/SdYCfVERkA26iGxNGsFXfaI
         Lb5GvjuaKOaczJVybGCyaMuPWrHQbyZPEjZ6GRn5mNTvhhWoZKlbj/GyOryzXaiM5kOE
         7HxA==
X-Forwarded-Encrypted: i=1; AFNElJ8Jdn07KjA7tahw0IHdhXwrb6StwyVTaMhJVjPSx44au/T/vbS8EpVJ+iya8EKOepcU67t3AU6zTXN6@vger.kernel.org
X-Gm-Message-State: AOJu0YwrxIPUFU/CQe4SSX0ufSkiVLt5SaZPATzm1rz2mVUt01SctK0z
	nmG9joShwSAe3D5q2avCnnJiyMQE66wxUvtMAlK9je0sRDE74/TDi5w7
X-Gm-Gg: AeBDieveoM3ZMkImI1IW6WB0/topMPCMd25OuIoha7x48IEmM+Dw8RybNfRwRYkCrmX
	bwSXtvRBc9vwtqEa7GoaZcYrUsd3w62gdGaaIitXjfVYfXLr2t7J0JLb85U3gstri07wNo46Jv7
	rMJAI8bO2o1c9N4MpH2N2K7mY0M5mQe23jy0n/W43CmnNFUPa8vwR+YrXOCm01rZ6xAQgCFbv5J
	DWD4Gz0KMAyDzx4jKQ2zSPZqvmvv0CBNtR3UdkcRHclsERUvEfkOmUtKpv+/NpE0yHGUNue6wns
	jm5vDh4tWrQ4ePj5LK7PjTYibQknSPMwcMvxlUtnhNEPlcdDQFrp8yEJMl8E3Jv3cY6uXKXWWkw
	DyKMhWABFSAWJc1beI8QbdXm5knNKhOxJ8MvDE/dQbtGd2vW8njw/FsBQbvQyFTr2p24EoNwZJF
	0F+9TGRWUY2scSn3lETX0CucDz4eBp2X743NyD/OMaX6FElHdBe7g=
X-Received: by 2002:a05:7300:fd09:b0:2da:d4b4:c85a with SMTP id 5a478bee46e88-2e464dad10cmr9508648eec.11.1776823008218;
        Tue, 21 Apr 2026 18:56:48 -0700 (PDT)
Received: from [192.168.86.23] ([136.25.189.61])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53d2cfc1dsm20747864eec.22.2026.04.21.18.56.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 18:56:46 -0700 (PDT)
Message-ID: <3e6a83f8-0070-4dce-8b91-5e28204739f6@gmail.com>
Date: Tue, 21 Apr 2026 18:56:44 -0700
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-deletions] net: remove ax25 and amateur radio
 (hamradio) subsystem
To: Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net
Cc: netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
 andrew+netdev@lunn.ch, horms@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, federico.vaga@vaga.pv.it,
 carlos.bilbao@kernel.org, avadhut.naik@amd.com, alexs@kernel.org,
 si.yanteng@linux.dev, dzm91@hust.edu.cn, 2023002089@link.tyut.edu.cn,
 tsbogend@alpha.franken.de, dsahern@kernel.org, jani.nikula@intel.com,
 mchehab+huawei@kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org,
 tytso@mit.edu, herbert@gondor.apana.org.au, ebiggers@kernel.org,
 johannes.berg@intel.com, geert@linux-m68k.org, pablo@netfilter.org,
 tglx@kernel.org, mashiro.chen@mailbox.org, mingo@kernel.org,
 dqfext@gmail.com, jreuter@yaina.de, sdf@fomichev.me, pkshih@realtek.com,
 enelsonmoore@gmail.com, mkl@pengutronix.de, toke@toke.dk, kees@kernel.org,
 crossd@gmail.com, jlayton@kernel.org, wangliang74@huawei.com,
 aha310510@gmail.com, takamitz@amazon.co.jp, kuniyu@google.com,
 linux-doc@vger.kernel.org, linux-mips@vger.kernel.org
References: <20260421021824.1293976-1-kuba@kernel.org>
Content-Language: en-US
From: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
In-Reply-To: <20260421021824.1293976-1-kuba@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,google.com,redhat.com,lunn.ch,kernel.org,lwn.net,linuxfoundation.org,vaga.pv.it,amd.com,linux.dev,hust.edu.cn,link.tyut.edu.cn,alpha.franken.de,intel.com,mit.edu,gondor.apana.org.au,linux-m68k.org,netfilter.org,mailbox.org,gmail.com,yaina.de,fomichev.me,realtek.com,pengutronix.de,toke.dk,huawei.com,amazon.co.jp];
	TAGGED_FROM(0.00)[bounces-14223-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[47];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[carlosbilbaoosdev@gmail.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips,netdev,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 1809B441361
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/20/26 19:18, Jakub Kicinski wrote:

> Remove the amateur radio (AX.25, NET/ROM, ROSE) protocol implementation
> and all associated hamradio device drivers from the kernel tree.
> This set of protocols has long been a huge bug/syzbot magnet,
> and since nobody stepped up to help us deal with the influx
> of the AI-generated bug reports we need to move it out of tree
> to protect our sanity.
>
> The code is moved to an out-of-tree repo:
> https://github.com/linux-netdev/mod-orphan
> if it's cleaned up and reworked there we can accept it back.
>
> Minimal stub headers are kept for include/net/ax25.h (AX25_P_IP,
> AX25_ADDR_LEN, ax25_address) and include/net/rose.h (ROSE_ADDR_LEN)
> so that the conditional integration code in arp.c and tun.c continues
> to compile and work when the out-of-tree modules are loaded.
>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>


Acked-by: Carlos Bilbao <carlos.bilbao@kernel.org>


> ---
> CC: corbet@lwn.net
> CC: skhan@linuxfoundation.org
> CC: federico.vaga@vaga.pv.it
> CC: carlos.bilbao@kernel.org
> CC: avadhut.naik@amd.com
> CC: alexs@kernel.org
> CC: si.yanteng@linux.dev
> CC: dzm91@hust.edu.cn
> CC: 2023002089@link.tyut.edu.cn
> CC: tsbogend@alpha.franken.de
> CC: dsahern@kernel.org
> CC: jani.nikula@intel.com
> CC: mchehab+huawei@kernel.org
> CC: gregkh@linuxfoundation.org
> CC: jirislaby@kernel.org
> CC: tytso@mit.edu
> CC: herbert@gondor.apana.org.au
> CC: ebiggers@kernel.org
> CC: johannes.berg@intel.com
> CC: geert@linux-m68k.org
> CC: pablo@netfilter.org
> CC: tglx@kernel.org
> CC: mashiro.chen@mailbox.org
> CC: mingo@kernel.org
> CC: dqfext@gmail.com
> CC: jreuter@yaina.de
> CC: sdf@fomichev.me
> CC: pkshih@realtek.com
> CC: enelsonmoore@gmail.com
> CC: mkl@pengutronix.de
> CC: toke@toke.dk
> CC: kees@kernel.org
> CC: crossd@gmail.com
> CC: jlayton@kernel.org
> CC: wangliang74@huawei.com
> CC: aha310510@gmail.com
> CC: takamitz@amazon.co.jp
> CC: kuniyu@google.com
> CC: linux-doc@vger.kernel.org
> CC: linux-mips@vger.kernel.org
> ---
>   MAINTAINERS                                   |   73 -
>   Documentation/.renames.txt                    |    2 -
>   .../admin-guide/kernel-parameters.txt         |   18 -
>   Documentation/networking/6pack.rst            |  191 --
>   Documentation/networking/ax25.rst             |   17 -
>   .../device_drivers/hamradio/baycom.rst        |  174 --
>   .../device_drivers/hamradio/index.rst         |   12 -
>   .../device_drivers/hamradio/z8530drv.rst      |  686 ------
>   .../networking/device_drivers/index.rst       |    1 -
>   Documentation/networking/index.rst            |    2 -
>   Documentation/staging/magic-number.rst        |    3 -
>   .../it_IT/staging/magic-number.rst            |    3 -
>   .../sp_SP/process/magic-number.rst            |    3 -
>   .../zh_CN/process/magic-number.rst            |    3 -
>   .../zh_TW/process/magic-number.rst            |    3 -
>   drivers/net/hamradio/Kconfig                  |  162 --
>   net/Kconfig                                   |    1 -
>   net/ax25/Kconfig                              |  108 -
>   drivers/net/Makefile                          |    1 -
>   drivers/net/hamradio/Makefile                 |   22 -
>   net/Makefile                                  |    3 -
>   net/ax25/Makefile                             |   12 -
>   net/netrom/Makefile                           |   10 -
>   net/rose/Makefile                             |   10 -
>   drivers/net/hamradio/z8530.h                  |  246 --
>   include/linux/hdlcdrv.h                       |  276 ---
>   include/linux/netdevice.h                     |    5 +-
>   include/linux/scc.h                           |   86 -
>   include/linux/yam.h                           |   67 -
>   include/net/ax25.h                            |  476 +---
>   include/net/netrom.h                          |  273 ---
>   include/net/rose.h                            |  263 +-
>   include/uapi/linux/baycom.h                   |   40 -
>   include/uapi/linux/hdlcdrv.h                  |  111 -
>   include/uapi/linux/netrom.h                   |   37 -
>   include/uapi/linux/rose.h                     |   91 -
>   include/uapi/linux/scc.h                      |  174 --
>   drivers/net/hamradio/6pack.c                  |  912 -------
>   drivers/net/hamradio/baycom_epp.c             | 1316 ----------
>   drivers/net/hamradio/baycom_par.c             |  598 -----
>   drivers/net/hamradio/baycom_ser_fdx.c         |  678 -----
>   drivers/net/hamradio/baycom_ser_hdx.c         |  727 ------
>   drivers/net/hamradio/bpqether.c               |  593 -----
>   drivers/net/hamradio/hdlcdrv.c                |  747 ------
>   drivers/net/hamradio/mkiss.c                  |  980 --------
>   drivers/net/hamradio/scc.c                    | 2179 -----------------
>   drivers/net/hamradio/yam.c                    | 1191 ---------
>   net/ax25/af_ax25.c                            | 2089 ----------------
>   net/ax25/ax25_addr.c                          |  303 ---
>   net/ax25/ax25_dev.c                           |  200 --
>   net/ax25/ax25_ds_in.c                         |  298 ---
>   net/ax25/ax25_ds_subr.c                       |  204 --
>   net/ax25/ax25_ds_timer.c                      |  235 --
>   net/ax25/ax25_iface.c                         |  214 --
>   net/ax25/ax25_in.c                            |  455 ----
>   net/ax25/ax25_ip.c                            |  247 --
>   net/ax25/ax25_out.c                           |  398 ---
>   net/ax25/ax25_route.c                         |  416 ----
>   net/ax25/ax25_std_in.c                        |  443 ----
>   net/ax25/ax25_std_subr.c                      |   83 -
>   net/ax25/ax25_std_timer.c                     |  175 --
>   net/ax25/ax25_subr.c                          |  296 ---
>   net/ax25/ax25_timer.c                         |  224 --
>   net/ax25/ax25_uid.c                           |  204 --
>   net/ax25/sysctl_net_ax25.c                    |  181 --
>   net/ipv4/arp.c                                |    1 -
>   net/netrom/af_netrom.c                        | 1536 ------------
>   net/netrom/nr_dev.c                           |  178 --
>   net/netrom/nr_in.c                            |  301 ---
>   net/netrom/nr_loopback.c                      |   73 -
>   net/netrom/nr_out.c                           |  272 --
>   net/netrom/nr_route.c                         |  989 --------
>   net/netrom/nr_subr.c                          |  280 ---
>   net/netrom/nr_timer.c                         |  249 --
>   net/netrom/sysctl_net_netrom.c                |  156 --
>   net/rose/af_rose.c                            | 1687 -------------
>   net/rose/rose_dev.c                           |  141 --
>   net/rose/rose_in.c                            |  301 ---
>   net/rose/rose_link.c                          |  289 ---
>   net/rose/rose_loopback.c                      |  133 -
>   net/rose/rose_out.c                           |  122 -
>   net/rose/rose_route.c                         | 1333 ----------
>   net/rose/rose_subr.c                          |  556 -----
>   net/rose/rose_timer.c                         |  227 --
>   net/rose/sysctl_net_rose.c                    |  125 -
>   arch/mips/configs/bcm47xx_defconfig           |    1 -
>   arch/mips/configs/bigsur_defconfig            |   10 -
>   arch/mips/configs/gpr_defconfig               |   11 -
>   arch/mips/configs/mtx1_defconfig              |   11 -
>   arch/mips/configs/rb532_defconfig             |    1 -
>   arch/mips/configs/rm200_defconfig             |    7 -
>   arch/mips/configs/rt305x_defconfig            |    1 -
>   arch/mips/configs/xway_defconfig              |    1 -
>   93 files changed, 6 insertions(+), 29237 deletions(-)
>   delete mode 100644 Documentation/networking/6pack.rst
>   delete mode 100644 Documentation/networking/ax25.rst
>   delete mode 100644 Documentation/networking/device_drivers/hamradio/baycom.rst
>   delete mode 100644 Documentation/networking/device_drivers/hamradio/index.rst
>   delete mode 100644 Documentation/networking/device_drivers/hamradio/z8530drv.rst
>   delete mode 100644 drivers/net/hamradio/Kconfig
>   delete mode 100644 net/ax25/Kconfig
>   delete mode 100644 drivers/net/hamradio/Makefile
>   delete mode 100644 net/ax25/Makefile
>   delete mode 100644 net/netrom/Makefile
>   delete mode 100644 net/rose/Makefile
>   delete mode 100644 drivers/net/hamradio/z8530.h
>   delete mode 100644 include/linux/hdlcdrv.h
>   delete mode 100644 include/linux/scc.h
>   delete mode 100644 include/linux/yam.h
>   delete mode 100644 include/net/netrom.h
>   delete mode 100644 include/uapi/linux/baycom.h
>   delete mode 100644 include/uapi/linux/hdlcdrv.h
>   delete mode 100644 include/uapi/linux/netrom.h
>   delete mode 100644 include/uapi/linux/rose.h
>   delete mode 100644 include/uapi/linux/scc.h
>   delete mode 100644 drivers/net/hamradio/6pack.c
>   delete mode 100644 drivers/net/hamradio/baycom_epp.c
>   delete mode 100644 drivers/net/hamradio/baycom_par.c
>   delete mode 100644 drivers/net/hamradio/baycom_ser_fdx.c
>   delete mode 100644 drivers/net/hamradio/baycom_ser_hdx.c
>   delete mode 100644 drivers/net/hamradio/bpqether.c
>   delete mode 100644 drivers/net/hamradio/hdlcdrv.c
>   delete mode 100644 drivers/net/hamradio/mkiss.c
>   delete mode 100644 drivers/net/hamradio/scc.c
>   delete mode 100644 drivers/net/hamradio/yam.c
>   delete mode 100644 net/ax25/af_ax25.c
>   delete mode 100644 net/ax25/ax25_addr.c
>   delete mode 100644 net/ax25/ax25_dev.c
>   delete mode 100644 net/ax25/ax25_ds_in.c
>   delete mode 100644 net/ax25/ax25_ds_subr.c
>   delete mode 100644 net/ax25/ax25_ds_timer.c
>   delete mode 100644 net/ax25/ax25_iface.c
>   delete mode 100644 net/ax25/ax25_in.c
>   delete mode 100644 net/ax25/ax25_ip.c
>   delete mode 100644 net/ax25/ax25_out.c
>   delete mode 100644 net/ax25/ax25_route.c
>   delete mode 100644 net/ax25/ax25_std_in.c
>   delete mode 100644 net/ax25/ax25_std_subr.c
>   delete mode 100644 net/ax25/ax25_std_timer.c
>   delete mode 100644 net/ax25/ax25_subr.c
>   delete mode 100644 net/ax25/ax25_timer.c
>   delete mode 100644 net/ax25/ax25_uid.c
>   delete mode 100644 net/ax25/sysctl_net_ax25.c
>   delete mode 100644 net/netrom/af_netrom.c
>   delete mode 100644 net/netrom/nr_dev.c
>   delete mode 100644 net/netrom/nr_in.c
>   delete mode 100644 net/netrom/nr_loopback.c
>   delete mode 100644 net/netrom/nr_out.c
>   delete mode 100644 net/netrom/nr_route.c
>   delete mode 100644 net/netrom/nr_subr.c
>   delete mode 100644 net/netrom/nr_timer.c
>   delete mode 100644 net/netrom/sysctl_net_netrom.c
>   delete mode 100644 net/rose/af_rose.c
>   delete mode 100644 net/rose/rose_dev.c
>   delete mode 100644 net/rose/rose_in.c
>   delete mode 100644 net/rose/rose_link.c
>   delete mode 100644 net/rose/rose_loopback.c
>   delete mode 100644 net/rose/rose_out.c
>   delete mode 100644 net/rose/rose_route.c
>   delete mode 100644 net/rose/rose_subr.c
>   delete mode 100644 net/rose/rose_timer.c
>   delete mode 100644 net/rose/sysctl_net_rose.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 66f29cde4985..cfcf422dd40a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -102,12 +102,6 @@ F:	Documentation/networking/6lowpan.rst
>   F:	include/net/6lowpan.h
>   F:	net/6lowpan/
>   
> -6PACK NETWORK DRIVER FOR AX.25
> -M:	Andreas Koensgen <ajk@comnets.uni-bremen.de>
> -L:	linux-hams@vger.kernel.org
> -S:	Maintained
> -F:	drivers/net/hamradio/6pack.c
> -
>   802.11 (including CFG80211/NL80211)
>   M:	Johannes Berg <johannes@sipsolutions.net>
>   L:	linux-wireless@vger.kernel.org
> @@ -4281,14 +4275,6 @@ S:	Maintained
>   F:	Documentation/devicetree/bindings/leds/backlight/awinic,aw99706.yaml
>   F:	drivers/video/backlight/aw99706.c
>   
> -AX.25 NETWORK LAYER
> -L:	linux-hams@vger.kernel.org
> -S:	Orphan
> -W:	https://linux-ax25.in-berlin.de
> -F:	include/net/ax25.h
> -F:	include/uapi/linux/ax25.h
> -F:	net/ax25/
> -
>   AXENTIA ARM DEVICES
>   M:	Peter Rosin <peda@axentia.se>
>   L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> @@ -4430,13 +4416,6 @@ F:	include/uapi/linux/batadv_packet.h
>   F:	include/uapi/linux/batman_adv.h
>   F:	net/batman-adv/
>   
> -BAYCOM/HDLCDRV DRIVERS FOR AX.25
> -M:	Thomas Sailer <t.sailer@alumni.ethz.ch>
> -L:	linux-hams@vger.kernel.org
> -S:	Maintained
> -W:	http://www.baycom.org/~tom/ham/ham.html
> -F:	drivers/net/hamradio/baycom*
> -
>   BCACHE (BLOCK LAYER CACHE)
>   M:	Coly Li <colyli@fnnas.com>
>   M:	Kent Overstreet <kent.overstreet@linux.dev>
> @@ -7020,20 +6999,6 @@ S:	Maintained
>   F:	drivers/rtc/rtc-ds1685.c
>   F:	include/linux/rtc/ds1685.h
>   
> -DAMA SLAVE for AX.25
> -M:	Joerg Reuter <jreuter@yaina.de>
> -L:	linux-hams@vger.kernel.org
> -S:	Maintained
> -W:	http://yaina.de/jreuter/
> -W:	http://www.qsl.net/dl1bke/
> -F:	net/ax25/af_ax25.c
> -F:	net/ax25/ax25_dev.c
> -F:	net/ax25/ax25_ds_*
> -F:	net/ax25/ax25_in.c
> -F:	net/ax25/ax25_out.c
> -F:	net/ax25/ax25_timer.c
> -F:	net/ax25/sysctl_net_ax25.c
> -
>   DASHARO ACPI PLATFORM DRIVER
>   M:	Michał Kopeć <michal.kopec@3mdeb.com>
>   S:	Maintained
> @@ -11444,11 +11409,6 @@ T:	git https://github.com/Rust-for-Linux/linux.git timekeeping-next
>   F:	rust/kernel/time.rs
>   F:	rust/kernel/time/
>   
> -HIGH-SPEED SCC DRIVER FOR AX.25
> -L:	linux-hams@vger.kernel.org
> -S:	Orphan
> -F:	drivers/net/hamradio/scc.c
> -
>   HIGHPOINT ROCKETRAID 3xxx RAID DRIVER
>   M:	HighPoint Linux Team <linux@highpoint-tech.com>
>   S:	Supported
> @@ -18272,14 +18232,6 @@ F:	net/bridge/br_netfilter*.c
>   F:	net/netfilter/
>   F:	tools/testing/selftests/net/netfilter/
>   
> -NETROM NETWORK LAYER
> -L:	linux-hams@vger.kernel.org
> -S:	Orphan
> -W:	https://linux-ax25.in-berlin.de
> -F:	include/net/netrom.h
> -F:	include/uapi/linux/netrom.h
> -F:	net/netrom/
> -
>   NETRONIX EMBEDDED CONTROLLER
>   M:	Jonathan Neuschäfer <j.neuschaefer@gmx.net>
>   S:	Maintained
> @@ -23072,14 +23024,6 @@ F:	include/linux/mfd/rohm-bd96802.h
>   F:	include/linux/mfd/rohm-generic.h
>   F:	include/linux/mfd/rohm-shared.h
>   
> -ROSE NETWORK LAYER
> -L:	linux-hams@vger.kernel.org
> -S:	Orphan
> -W:	https://linux-ax25.in-berlin.de
> -F:	include/net/rose.h
> -F:	include/uapi/linux/rose.h
> -F:	net/rose/
> -
>   ROTATION DRIVER FOR ALLWINNER A83T
>   M:	Jernej Skrabec <jernej.skrabec@gmail.com>
>   L:	linux-media@vger.kernel.org
> @@ -29105,13 +29049,6 @@ F:	lib/decompress_unxz.c
>   F:	lib/xz/
>   F:	scripts/xz_wrap.sh
>   
> -YAM DRIVER FOR AX.25
> -M:	Jean-Paul Roubelat <jpr@f6fbb.org>
> -L:	linux-hams@vger.kernel.org
> -S:	Maintained
> -F:	drivers/net/hamradio/yam*
> -F:	include/linux/yam.h
> -
>   YAMA SECURITY MODULE
>   M:	Kees Cook <kees@kernel.org>
>   S:	Supported
> @@ -29133,16 +29070,6 @@ S:	Maintained
>   F:	Documentation/input/devices/yealink.rst
>   F:	drivers/input/misc/yealink.*
>   
> -Z8530 DRIVER FOR AX.25
> -M:	Joerg Reuter <jreuter@yaina.de>
> -L:	linux-hams@vger.kernel.org
> -S:	Maintained
> -W:	http://yaina.de/jreuter/
> -W:	http://www.qsl.net/dl1bke/
> -F:	Documentation/networking/device_drivers/hamradio/z8530drv.rst
> -F:	drivers/net/hamradio/*scc.c
> -F:	drivers/net/hamradio/z8530.h
> -
>   ZD1211RW WIRELESS DRIVER
>   L:	linux-wireless@vger.kernel.org
>   S:	Orphan
> diff --git a/Documentation/.renames.txt b/Documentation/.renames.txt
> index c4de5200abdb..df4db1121995 100644
> --- a/Documentation/.renames.txt
> +++ b/Documentation/.renames.txt
> @@ -783,7 +783,6 @@ namespaces/compatibility-list admin-guide/namespaces/compatibility-list
>   namespaces/index admin-guide/namespaces/index
>   namespaces/resource-control admin-guide/namespaces/resource-control
>   networking/altera_tse networking/device_drivers/ethernet/altera/altera_tse
> -networking/baycom networking/device_drivers/hamradio/baycom
>   networking/bpf_flow_dissector bpf/prog_flow_dissector
>   networking/cxacru networking/device_drivers/atm/cxacru
>   networking/defza networking/device_drivers/fddi/defza
> @@ -846,7 +845,6 @@ networking/ixgbe networking/device_drivers/ethernet/intel/ixgbe
>   networking/ixgbevf networking/device_drivers/ethernet/intel/ixgbevf
>   networking/netdev-FAQ process/maintainer-netdev
>   networking/skfp networking/device_drivers/fddi/skfp
> -networking/z8530drv networking/device_drivers/hamradio/z8530drv
>   nfc/index driver-api/nfc/index
>   nfc/nfc-hci driver-api/nfc/nfc-hci
>   nfc/nfc-pn544 driver-api/nfc/nfc-pn544
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index f2ce1f4975c1..09354ff7cff2 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -6,7 +6,6 @@
>   	APPARMOR AppArmor support is enabled.
>   	ARM	ARM architecture is enabled.
>   	ARM64	ARM64 architecture is enabled.
> -	AX25	Appropriate AX.25 support is enabled.
>   	CLK	Common clock infrastructure is enabled.
>   	CMA	Contiguous Memory Area support is enabled.
>   	DRM	Direct Rendering Management support is enabled.
> @@ -633,23 +632,6 @@ Kernel parameters
>   			1 - Enable the BAU.
>   			unset - Disable the BAU.
>   
> -	baycom_epp=	[HW,AX25]
> -			Format: <io>,<mode>
> -
> -	baycom_par=	[HW,AX25] BayCom Parallel Port AX.25 Modem
> -			Format: <io>,<mode>
> -			See header of drivers/net/hamradio/baycom_par.c.
> -
> -	baycom_ser_fdx=	[HW,AX25]
> -			BayCom Serial Port AX.25 Modem (Full Duplex Mode)
> -			Format: <io>,<irq>,<mode>[,<baud>]
> -			See header of drivers/net/hamradio/baycom_ser_fdx.c.
> -
> -	baycom_ser_hdx=	[HW,AX25]
> -			BayCom Serial Port AX.25 Modem (Half Duplex Mode)
> -			Format: <io>,<irq>,<mode>
> -			See header of drivers/net/hamradio/baycom_ser_hdx.c.
> -
>   	bdev_allow_write_mounted=
>   			Format: <bool>
>   			Control the ability to open a mounted block device
> diff --git a/Documentation/networking/6pack.rst b/Documentation/networking/6pack.rst
> deleted file mode 100644
> index 66d5fd4fc821..000000000000
> --- a/Documentation/networking/6pack.rst
> +++ /dev/null
> @@ -1,191 +0,0 @@
> -.. SPDX-License-Identifier: GPL-2.0
> -
> -==============
> -6pack Protocol
> -==============
> -
> -This is the 6pack-mini-HOWTO, written by
> -
> -Andreas Könsgen DG3KQ
> -
> -:Internet: ajk@comnets.uni-bremen.de
> -:AMPR-net: dg3kq@db0pra.ampr.org
> -:AX.25:    dg3kq@db0ach.#nrw.deu.eu
> -
> -Last update: April 7, 1998
> -
> -1. What is 6pack, and what are the advantages to KISS?
> -======================================================
> -
> -6pack is a transmission protocol for data exchange between the PC and
> -the TNC over a serial line. It can be used as an alternative to KISS.
> -
> -6pack has two major advantages:
> -
> -- The PC is given full control over the radio
> -  channel. Special control data is exchanged between the PC and the TNC so
> -  that the PC knows at any time if the TNC is receiving data, if a TNC
> -  buffer underrun or overrun has occurred, if the PTT is
> -  set and so on. This control data is processed at a higher priority than
> -  normal data, so a data stream can be interrupted at any time to issue an
> -  important event. This helps to improve the channel access and timing
> -  algorithms as everything is computed in the PC. It would even be possible
> -  to experiment with something completely different from the known CSMA and
> -  DAMA channel access methods.
> -  This kind of real-time control is especially important to supply several
> -  TNCs that are connected between each other and the PC by a daisy chain
> -  (however, this feature is not supported yet by the Linux 6pack driver).
> -
> -- Each packet transferred over the serial line is supplied with a checksum,
> -  so it is easy to detect errors due to problems on the serial line.
> -  Received packets that are corrupt are not passed on to the AX.25 layer.
> -  Damaged packets that the TNC has received from the PC are not transmitted.
> -
> -More details about 6pack are described in the file 6pack.ps that is located
> -in the doc directory of the AX.25 utilities package.
> -
> -2. Who has developed the 6pack protocol?
> -========================================
> -
> -The 6pack protocol has been developed by Ekki Plicht DF4OR, Henning Rech
> -DF9IC and Gunter Jost DK7WJ. A driver for 6pack, written by Gunter Jost and
> -Matthias Welwarsky DG2FEF, comes along with the PC version of FlexNet.
> -They have also written a firmware for TNCs to perform the 6pack
> -protocol (see section 4 below).
> -
> -3. Where can I get the latest version of 6pack for LinuX?
> -=========================================================
> -
> -At the moment, the 6pack stuff can obtained via anonymous ftp from
> -db0bm.automation.fh-aachen.de. In the directory /incoming/dg3kq,
> -there is a file named 6pack.tgz.
> -
> -4. Preparing the TNC for 6pack operation
> -========================================
> -
> -To be able to use 6pack, a special firmware for the TNC is needed. The EPROM
> -of a newly bought TNC does not contain 6pack, so you will have to
> -program an EPROM yourself. The image file for 6pack EPROMs should be
> -available on any packet radio box where PC/FlexNet can be found. The name of
> -the file is 6pack.bin. This file is copyrighted and maintained by the FlexNet
> -team. It can be used under the terms of the license that comes along
> -with PC/FlexNet. Please do not ask me about the internals of this file as I
> -don't know anything about it. I used a textual description of the 6pack
> -protocol to program the Linux driver.
> -
> -TNCs contain a 64kByte EPROM, the lower half of which is used for
> -the firmware/KISS. The upper half is either empty or is sometimes
> -programmed with software called TAPR. In the latter case, the TNC
> -is supplied with a DIP switch so you can easily change between the
> -two systems. When programming a new EPROM, one of the systems is replaced
> -by 6pack. It is useful to replace TAPR, as this software is rarely used
> -nowadays. If your TNC is not equipped with the switch mentioned above, you
> -can build in one yourself that switches over the highest address pin
> -of the EPROM between HIGH and LOW level. After having inserted the new EPROM
> -and switched to 6pack, apply power to the TNC for a first test. The connect
> -and the status LED are lit for about a second if the firmware initialises
> -the TNC correctly.
> -
> -5. Building and installing the 6pack driver
> -===========================================
> -
> -The driver has been tested with kernel version 2.1.90. Use with older
> -kernels may lead to a compilation error because the interface to a kernel
> -function has been changed in the 2.1.8x kernels.
> -
> -How to turn on 6pack support:
> ------------------------------
> -
> -- In the linux kernel configuration program, select the code maturity level
> -  options menu and turn on the prompting for development drivers.
> -
> -- Select the amateur radio support menu and turn on the serial port 6pack
> -  driver.
> -
> -- Compile and install the kernel and the modules.
> -
> -To use the driver, the kissattach program delivered with the AX.25 utilities
> -has to be modified.
> -
> -- Do a cd to the directory that holds the kissattach sources. Edit the
> -  kissattach.c file. At the top, insert the following lines::
> -
> -    #ifndef N_6PACK
> -    #define N_6PACK (N_AX25+1)
> -    #endif
> -
> -  Then find the line:
> -
> -    int disc = N_AX25;
> -
> -  and replace N_AX25 by N_6PACK.
> -
> -- Recompile kissattach. Rename it to spattach to avoid confusions.
> -
> -Installing the driver:
> -----------------------
> -
> -- Do an insmod 6pack. Look at your /var/log/messages file to check if the
> -  module has printed its initialization message.
> -
> -- Do a spattach as you would launch kissattach when starting a KISS port.
> -  Check if the kernel prints the message '6pack: TNC found'.
> -
> -- From here, everything should work as if you were setting up a KISS port.
> -  The only difference is that the network device that represents
> -  the 6pack port is called sp instead of sl or ax. So, sp0 would be the
> -  first 6pack port.
> -
> -Although the driver has been tested on various platforms, I still declare it
> -ALPHA. BE CAREFUL! Sync your disks before insmoding the 6pack module
> -and spattaching. Watch out if your computer behaves strangely. Read section
> -6 of this file about known problems.
> -
> -Note that the connect and status LEDs of the TNC are controlled in a
> -different way than they are when the TNC is used with PC/FlexNet. When using
> -FlexNet, the connect LED is on if there is a connection; the status LED is
> -on if there is data in the buffer of the PC's AX.25 engine that has to be
> -transmitted. Under Linux, the 6pack layer is beyond the AX.25 layer,
> -so the 6pack driver doesn't know anything about connects or data that
> -has not yet been transmitted. Therefore the LEDs are controlled
> -as they are in KISS mode: The connect LED is turned on if data is transferred
> -from the PC to the TNC over the serial line, the status LED if data is
> -sent to the PC.
> -
> -6. Known problems
> -=================
> -
> -When testing the driver with 2.0.3x kernels and
> -operating with data rates on the radio channel of 9600 Baud or higher,
> -the driver may, on certain systems, sometimes print the message '6pack:
> -bad checksum', which is due to data loss if the other station sends two
> -or more subsequent packets. I have been told that this is due to a problem
> -with the serial driver of 2.0.3x kernels. I don't know yet if the problem
> -still exists with 2.1.x kernels, as I have heard that the serial driver
> -code has been changed with 2.1.x.
> -
> -When shutting down the sp interface with ifconfig, the kernel crashes if
> -there is still an AX.25 connection left over which an IP connection was
> -running, even if that IP connection is already closed. The problem does not
> -occur when there is a bare AX.25 connection still running. I don't know if
> -this is a problem of the 6pack driver or something else in the kernel.
> -
> -The driver has been tested as a module, not yet as a kernel-builtin driver.
> -
> -The 6pack protocol supports daisy-chaining of TNCs in a token ring, which is
> -connected to one serial port of the PC. This feature is not implemented
> -and at least at the moment I won't be able to do it because I do not have
> -the opportunity to build a TNC daisy-chain and test it.
> -
> -Some of the comments in the source code are inaccurate. They are left from
> -the SLIP/KISS driver, from which the 6pack driver has been derived.
> -I haven't modified or removed them yet -- sorry! The code itself needs
> -some cleaning and optimizing. This will be done in a later release.
> -
> -If you encounter a bug or if you have a question or suggestion concerning the
> -driver, feel free to mail me, using the addresses given at the beginning of
> -this file.
> -
> -Have fun!
> -
> -Andreas
> diff --git a/Documentation/networking/ax25.rst b/Documentation/networking/ax25.rst
> deleted file mode 100644
> index 89c79dd6c6f9..000000000000
> --- a/Documentation/networking/ax25.rst
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -.. SPDX-License-Identifier: GPL-2.0
> -
> -=====
> -AX.25
> -=====
> -
> -To use the amateur radio protocols within Linux you will need to get a
> -suitable copy of the AX.25 Utilities. More detailed information about
> -AX.25, NET/ROM and ROSE, associated programs and utilities can be
> -found on https://linux-ax25.in-berlin.de.
> -
> -There is a mailing list for discussing Linux amateur radio matters
> -called linux-hams@vger.kernel.org. To subscribe to it, send a message to
> -linux-hams+subscribe@vger.kernel.org or use the web interface at
> -https://vger.kernel.org. The subject and body of the message are
> -ignored.  You don't need to be subscribed to post but of course that
> -means you might miss an answer.
> diff --git a/Documentation/networking/device_drivers/hamradio/baycom.rst b/Documentation/networking/device_drivers/hamradio/baycom.rst
> deleted file mode 100644
> index fe2d010f0e86..000000000000
> --- a/Documentation/networking/device_drivers/hamradio/baycom.rst
> +++ /dev/null
> @@ -1,174 +0,0 @@
> -.. SPDX-License-Identifier: GPL-2.0
> -
> -===============================
> -Linux Drivers for Baycom Modems
> -===============================
> -
> -Thomas M. Sailer, HB9JNX/AE4WA, <sailer@ife.ee.ethz.ch>
> -
> -The drivers for the baycom modems have been split into
> -separate drivers as they did not share any code, and the driver
> -and device names have changed.
> -
> -This document describes the Linux Kernel Drivers for simple Baycom style
> -amateur radio modems.
> -
> -The following drivers are available:
> -====================================
> -
> -baycom_ser_fdx:
> -  This driver supports the SER12 modems either full or half duplex.
> -  Its baud rate may be changed via the ``baud`` module parameter,
> -  therefore it supports just about every bit bang modem on a
> -  serial port. Its devices are called bcsf0 through bcsf3.
> -  This is the recommended driver for SER12 type modems,
> -  however if you have a broken UART clone that does not have working
> -  delta status bits, you may try baycom_ser_hdx.
> -
> -baycom_ser_hdx:
> -  This is an alternative driver for SER12 type modems.
> -  It only supports half duplex, and only 1200 baud. Its devices
> -  are called bcsh0 through bcsh3. Use this driver only if baycom_ser_fdx
> -  does not work with your UART.
> -
> -baycom_par:
> -  This driver supports the par96 and picpar modems.
> -  Its devices are called bcp0 through bcp3.
> -
> -baycom_epp:
> -  This driver supports the EPP modem.
> -  Its devices are called bce0 through bce3.
> -  This driver is work-in-progress.
> -
> -The following modems are supported:
> -
> -======= ========================================================================
> -ser12   This is a very simple 1200 baud AFSK modem. The modem consists only
> -	of a modulator/demodulator chip, usually a TI TCM3105. The computer
> -	is responsible for regenerating the receiver bit clock, as well as
> -	for handling the HDLC protocol. The modem connects to a serial port,
> -	hence the name. Since the serial port is not used as an async serial
> -	port, the kernel driver for serial ports cannot be used, and this
> -	driver only supports standard serial hardware (8250, 16450, 16550)
> -
> -par96   This is a modem for 9600 baud FSK compatible to the G3RUH standard.
> -	The modem does all the filtering and regenerates the receiver clock.
> -	Data is transferred from and to the PC via a shift register.
> -	The shift register is filled with 16 bits and an interrupt is signalled.
> -	The PC then empties the shift register in a burst. This modem connects
> -	to the parallel port, hence the name. The modem leaves the
> -	implementation of the HDLC protocol and the scrambler polynomial to
> -	the PC.
> -
> -picpar  This is a redesign of the par96 modem by Henning Rech, DF9IC. The modem
> -	is protocol compatible to par96, but uses only three low power ICs
> -	and can therefore be fed from the parallel port and does not require
> -	an additional power supply. Furthermore, it incorporates a carrier
> -	detect circuitry.
> -
> -EPP     This is a high-speed modem adaptor that connects to an enhanced parallel
> -	port.
> -
> -	Its target audience is users working over a high speed hub (76.8kbit/s).
> -
> -eppfpga This is a redesign of the EPP adaptor.
> -======= ========================================================================
> -
> -All of the above modems only support half duplex communications. However,
> -the driver supports the KISS (see below) fullduplex command. It then simply
> -starts to send as soon as there's a packet to transmit and does not care
> -about DCD, i.e. it starts to send even if there's someone else on the channel.
> -This command is required by some implementations of the DAMA channel
> -access protocol.
> -
> -
> -The Interface of the drivers
> -============================
> -
> -Unlike previous drivers, these drivers are no longer character devices,
> -but they are now true kernel network interfaces. Installation is therefore
> -simple. Once installed, four interfaces named bc{sf,sh,p,e}[0-3] are available.
> -sethdlc from the ax25 utilities may be used to set driver states etc.
> -Users of userland AX.25 stacks may use the net2kiss utility (also available
> -in the ax25 utilities package) to convert packets of a network interface
> -to a KISS stream on a pseudo tty. There's also a patch available from
> -me for WAMPES which allows attaching a kernel network interface directly.
> -
> -
> -Configuring the driver
> -======================
> -
> -Every time a driver is inserted into the kernel, it has to know which
> -modems it should access at which ports. This can be done with the setbaycom
> -utility. If you are only using one modem, you can also configure the
> -driver from the insmod command line (or by means of an option line in
> -``/etc/modprobe.d/*.conf``).
> -
> -Examples::
> -
> -  modprobe baycom_ser_fdx mode="ser12*" iobase=0x3f8 irq=4
> -  sethdlc -i bcsf0 -p mode "ser12*" io 0x3f8 irq 4
> -
> -Both lines configure the first port to drive a ser12 modem at the first
> -serial port (COM1 under DOS). The * in the mode parameter instructs the driver
> -to use the software DCD algorithm (see below)::
> -
> -  insmod baycom_par mode="picpar" iobase=0x378
> -  sethdlc -i bcp0 -p mode "picpar" io 0x378
> -
> -Both lines configure the first port to drive a picpar modem at the
> -first parallel port (LPT1 under DOS). (Note: picpar implies
> -hardware DCD, par96 implies software DCD).
> -
> -The channel access parameters can be set with sethdlc -a or kissparms.
> -Note that both utilities interpret the values slightly differently.
> -
> -
> -Hardware DCD versus Software DCD
> -================================
> -
> -To avoid collisions on the air, the driver must know when the channel is
> -busy. This is the task of the DCD circuitry/software. The driver may either
> -utilise a software DCD algorithm (options=1) or use a DCD signal from
> -the hardware (options=0).
> -
> -======= =================================================================
> -ser12   if software DCD is utilised, the radio's squelch should always be
> -	open. It is highly recommended to use the software DCD algorithm,
> -	as it is much faster than most hardware squelch circuitry. The
> -	disadvantage is a slightly higher load on the system.
> -
> -par96   the software DCD algorithm for this type of modem is rather poor.
> -	The modem simply does not provide enough information to implement
> -	a reasonable DCD algorithm in software. Therefore, if your radio
> -	feeds the DCD input of the PAR96 modem, the use of the hardware
> -	DCD circuitry is recommended.
> -
> -picpar  the picpar modem features a builtin DCD hardware, which is highly
> -	recommended.
> -======= =================================================================
> -
> -
> -
> -Compatibility with the rest of the Linux kernel
> -===============================================
> -
> -The serial driver and the baycom serial drivers compete
> -for the same hardware resources. Of course only one driver can access a given
> -interface at a time. The serial driver grabs all interfaces it can find at
> -startup time. Therefore the baycom drivers subsequently won't be able to
> -access a serial port. You might therefore find it necessary to release
> -a port owned by the serial driver with 'setserial /dev/ttyS# uart none', where
> -# is the number of the interface. The baycom drivers do not reserve any
> -ports at startup, unless one is specified on the 'insmod' command line. Another
> -method to solve the problem is to compile all drivers as modules and
> -leave it to kmod to load the correct driver depending on the application.
> -
> -The parallel port drivers (baycom_par, baycom_epp) now use the parport subsystem
> -to arbitrate the ports between different client drivers.
> -
> -vy 73s de
> -
> -Tom Sailer, sailer@ife.ee.ethz.ch
> -
> -hb9jnx @ hb9w.ampr.org
> diff --git a/Documentation/networking/device_drivers/hamradio/index.rst b/Documentation/networking/device_drivers/hamradio/index.rst
> deleted file mode 100644
> index 6af481c5b020..000000000000
> --- a/Documentation/networking/device_drivers/hamradio/index.rst
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -.. SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> -
> -Amateur Radio Device Drivers
> -============================
> -
> -Contents:
> -
> -.. toctree::
> -   :maxdepth: 2
> -
> -   baycom
> -   z8530drv
> diff --git a/Documentation/networking/device_drivers/hamradio/z8530drv.rst b/Documentation/networking/device_drivers/hamradio/z8530drv.rst
> deleted file mode 100644
> index d2942760f167..000000000000
> --- a/Documentation/networking/device_drivers/hamradio/z8530drv.rst
> +++ /dev/null
> @@ -1,686 +0,0 @@
> -.. SPDX-License-Identifier: GPL-2.0
> -.. include:: <isonum.txt>
> -
> -=========================================================
> -SCC.C - Linux driver for Z8530 based HDLC cards for AX.25
> -=========================================================
> -
> -
> -This is a subset of the documentation. To use this driver you MUST have the
> -full package from:
> -
> -Internet:
> -
> -    1. ftp://ftp.ccac.rwth-aachen.de/pub/jr/z8530drv-utils_3.0-3.tar.gz
> -
> -    2. ftp://ftp.pspt.fi/pub/ham/linux/ax25/z8530drv-utils_3.0-3.tar.gz
> -
> -Please note that the information in this document may be hopelessly outdated.
> -A new version of the documentation, along with links to other important
> -Linux Kernel AX.25 documentation and programs, is available on
> -http://yaina.de/jreuter
> -
> -Copyright |copy| 1993,2000 by Joerg Reuter DL1BKE <jreuter@yaina.de>
> -
> -portions Copyright |copy| 1993 Guido ten Dolle PE1NNZ
> -
> -for the complete copyright notice see >> Copying.Z8530DRV <<
> -
> -1. Initialization of the driver
> -===============================
> -
> -To use the driver, 3 steps must be performed:
> -
> -     1. if compiled as module: loading the module
> -     2. Setup of hardware, MODEM and KISS parameters with sccinit
> -     3. Attach each channel to the Linux kernel AX.25 with "ifconfig"
> -
> -Unlike the versions below 2.4 this driver is a real network device
> -driver. If you want to run xNOS instead of our fine kernel AX.25
> -use a 2.x version (available from above sites) or read the
> -AX.25-HOWTO on how to emulate a KISS TNC on network device drivers.
> -
> -
> -1.1 Loading the module
> -======================
> -
> -(If you're going to compile the driver as a part of the kernel image,
> - skip this chapter and continue with 1.2)
> -
> -Before you can use a module, you'll have to load it with::
> -
> -	insmod scc.o
> -
> -please read 'man insmod' that comes with module-init-tools.
> -
> -You should include the insmod in one of the /etc/rc.d/rc.* files,
> -and don't forget to insert a call of sccinit after that. It
> -will read your /etc/z8530drv.conf.
> -
> -1.2. /etc/z8530drv.conf
> -=======================
> -
> -To setup all parameters you must run /sbin/sccinit from one
> -of your rc.*-files. This has to be done BEFORE you can
> -"ifconfig" an interface. Sccinit reads the file /etc/z8530drv.conf
> -and sets the hardware, MODEM and KISS parameters. A sample file is
> -delivered with this package. Change it to your needs.
> -
> -The file itself consists of two main sections.
> -
> -1.2.1 configuration of hardware parameters
> -==========================================
> -
> -The hardware setup section defines the following parameters for each
> -Z8530::
> -
> -    chip    1
> -    data_a  0x300                   # data port A
> -    ctrl_a  0x304                   # control port A
> -    data_b  0x301                   # data port B
> -    ctrl_b  0x305                   # control port B
> -    irq     5                       # IRQ No. 5
> -    pclock  4915200                 # clock
> -    board   BAYCOM                  # hardware type
> -    escc    no                      # enhanced SCC chip? (8580/85180/85280)
> -    vector  0                       # latch for interrupt vector
> -    special no                      # address of special function register
> -    option  0                       # option to set via sfr
> -
> -
> -chip
> -	- this is just a delimiter to make sccinit a bit simpler to
> -	  program. A parameter has no effect.
> -
> -data_a
> -	- the address of the data port A of this Z8530 (needed)
> -ctrl_a
> -	- the address of the control port A (needed)
> -data_b
> -	- the address of the data port B (needed)
> -ctrl_b
> -	- the address of the control port B (needed)
> -
> -irq
> -	- the used IRQ for this chip. Different chips can use different
> -	  IRQs or the same. If they share an interrupt, it needs to be
> -	  specified within one chip-definition only.
> -
> -pclock  - the clock at the PCLK pin of the Z8530 (option, 4915200 is
> -	  default), measured in Hertz
> -
> -board
> -	- the "type" of the board:
> -
> -	   =======================  ========
> -	   SCC type                 value
> -	   =======================  ========
> -	   PA0HZP SCC card          PA0HZP
> -	   EAGLE card               EAGLE
> -	   PC100 card               PC100
> -	   PRIMUS-PC (DG9BL) card   PRIMUS
> -	   BayCom (U)SCC card       BAYCOM
> -	   =======================  ========
> -
> -escc
> -	- if you want support for ESCC chips (8580, 85180, 85280), set
> -	  this to "yes" (option, defaults to "no")
> -
> -vector
> -	- address of the vector latch (aka "intack port") for PA0HZP
> -	  cards. There can be only one vector latch for all chips!
> -	  (option, defaults to 0)
> -
> -special
> -	- address of the special function register on several cards.
> -	  (option, defaults to 0)
> -
> -option  - The value you write into that register (option, default is 0)
> -
> -You can specify up to four chips (8 channels). If this is not enough,
> -just change::
> -
> -	#define MAXSCC 4
> -
> -to a higher value.
> -
> -Example for the BAYCOM USCC:
> -----------------------------
> -
> -::
> -
> -	chip    1
> -	data_a  0x300                   # data port A
> -	ctrl_a  0x304                   # control port A
> -	data_b  0x301                   # data port B
> -	ctrl_b  0x305                   # control port B
> -	irq     5                       # IRQ No. 5 (#)
> -	board   BAYCOM                  # hardware type (*)
> -	#
> -	# SCC chip 2
> -	#
> -	chip    2
> -	data_a  0x302
> -	ctrl_a  0x306
> -	data_b  0x303
> -	ctrl_b  0x307
> -	board   BAYCOM
> -
> -An example for a PA0HZP card:
> ------------------------------
> -
> -::
> -
> -	chip 1
> -	data_a 0x153
> -	data_b 0x151
> -	ctrl_a 0x152
> -	ctrl_b 0x150
> -	irq 9
> -	pclock 4915200
> -	board PA0HZP
> -	vector 0x168
> -	escc no
> -	#
> -	#
> -	#
> -	chip 2
> -	data_a 0x157
> -	data_b 0x155
> -	ctrl_a 0x156
> -	ctrl_b 0x154
> -	irq 9
> -	pclock 4915200
> -	board PA0HZP
> -	vector 0x168
> -	escc no
> -
> -A DRSI would should probably work with this:
> ---------------------------------------------
> -(actually: two DRSI cards...)
> -
> -::
> -
> -	chip 1
> -	data_a 0x303
> -	data_b 0x301
> -	ctrl_a 0x302
> -	ctrl_b 0x300
> -	irq 7
> -	pclock 4915200
> -	board DRSI
> -	escc no
> -	#
> -	#
> -	#
> -	chip 2
> -	data_a 0x313
> -	data_b 0x311
> -	ctrl_a 0x312
> -	ctrl_b 0x310
> -	irq 7
> -	pclock 4915200
> -	board DRSI
> -	escc no
> -
> -Note that you cannot use the on-board baudrate generator off DRSI
> -cards. Use "mode dpll" for clock source (see below).
> -
> -This is based on information provided by Mike Bilow (and verified
> -by Paul Helay)
> -
> -The utility "gencfg"
> ---------------------
> -
> -If you only know the parameters for the PE1CHL driver for DOS,
> -run gencfg. It will generate the correct port addresses (I hope).
> -Its parameters are exactly the same as the ones you use with
> -the "attach scc" command in net, except that the string "init" must
> -not appear. Example::
> -
> -	gencfg 2 0x150 4 2 0 1 0x168 9 4915200
> -
> -will print a skeleton z8530drv.conf for the OptoSCC to stdout.
> -
> -::
> -
> -	gencfg 2 0x300 2 4 5 -4 0 7 4915200 0x10
> -
> -does the same for the BAYCOM USCC card. In my opinion it is much easier
> -to edit scc_config.h...
> -
> -
> -1.2.2 channel configuration
> -===========================
> -
> -The channel definition is divided into three sub sections for each
> -channel:
> -
> -An example for scc0::
> -
> -	# DEVICE
> -
> -	device scc0	# the device for the following params
> -
> -	# MODEM / BUFFERS
> -
> -	speed 1200		# the default baudrate
> -	clock dpll		# clock source:
> -				# 	dpll     = normal half duplex operation
> -				# 	external = MODEM provides own Rx/Tx clock
> -				#	divider  = use full duplex divider if
> -				#		   installed (1)
> -	mode nrzi		# HDLC encoding mode
> -				#	nrzi = 1k2 MODEM, G3RUH 9k6 MODEM
> -				#	nrz  = DF9IC 9k6 MODEM
> -				#
> -	bufsize	384		# size of buffers. Note that this must include
> -				# the AX.25 header, not only the data field!
> -				# (optional, defaults to 384)
> -
> -	# KISS (Layer 1)
> -
> -	txdelay 36              # (see chapter 1.4)
> -	persist 64
> -	slot    8
> -	tail    8
> -	fulldup 0
> -	wait    12
> -	min     3
> -	maxkey  7
> -	idle    3
> -	maxdef  120
> -	group   0
> -	txoff   off
> -	softdcd on
> -	slip    off
> -
> -The order WITHIN these sections is unimportant. The order OF these
> -sections IS important. The MODEM parameters are set with the first
> -recognized KISS parameter...
> -
> -Please note that you can initialize the board only once after boot
> -(or insmod). You can change all parameters but "mode" and "clock"
> -later with the Sccparam program or through KISS. Just to avoid
> -security holes...
> -
> -(1) this divider is usually mounted on the SCC-PBC (PA0HZP) or not
> -    present at all (BayCom). It feeds back the output of the DPLL
> -    (digital pll) as transmit clock. Using this mode without a divider
> -    installed will normally result in keying the transceiver until
> -    maxkey expires --- of course without sending anything (useful).
> -
> -2. Attachment of a channel by your AX.25 software
> -=================================================
> -
> -2.1 Kernel AX.25
> -================
> -
> -To set up an AX.25 device you can simply type::
> -
> -	ifconfig scc0 44.128.1.1 hw ax25 dl0tha-7
> -
> -This will create a network interface with the IP number 44.128.20.107
> -and the callsign "dl0tha". If you do not have any IP number (yet) you
> -can use any of the 44.128.0.0 network. Note that you do not need
> -axattach. The purpose of axattach (like slattach) is to create a KISS
> -network device linked to a TTY. Please read the documentation of the
> -ax25-utils and the AX.25-HOWTO to learn how to set the parameters of
> -the kernel AX.25.
> -
> -2.2 NOS, NET and TFKISS
> -=======================
> -
> -Since the TTY driver (aka KISS TNC emulation) is gone you need
> -to emulate the old behaviour. The cost of using these programs is
> -that you probably need to compile the kernel AX.25, regardless of whether
> -you actually use it or not. First setup your /etc/ax25/axports,
> -for example::
> -
> -	9k6	dl0tha-9  9600  255 4 9600 baud port (scc3)
> -	axlink	dl0tha-15 38400 255 4 Link to NOS
> -
> -Now "ifconfig" the scc device::
> -
> -	ifconfig scc3 44.128.1.1 hw ax25 dl0tha-9
> -
> -You can now axattach a pseudo-TTY::
> -
> -	axattach /dev/ptys0 axlink
> -
> -and start your NOS and attach /dev/ptys0 there. The problem is that
> -NOS is reachable only via digipeating through the kernel AX.25
> -(disastrous on a DAMA controlled channel). To solve this problem,
> -configure "rxecho" to echo the incoming frames from "9k6" to "axlink"
> -and outgoing frames from "axlink" to "9k6" and start::
> -
> -	rxecho
> -
> -Or simply use "kissbridge" coming with z8530drv-utils::
> -
> -	ifconfig scc3 hw ax25 dl0tha-9
> -	kissbridge scc3 /dev/ptys0
> -
> -
> -3. Adjustment and Display of parameters
> -=======================================
> -
> -3.1 Displaying SCC Parameters:
> -==============================
> -
> -Once a SCC channel has been attached, the parameter settings and
> -some statistic information can be shown using the param program::
> -
> -	dl1bke-u:~$ sccstat scc0
> -
> -	Parameters:
> -
> -	speed       : 1200 baud
> -	txdelay     : 36
> -	persist     : 255
> -	slottime    : 0
> -	txtail      : 8
> -	fulldup     : 1
> -	waittime    : 12
> -	mintime     : 3 sec
> -	maxkeyup    : 7 sec
> -	idletime    : 3 sec
> -	maxdefer    : 120 sec
> -	group       : 0x00
> -	txoff       : off
> -	softdcd     : on
> -	SLIP        : off
> -
> -	Status:
> -
> -	HDLC                  Z8530           Interrupts         Buffers
> -	-----------------------------------------------------------------------
> -	Sent       :     273  RxOver :     0  RxInts :   125074  Size    :  384
> -	Received   :    1095  TxUnder:     0  TxInts :     4684  NoSpace :    0
> -	RxErrors   :    1591                  ExInts :    11776
> -	TxErrors   :       0                  SpInts :     1503
> -	Tx State   :    idle
> -
> -
> -The status info shown is:
> -
> -==============	==============================================================
> -Sent		number of frames transmitted
> -Received	number of frames received
> -RxErrors	number of receive errors (CRC, ABORT)
> -TxErrors	number of discarded Tx frames (due to various reasons)
> -Tx State	status of the Tx interrupt handler: idle/busy/active/tail (2)
> -RxOver		number of receiver overruns
> -TxUnder		number of transmitter underruns
> -RxInts		number of receiver interrupts
> -TxInts		number of transmitter interrupts
> -EpInts		number of receiver special condition interrupts
> -SpInts		number of external/status interrupts
> -Size		maximum size of an AX.25 frame (*with* AX.25 headers!)
> -NoSpace		number of times a buffer could not get allocated
> -==============	==============================================================
> -
> -An overrun is abnormal. If lots of these occur, the product of
> -baudrate and number of interfaces is too high for the processing
> -power of your computer. NoSpace errors are unlikely to be caused by the
> -driver or the kernel AX.25.
> -
> -
> -3.2 Setting Parameters
> -======================
> -
> -
> -The setting of parameters of the emulated KISS TNC is done in the
> -same way in the SCC driver. You can change parameters by using
> -the kissparms program from the ax25-utils package or use the program
> -"sccparam"::
> -
> -     sccparam <device> <paramname> <decimal-|hexadecimal value>
> -
> -You can change the following parameters:
> -
> -===========   =====
> -param	      value
> -===========   =====
> -speed         1200
> -txdelay       36
> -persist       255
> -slottime      0
> -txtail        8
> -fulldup       1
> -waittime      12
> -mintime       3
> -maxkeyup      7
> -idletime      3
> -maxdefer      120
> -group         0x00
> -txoff         off
> -softdcd       on
> -SLIP          off
> -===========   =====
> -
> -
> -The parameters have the following meaning:
> -
> -speed:
> -     The baudrate on this channel in bits/sec
> -
> -     Example: sccparam /dev/scc3 speed 9600
> -
> -txdelay:
> -     The delay (in units of 10 ms) after keying of the
> -     transmitter, until the first byte is sent. This is usually
> -     called "TXDELAY" in a TNC.  When 0 is specified, the driver
> -     will just wait until the CTS signal is asserted. This
> -     assumes the presence of a timer or other circuitry in the
> -     MODEM and/or transmitter, that asserts CTS when the
> -     transmitter is ready for data.
> -     A normal value of this parameter is 30-36.
> -
> -     Example: sccparam /dev/scc0 txd 20
> -
> -persist:
> -     This is the probability that the transmitter will be keyed
> -     when the channel is found to be free.  It is a value from 0
> -     to 255, and the probability is (value+1)/256.  The value
> -     should be somewhere near 50-60, and should be lowered when
> -     the channel is used more heavily.
> -
> -     Example: sccparam /dev/scc2 persist 20
> -
> -slottime:
> -     This is the time between samples of the channel. It is
> -     expressed in units of 10 ms.  About 200-300 ms (value 20-30)
> -     seems to be a good value.
> -
> -     Example: sccparam /dev/scc0 slot 20
> -
> -tail:
> -     The time the transmitter will remain keyed after the last
> -     byte of a packet has been transferred to the SCC. This is
> -     necessary because the CRC and a flag still have to leave the
> -     SCC before the transmitter is keyed down. The value depends
> -     on the baudrate selected.  A few character times should be
> -     sufficient, e.g. 40ms at 1200 baud. (value 4)
> -     The value of this parameter is in 10 ms units.
> -
> -     Example: sccparam /dev/scc2 4
> -
> -full:
> -     The full-duplex mode switch. This can be one of the following
> -     values:
> -
> -     0:   The interface will operate in CSMA mode (the normal
> -	  half-duplex packet radio operation)
> -     1:   Fullduplex mode, i.e. the transmitter will be keyed at
> -	  any time, without checking the received carrier.  It
> -	  will be unkeyed when there are no packets to be sent.
> -     2:   Like 1, but the transmitter will remain keyed, also
> -	  when there are no packets to be sent.  Flags will be
> -	  sent in that case, until a timeout (parameter 10)
> -	  occurs.
> -
> -     Example: sccparam /dev/scc0 fulldup off
> -
> -wait:
> -     The initial waittime before any transmit attempt, after the
> -     frame has been queue for transmit.  This is the length of
> -     the first slot in CSMA mode.  In full duplex modes it is
> -     set to 0 for maximum performance.
> -     The value of this parameter is in 10 ms units.
> -
> -     Example: sccparam /dev/scc1 wait 4
> -
> -maxkey:
> -     The maximal time the transmitter will be keyed to send
> -     packets, in seconds.  This can be useful on busy CSMA
> -     channels, to avoid "getting a bad reputation" when you are
> -     generating a lot of traffic.  After the specified time has
> -     elapsed, no new frame will be started. Instead, the trans-
> -     mitter will be switched off for a specified time (parameter
> -     min), and then the selected algorithm for keyup will be
> -     started again.
> -     The value 0 as well as "off" will disable this feature,
> -     and allow infinite transmission time.
> -
> -     Example: sccparam /dev/scc0 maxk 20
> -
> -min:
> -     This is the time the transmitter will be switched off when
> -     the maximum transmission time is exceeded.
> -
> -     Example: sccparam /dev/scc3 min 10
> -
> -idle:
> -     This parameter specifies the maximum idle time in full duplex
> -     2 mode, in seconds.  When no frames have been sent for this
> -     time, the transmitter will be keyed down.  A value of 0 is
> -     has same result as the fullduplex mode 1. This parameter
> -     can be disabled.
> -
> -     Example: sccparam /dev/scc2 idle off	# transmit forever
> -
> -maxdefer
> -     This is the maximum time (in seconds) to wait for a free channel
> -     to send. When this timer expires the transmitter will be keyed
> -     IMMEDIATELY. If you love to get trouble with other users you
> -     should set this to a very low value ;-)
> -
> -     Example: sccparam /dev/scc0 maxdefer 240	# 2 minutes
> -
> -
> -txoff:
> -     When this parameter has the value 0, the transmission of packets
> -     is enable. Otherwise it is disabled.
> -
> -     Example: sccparam /dev/scc2 txoff on
> -
> -group:
> -     It is possible to build special radio equipment to use more than
> -     one frequency on the same band, e.g. using several receivers and
> -     only one transmitter that can be switched between frequencies.
> -     Also, you can connect several radios that are active on the same
> -     band.  In these cases, it is not possible, or not a good idea, to
> -     transmit on more than one frequency.  The SCC driver provides a
> -     method to lock transmitters on different interfaces, using the
> -     "param <interface> group <x>" command.  This will only work when
> -     you are using CSMA mode (parameter full = 0).
> -
> -     The number <x> must be 0 if you want no group restrictions, and
> -     can be computed as follows to create restricted groups:
> -     <x> is the sum of some OCTAL numbers:
> -
> -
> -     ===  =======================================================
> -     200  This transmitter will only be keyed when all other
> -	  transmitters in the group are off.
> -     100  This transmitter will only be keyed when the carrier
> -	  detect of all other interfaces in the group is off.
> -     0xx  A byte that can be used to define different groups.
> -	  Interfaces are in the same group, when the logical AND
> -	  between their xx values is nonzero.
> -     ===  =======================================================
> -
> -     Examples:
> -
> -     When 2 interfaces use group 201, their transmitters will never be
> -     keyed at the same time.
> -
> -     When 2 interfaces use group 101, the transmitters will only key
> -     when both channels are clear at the same time.  When group 301,
> -     the transmitters will not be keyed at the same time.
> -
> -     Don't forget to convert the octal numbers into decimal before
> -     you set the parameter.
> -
> -     Example: (to be written)
> -
> -softdcd:
> -     use a software dcd instead of the real one... Useful for a very
> -     slow squelch.
> -
> -     Example: sccparam /dev/scc0 soft on
> -
> -
> -4. Problems
> -===========
> -
> -If you have tx-problems with your BayCom USCC card please check
> -the manufacturer of the 8530. SGS chips have a slightly
> -different timing. Try Zilog...  A solution is to write to register 8
> -instead to the data port, but this won't work with the ESCC chips.
> -*SIGH!*
> -
> -A very common problem is that the PTT locks until the maxkeyup timer
> -expires, although interrupts and clock source are correct. In most
> -cases compiling the driver with CONFIG_SCC_DELAY (set with
> -make config) solves the problems. For more hints read the (pseudo) FAQ
> -and the documentation coming with z8530drv-utils.
> -
> -I got reports that the driver has problems on some 386-based systems.
> -(i.e. Amstrad) Those systems have a bogus AT bus timing which will
> -lead to delayed answers on interrupts. You can recognize these
> -problems by looking at the output of Sccstat for the suspected
> -port. If it shows under- and overruns you own such a system.
> -
> -Delayed processing of received data: This depends on
> -
> -- the kernel version
> -
> -- kernel profiling compiled or not
> -
> -- a high interrupt load
> -
> -- a high load of the machine --- running X, Xmorph, XV and Povray,
> -  while compiling the kernel... hmm ... even with 32 MB RAM ...  ;-)
> -  Or running a named for the whole .ampr.org domain on an 8 MB
> -  box...
> -
> -- using information from rxecho or kissbridge.
> -
> -Kernel panics: please read /linux/README and find out if it
> -really occurred within the scc driver.
> -
> -If you cannot solve a problem, send me
> -
> -- a description of the problem,
> -- information on your hardware (computer system, scc board, modem)
> -- your kernel version
> -- the output of cat /proc/net/z8530
> -
> -4. Thor RLC100
> -==============
> -
> -Mysteriously this board seems not to work with the driver. Anyone
> -got it up-and-running?
> -
> -
> -Many thanks to Linus Torvalds and Alan Cox for including the driver
> -in the Linux standard distribution and their support.
> -
> -::
> -
> -	Joerg Reuter	ampr-net: dl1bke@db0pra.ampr.org
> -			AX-25   : DL1BKE @ DB0ABH.#BAY.DEU.EU
> -			Internet: jreuter@yaina.de
> -			WWW     : http://yaina.de/jreuter
> diff --git a/Documentation/networking/device_drivers/index.rst b/Documentation/networking/device_drivers/index.rst
> index 1df51c9f7827..1f54f01d24be 100644
> --- a/Documentation/networking/device_drivers/index.rst
> +++ b/Documentation/networking/device_drivers/index.rst
> @@ -13,6 +13,5 @@ Hardware Device Drivers
>      cellular/index
>      ethernet/index
>      fddi/index
> -   hamradio/index
>      wifi/index
>      wwan/index
> diff --git a/Documentation/networking/index.rst b/Documentation/networking/index.rst
> index 2e946924ad3f..44a422ad3b05 100644
> --- a/Documentation/networking/index.rst
> +++ b/Documentation/networking/index.rst
> @@ -40,11 +40,9 @@ Refer to :ref:`netdev-FAQ` for a guide on netdev development process specifics.
>      tls-handshake
>      nfc
>      6lowpan
> -   6pack
>      arcnet-hardware
>      arcnet
>      atm
> -   ax25
>      bonding
>      cdc_mbim
>      dctcp
> diff --git a/Documentation/staging/magic-number.rst b/Documentation/staging/magic-number.rst
> index 79afddf0e692..670d3189a976 100644
> --- a/Documentation/staging/magic-number.rst
> +++ b/Documentation/staging/magic-number.rst
> @@ -72,11 +72,8 @@ PG_MAGIC              'P'              pg_{read,write}_hdr      ``include/uapi/l
>   APM_BIOS_MAGIC        0x4101           apm_user                 ``arch/x86/kernel/apm_32.c``
>   FASYNC_MAGIC          0x4601           fasync_struct            ``include/linux/fs.h``
>   SLIP_MAGIC            0x5302           slip                     ``drivers/net/slip/slip.h``
> -BAYCOM_MAGIC          19730510         baycom_state             ``drivers/net/hamradio/baycom_epp.c``
> -HDLCDRV_MAGIC         0x5ac6e778       hdlcdrv_state            ``include/linux/hdlcdrv.h``
>   KV_MAGIC              0x5f4b565f       kernel_vars_s            ``arch/mips/include/asm/sn/klkernvars.h``
>   CODA_MAGIC            0xC0DAC0DA       coda_file_info           ``fs/coda/coda_fs_i.h``
> -YAM_MAGIC             0xF10A7654       yam_port                 ``drivers/net/hamradio/yam.c``
>   CCB_MAGIC             0xf2691ad2       ccb                      ``drivers/scsi/ncr53c8xx.c``
>   QUEUE_MAGIC_FREE      0xf7e1c9a3       queue_entry              ``drivers/scsi/arm/queue.c``
>   QUEUE_MAGIC_USED      0xf7e1cc33       queue_entry              ``drivers/scsi/arm/queue.c``
> diff --git a/Documentation/translations/it_IT/staging/magic-number.rst b/Documentation/translations/it_IT/staging/magic-number.rst
> index cd8f23571835..43dd6398300b 100644
> --- a/Documentation/translations/it_IT/staging/magic-number.rst
> +++ b/Documentation/translations/it_IT/staging/magic-number.rst
> @@ -78,11 +78,8 @@ PG_MAGIC              'P'              pg_{read,write}_hdr      ``include/linux/
>   APM_BIOS_MAGIC        0x4101           apm_user                 ``arch/x86/kernel/apm_32.c``
>   FASYNC_MAGIC          0x4601           fasync_struct            ``include/linux/fs.h``
>   SLIP_MAGIC            0x5302           slip                     ``drivers/net/slip.h``
> -BAYCOM_MAGIC          0x19730510       baycom_state             ``drivers/net/baycom_epp.c``
> -HDLCDRV_MAGIC         0x5ac6e778       hdlcdrv_state            ``include/linux/hdlcdrv.h``
>   KV_MAGIC              0x5f4b565f       kernel_vars_s            ``arch/mips/include/asm/sn/klkernvars.h``
>   CODA_MAGIC            0xC0DAC0DA       coda_file_info           ``fs/coda/coda_fs_i.h``
> -YAM_MAGIC             0xF10A7654       yam_port                 ``drivers/net/hamradio/yam.c``
>   CCB_MAGIC             0xf2691ad2       ccb                      ``drivers/scsi/ncr53c8xx.c``
>   QUEUE_MAGIC_FREE      0xf7e1c9a3       queue_entry              ``drivers/scsi/arm/queue.c``
>   QUEUE_MAGIC_USED      0xf7e1cc33       queue_entry              ``drivers/scsi/arm/queue.c``
> diff --git a/Documentation/translations/sp_SP/process/magic-number.rst b/Documentation/translations/sp_SP/process/magic-number.rst
> index beb4b4c1de11..f5b4c3f2849f 100644
> --- a/Documentation/translations/sp_SP/process/magic-number.rst
> +++ b/Documentation/translations/sp_SP/process/magic-number.rst
> @@ -77,11 +77,8 @@ PG_MAGIC              'P'              pg_{read,write}_hdr      ``include/linux/
>   APM_BIOS_MAGIC        0x4101           apm_user                 ``arch/x86/kernel/apm_32.c``
>   FASYNC_MAGIC          0x4601           fasync_struct            ``include/linux/fs.h``
>   SLIP_MAGIC            0x5302           slip                     ``drivers/net/slip.h``
> -BAYCOM_MAGIC          0x19730510       baycom_state             ``drivers/net/baycom_epp.c``
> -HDLCDRV_MAGIC         0x5ac6e778       hdlcdrv_state            ``include/linux/hdlcdrv.h``
>   KV_MAGIC              0x5f4b565f       kernel_vars_s            ``arch/mips/include/asm/sn/klkernvars.h``
>   CODA_MAGIC            0xC0DAC0DA       coda_file_info           ``fs/coda/coda_fs_i.h``
> -YAM_MAGIC             0xF10A7654       yam_port                 ``drivers/net/hamradio/yam.c``
>   CCB_MAGIC             0xf2691ad2       ccb                      ``drivers/scsi/ncr53c8xx.c``
>   QUEUE_MAGIC_FREE      0xf7e1c9a3       queue_entry              ``drivers/scsi/arm/queue.c``
>   QUEUE_MAGIC_USED      0xf7e1cc33       queue_entry              ``drivers/scsi/arm/queue.c``
> diff --git a/Documentation/translations/zh_CN/process/magic-number.rst b/Documentation/translations/zh_CN/process/magic-number.rst
> index 4ebc84cc0c54..05ee75cf4346 100644
> --- a/Documentation/translations/zh_CN/process/magic-number.rst
> +++ b/Documentation/translations/zh_CN/process/magic-number.rst
> @@ -70,11 +70,8 @@ PG_MAGIC              'P'              pg_{read,write}_hdr      ``include/linux/
>   APM_BIOS_MAGIC        0x4101           apm_user                 ``arch/x86/kernel/apm_32.c``
>   FASYNC_MAGIC          0x4601           fasync_struct            ``include/linux/fs.h``
>   SLIP_MAGIC            0x5302           slip                     ``drivers/net/slip.h``
> -BAYCOM_MAGIC          0x19730510       baycom_state             ``drivers/net/baycom_epp.c``
> -HDLCDRV_MAGIC         0x5ac6e778       hdlcdrv_state            ``include/linux/hdlcdrv.h``
>   KV_MAGIC              0x5f4b565f       kernel_vars_s            ``arch/mips/include/asm/sn/klkernvars.h``
>   CODA_MAGIC            0xC0DAC0DA       coda_file_info           ``fs/coda/coda_fs_i.h``
> -YAM_MAGIC             0xF10A7654       yam_port                 ``drivers/net/hamradio/yam.c``
>   CCB_MAGIC             0xf2691ad2       ccb                      ``drivers/scsi/ncr53c8xx.c``
>   QUEUE_MAGIC_FREE      0xf7e1c9a3       queue_entry              ``drivers/scsi/arm/queue.c``
>   QUEUE_MAGIC_USED      0xf7e1cc33       queue_entry              ``drivers/scsi/arm/queue.c``
> diff --git a/Documentation/translations/zh_TW/process/magic-number.rst b/Documentation/translations/zh_TW/process/magic-number.rst
> index 5582df6d7ca7..bc7eb025dd1e 100644
> --- a/Documentation/translations/zh_TW/process/magic-number.rst
> +++ b/Documentation/translations/zh_TW/process/magic-number.rst
> @@ -64,11 +64,8 @@ PG_MAGIC              'P'              pg_{read,write}_hdr      ``include/linux/
>   APM_BIOS_MAGIC        0x4101           apm_user                 ``arch/x86/kernel/apm_32.c``
>   FASYNC_MAGIC          0x4601           fasync_struct            ``include/linux/fs.h``
>   SLIP_MAGIC            0x5302           slip                     ``drivers/net/slip.h``
> -BAYCOM_MAGIC          0x19730510       baycom_state             ``drivers/net/baycom_epp.c``
> -HDLCDRV_MAGIC         0x5ac6e778       hdlcdrv_state            ``include/linux/hdlcdrv.h``
>   KV_MAGIC              0x5f4b565f       kernel_vars_s            ``arch/mips/include/asm/sn/klkernvars.h``
>   CODA_MAGIC            0xC0DAC0DA       coda_file_info           ``fs/coda/coda_fs_i.h``
> -YAM_MAGIC             0xF10A7654       yam_port                 ``drivers/net/hamradio/yam.c``
>   CCB_MAGIC             0xf2691ad2       ccb                      ``drivers/scsi/ncr53c8xx.c``
>   QUEUE_MAGIC_FREE      0xf7e1c9a3       queue_entry              ``drivers/scsi/arm/queue.c``
>   QUEUE_MAGIC_USED      0xf7e1cc33       queue_entry              ``drivers/scsi/arm/queue.c``
> diff --git a/drivers/net/hamradio/Kconfig b/drivers/net/hamradio/Kconfig
> deleted file mode 100644
> index 36a9aade9f33..000000000000
> --- a/drivers/net/hamradio/Kconfig
> +++ /dev/null
> @@ -1,162 +0,0 @@
> -# SPDX-License-Identifier: GPL-2.0-only
> -config MKISS
> -	tristate "Serial port KISS driver"
> -	depends on AX25 && TTY
> -	select CRC16
> -	help
> -	  KISS is a protocol used for the exchange of data between a computer
> -	  and a Terminal Node Controller (a small embedded system commonly
> -	  used for networking over AX.25 amateur radio connections; it
> -	  connects the computer's serial port with the radio's microphone
> -	  input and speaker output).
> -
> -	  Although KISS is less advanced than the 6pack protocol, it has
> -	  the advantage that it is already supported by most modern TNCs
> -	  without the need for a firmware upgrade.
> -
> -	  To compile this driver as a module, choose M here: the module
> -	  will be called mkiss.
> -
> -config 6PACK
> -	tristate "Serial port 6PACK driver"
> -	depends on AX25 && TTY
> -	help
> -	  6pack is a transmission protocol for the data exchange between your
> -	  PC and your TNC (the Terminal Node Controller acts as a kind of
> -	  modem connecting your computer's serial port to your radio's
> -	  microphone input and speaker output). This protocol can be used as
> -	  an alternative to KISS for networking over AX.25 amateur radio
> -	  connections, but it has some extended functionality.
> -
> -	  Note that this driver is still experimental and might cause
> -	  problems. For details about the features and the usage of the
> -	  driver, read <file:Documentation/networking/6pack.rst>.
> -
> -	  To compile this driver as a module, choose M here: the module
> -	  will be called 6pack.
> -
> -config BPQETHER
> -	tristate "BPQ Ethernet driver"
> -	depends on AX25
> -	help
> -	  AX.25 is the protocol used for computer communication over amateur
> -	  radio. If you say Y here, you will be able to send and receive AX.25
> -	  traffic over Ethernet (also called "BPQ AX.25"), which could be
> -	  useful if some other computer on your local network has a direct
> -	  amateur radio connection.
> -
> -config SCC
> -	tristate "Z8530 SCC driver"
> -	depends on ISA && AX25
> -	help
> -	  These cards are used to connect your Linux box to an amateur radio
> -	  in order to communicate with other computers. If you want to use
> -	  this, read
> -	  <file:Documentation/networking/device_drivers/hamradio/z8530drv.rst>
> -	  and the AX25-HOWTO, available from
> -	  <http://www.tldp.org/docs.html#howto>. Also make sure to say Y
> -	  to "Amateur Radio AX.25 Level 2" support.
> -
> -	  To compile this driver as a module, choose M here: the module
> -	  will be called scc.
> -
> -config SCC_DELAY
> -	bool "additional delay for PA0HZP OptoSCC compatible boards"
> -	depends on SCC
> -	help
> -	  Say Y here if you experience problems with the SCC driver not
> -	  working properly; please read
> -	  <file:Documentation/networking/device_drivers/hamradio/z8530drv.rst>
> -	  for details.
> -
> -	  If unsure, say N.
> -
> -config SCC_TRXECHO
> -	bool "support for TRX that feedback the tx signal to rx"
> -	depends on SCC
> -	help
> -	  Some transmitters feed the transmitted signal back to the receive
> -	  line.  Say Y here to foil this by explicitly disabling the receiver
> -	  during data transmission.
> -
> -	  If in doubt, say Y.
> -
> -config BAYCOM_SER_FDX
> -	tristate "BAYCOM ser12 fullduplex driver for AX.25"
> -	depends on AX25 && HAS_IOPORT
> -	select CRC_CCITT
> -	help
> -	  This is one of two drivers for Baycom style simple amateur radio
> -	  modems that connect to a serial interface. The driver supports the
> -	  ser12 design in full-duplex mode. In addition, it allows the
> -	  baudrate to be set between 300 and 4800 baud (however not all modems
> -	  support all baudrates). This is the preferred driver. The next
> -	  driver, "BAYCOM ser12 half-duplex driver for AX.25" is the old
> -	  driver and still provided in case this driver does not work with
> -	  your serial interface chip. To configure the driver, use the sethdlc
> -	  utility available in the standard ax25 utilities package.
> -	  For more information on the modems, see
> -	  <file:Documentation/networking/device_drivers/hamradio/baycom.rst>.
> -
> -	  To compile this driver as a module, choose M here: the module
> -	  will be called baycom_ser_fdx.  This is recommended.
> -
> -config BAYCOM_SER_HDX
> -	tristate "BAYCOM ser12 halfduplex driver for AX.25"
> -	depends on AX25 && HAS_IOPORT
> -	select CRC_CCITT
> -	help
> -	  This is one of two drivers for Baycom style simple amateur radio
> -	  modems that connect to a serial interface. The driver supports the
> -	  ser12 design in half-duplex mode. This is the old driver.  It is
> -	  still provided in case your serial interface chip does not work with
> -	  the full-duplex driver. This driver is deprecated.  To configure
> -	  the driver, use the sethdlc utility available in the standard ax25
> -	  utilities package. For more information on the modems, see
> -	  <file:Documentation/networking/device_drivers/hamradio/baycom.rst>.
> -
> -	  To compile this driver as a module, choose M here: the module
> -	  will be called baycom_ser_hdx.  This is recommended.
> -
> -config BAYCOM_PAR
> -	tristate "BAYCOM picpar and par96 driver for AX.25"
> -	depends on PARPORT && AX25
> -	select CRC_CCITT
> -	help
> -	  This is a driver for Baycom style simple amateur radio modems that
> -	  connect to a parallel interface. The driver supports the picpar and
> -	  par96 designs. To configure the driver, use the sethdlc utility
> -	  available in the standard ax25 utilities package.
> -	  For more information on the modems, see
> -	  <file:Documentation/networking/device_drivers/hamradio/baycom.rst>.
> -
> -	  To compile this driver as a module, choose M here: the module
> -	  will be called baycom_par.  This is recommended.
> -
> -config BAYCOM_EPP
> -	tristate "BAYCOM epp driver for AX.25"
> -	depends on PARPORT && AX25 && !64BIT
> -	select CRC_CCITT
> -	help
> -	  This is a driver for Baycom style simple amateur radio modems that
> -	  connect to a parallel interface. The driver supports the EPP
> -	  designs. To configure the driver, use the sethdlc utility available
> -	  in the standard ax25 utilities package.
> -	  For more information on the modems, see
> -	  <file:Documentation/networking/device_drivers/hamradio/baycom.rst>.
> -
> -	  To compile this driver as a module, choose M here: the module
> -	  will be called baycom_epp.  This is recommended.
> -
> -config YAM
> -	tristate "YAM driver for AX.25"
> -	depends on AX25 && HAS_IOPORT
> -	help
> -	  The YAM is a modem for packet radio which connects to the serial
> -	  port and includes some of the functions of a Terminal Node
> -	  Controller. If you have one of those, say Y here.
> -
> -	  To compile this driver as a module, choose M here: the module
> -	  will be called yam.
> -
> -
> diff --git a/net/Kconfig b/net/Kconfig
> index 5c588dbcbdbd..bdea8aef7983 100644
> --- a/net/Kconfig
> +++ b/net/Kconfig
> @@ -414,7 +414,6 @@ endmenu # Network testing
>   
>   endmenu # Networking options
>   
> -source "net/ax25/Kconfig"
>   source "net/can/Kconfig"
>   source "net/bluetooth/Kconfig"
>   source "net/rxrpc/Kconfig"
> diff --git a/net/ax25/Kconfig b/net/ax25/Kconfig
> deleted file mode 100644
> index 310169ce1488..000000000000
> --- a/net/ax25/Kconfig
> +++ /dev/null
> @@ -1,108 +0,0 @@
> -# SPDX-License-Identifier: GPL-2.0-only
> -#
> -# Amateur Radio protocols and AX.25 device configuration
> -#
> -
> -menuconfig HAMRADIO
> -	depends on NET
> -	bool "Amateur Radio support"
> -	help
> -	  If you want to connect your Linux box to an amateur radio, answer Y
> -	  here. You want to read <https://www.tapr.org/>
> -	  and more specifically about AX.25 on Linux
> -	  <https://linux-ax25.in-berlin.de>.
> -
> -	  Note that the answer to this question won't directly affect the
> -	  kernel: saying N will just cause the configurator to skip all
> -	  the questions about amateur radio.
> -
> -comment "Packet Radio protocols"
> -	depends on HAMRADIO
> -
> -config AX25
> -	tristate "Amateur Radio AX.25 Level 2 protocol"
> -	depends on HAMRADIO
> -	help
> -	  This is the protocol used for computer communication over amateur
> -	  radio. It is either used by itself for point-to-point links, or to
> -	  carry other protocols such as tcp/ip. To use it, you need a device
> -	  that connects your Linux box to your amateur radio. You can either
> -	  use a low speed TNC (a Terminal Node Controller acts as a kind of
> -	  modem connecting your computer's serial port to your radio's
> -	  microphone input and speaker output) supporting the KISS protocol or
> -	  one of the various SCC cards that are supported by the generic Z8530
> -	  or the DMA SCC driver. Another option are the Baycom modem serial
> -	  and parallel port hacks or the sound card modem (supported by their
> -	  own drivers). If you say Y here, you also have to say Y to one of
> -	  those drivers.
> -
> -	  Information about where to get supporting software for Linux amateur
> -	  radio as well as information about how to configure an AX.25 port is
> -	  contained in the AX25-HOWTO, available from
> -	  <https://www.tldp.org/docs.html#howto>. You might also want to
> -	  check out the file <file:Documentation/networking/ax25.rst> in the
> -	  kernel source. More information about digital amateur radio in
> -	  general is on the WWW at
> -	  <https://www.tapr.org/>.
> -
> -	  To compile this driver as a module, choose M here: the
> -	  module will be called ax25.
> -
> -config AX25_DAMA_SLAVE
> -	bool "AX.25 DAMA Slave support"
> -	default y
> -	depends on AX25
> -	help
> -	  DAMA is a mechanism to prevent collisions when doing AX.25
> -	  networking. A DAMA server (called "master") accepts incoming traffic
> -	  from clients (called "slaves") and redistributes it to other slaves.
> -	  If you say Y here, your Linux box will act as a DAMA slave; this is
> -	  transparent in that you don't have to do any special DAMA
> -	  configuration. Linux cannot yet act as a DAMA server.  This option
> -	  only compiles DAMA slave support into the kernel.  It still needs to
> -	  be enabled at runtime.  For more about DAMA see
> -	  <https://linux-ax25.in-berlin.de>.  If unsure, say Y.
> -
> -config NETROM
> -	tristate "Amateur Radio NET/ROM protocol"
> -	depends on AX25
> -	help
> -	  NET/ROM is a network layer protocol on top of AX.25 useful for
> -	  routing.
> -
> -	  A comprehensive listing of all the software for Linux amateur radio
> -	  users as well as information about how to configure an AX.25 port is
> -	  contained in the Linux Ham Wiki, available from
> -	  <https://linux-ax25.in-berlin.de>. You also might want to check out
> -	  the file <file:Documentation/networking/ax25.rst>. More information
> -	  about digital amateur radio in general is on the WWW at
> -	  <https://www.tapr.org/>.
> -
> -	  To compile this driver as a module, choose M here: the
> -	  module will be called netrom.
> -
> -config ROSE
> -	tristate "Amateur Radio X.25 PLP (Rose)"
> -	depends on AX25
> -	help
> -	  The Packet Layer Protocol (PLP) is a way to route packets over X.25
> -	  connections in general and amateur radio AX.25 connections in
> -	  particular, essentially an alternative to NET/ROM.
> -
> -	  A comprehensive listing of all the software for Linux amateur radio
> -	  users as well as information about how to configure an AX.25 port is
> -	  contained in the Linux Ham Wiki, available from
> -	  <https://linux-ax25.in-berlin.de>.  You also might want to check out
> -	  the file <file:Documentation/networking/ax25.rst>. More information
> -	  about digital amateur radio in general is on the WWW at
> -	  <https://www.tapr.org/>.
> -
> -	  To compile this driver as a module, choose M here: the
> -	  module will be called rose.
> -
> -menu "AX.25 network device drivers"
> -	depends on HAMRADIO && AX25
> -
> -source "drivers/net/hamradio/Kconfig"
> -
> -endmenu
> diff --git a/drivers/net/Makefile b/drivers/net/Makefile
> index 3b2d28127634..b87a741fc952 100644
> --- a/drivers/net/Makefile
> +++ b/drivers/net/Makefile
> @@ -54,7 +54,6 @@ obj-y += dsa/
>   endif
>   obj-$(CONFIG_ETHERNET) += ethernet/
>   obj-$(CONFIG_FDDI) += fddi/
> -obj-$(CONFIG_HAMRADIO) += hamradio/
>   obj-$(CONFIG_QCOM_IPA) += ipa/
>   obj-$(CONFIG_PLIP) += plip/
>   obj-$(CONFIG_PPP) += ppp/
> diff --git a/drivers/net/hamradio/Makefile b/drivers/net/hamradio/Makefile
> deleted file mode 100644
> index 25fc400369ba..000000000000
> --- a/drivers/net/hamradio/Makefile
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -# SPDX-License-Identifier: GPL-2.0
> -#
> -# Makefile for the Linux AX.25 and HFMODEM device drivers.
> -#
> -#
> -# 19971130 	Moved the amateur radio related network drivers from
> -#		drivers/net/ to drivers/hamradio for easier maintenance.
> -#               Joerg Reuter DL1BKE <jreuter@yaina.de>
> -#
> -# 20000806	Rewritten to use lists instead of if-statements.
> -#		Christoph Hellwig <hch@infradead.org>
> -#
> -
> -obj-$(CONFIG_SCC)		+= scc.o
> -obj-$(CONFIG_MKISS)		+= mkiss.o
> -obj-$(CONFIG_6PACK)		+= 6pack.o
> -obj-$(CONFIG_YAM)		+= yam.o
> -obj-$(CONFIG_BPQETHER)		+= bpqether.o
> -obj-$(CONFIG_BAYCOM_SER_FDX)	+= baycom_ser_fdx.o	hdlcdrv.o
> -obj-$(CONFIG_BAYCOM_SER_HDX)	+= baycom_ser_hdx.o	hdlcdrv.o
> -obj-$(CONFIG_BAYCOM_PAR)	+= baycom_par.o		hdlcdrv.o
> -obj-$(CONFIG_BAYCOM_EPP)	+= baycom_epp.o		hdlcdrv.o
> diff --git a/net/Makefile b/net/Makefile
> index 98e182829eff..d2175fce0406 100644
> --- a/net/Makefile
> +++ b/net/Makefile
> @@ -28,9 +28,6 @@ obj-y				+= dsa/
>   obj-$(CONFIG_ATALK)		+= appletalk/
>   obj-$(CONFIG_X25)		+= x25/
>   obj-$(CONFIG_LAPB)		+= lapb/
> -obj-$(CONFIG_NETROM)		+= netrom/
> -obj-$(CONFIG_ROSE)		+= rose/
> -obj-$(CONFIG_AX25)		+= ax25/
>   obj-$(CONFIG_CAN)		+= can/
>   obj-$(CONFIG_BT)		+= bluetooth/
>   obj-$(CONFIG_SUNRPC)		+= sunrpc/
> diff --git a/net/ax25/Makefile b/net/ax25/Makefile
> deleted file mode 100644
> index 2e53affc8568..000000000000
> --- a/net/ax25/Makefile
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -# SPDX-License-Identifier: GPL-2.0
> -#
> -# Makefile for the Linux AX.25 layer.
> -#
> -
> -obj-$(CONFIG_AX25) += ax25.o
> -
> -ax25-y	 := ax25_addr.o ax25_dev.o ax25_iface.o ax25_in.o ax25_ip.o ax25_out.o \
> -	    ax25_route.o ax25_std_in.o ax25_std_subr.o ax25_std_timer.o \
> -	    ax25_subr.o ax25_timer.o ax25_uid.o af_ax25.o
> -ax25-$(CONFIG_AX25_DAMA_SLAVE) += ax25_ds_in.o ax25_ds_subr.o ax25_ds_timer.o
> -ax25-$(CONFIG_SYSCTL) += sysctl_net_ax25.o
> diff --git a/net/netrom/Makefile b/net/netrom/Makefile
> deleted file mode 100644
> index 603e36c9af2e..000000000000
> --- a/net/netrom/Makefile
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -# SPDX-License-Identifier: GPL-2.0-only
> -#
> -# Makefile for the Linux NET/ROM layer.
> -#
> -
> -obj-$(CONFIG_NETROM) += netrom.o
> -
> -netrom-y		:= af_netrom.o nr_dev.o nr_in.o nr_loopback.o \
> -			   nr_out.o nr_route.o nr_subr.o nr_timer.o
> -netrom-$(CONFIG_SYSCTL)	+= sysctl_net_netrom.o
> diff --git a/net/rose/Makefile b/net/rose/Makefile
> deleted file mode 100644
> index 3e6638f5ba57..000000000000
> --- a/net/rose/Makefile
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -# SPDX-License-Identifier: GPL-2.0-only
> -#
> -# Makefile for the Linux Rose (X.25 PLP) layer.
> -#
> -
> -obj-$(CONFIG_ROSE) += rose.o
> -
> -rose-y	  := af_rose.o rose_dev.o rose_in.o rose_link.o rose_loopback.o \
> -	     rose_out.o rose_route.o rose_subr.o rose_timer.o
> -rose-$(CONFIG_SYSCTL) += sysctl_net_rose.o
> diff --git a/drivers/net/hamradio/z8530.h b/drivers/net/hamradio/z8530.h
> deleted file mode 100644
> index 1655901d713b..000000000000
> --- a/drivers/net/hamradio/z8530.h
> +++ /dev/null
> @@ -1,246 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -
> -/* 8530 Serial Communications Controller Register definitions */
> -#define	FLAG	0x7e
> -
> -/* Write Register 0 */
> -#define	R0	0		/* Register selects */
> -#define	R1	1
> -#define	R2	2
> -#define	R3	3
> -#define	R4	4
> -#define	R5	5
> -#define	R6	6
> -#define	R7	7
> -#define	R8	8
> -#define	R9	9
> -#define	R10	10
> -#define	R11	11
> -#define	R12	12
> -#define	R13	13
> -#define	R14	14
> -#define	R15	15
> -
> -#define	NULLCODE	0	/* Null Code */
> -#define	POINT_HIGH	0x8	/* Select upper half of registers */
> -#define	RES_EXT_INT	0x10	/* Reset Ext. Status Interrupts */
> -#define	SEND_ABORT	0x18	/* HDLC Abort */
> -#define	RES_RxINT_FC	0x20	/* Reset RxINT on First Character */
> -#define	RES_Tx_P	0x28	/* Reset TxINT Pending */
> -#define	ERR_RES		0x30	/* Error Reset */
> -#define	RES_H_IUS	0x38	/* Reset highest IUS */
> -
> -#define	RES_Rx_CRC	0x40	/* Reset Rx CRC Checker */
> -#define	RES_Tx_CRC	0x80	/* Reset Tx CRC Checker */
> -#define	RES_EOM_L	0xC0	/* Reset EOM latch */
> -
> -/* Write Register 1 */
> -
> -#define	EXT_INT_ENAB	0x1	/* Ext Int Enable */
> -#define	TxINT_ENAB	0x2	/* Tx Int Enable */
> -#define	PAR_SPEC	0x4	/* Parity is special condition */
> -
> -#define	RxINT_DISAB	0	/* Rx Int Disable */
> -#define	RxINT_FCERR	0x8	/* Rx Int on First Character Only or Error */
> -#define	INT_ALL_Rx	0x10	/* Int on all Rx Characters or error */
> -#define	INT_ERR_Rx	0x18	/* Int on error only */
> -
> -#define	WT_RDY_RT	0x20	/* Wait/Ready on R/T */
> -#define	WT_FN_RDYFN	0x40	/* Wait/FN/Ready FN */
> -#define	WT_RDY_ENAB	0x80	/* Wait/Ready Enable */
> -
> -/* Write Register #2 (Interrupt Vector) */
> -
> -/* Write Register 3 */
> -
> -#define	RxENABLE	0x1	/* Rx Enable */
> -#define	SYNC_L_INH	0x2	/* Sync Character Load Inhibit */
> -#define	ADD_SM		0x4	/* Address Search Mode (SDLC) */
> -#define	RxCRC_ENAB	0x8	/* Rx CRC Enable */
> -#define	ENT_HM		0x10	/* Enter Hunt Mode */
> -#define	AUTO_ENAB	0x20	/* Auto Enables */
> -#define	Rx5		0x0	/* Rx 5 Bits/Character */
> -#define	Rx7		0x40	/* Rx 7 Bits/Character */
> -#define	Rx6		0x80	/* Rx 6 Bits/Character */
> -#define	Rx8		0xc0	/* Rx 8 Bits/Character */
> -
> -/* Write Register 4 */
> -
> -#define	PAR_ENA		0x1	/* Parity Enable */
> -#define	PAR_EVEN	0x2	/* Parity Even/Odd* */
> -
> -#define	SYNC_ENAB	0	/* Sync Modes Enable */
> -#define	SB1		0x4	/* 1 stop bit/char */
> -#define	SB15		0x8	/* 1.5 stop bits/char */
> -#define	SB2		0xc	/* 2 stop bits/char */
> -
> -#define	MONSYNC		0	/* 8 Bit Sync character */
> -#define	BISYNC		0x10	/* 16 bit sync character */
> -#define	SDLC		0x20	/* SDLC Mode (01111110 Sync Flag) */
> -#define	EXTSYNC		0x30	/* External Sync Mode */
> -
> -#define	X1CLK		0x0	/* x1 clock mode */
> -#define	X16CLK		0x40	/* x16 clock mode */
> -#define	X32CLK		0x80	/* x32 clock mode */
> -#define	X64CLK		0xC0	/* x64 clock mode */
> -
> -/* Write Register 5 */
> -
> -#define	TxCRC_ENAB	0x1	/* Tx CRC Enable */
> -#define	RTS		0x2	/* RTS */
> -#define	SDLC_CRC	0x4	/* SDLC/CRC-16 */
> -#define	TxENAB		0x8	/* Tx Enable */
> -#define	SND_BRK		0x10	/* Send Break */
> -#define	Tx5		0x0	/* Tx 5 bits (or less)/character */
> -#define	Tx7		0x20	/* Tx 7 bits/character */
> -#define	Tx6		0x40	/* Tx 6 bits/character */
> -#define	Tx8		0x60	/* Tx 8 bits/character */
> -#define	DTR		0x80	/* DTR */
> -
> -/* Write Register 6 (Sync bits 0-7/SDLC Address Field) */
> -
> -/* Write Register 7 (Sync bits 8-15/SDLC 01111110) */
> -
> -/* Write Register 8 (transmit buffer) */
> -
> -/* Write Register 9 (Master interrupt control) */
> -#define	VIS	1	/* Vector Includes Status */
> -#define	NV	2	/* No Vector */
> -#define	DLC	4	/* Disable Lower Chain */
> -#define	MIE	8	/* Master Interrupt Enable */
> -#define	STATHI	0x10	/* Status high */
> -#define	NORESET	0	/* No reset on write to R9 */
> -#define	CHRB	0x40	/* Reset channel B */
> -#define	CHRA	0x80	/* Reset channel A */
> -#define	FHWRES	0xc0	/* Force hardware reset */
> -
> -/* Write Register 10 (misc control bits) */
> -#define	BIT6	1	/* 6 bit/8bit sync */
> -#define	LOOPMODE 2	/* SDLC Loop mode */
> -#define	ABUNDER	4	/* Abort/flag on SDLC xmit underrun */
> -#define	MARKIDLE 8	/* Mark/flag on idle */
> -#define	GAOP	0x10	/* Go active on poll */
> -#define	NRZ	0	/* NRZ mode */
> -#define	NRZI	0x20	/* NRZI mode */
> -#define	FM1	0x40	/* FM1 (transition = 1) */
> -#define	FM0	0x60	/* FM0 (transition = 0) */
> -#define	CRCPS	0x80	/* CRC Preset I/O */
> -
> -/* Write Register 11 (Clock Mode control) */
> -#define	TRxCXT	0	/* TRxC = Xtal output */
> -#define	TRxCTC	1	/* TRxC = Transmit clock */
> -#define	TRxCBR	2	/* TRxC = BR Generator Output */
> -#define	TRxCDP	3	/* TRxC = DPLL output */
> -#define	TRxCOI	4	/* TRxC O/I */
> -#define	TCRTxCP	0	/* Transmit clock = RTxC pin */
> -#define	TCTRxCP	8	/* Transmit clock = TRxC pin */
> -#define	TCBR	0x10	/* Transmit clock = BR Generator output */
> -#define	TCDPLL	0x18	/* Transmit clock = DPLL output */
> -#define	RCRTxCP	0	/* Receive clock = RTxC pin */
> -#define	RCTRxCP	0x20	/* Receive clock = TRxC pin */
> -#define	RCBR	0x40	/* Receive clock = BR Generator output */
> -#define	RCDPLL	0x60	/* Receive clock = DPLL output */
> -#define	RTxCX	0x80	/* RTxC Xtal/No Xtal */
> -
> -/* Write Register 12 (lower byte of baud rate generator time constant) */
> -
> -/* Write Register 13 (upper byte of baud rate generator time constant) */
> -
> -/* Write Register 14 (Misc control bits) */
> -#define	BRENABL	1	/* Baud rate generator enable */
> -#define	BRSRC	2	/* Baud rate generator source */
> -#define	DTRREQ	4	/* DTR/Request function */
> -#define	AUTOECHO 8	/* Auto Echo */
> -#define	LOOPBAK	0x10	/* Local loopback */
> -#define	SEARCH	0x20	/* Enter search mode */
> -#define	RMC	0x40	/* Reset missing clock */
> -#define	DISDPLL	0x60	/* Disable DPLL */
> -#define	SSBR	0x80	/* Set DPLL source = BR generator */
> -#define	SSRTxC	0xa0	/* Set DPLL source = RTxC */
> -#define	SFMM	0xc0	/* Set FM mode */
> -#define	SNRZI	0xe0	/* Set NRZI mode */
> -
> -/* Write Register 15 (external/status interrupt control) */
> -#define	ZCIE	2	/* Zero count IE */
> -#define	DCDIE	8	/* DCD IE */
> -#define	SYNCIE	0x10	/* Sync/hunt IE */
> -#define	CTSIE	0x20	/* CTS IE */
> -#define	TxUIE	0x40	/* Tx Underrun/EOM IE */
> -#define	BRKIE	0x80	/* Break/Abort IE */
> -
> -
> -/* Read Register 0 */
> -#define	Rx_CH_AV	0x1	/* Rx Character Available */
> -#define	ZCOUNT		0x2	/* Zero count */
> -#define	Tx_BUF_EMP	0x4	/* Tx Buffer empty */
> -#define	DCD		0x8	/* DCD */
> -#define	SYNC_HUNT	0x10	/* Sync/hunt */
> -#define	CTS		0x20	/* CTS */
> -#define	TxEOM		0x40	/* Tx underrun */
> -#define	BRK_ABRT	0x80	/* Break/Abort */
> -
> -/* Read Register 1 */
> -#define	ALL_SNT		0x1	/* All sent */
> -/* Residue Data for 8 Rx bits/char programmed */
> -#define	RES3		0x8	/* 0/3 */
> -#define	RES4		0x4	/* 0/4 */
> -#define	RES5		0xc	/* 0/5 */
> -#define	RES6		0x2	/* 0/6 */
> -#define	RES7		0xa	/* 0/7 */
> -#define	RES8		0x6	/* 0/8 */
> -#define	RES18		0xe	/* 1/8 */
> -#define	RES28		0x0	/* 2/8 */
> -/* Special Rx Condition Interrupts */
> -#define	PAR_ERR		0x10	/* Parity error */
> -#define	Rx_OVR		0x20	/* Rx Overrun Error */
> -#define	CRC_ERR		0x40	/* CRC/Framing Error */
> -#define	END_FR		0x80	/* End of Frame (SDLC) */
> -
> -/* Read Register 2 (channel b only) - Interrupt vector */
> -
> -/* Read Register 3 (interrupt pending register) ch a only */
> -#define	CHBEXT	0x1		/* Channel B Ext/Stat IP */
> -#define	CHBTxIP	0x2		/* Channel B Tx IP */
> -#define	CHBRxIP	0x4		/* Channel B Rx IP */
> -#define	CHAEXT	0x8		/* Channel A Ext/Stat IP */
> -#define	CHATxIP	0x10		/* Channel A Tx IP */
> -#define	CHARxIP	0x20		/* Channel A Rx IP */
> -
> -/* Read Register 8 (receive data register) */
> -
> -/* Read Register 10  (misc status bits) */
> -#define	ONLOOP	2		/* On loop */
> -#define	LOOPSEND 0x10		/* Loop sending */
> -#define	CLK2MIS	0x40		/* Two clocks missing */
> -#define	CLK1MIS	0x80		/* One clock missing */
> -
> -/* Read Register 12 (lower byte of baud rate generator constant) */
> -
> -/* Read Register 13 (upper byte of baud rate generator constant) */
> -
> -/* Read Register 15 (value of WR 15) */
> -
> -/* Z85C30/Z85230 Enhanced SCC register definitions */
> -
> -/* Write Register 7' (SDLC/HDLC Programmable Enhancements) */
> -#define AUTOTXF	0x01		/* Auto Tx Flag */
> -#define AUTOEOM 0x02		/* Auto EOM Latch Reset */
> -#define AUTORTS	0x04		/* Auto RTS */
> -#define TXDNRZI 0x08		/* TxD Pulled High in SDLC NRZI mode */
> -#define RXFIFOH 0x08		/* Z85230: Int on RX FIFO half full */
> -#define FASTDTR 0x10		/* Fast DTR/REQ Mode */
> -#define CRCCBCR	0x20		/* CRC Check Bytes Completely Received */
> -#define TXFIFOE 0x20		/* Z85230: Int on TX FIFO completely empty */
> -#define EXTRDEN	0x40		/* Extended Read Enabled */
> -
> -/* Write Register 15 (external/status interrupt control) */
> -#define SHDLCE	1		/* SDLC/HDLC Enhancements Enable */
> -#define FIFOE	4		/* FIFO Enable */
> -
> -/* Read Register 6 (frame status FIFO) */
> -#define BCLSB	0xff		/* LSB of 14 bits count */
> -
> -/* Read Register 7 (frame status FIFO) */
> -#define BCMSB	0x3f		/* MSB of 14 bits count */
> -#define FDA	0x40		/* FIFO Data Available Status */
> -#define FOS	0x80		/* FIFO Overflow Status */
> diff --git a/include/linux/hdlcdrv.h b/include/linux/hdlcdrv.h
> deleted file mode 100644
> index 5d70c3f98f5b..000000000000
> --- a/include/linux/hdlcdrv.h
> +++ /dev/null
> @@ -1,276 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -/*
> - * hdlcdrv.h  -- HDLC packet radio network driver.
> - * The Linux soundcard driver for 1200 baud and 9600 baud packet radio
> - * (C) 1996-1998 by Thomas Sailer, HB9JNX/AE4WA
> - */
> -#ifndef _HDLCDRV_H
> -#define _HDLCDRV_H
> -
> -
> -#include <linux/netdevice.h>
> -#include <linux/if.h>
> -#include <linux/spinlock.h>
> -#include <uapi/linux/hdlcdrv.h>
> -
> -#define HDLCDRV_MAGIC      0x5ac6e778
> -#define HDLCDRV_HDLCBUFFER  32 /* should be a power of 2 for speed reasons */
> -#define HDLCDRV_BITBUFFER  256 /* should be a power of 2 for speed reasons */
> -#undef HDLCDRV_LOOPBACK  /* define for HDLC debugging purposes */
> -#define HDLCDRV_DEBUG
> -
> -/* maximum packet length, excluding CRC */
> -#define HDLCDRV_MAXFLEN             400	
> -
> -
> -struct hdlcdrv_hdlcbuffer {
> -	spinlock_t lock;
> -	unsigned rd, wr;
> -	unsigned short buf[HDLCDRV_HDLCBUFFER];
> -};
> -
> -#ifdef HDLCDRV_DEBUG
> -struct hdlcdrv_bitbuffer {
> -	unsigned int rd;
> -	unsigned int wr;
> -	unsigned int shreg;
> -	unsigned char buffer[HDLCDRV_BITBUFFER];
> -};
> -
> -static inline void hdlcdrv_add_bitbuffer(struct hdlcdrv_bitbuffer *buf,
> -					 unsigned int bit)
> -{
> -	unsigned char new;
> -
> -	new = buf->shreg & 1;
> -	buf->shreg >>= 1;
> -	buf->shreg |= (!!bit) << 7;
> -	if (new) {
> -		buf->buffer[buf->wr] = buf->shreg;
> -		buf->wr = (buf->wr+1) % sizeof(buf->buffer);
> -		buf->shreg = 0x80;
> -	}
> -}
> -
> -static inline void hdlcdrv_add_bitbuffer_word(struct hdlcdrv_bitbuffer *buf,
> -					      unsigned int bits)
> -{
> -	buf->buffer[buf->wr] = bits & 0xff;
> -	buf->wr = (buf->wr+1) % sizeof(buf->buffer);
> -	buf->buffer[buf->wr] = (bits >> 8) & 0xff;
> -	buf->wr = (buf->wr+1) % sizeof(buf->buffer);
> -
> -}
> -#endif /* HDLCDRV_DEBUG */
> -
> -/* -------------------------------------------------------------------- */
> -/*
> - * Information that need to be kept for each driver.
> - */
> -
> -struct hdlcdrv_ops {
> -	/*
> -	 * first some informations needed by the hdlcdrv routines
> -	 */
> -	const char *drvname;
> -	const char *drvinfo;
> -	/*
> -	 * the routines called by the hdlcdrv routines
> -	 */
> -	int (*open)(struct net_device *);
> -	int (*close)(struct net_device *);
> -	int (*ioctl)(struct net_device *, void __user *,
> -		     struct hdlcdrv_ioctl *, int);
> -};
> -
> -struct hdlcdrv_state {
> -	int magic;
> -	int opened;
> -
> -	const struct hdlcdrv_ops *ops;
> -
> -	struct {
> -		int bitrate;
> -	} par;
> -
> -	struct hdlcdrv_pttoutput {
> -		int dma2;
> -		int seriobase;
> -		int pariobase;
> -		int midiiobase;
> -		unsigned int flags;
> -	} ptt_out;
> -
> -	struct hdlcdrv_channel_params ch_params;
> -
> -	struct hdlcdrv_hdlcrx {
> -		struct hdlcdrv_hdlcbuffer hbuf;
> -		unsigned long in_hdlc_rx;
> -		/* 0 = sync hunt, != 0 receiving */
> -		int rx_state;	
> -		unsigned int bitstream;
> -		unsigned int bitbuf;
> -		int numbits;
> -		unsigned char dcd;
> -		
> -		int len;
> -		unsigned char *bp;
> -		unsigned char buffer[HDLCDRV_MAXFLEN+2];
> -	} hdlcrx;
> -
> -	struct hdlcdrv_hdlctx {
> -		struct hdlcdrv_hdlcbuffer hbuf;
> -		unsigned long in_hdlc_tx;
> -		/*
> -		 * 0 = send flags
> -		 * 1 = send txtail (flags)
> -		 * 2 = send packet
> -		 */
> -		int tx_state;	
> -		int numflags;
> -		unsigned int bitstream;
> -		unsigned char ptt;
> -		int calibrate;
> -		int slotcnt;
> -
> -		unsigned int bitbuf;
> -		int numbits;
> -		
> -		int len;
> -		unsigned char *bp;
> -		unsigned char buffer[HDLCDRV_MAXFLEN+2];
> -	} hdlctx;
> -
> -#ifdef HDLCDRV_DEBUG
> -	struct hdlcdrv_bitbuffer bitbuf_channel;
> -	struct hdlcdrv_bitbuffer bitbuf_hdlc;
> -#endif /* HDLCDRV_DEBUG */
> -
> -	int ptt_keyed;
> -
> -	/* queued skb for transmission */
> -	struct sk_buff *skb;
> -};
> -
> -
> -/* -------------------------------------------------------------------- */
> -
> -static inline int hdlcdrv_hbuf_full(struct hdlcdrv_hdlcbuffer *hb)
> -{
> -	unsigned long flags;
> -	int ret;
> -	
> -	spin_lock_irqsave(&hb->lock, flags);
> -	ret = !((HDLCDRV_HDLCBUFFER - 1 + hb->rd - hb->wr) % HDLCDRV_HDLCBUFFER);
> -	spin_unlock_irqrestore(&hb->lock, flags);
> -	return ret;
> -}
> -
> -/* -------------------------------------------------------------------- */
> -
> -static inline int hdlcdrv_hbuf_empty(struct hdlcdrv_hdlcbuffer *hb)
> -{
> -	unsigned long flags;
> -	int ret;
> -	
> -	spin_lock_irqsave(&hb->lock, flags);
> -	ret = (hb->rd == hb->wr);
> -	spin_unlock_irqrestore(&hb->lock, flags);
> -	return ret;
> -}
> -
> -/* -------------------------------------------------------------------- */
> -
> -static inline unsigned short hdlcdrv_hbuf_get(struct hdlcdrv_hdlcbuffer *hb)
> -{
> -	unsigned long flags;
> -	unsigned short val;
> -	unsigned newr;
> -
> -	spin_lock_irqsave(&hb->lock, flags);
> -	if (hb->rd == hb->wr)
> -		val = 0;
> -	else {
> -		newr = (hb->rd+1) % HDLCDRV_HDLCBUFFER;
> -		val = hb->buf[hb->rd];
> -		hb->rd = newr;
> -	}
> -	spin_unlock_irqrestore(&hb->lock, flags);
> -	return val;
> -}
> -
> -/* -------------------------------------------------------------------- */
> -
> -static inline void hdlcdrv_hbuf_put(struct hdlcdrv_hdlcbuffer *hb,
> -				    unsigned short val)
> -{
> -	unsigned newp;
> -	unsigned long flags;
> -	
> -	spin_lock_irqsave(&hb->lock, flags);
> -	newp = (hb->wr+1) % HDLCDRV_HDLCBUFFER;
> -	if (newp != hb->rd) {
> -		hb->buf[hb->wr] = val & 0xffff;
> -		hb->wr = newp;
> -	}
> -	spin_unlock_irqrestore(&hb->lock, flags);
> -}
> -
> -/* -------------------------------------------------------------------- */
> -
> -static inline void hdlcdrv_putbits(struct hdlcdrv_state *s, unsigned int bits)
> -{
> -	hdlcdrv_hbuf_put(&s->hdlcrx.hbuf, bits);
> -}
> -
> -static inline unsigned int hdlcdrv_getbits(struct hdlcdrv_state *s)
> -{
> -	unsigned int ret;
> -
> -	if (hdlcdrv_hbuf_empty(&s->hdlctx.hbuf)) {
> -		if (s->hdlctx.calibrate > 0)
> -			s->hdlctx.calibrate--;
> -		else
> -			s->hdlctx.ptt = 0;
> -		ret = 0;
> -	} else
> -		ret = hdlcdrv_hbuf_get(&s->hdlctx.hbuf);
> -#ifdef HDLCDRV_LOOPBACK
> -	hdlcdrv_hbuf_put(&s->hdlcrx.hbuf, ret);
> -#endif /* HDLCDRV_LOOPBACK */
> -	return ret;
> -}
> -
> -static inline void hdlcdrv_channelbit(struct hdlcdrv_state *s, unsigned int bit)
> -{
> -#ifdef HDLCDRV_DEBUG
> -	hdlcdrv_add_bitbuffer(&s->bitbuf_channel, bit);
> -#endif /* HDLCDRV_DEBUG */
> -}
> -
> -static inline void hdlcdrv_setdcd(struct hdlcdrv_state *s, int dcd)
> -{
> -	s->hdlcrx.dcd = !!dcd;
> -}
> -
> -static inline int hdlcdrv_ptt(struct hdlcdrv_state *s)
> -{
> -	return s->hdlctx.ptt || (s->hdlctx.calibrate > 0);
> -}
> -
> -/* -------------------------------------------------------------------- */
> -
> -void hdlcdrv_receiver(struct net_device *, struct hdlcdrv_state *);
> -void hdlcdrv_transmitter(struct net_device *, struct hdlcdrv_state *);
> -void hdlcdrv_arbitrate(struct net_device *, struct hdlcdrv_state *);
> -struct net_device *hdlcdrv_register(const struct hdlcdrv_ops *ops,
> -				    unsigned int privsize, const char *ifname,
> -				    unsigned int baseaddr, unsigned int irq,
> -				    unsigned int dma);
> -void hdlcdrv_unregister(struct net_device *dev);
> -
> -/* -------------------------------------------------------------------- */
> -
> -
> -
> -#endif /* _HDLCDRV_H */
> diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
> index 7969fcdd5ac4..e9e2ec8d4c19 100644
> --- a/include/linux/netdevice.h
> +++ b/include/linux/netdevice.h
> @@ -162,7 +162,7 @@ static inline bool dev_xmit_complete(int rc)
>   
>   #if defined(CONFIG_HYPERV_NET)
>   # define LL_MAX_HEADER 128
> -#elif defined(CONFIG_WLAN) || IS_ENABLED(CONFIG_AX25)
> +#elif defined(CONFIG_WLAN)
>   # if defined(CONFIG_MAC80211_MESH)
>   #  define LL_MAX_HEADER 128
>   # else
> @@ -2316,9 +2316,6 @@ struct net_device {
>   #if IS_ENABLED(CONFIG_ATALK)
>   	void 			*atalk_ptr;
>   #endif
> -#if IS_ENABLED(CONFIG_AX25)
> -	struct ax25_dev	__rcu	*ax25_ptr;
> -#endif
>   #if IS_ENABLED(CONFIG_CFG80211)
>   	struct wireless_dev	*ieee80211_ptr;
>   #endif
> diff --git a/include/linux/scc.h b/include/linux/scc.h
> deleted file mode 100644
> index 745eabd17c10..000000000000
> --- a/include/linux/scc.h
> +++ /dev/null
> @@ -1,86 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -/* $Id: scc.h,v 1.29 1997/04/02 14:56:45 jreuter Exp jreuter $ */
> -#ifndef	_SCC_H
> -#define	_SCC_H
> -
> -#include <uapi/linux/scc.h>
> -
> -
> -enum {TX_OFF, TX_ON};	/* command for scc_key_trx() */
> -
> -/* Vector masks in RR2B */
> -
> -#define VECTOR_MASK	0x06
> -#define TXINT		0x00
> -#define EXINT		0x02
> -#define RXINT		0x04
> -#define SPINT		0x06
> -
> -#ifdef CONFIG_SCC_DELAY
> -#define Inb(port)	inb_p(port)
> -#define Outb(port, val)	outb_p(val, port)
> -#else
> -#define Inb(port)	inb(port)
> -#define Outb(port, val)	outb(val, port)
> -#endif
> -
> -/* SCC channel control structure for KISS */
> -
> -struct scc_kiss {
> -	unsigned char txdelay;		/* Transmit Delay 10 ms/cnt */
> -	unsigned char persist;		/* Persistence (0-255) as a % */
> -	unsigned char slottime;		/* Delay to wait on persistence hit */
> -	unsigned char tailtime;		/* Delay after last byte written */
> -	unsigned char fulldup;		/* Full Duplex mode 0=CSMA 1=DUP 2=ALWAYS KEYED */
> -	unsigned char waittime;		/* Waittime before any transmit attempt */
> -	unsigned int  maxkeyup;		/* Maximum time to transmit (seconds) */
> -	unsigned int  mintime;		/* Minimal offtime after MAXKEYUP timeout (seconds) */
> -	unsigned int  idletime;		/* Maximum idle time in ALWAYS KEYED mode (seconds) */
> -	unsigned int  maxdefer;		/* Timer for CSMA channel busy limit */
> -	unsigned char tx_inhibit;	/* Transmit is not allowed when set */	
> -	unsigned char group;		/* Group ID for AX.25 TX interlocking */
> -	unsigned char mode;		/* 'normal' or 'hwctrl' mode (unused) */
> -	unsigned char softdcd;		/* Use DPLL instead of DCD pin for carrier detect */
> -};
> -
> -
> -/* SCC channel structure */
> -
> -struct scc_channel {
> -	int init;			/* channel exists? */
> -
> -	struct net_device *dev;		/* link to device control structure */
> -	struct net_device_stats dev_stat;/* device statistics */
> -
> -	char brand;			/* manufacturer of the board */
> -	long clock;			/* used clock */
> -
> -	io_port ctrl;			/* I/O address of CONTROL register */
> -	io_port	data;			/* I/O address of DATA register */
> -	io_port special;		/* I/O address of special function port */
> -	int irq;			/* Number of Interrupt */
> -
> -	char option;
> -	char enhanced;			/* Enhanced SCC support */
> -
> -	unsigned char wreg[16]; 	/* Copy of last written value in WRx */
> -	unsigned char status;		/* Copy of R0 at last external interrupt */
> -	unsigned char dcd;		/* DCD status */
> -
> -        struct scc_kiss kiss;		/* control structure for KISS params */
> -        struct scc_stat stat;		/* statistical information */
> -        struct scc_modem modem; 	/* modem information */
> -
> -        struct sk_buff_head tx_queue;	/* next tx buffer */
> -        struct sk_buff *rx_buff;	/* pointer to frame currently received */
> -        struct sk_buff *tx_buff;	/* pointer to frame currently transmitted */
> -
> -	/* Timer */
> -	struct timer_list tx_t;		/* tx timer for this channel */
> -	struct timer_list tx_wdog;	/* tx watchdogs */
> -	
> -	/* Channel lock */
> -	spinlock_t	lock;		/* Channel guard lock */
> -};
> -
> -#endif /* defined(_SCC_H) */
> diff --git a/include/linux/yam.h b/include/linux/yam.h
> deleted file mode 100644
> index a29b04fa1e66..000000000000
> --- a/include/linux/yam.h
> +++ /dev/null
> @@ -1,67 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-or-later */
> -/*****************************************************************************/
> -
> -/*
> - *	yam.h  -- YAM radio modem driver.
> - *
> - *	Copyright (C) 1998 Frederic Rible F1OAT (frible@teaser.fr)
> - *	Adapted from baycom.c driver written by Thomas Sailer (sailer@ife.ee.ethz.ch)
> - *
> - *  Please note that the GPL allows you to use the driver, NOT the radio.
> - *  In order to use the radio, you need a license from the communications
> - *  authority of your country.
> - */
> -
> -/*****************************************************************************/
> -
> -#define SIOCYAMRESERVED	(0)
> -#define SIOCYAMSCFG 	(1)	/* Set configuration */
> -#define SIOCYAMGCFG 	(2)	/* Get configuration */
> -#define SIOCYAMSMCS 	(3)	/* Set mcs data */
> -
> -#define YAM_IOBASE   (1 << 0)
> -#define YAM_IRQ      (1 << 1)
> -#define YAM_BITRATE  (1 << 2) /* Bit rate of radio port ->57600 */
> -#define YAM_MODE     (1 << 3) /* 0=simplex 1=duplex 2=duplex+tempo */
> -#define YAM_HOLDDLY  (1 << 4) /* duplex tempo (sec) */
> -#define YAM_TXDELAY  (1 << 5) /* Tx Delay (ms) */
> -#define YAM_TXTAIL   (1 << 6) /* Tx Tail  (ms) */
> -#define YAM_PERSIST  (1 << 7) /* Persist  (ms) */
> -#define YAM_SLOTTIME (1 << 8) /* Slottime (ms) */
> -#define YAM_BAUDRATE (1 << 9) /* Baud rate of rs232 port ->115200 */
> -
> -#define YAM_MAXBITRATE  57600
> -#define YAM_MAXBAUDRATE 115200
> -#define YAM_MAXMODE     2
> -#define YAM_MAXHOLDDLY  99
> -#define YAM_MAXTXDELAY  999
> -#define YAM_MAXTXTAIL   999
> -#define YAM_MAXPERSIST  255
> -#define YAM_MAXSLOTTIME 999
> -
> -#define YAM_FPGA_SIZE	5302
> -
> -struct yamcfg {
> -	unsigned int mask;		/* Mask of commands */
> -	unsigned int iobase;	/* IO Base of COM port */
> -	unsigned int irq;		/* IRQ of COM port */
> -	unsigned int bitrate;	/* Bit rate of radio port */
> -	unsigned int baudrate;	/* Baud rate of the RS232 port */
> -	unsigned int txdelay;	/* TxDelay */
> -	unsigned int txtail;	/* TxTail */
> -	unsigned int persist;	/* Persistence */
> -	unsigned int slottime;	/* Slottime */
> -	unsigned int mode;		/* mode 0 (simp), 1(Dupl), 2(Dupl+delay) */
> -	unsigned int holddly;	/* PTT delay in FullDuplex 2 mode */
> -};
> -
> -struct yamdrv_ioctl_cfg {
> -	int cmd;
> -	struct yamcfg cfg;
> -};
> -
> -struct yamdrv_ioctl_mcs {
> -	int cmd;
> -	unsigned int bitrate;
> -	unsigned char bits[YAM_FPGA_SIZE];
> -};
> diff --git a/include/net/ax25.h b/include/net/ax25.h
> index 9fc6a6657266..6b2f518facdb 100644
> --- a/include/net/ax25.h
> +++ b/include/net/ax25.h
> @@ -1,480 +1,10 @@
>   /* SPDX-License-Identifier: GPL-2.0 */
> -/*
> - *	Declarations of AX.25 type objects.
> - *
> - *	Alan Cox (GW4PTS) 	10/11/93
> - */
>   #ifndef _AX25_H
> -#define _AX25_H
> +#define _AX25_H
>   
>   #include <linux/ax25.h>
> -#include <linux/spinlock.h>
> -#include <linux/timer.h>
> -#include <linux/list.h>
> -#include <linux/slab.h>
> -#include <linux/refcount.h>
> -#include <net/neighbour.h>
> -#include <net/sock.h>
> -#include <linux/seq_file.h>
>   
> -#define	AX25_T1CLAMPLO  		1
> -#define	AX25_T1CLAMPHI 			(30 * HZ)
> -
> -#define	AX25_BPQ_HEADER_LEN		16
> -#define	AX25_KISS_HEADER_LEN		1
> -
> -#define	AX25_HEADER_LEN			17
> -#define	AX25_ADDR_LEN			7
> -#define	AX25_DIGI_HEADER_LEN		(AX25_MAX_DIGIS * AX25_ADDR_LEN)
> -#define	AX25_MAX_HEADER_LEN		(AX25_HEADER_LEN + AX25_DIGI_HEADER_LEN)
> -
> -/* AX.25 Protocol IDs */
> -#define AX25_P_ROSE			0x01
> -#define AX25_P_VJCOMP			0x06	/* Compressed TCP/IP packet   */
> -						/* Van Jacobsen (RFC 1144)    */
> -#define AX25_P_VJUNCOMP			0x07	/* Uncompressed TCP/IP packet */
> -						/* Van Jacobsen (RFC 1144)    */
> -#define	AX25_P_SEGMENT			0x08	/* Segmentation fragment      */
> -#define AX25_P_TEXNET			0xc3	/* TEXTNET datagram protocol  */
> -#define AX25_P_LQ			0xc4	/* Link Quality Protocol      */
> -#define AX25_P_ATALK			0xca	/* Appletalk                  */
> -#define AX25_P_ATALK_ARP		0xcb	/* Appletalk ARP              */
> -#define AX25_P_IP			0xcc	/* ARPA Internet Protocol     */
> -#define AX25_P_ARP			0xcd	/* ARPA Address Resolution    */
> -#define AX25_P_FLEXNET			0xce	/* FlexNet                    */
> -#define AX25_P_NETROM 			0xcf	/* NET/ROM                    */
> -#define AX25_P_TEXT 			0xF0	/* No layer 3 protocol impl.  */
> -
> -/* AX.25 Segment control values */
> -#define	AX25_SEG_REM			0x7F
> -#define	AX25_SEG_FIRST			0x80
> -
> -#define AX25_CBIT			0x80	/* Command/Response bit */
> -#define AX25_EBIT			0x01	/* HDLC Address Extension bit */
> -#define AX25_HBIT			0x80	/* Has been repeated bit */
> -
> -#define AX25_SSSID_SPARE		0x60	/* Unused bits in SSID for standard AX.25 */
> -#define AX25_ESSID_SPARE		0x20	/* Unused bits in SSID for extended AX.25 */
> -#define AX25_DAMA_FLAG			0x20	/* Well, it is *NOT* unused! (dl1bke 951121 */
> -
> -#define	AX25_COND_ACK_PENDING		0x01
> -#define	AX25_COND_REJECT		0x02
> -#define	AX25_COND_PEER_RX_BUSY		0x04
> -#define	AX25_COND_OWN_RX_BUSY		0x08
> -#define	AX25_COND_DAMA_MODE		0x10
> -
> -#ifndef _LINUX_NETDEVICE_H
> -#include <linux/netdevice.h>
> -#endif
> -
> -/* Upper sub-layer (LAPB) definitions */
> -
> -/* Control field templates */
> -#define	AX25_I			0x00	/* Information frames */
> -#define	AX25_S			0x01	/* Supervisory frames */
> -#define	AX25_RR			0x01	/* Receiver ready */
> -#define	AX25_RNR		0x05	/* Receiver not ready */
> -#define	AX25_REJ		0x09	/* Reject */
> -#define	AX25_U			0x03	/* Unnumbered frames */
> -#define	AX25_SABM		0x2f	/* Set Asynchronous Balanced Mode */
> -#define	AX25_SABME		0x6f	/* Set Asynchronous Balanced Mode Extended */
> -#define	AX25_DISC		0x43	/* Disconnect */
> -#define	AX25_DM			0x0f	/* Disconnected mode */
> -#define	AX25_UA			0x63	/* Unnumbered acknowledge */
> -#define	AX25_FRMR		0x87	/* Frame reject */
> -#define	AX25_UI			0x03	/* Unnumbered information */
> -#define	AX25_XID		0xaf	/* Exchange information */
> -#define	AX25_TEST		0xe3	/* Test */
> -
> -#define	AX25_PF			0x10	/* Poll/final bit for standard AX.25 */
> -#define	AX25_EPF		0x01	/* Poll/final bit for extended AX.25 */
> -
> -#define AX25_ILLEGAL		0x100	/* Impossible to be a real frame type */
> -
> -#define	AX25_POLLOFF		0
> -#define	AX25_POLLON		1
> -
> -/* AX25 L2 C-bit */
> -#define AX25_COMMAND		1
> -#define AX25_RESPONSE		2
> -
> -/* Define Link State constants. */
> -
> -enum {
> -	AX25_STATE_0,			/* Listening */
> -	AX25_STATE_1,			/* SABM sent */
> -	AX25_STATE_2,			/* DISC sent */
> -	AX25_STATE_3,			/* Established */
> -	AX25_STATE_4			/* Recovery */
> -};
> -
> -#define AX25_MODULUS 		8	/*  Standard AX.25 modulus */
> -#define	AX25_EMODULUS		128	/*  Extended AX.25 modulus */
> -
> -enum {
> -	AX25_PROTO_STD_SIMPLEX,
> -	AX25_PROTO_STD_DUPLEX,
> -#ifdef CONFIG_AX25_DAMA_SLAVE
> -	AX25_PROTO_DAMA_SLAVE,
> -#endif
> -	__AX25_PROTO_MAX,
> -	AX25_PROTO_MAX = __AX25_PROTO_MAX -1
> -};
> -
> -enum {
> -	AX25_VALUES_IPDEFMODE,	/* 0=DG 1=VC */
> -	AX25_VALUES_AXDEFMODE,	/* 0=Normal 1=Extended Seq Nos */
> -	AX25_VALUES_BACKOFF,	/* 0=None 1=Linear 2=Exponential */
> -	AX25_VALUES_CONMODE,	/* Allow connected modes - 0=No 1=no "PID text" 2=all PIDs */
> -	AX25_VALUES_WINDOW,	/* Default window size for standard AX.25 */
> -	AX25_VALUES_EWINDOW,	/* Default window size for extended AX.25 */
> -	AX25_VALUES_T1,		/* Default T1 timeout value */
> -	AX25_VALUES_T2,		/* Default T2 timeout value */
> -	AX25_VALUES_T3,		/* Default T3 timeout value */
> -	AX25_VALUES_IDLE,	/* Connected mode idle timer */
> -	AX25_VALUES_N2,		/* Default N2 value */
> -	AX25_VALUES_PACLEN,	/* AX.25 MTU */
> -	AX25_VALUES_PROTOCOL,	/* Std AX.25, DAMA Slave */
> -#ifdef CONFIG_AX25_DAMA_SLAVE
> -	AX25_VALUES_DS_TIMEOUT,	/* DAMA Slave timeout */
> -#endif
> -	AX25_MAX_VALUES		/* THIS MUST REMAIN THE LAST ENTRY OF THIS LIST */
> -};
> -
> -#define	AX25_DEF_IPDEFMODE	0			/* Datagram */
> -#define	AX25_DEF_AXDEFMODE	0			/* Normal */
> -#define	AX25_DEF_BACKOFF	1			/* Linear backoff */
> -#define	AX25_DEF_CONMODE	2			/* Connected mode allowed */
> -#define	AX25_DEF_WINDOW		2			/* Window=2 */
> -#define	AX25_DEF_EWINDOW	32			/* Module-128 Window=32 */
> -#define	AX25_DEF_T1		10000			/* T1=10s */
> -#define	AX25_DEF_T2		3000			/* T2=3s  */
> -#define	AX25_DEF_T3		300000			/* T3=300s */
> -#define	AX25_DEF_N2		10			/* N2=10 */
> -#define AX25_DEF_IDLE		0			/* Idle=None */
> -#define AX25_DEF_PACLEN		256			/* Paclen=256 */
> -#define	AX25_DEF_PROTOCOL	AX25_PROTO_STD_SIMPLEX	/* Standard AX.25 */
> -#define AX25_DEF_DS_TIMEOUT	180000			/* DAMA timeout 3 minutes */
> -
> -typedef struct ax25_uid_assoc {
> -	struct hlist_node	uid_node;
> -	refcount_t		refcount;
> -	kuid_t			uid;
> -	ax25_address		call;
> -} ax25_uid_assoc;
> -
> -#define ax25_uid_for_each(__ax25, list) \
> -	hlist_for_each_entry(__ax25, list, uid_node)
> -
> -#define ax25_uid_hold(ax25) \
> -	refcount_inc(&((ax25)->refcount))
> -
> -static inline void ax25_uid_put(ax25_uid_assoc *assoc)
> -{
> -	if (refcount_dec_and_test(&assoc->refcount)) {
> -		kfree(assoc);
> -	}
> -}
> -
> -typedef struct {
> -	ax25_address		calls[AX25_MAX_DIGIS];
> -	unsigned char		repeated[AX25_MAX_DIGIS];
> -	unsigned char		ndigi;
> -	signed char		lastrepeat;
> -} ax25_digi;
> -
> -typedef struct ax25_route {
> -	struct ax25_route	*next;
> -	ax25_address		callsign;
> -	struct net_device	*dev;
> -	ax25_digi		*digipeat;
> -	char			ip_mode;
> -} ax25_route;
> -
> -void __ax25_put_route(ax25_route *ax25_rt);
> -
> -extern rwlock_t ax25_route_lock;
> -
> -static inline void ax25_route_lock_use(void)
> -{
> -	read_lock(&ax25_route_lock);
> -}
> -
> -static inline void ax25_route_lock_unuse(void)
> -{
> -	read_unlock(&ax25_route_lock);
> -}
> -
> -typedef struct {
> -	char			slave;			/* slave_mode?   */
> -	struct timer_list	slave_timer;		/* timeout timer */
> -	unsigned short		slave_timeout;		/* when? */
> -} ax25_dama_info;
> -
> -typedef struct ax25_dev {
> -	struct list_head	list;
> -
> -	struct net_device	*dev;
> -	netdevice_tracker	dev_tracker;
> -
> -	struct net_device	*forward;
> -	struct ctl_table_header *sysheader;
> -	int			values[AX25_MAX_VALUES];
> -#ifdef CONFIG_AX25_DAMA_SLAVE
> -	ax25_dama_info		dama;
> -#endif
> -	refcount_t		refcount;
> -	bool device_up;
> -	struct rcu_head		rcu;
> -} ax25_dev;
> -
> -typedef struct ax25_cb {
> -	struct hlist_node	ax25_node;
> -	ax25_address		source_addr, dest_addr;
> -	ax25_digi		*digipeat;
> -	ax25_dev		*ax25_dev;
> -	netdevice_tracker	dev_tracker;
> -	unsigned char		iamdigi;
> -	unsigned char		state, modulus, pidincl;
> -	unsigned short		vs, vr, va;
> -	unsigned char		condition, backoff;
> -	unsigned char		n2, n2count;
> -	struct timer_list	t1timer, t2timer, t3timer, idletimer;
> -	unsigned long		t1, t2, t3, idle, rtt;
> -	unsigned short		paclen, fragno, fraglen;
> -	struct sk_buff_head	write_queue;
> -	struct sk_buff_head	reseq_queue;
> -	struct sk_buff_head	ack_queue;
> -	struct sk_buff_head	frag_queue;
> -	unsigned char		window;
> -	struct timer_list	timer, dtimer;
> -	struct sock		*sk;		/* Backlink to socket */
> -	refcount_t		refcount;
> -} ax25_cb;
> -
> -struct ax25_sock {
> -	struct sock		sk;
> -	struct ax25_cb		*cb;
> -};
> -
> -#define ax25_sk(ptr) container_of_const(ptr, struct ax25_sock, sk)
> -
> -static inline struct ax25_cb *sk_to_ax25(const struct sock *sk)
> -{
> -	return ax25_sk(sk)->cb;
> -}
> -
> -#define ax25_for_each(__ax25, list) \
> -	hlist_for_each_entry(__ax25, list, ax25_node)
> -
> -#define ax25_cb_hold(__ax25) \
> -	refcount_inc(&((__ax25)->refcount))
> -
> -static __inline__ void ax25_cb_put(ax25_cb *ax25)
> -{
> -	if (refcount_dec_and_test(&ax25->refcount)) {
> -		kfree(ax25->digipeat);
> -		kfree(ax25);
> -	}
> -}
> -
> -static inline void ax25_dev_hold(ax25_dev *ax25_dev)
> -{
> -	refcount_inc(&ax25_dev->refcount);
> -}
> -
> -static inline void ax25_dev_put(ax25_dev *ax25_dev)
> -{
> -	if (refcount_dec_and_test(&ax25_dev->refcount))
> -		kfree_rcu(ax25_dev, rcu);
> -}
> -static inline __be16 ax25_type_trans(struct sk_buff *skb, struct net_device *dev)
> -{
> -	skb->dev      = dev;
> -	skb_reset_mac_header(skb);
> -	skb->pkt_type = PACKET_HOST;
> -	return htons(ETH_P_AX25);
> -}
> -
> -/* af_ax25.c */
> -extern struct hlist_head ax25_list;
> -extern spinlock_t ax25_list_lock;
> -void ax25_cb_add(ax25_cb *);
> -struct sock *ax25_find_listener(ax25_address *, int, struct net_device *, int);
> -struct sock *ax25_get_socket(ax25_address *, ax25_address *, int);
> -ax25_cb *ax25_find_cb(const ax25_address *, ax25_address *, ax25_digi *,
> -		      struct net_device *);
> -void ax25_send_to_raw(ax25_address *, struct sk_buff *, int);
> -void ax25_destroy_socket(ax25_cb *);
> -ax25_cb * __must_check ax25_create_cb(void);
> -void ax25_fillin_cb(ax25_cb *, ax25_dev *);
> -struct sock *ax25_make_new(struct sock *, struct ax25_dev *);
> -
> -/* ax25_addr.c */
> -extern const ax25_address ax25_bcast;
> -extern const ax25_address ax25_defaddr;
> -extern const ax25_address null_ax25_address;
> -char *ax2asc(char *buf, const ax25_address *);
> -void asc2ax(ax25_address *addr, const char *callsign);
> -int ax25cmp(const ax25_address *, const ax25_address *);
> -int ax25digicmp(const ax25_digi *, const ax25_digi *);
> -const unsigned char *ax25_addr_parse(const unsigned char *, int,
> -	ax25_address *, ax25_address *, ax25_digi *, int *, int *);
> -int ax25_addr_build(unsigned char *, const ax25_address *,
> -		    const ax25_address *, const ax25_digi *, int, int);
> -int ax25_addr_size(const ax25_digi *);
> -void ax25_digi_invert(const ax25_digi *, ax25_digi *);
> -
> -/* ax25_dev.c */
> -extern spinlock_t ax25_dev_lock;
> -
> -#if IS_ENABLED(CONFIG_AX25)
> -static inline ax25_dev *ax25_dev_ax25dev(const struct net_device *dev)
> -{
> -	return rcu_dereference_rtnl(dev->ax25_ptr);
> -}
> -#endif
> -
> -ax25_dev *ax25_addr_ax25dev(ax25_address *);
> -void ax25_dev_device_up(struct net_device *);
> -void ax25_dev_device_down(struct net_device *);
> -int ax25_fwd_ioctl(unsigned int, struct ax25_fwd_struct *);
> -struct net_device *ax25_fwd_dev(struct net_device *);
> -void ax25_dev_free(void);
> -
> -/* ax25_ds_in.c */
> -int ax25_ds_frame_in(ax25_cb *, struct sk_buff *, int);
> -
> -/* ax25_ds_subr.c */
> -void ax25_ds_nr_error_recovery(ax25_cb *);
> -void ax25_ds_enquiry_response(ax25_cb *);
> -void ax25_ds_establish_data_link(ax25_cb *);
> -void ax25_dev_dama_off(ax25_dev *);
> -void ax25_dama_on(ax25_cb *);
> -void ax25_dama_off(ax25_cb *);
> -
> -/* ax25_ds_timer.c */
> -void ax25_ds_setup_timer(ax25_dev *);
> -void ax25_ds_set_timer(ax25_dev *);
> -void ax25_ds_del_timer(ax25_dev *);
> -void ax25_ds_timer(ax25_cb *);
> -void ax25_ds_t1_timeout(ax25_cb *);
> -void ax25_ds_heartbeat_expiry(ax25_cb *);
> -void ax25_ds_t3timer_expiry(ax25_cb *);
> -void ax25_ds_idletimer_expiry(ax25_cb *);
> -
> -/* ax25_iface.c */
> -
> -struct ax25_protocol {
> -	struct ax25_protocol *next;
> -	unsigned int pid;
> -	int (*func)(struct sk_buff *, ax25_cb *);
> -};
> -
> -void ax25_register_pid(struct ax25_protocol *ap);
> -void ax25_protocol_release(unsigned int);
> -
> -struct ax25_linkfail {
> -	struct hlist_node lf_node;
> -	void (*func)(ax25_cb *, int);
> -};
> -
> -void ax25_linkfail_register(struct ax25_linkfail *lf);
> -void ax25_linkfail_release(struct ax25_linkfail *lf);
> -int __must_check ax25_listen_register(const ax25_address *,
> -				      struct net_device *);
> -void ax25_listen_release(const ax25_address *, struct net_device *);
> -int(*ax25_protocol_function(unsigned int))(struct sk_buff *, ax25_cb *);
> -int ax25_listen_mine(const ax25_address *, struct net_device *);
> -void ax25_link_failed(ax25_cb *, int);
> -int ax25_protocol_is_registered(unsigned int);
> -
> -/* ax25_in.c */
> -int ax25_rx_iframe(ax25_cb *, struct sk_buff *);
> -int ax25_kiss_rcv(struct sk_buff *, struct net_device *, struct packet_type *,
> -		  struct net_device *);
> -
> -/* ax25_ip.c */
> -netdev_tx_t ax25_ip_xmit(struct sk_buff *skb);
> -extern const struct header_ops ax25_header_ops;
> -
> -/* ax25_out.c */
> -ax25_cb *ax25_send_frame(struct sk_buff *, int, const ax25_address *,
> -			 ax25_address *, ax25_digi *, struct net_device *);
> -void ax25_output(ax25_cb *, int, struct sk_buff *);
> -void ax25_kick(ax25_cb *);
> -void ax25_transmit_buffer(ax25_cb *, struct sk_buff *, int);
> -void ax25_queue_xmit(struct sk_buff *skb, struct net_device *dev);
> -int ax25_check_iframes_acked(ax25_cb *, unsigned short);
> -
> -/* ax25_route.c */
> -void ax25_rt_device_down(struct net_device *);
> -int ax25_rt_ioctl(unsigned int, void __user *);
> -extern const struct seq_operations ax25_rt_seqops;
> -ax25_route *ax25_get_route(ax25_address *addr, struct net_device *dev);
> -struct sk_buff *ax25_rt_build_path(struct sk_buff *, ax25_address *,
> -				   ax25_address *, ax25_digi *);
> -void ax25_rt_free(void);
> -
> -/* ax25_std_in.c */
> -int ax25_std_frame_in(ax25_cb *, struct sk_buff *, int);
> -
> -/* ax25_std_subr.c */
> -void ax25_std_nr_error_recovery(ax25_cb *);
> -void ax25_std_establish_data_link(ax25_cb *);
> -void ax25_std_transmit_enquiry(ax25_cb *);
> -void ax25_std_enquiry_response(ax25_cb *);
> -void ax25_std_timeout_response(ax25_cb *);
> -
> -/* ax25_std_timer.c */
> -void ax25_std_heartbeat_expiry(ax25_cb *);
> -void ax25_std_t1timer_expiry(ax25_cb *);
> -void ax25_std_t2timer_expiry(ax25_cb *);
> -void ax25_std_t3timer_expiry(ax25_cb *);
> -void ax25_std_idletimer_expiry(ax25_cb *);
> -
> -/* ax25_subr.c */
> -void ax25_clear_queues(ax25_cb *);
> -void ax25_frames_acked(ax25_cb *, unsigned short);
> -void ax25_requeue_frames(ax25_cb *);
> -int ax25_validate_nr(ax25_cb *, unsigned short);
> -int ax25_decode(ax25_cb *, struct sk_buff *, int *, int *, int *);
> -void ax25_send_control(ax25_cb *, int, int, int);
> -void ax25_return_dm(struct net_device *, ax25_address *, ax25_address *,
> -		    ax25_digi *);
> -void ax25_calculate_t1(ax25_cb *);
> -void ax25_calculate_rtt(ax25_cb *);
> -void ax25_disconnect(ax25_cb *, int);
> -
> -/* ax25_timer.c */
> -void ax25_setup_timers(ax25_cb *);
> -void ax25_start_heartbeat(ax25_cb *);
> -void ax25_start_t1timer(ax25_cb *);
> -void ax25_start_t2timer(ax25_cb *);
> -void ax25_start_t3timer(ax25_cb *);
> -void ax25_start_idletimer(ax25_cb *);
> -void ax25_stop_heartbeat(ax25_cb *);
> -void ax25_stop_t1timer(ax25_cb *);
> -void ax25_stop_t2timer(ax25_cb *);
> -void ax25_stop_t3timer(ax25_cb *);
> -void ax25_stop_idletimer(ax25_cb *);
> -int ax25_t1timer_running(ax25_cb *);
> -unsigned long ax25_display_timer(struct timer_list *);
> -
> -/* ax25_uid.c */
> -extern int  ax25_uid_policy;
> -ax25_uid_assoc *ax25_findbyuid(kuid_t);
> -int __must_check ax25_uid_ioctl(int, struct sockaddr_ax25 *);
> -extern const struct seq_operations ax25_uid_seqops;
> -void ax25_uid_free(void);
> -
> -/* sysctl_net_ax25.c */
> -#ifdef CONFIG_SYSCTL
> -int ax25_register_dev_sysctl(ax25_dev *ax25_dev);
> -void ax25_unregister_dev_sysctl(ax25_dev *ax25_dev);
> -#else
> -static inline int ax25_register_dev_sysctl(ax25_dev *ax25_dev) { return 0; }
> -static inline void ax25_unregister_dev_sysctl(ax25_dev *ax25_dev) {}
> -#endif /* CONFIG_SYSCTL */
> +#define	AX25_ADDR_LEN	7
> +#define	AX25_P_IP	0xCC
>   
>   #endif
> diff --git a/include/net/netrom.h b/include/net/netrom.h
> deleted file mode 100644
> index f0565a5987d1..000000000000
> --- a/include/net/netrom.h
> +++ /dev/null
> @@ -1,273 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -/*
> - *	Declarations of NET/ROM type objects.
> - *
> - *	Jonathan Naylor G4KLX	9/4/95
> - */
> -
> -#ifndef _NETROM_H
> -#define _NETROM_H
> -
> -#include <linux/netrom.h>
> -#include <linux/list.h>
> -#include <linux/slab.h>
> -#include <net/sock.h>
> -#include <linux/refcount.h>
> -#include <linux/seq_file.h>
> -#include <net/ax25.h>
> -
> -#define	NR_NETWORK_LEN			15
> -#define	NR_TRANSPORT_LEN		5
> -
> -#define	NR_PROTO_IP			0x0C
> -
> -#define	NR_PROTOEXT			0x00
> -#define	NR_CONNREQ			0x01
> -#define	NR_CONNACK			0x02
> -#define	NR_DISCREQ			0x03
> -#define	NR_DISCACK			0x04
> -#define	NR_INFO				0x05
> -#define	NR_INFOACK			0x06
> -#define	NR_RESET			0x07
> -
> -#define	NR_CHOKE_FLAG			0x80
> -#define	NR_NAK_FLAG			0x40
> -#define	NR_MORE_FLAG			0x20
> -
> -/* Define Link State constants. */
> -enum {
> -	NR_STATE_0,
> -	NR_STATE_1,
> -	NR_STATE_2,
> -	NR_STATE_3
> -};
> -
> -#define	NR_COND_ACK_PENDING		0x01
> -#define	NR_COND_REJECT			0x02
> -#define	NR_COND_PEER_RX_BUSY		0x04
> -#define	NR_COND_OWN_RX_BUSY		0x08
> -
> -#define NR_DEFAULT_T1			120000		/* Outstanding frames - 120 seconds */
> -#define NR_DEFAULT_T2			5000		/* Response delay     - 5 seconds */
> -#define NR_DEFAULT_N2			3		/* Number of Retries - 3 */
> -#define	NR_DEFAULT_T4			180000		/* Busy Delay - 180 seconds */
> -#define	NR_DEFAULT_IDLE			0		/* No Activity Timeout - none */
> -#define	NR_DEFAULT_WINDOW		4		/* Default Window Size - 4 */
> -#define	NR_DEFAULT_OBS			6		/* Default Obsolescence Count - 6 */
> -#define	NR_DEFAULT_QUAL			10		/* Default Neighbour Quality - 10 */
> -#define	NR_DEFAULT_TTL			16		/* Default Time To Live - 16 */
> -#define	NR_DEFAULT_ROUTING		1		/* Is routing enabled ? */
> -#define	NR_DEFAULT_FAILS		2		/* Link fails until route fails */
> -#define	NR_DEFAULT_RESET		0		/* Sent / accept reset cmds? */
> -
> -#define NR_MODULUS 			256
> -#define NR_MAX_WINDOW_SIZE		127			/* Maximum Window Allowable - 127 */
> -#define	NR_MAX_PACKET_SIZE		236			/* Maximum Packet Length - 236 */
> -
> -struct nr_sock {
> -	struct sock		sock;
> -	ax25_address		user_addr, source_addr, dest_addr;
> -	struct net_device		*device;
> -	unsigned char		my_index,   my_id;
> -	unsigned char		your_index, your_id;
> -	unsigned char		state, condition, bpqext, window;
> -	unsigned short		vs, vr, va, vl;
> -	unsigned char		n2, n2count;
> -	unsigned long		t1, t2, t4, idle;
> -	unsigned short		fraglen;
> -	struct timer_list	t1timer;
> -	struct timer_list	t2timer;
> -	struct timer_list	t4timer;
> -	struct timer_list	idletimer;
> -	struct sk_buff_head	ack_queue;
> -	struct sk_buff_head	reseq_queue;
> -	struct sk_buff_head	frag_queue;
> -};
> -
> -#define nr_sk(sk) ((struct nr_sock *)(sk))
> -
> -struct nr_neigh {
> -	struct hlist_node	neigh_node;
> -	ax25_address		callsign;
> -	ax25_digi		*digipeat;
> -	ax25_cb			*ax25;
> -	struct net_device	*dev;
> -	unsigned char		quality;
> -	unsigned char		locked;
> -	unsigned short		count;
> -	unsigned int		number;
> -	unsigned char		failed;
> -	refcount_t		refcount;
> -};
> -
> -struct nr_route {
> -	unsigned char   quality;
> -	unsigned char   obs_count;
> -	struct nr_neigh *neighbour;
> -};
> -
> -struct nr_node {
> -	struct hlist_node	node_node;
> -	ax25_address		callsign;
> -	char			mnemonic[7];
> -	unsigned char		which;
> -	unsigned char		count;
> -	struct nr_route		routes[3];
> -	refcount_t		refcount;
> -	spinlock_t		node_lock;
> -};
> -
> -/*********************************************************************
> - *	nr_node & nr_neigh lists, refcounting and locking
> - *********************************************************************/
> -
> -#define nr_node_hold(__nr_node) \
> -	refcount_inc(&((__nr_node)->refcount))
> -
> -static __inline__ void nr_node_put(struct nr_node *nr_node)
> -{
> -	if (refcount_dec_and_test(&nr_node->refcount)) {
> -		kfree(nr_node);
> -	}
> -}
> -
> -#define nr_neigh_hold(__nr_neigh) \
> -	refcount_inc(&((__nr_neigh)->refcount))
> -
> -static __inline__ void nr_neigh_put(struct nr_neigh *nr_neigh)
> -{
> -	if (refcount_dec_and_test(&nr_neigh->refcount)) {
> -		if (nr_neigh->ax25)
> -			ax25_cb_put(nr_neigh->ax25);
> -		kfree(nr_neigh->digipeat);
> -		kfree(nr_neigh);
> -	}
> -}
> -
> -/* nr_node_lock and nr_node_unlock also hold/put the node's refcounter.
> - */
> -static __inline__ void nr_node_lock(struct nr_node *nr_node)
> -{
> -	nr_node_hold(nr_node);
> -	spin_lock_bh(&nr_node->node_lock);
> -}
> -
> -static __inline__ void nr_node_unlock(struct nr_node *nr_node)
> -{
> -	spin_unlock_bh(&nr_node->node_lock);
> -	nr_node_put(nr_node);
> -}
> -
> -#define nr_neigh_for_each(__nr_neigh, list) \
> -	hlist_for_each_entry(__nr_neigh, list, neigh_node)
> -
> -#define nr_neigh_for_each_safe(__nr_neigh, node2, list) \
> -	hlist_for_each_entry_safe(__nr_neigh, node2, list, neigh_node)
> -
> -#define nr_node_for_each(__nr_node, list) \
> -	hlist_for_each_entry(__nr_node, list, node_node)
> -
> -#define nr_node_for_each_safe(__nr_node, node2, list) \
> -	hlist_for_each_entry_safe(__nr_node, node2, list, node_node)
> -
> -
> -/*********************************************************************/
> -
> -/* af_netrom.c */
> -extern int  sysctl_netrom_default_path_quality;
> -extern int  sysctl_netrom_obsolescence_count_initialiser;
> -extern int  sysctl_netrom_network_ttl_initialiser;
> -extern int  sysctl_netrom_transport_timeout;
> -extern int  sysctl_netrom_transport_maximum_tries;
> -extern int  sysctl_netrom_transport_acknowledge_delay;
> -extern int  sysctl_netrom_transport_busy_delay;
> -extern int  sysctl_netrom_transport_requested_window_size;
> -extern int  sysctl_netrom_transport_no_activity_timeout;
> -extern int  sysctl_netrom_routing_control;
> -extern int  sysctl_netrom_link_fails_count;
> -extern int  sysctl_netrom_reset_circuit;
> -
> -int nr_rx_frame(struct sk_buff *, struct net_device *);
> -void nr_destroy_socket(struct sock *);
> -
> -/* nr_dev.c */
> -int nr_rx_ip(struct sk_buff *, struct net_device *);
> -void nr_setup(struct net_device *);
> -
> -/* nr_in.c */
> -int nr_process_rx_frame(struct sock *, struct sk_buff *);
> -
> -/* nr_loopback.c */
> -void nr_loopback_init(void);
> -void nr_loopback_clear(void);
> -int nr_loopback_queue(struct sk_buff *);
> -
> -/* nr_out.c */
> -void nr_output(struct sock *, struct sk_buff *);
> -void nr_send_nak_frame(struct sock *);
> -void nr_kick(struct sock *);
> -void nr_transmit_buffer(struct sock *, struct sk_buff *);
> -void nr_establish_data_link(struct sock *);
> -void nr_enquiry_response(struct sock *);
> -void nr_check_iframes_acked(struct sock *, unsigned short);
> -
> -/* nr_route.c */
> -void nr_rt_device_down(struct net_device *);
> -struct net_device *nr_dev_first(void);
> -struct net_device *nr_dev_get(ax25_address *);
> -int nr_rt_ioctl(unsigned int, void __user *);
> -void nr_link_failed(ax25_cb *, int);
> -int nr_route_frame(struct sk_buff *, ax25_cb *);
> -extern const struct seq_operations nr_node_seqops;
> -extern const struct seq_operations nr_neigh_seqops;
> -void nr_rt_free(void);
> -
> -/* nr_subr.c */
> -void nr_clear_queues(struct sock *);
> -void nr_frames_acked(struct sock *, unsigned short);
> -void nr_requeue_frames(struct sock *);
> -int nr_validate_nr(struct sock *, unsigned short);
> -int nr_in_rx_window(struct sock *, unsigned short);
> -void nr_write_internal(struct sock *, int);
> -
> -void __nr_transmit_reply(struct sk_buff *skb, int mine, unsigned char cmdflags);
> -
> -/*
> - * This routine is called when a Connect Acknowledge with the Choke Flag
> - * set is needed to refuse a connection.
> - */
> -#define nr_transmit_refusal(skb, mine)					\
> -do {									\
> -	__nr_transmit_reply((skb), (mine), NR_CONNACK | NR_CHOKE_FLAG);	\
> -} while (0)
> -
> -/*
> - * This routine is called when we don't have a circuit matching an incoming
> - * NET/ROM packet.  This is an G8PZT Xrouter extension.
> - */
> -#define nr_transmit_reset(skb, mine)					\
> -do {									\
> -	__nr_transmit_reply((skb), (mine), NR_RESET);			\
> -} while (0)
> -
> -void nr_disconnect(struct sock *, int);
> -
> -/* nr_timer.c */
> -void nr_init_timers(struct sock *sk);
> -void nr_start_heartbeat(struct sock *);
> -void nr_start_t1timer(struct sock *);
> -void nr_start_t2timer(struct sock *);
> -void nr_start_t4timer(struct sock *);
> -void nr_start_idletimer(struct sock *);
> -void nr_stop_heartbeat(struct sock *);
> -void nr_stop_t1timer(struct sock *);
> -void nr_stop_t2timer(struct sock *);
> -void nr_stop_t4timer(struct sock *);
> -void nr_stop_idletimer(struct sock *);
> -int nr_t1timer_running(struct sock *);
> -
> -/* sysctl_net_netrom.c */
> -int nr_register_sysctl(void);
> -void nr_unregister_sysctl(void);
> -
> -#endif
> diff --git a/include/net/rose.h b/include/net/rose.h
> index 2b5491bbf39a..41bfcb224f0b 100644
> --- a/include/net/rose.h
> +++ b/include/net/rose.h
> @@ -1,266 +1,7 @@
>   /* SPDX-License-Identifier: GPL-2.0 */
> -/*
> - *	Declarations of Rose type objects.
> - *
> - *	Jonathan Naylor G4KLX	25/8/96
> - */
> -
>   #ifndef _ROSE_H
> -#define _ROSE_H
> +#define _ROSE_H
>   
> -#include <linux/refcount.h>
> -#include <linux/rose.h>
> -#include <net/ax25.h>
> -#include <net/sock.h>
> -
> -#define	ROSE_ADDR_LEN			5
> -
> -#define	ROSE_MIN_LEN			3
> -
> -#define	ROSE_CALL_REQ_ADDR_LEN_OFF	3
> -#define	ROSE_CALL_REQ_ADDR_LEN_VAL	0xAA	/* each address is 10 digits */
> -#define	ROSE_CALL_REQ_DEST_ADDR_OFF	4
> -#define	ROSE_CALL_REQ_SRC_ADDR_OFF	9
> -#define	ROSE_CALL_REQ_FACILITIES_OFF	14
> -
> -#define	ROSE_GFI			0x10
> -#define	ROSE_Q_BIT			0x80
> -#define	ROSE_D_BIT			0x40
> -#define	ROSE_M_BIT			0x10
> -
> -#define	ROSE_CALL_REQUEST		0x0B
> -#define	ROSE_CALL_ACCEPTED		0x0F
> -#define	ROSE_CLEAR_REQUEST		0x13
> -#define	ROSE_CLEAR_CONFIRMATION		0x17
> -#define	ROSE_DATA			0x00
> -#define	ROSE_INTERRUPT			0x23
> -#define	ROSE_INTERRUPT_CONFIRMATION	0x27
> -#define	ROSE_RR				0x01
> -#define	ROSE_RNR			0x05
> -#define	ROSE_REJ			0x09
> -#define	ROSE_RESET_REQUEST		0x1B
> -#define	ROSE_RESET_CONFIRMATION		0x1F
> -#define	ROSE_REGISTRATION_REQUEST	0xF3
> -#define	ROSE_REGISTRATION_CONFIRMATION	0xF7
> -#define	ROSE_RESTART_REQUEST		0xFB
> -#define	ROSE_RESTART_CONFIRMATION	0xFF
> -#define	ROSE_DIAGNOSTIC			0xF1
> -#define	ROSE_ILLEGAL			0xFD
> -
> -/* Define Link State constants. */
> -
> -enum {
> -	ROSE_STATE_0,			/* Ready */
> -	ROSE_STATE_1,			/* Awaiting Call Accepted */
> -	ROSE_STATE_2,			/* Awaiting Clear Confirmation */
> -	ROSE_STATE_3,			/* Data Transfer */
> -	ROSE_STATE_4,			/* Awaiting Reset Confirmation */
> -	ROSE_STATE_5			/* Deferred Call Acceptance */
> -};
> -
> -#define ROSE_DEFAULT_T0			180000		/* Default T10 T20 value */
> -#define ROSE_DEFAULT_T1			200000		/* Default T11 T21 value */
> -#define ROSE_DEFAULT_T2			180000		/* Default T12 T22 value */
> -#define	ROSE_DEFAULT_T3			180000		/* Default T13 T23 value */
> -#define	ROSE_DEFAULT_HB			5000		/* Default Holdback value */
> -#define	ROSE_DEFAULT_IDLE		0		/* No Activity Timeout - none */
> -#define	ROSE_DEFAULT_ROUTING		1		/* Default routing flag */
> -#define	ROSE_DEFAULT_FAIL_TIMEOUT	120000		/* Time until link considered usable */
> -#define	ROSE_DEFAULT_MAXVC		50		/* Maximum number of VCs per neighbour */
> -#define	ROSE_DEFAULT_WINDOW_SIZE	7		/* Default window size */
> -
> -#define ROSE_MODULUS 			8
> -#define	ROSE_MAX_PACKET_SIZE		251		/* Maximum packet size */
> -
> -#define	ROSE_COND_ACK_PENDING		0x01
> -#define	ROSE_COND_PEER_RX_BUSY		0x02
> -#define	ROSE_COND_OWN_RX_BUSY		0x04
> -
> -#define	FAC_NATIONAL			0x00
> -#define	FAC_CCITT			0x0F
> -
> -#define	FAC_NATIONAL_RAND		0x7F
> -#define	FAC_NATIONAL_FLAGS		0x3F
> -#define	FAC_NATIONAL_DEST_DIGI		0xE9
> -#define	FAC_NATIONAL_SRC_DIGI		0xEB
> -#define	FAC_NATIONAL_FAIL_CALL		0xED
> -#define	FAC_NATIONAL_FAIL_ADD		0xEE
> -#define	FAC_NATIONAL_DIGIS			0xEF
> -
> -#define	FAC_CCITT_DEST_NSAP		0xC9
> -#define	FAC_CCITT_SRC_NSAP		0xCB
> -
> -struct rose_neigh {
> -	struct rose_neigh	*next;
> -	ax25_address		callsign;
> -	ax25_digi		*digipeat;
> -	ax25_cb			*ax25;
> -	struct net_device		*dev;
> -	unsigned short		count;
> -	refcount_t		use;
> -	unsigned int		number;
> -	char			restarted;
> -	char			dce_mode;
> -	char			loopback;
> -	struct sk_buff_head	queue;
> -	struct timer_list	t0timer;
> -	struct timer_list	ftimer;
> -};
> -
> -struct rose_node {
> -	struct rose_node	*next;
> -	rose_address		address;
> -	unsigned short		mask;
> -	unsigned char		count;
> -	char			loopback;
> -	struct rose_neigh	*neighbour[3];
> -};
> -
> -struct rose_route {
> -	struct rose_route	*next;
> -	unsigned int		lci1, lci2;
> -	rose_address		src_addr, dest_addr;
> -	ax25_address		src_call, dest_call;
> -	struct rose_neigh 	*neigh1, *neigh2;
> -	unsigned int		rand;
> -};
> -
> -struct rose_sock {
> -	struct sock		sock;
> -	rose_address		source_addr,   dest_addr;
> -	ax25_address		source_call,   dest_call;
> -	unsigned char		source_ndigis, dest_ndigis;
> -	ax25_address		source_digis[ROSE_MAX_DIGIS];
> -	ax25_address		dest_digis[ROSE_MAX_DIGIS];
> -	struct rose_neigh	*neighbour;
> -	struct net_device	*device;
> -	netdevice_tracker	dev_tracker;
> -	unsigned int		lci, rand;
> -	unsigned char		state, condition, qbitincl, defer;
> -	unsigned char		cause, diagnostic;
> -	unsigned short		vs, vr, va, vl;
> -	unsigned long		t1, t2, t3, hb, idle;
> -#ifdef M_BIT
> -	unsigned short		fraglen;
> -	struct sk_buff_head	frag_queue;
> -#endif
> -	struct sk_buff_head	ack_queue;
> -	struct rose_facilities_struct facilities;
> -	struct timer_list	timer;
> -	struct timer_list	idletimer;
> -};
> -
> -#define rose_sk(sk) ((struct rose_sock *)(sk))
> -
> -static inline void rose_neigh_hold(struct rose_neigh *rose_neigh)
> -{
> -	refcount_inc(&rose_neigh->use);
> -}
> -
> -static inline void rose_neigh_put(struct rose_neigh *rose_neigh)
> -{
> -	if (refcount_dec_and_test(&rose_neigh->use)) {
> -		if (rose_neigh->ax25)
> -			ax25_cb_put(rose_neigh->ax25);
> -		kfree(rose_neigh->digipeat);
> -		kfree(rose_neigh);
> -	}
> -}
> -
> -/* af_rose.c */
> -extern ax25_address rose_callsign;
> -extern int  sysctl_rose_restart_request_timeout;
> -extern int  sysctl_rose_call_request_timeout;
> -extern int  sysctl_rose_reset_request_timeout;
> -extern int  sysctl_rose_clear_request_timeout;
> -extern int  sysctl_rose_no_activity_timeout;
> -extern int  sysctl_rose_ack_hold_back_timeout;
> -extern int  sysctl_rose_routing_control;
> -extern int  sysctl_rose_link_fail_timeout;
> -extern int  sysctl_rose_maximum_vcs;
> -extern int  sysctl_rose_window_size;
> -
> -int rosecmp(const rose_address *, const rose_address *);
> -int rosecmpm(const rose_address *, const rose_address *, unsigned short);
> -char *rose2asc(char *buf, const rose_address *);
> -struct sock *rose_find_socket(unsigned int, struct rose_neigh *);
> -void rose_kill_by_neigh(struct rose_neigh *);
> -unsigned int rose_new_lci(struct rose_neigh *);
> -int rose_rx_call_request(struct sk_buff *, struct net_device *,
> -			 struct rose_neigh *, unsigned int);
> -void rose_destroy_socket(struct sock *);
> -
> -/* rose_dev.c */
> -void rose_setup(struct net_device *);
> -
> -/* rose_in.c */
> -int rose_process_rx_frame(struct sock *, struct sk_buff *);
> -
> -/* rose_link.c */
> -void rose_start_ftimer(struct rose_neigh *);
> -void rose_stop_ftimer(struct rose_neigh *);
> -void rose_stop_t0timer(struct rose_neigh *);
> -int rose_ftimer_running(struct rose_neigh *);
> -void rose_link_rx_restart(struct sk_buff *, struct rose_neigh *,
> -			  unsigned short);
> -void rose_transmit_clear_request(struct rose_neigh *, unsigned int,
> -				 unsigned char, unsigned char);
> -void rose_transmit_link(struct sk_buff *, struct rose_neigh *);
> -
> -/* rose_loopback.c */
> -void rose_loopback_init(void);
> -void rose_loopback_clear(void);
> -int rose_loopback_queue(struct sk_buff *, struct rose_neigh *);
> -
> -/* rose_out.c */
> -void rose_kick(struct sock *);
> -void rose_enquiry_response(struct sock *);
> -
> -/* rose_route.c */
> -extern struct rose_neigh *rose_loopback_neigh;
> -extern const struct seq_operations rose_neigh_seqops;
> -extern const struct seq_operations rose_node_seqops;
> -extern struct seq_operations rose_route_seqops;
> -
> -void rose_add_loopback_neigh(void);
> -int __must_check rose_add_loopback_node(const rose_address *);
> -void rose_del_loopback_node(const rose_address *);
> -void rose_rt_device_down(struct net_device *);
> -void rose_link_device_down(struct net_device *);
> -struct net_device *rose_dev_first(void);
> -struct net_device *rose_dev_get(rose_address *);
> -struct rose_route *rose_route_free_lci(unsigned int, struct rose_neigh *);
> -struct rose_neigh *rose_get_neigh(rose_address *, unsigned char *,
> -				  unsigned char *, int);
> -int rose_rt_ioctl(unsigned int, void __user *);
> -void rose_link_failed(ax25_cb *, int);
> -int rose_route_frame(struct sk_buff *, ax25_cb *);
> -void rose_rt_free(void);
> -
> -/* rose_subr.c */
> -void rose_clear_queues(struct sock *);
> -void rose_frames_acked(struct sock *, unsigned short);
> -void rose_requeue_frames(struct sock *);
> -int rose_validate_nr(struct sock *, unsigned short);
> -void rose_write_internal(struct sock *, int);
> -int rose_decode(struct sk_buff *, int *, int *, int *, int *, int *);
> -int rose_parse_facilities(unsigned char *, unsigned int,
> -			  struct rose_facilities_struct *);
> -void rose_disconnect(struct sock *, int, int, int);
> -
> -/* rose_timer.c */
> -void rose_start_heartbeat(struct sock *);
> -void rose_start_t1timer(struct sock *);
> -void rose_start_t2timer(struct sock *);
> -void rose_start_t3timer(struct sock *);
> -void rose_start_hbtimer(struct sock *);
> -void rose_start_idletimer(struct sock *);
> -void rose_stop_heartbeat(struct sock *);
> -void rose_stop_timer(struct sock *);
> -void rose_stop_idletimer(struct sock *);
> -
> -/* sysctl_net_rose.c */
> -void rose_register_sysctl(void);
> -void rose_unregister_sysctl(void);
> +#define	ROSE_ADDR_LEN	5
>   
>   #endif
> diff --git a/include/uapi/linux/baycom.h b/include/uapi/linux/baycom.h
> deleted file mode 100644
> index 478cb565ae52..000000000000
> --- a/include/uapi/linux/baycom.h
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> -/*
> - * The Linux BAYCOM driver for the Baycom serial 1200 baud modem
> - * and the parallel 9600 baud modem
> - * (C) 1997-1998 by Thomas Sailer, HB9JNX/AE4WA
> - */
> -
> -#ifndef _BAYCOM_H
> -#define _BAYCOM_H
> -
> -/* -------------------------------------------------------------------- */
> -/*
> - * structs for the IOCTL commands
> - */
> -
> -struct baycom_debug_data {
> -	unsigned long debug1;
> -	unsigned long debug2;
> -	long debug3;
> -};
> -
> -struct baycom_ioctl {
> -	int cmd;
> -	union {
> -		struct baycom_debug_data dbg;
> -	} data;
> -};
> -
> -/* -------------------------------------------------------------------- */
> -
> -/*
> - * ioctl values change for baycom
> - */
> -#define BAYCOMCTL_GETDEBUG       0x92
> -
> -/* -------------------------------------------------------------------- */
> -
> -#endif /* _BAYCOM_H */
> -
> -/* --------------------------------------------------------------------- */
> diff --git a/include/uapi/linux/hdlcdrv.h b/include/uapi/linux/hdlcdrv.h
> deleted file mode 100644
> index 9fe9499403a6..000000000000
> --- a/include/uapi/linux/hdlcdrv.h
> +++ /dev/null
> @@ -1,111 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> -/*
> - * hdlcdrv.h  -- HDLC packet radio network driver.
> - * The Linux soundcard driver for 1200 baud and 9600 baud packet radio
> - * (C) 1996-1998 by Thomas Sailer, HB9JNX/AE4WA
> - */
> -
> -#ifndef _UAPI_HDLCDRV_H
> -#define _UAPI_HDLCDRV_H
> -
> -/* -------------------------------------------------------------------- */
> -/*
> - * structs for the IOCTL commands
> - */
> -
> -struct hdlcdrv_params {
> -	int iobase;
> -	int irq;
> -	int dma;
> -	int dma2;
> -	int seriobase;
> -	int pariobase;
> -	int midiiobase;
> -};	
> -
> -struct hdlcdrv_channel_params {
> -	int tx_delay;  /* the transmitter keyup delay in 10ms units */
> -	int tx_tail;   /* the transmitter keyoff delay in 10ms units */
> -	int slottime;  /* the slottime in 10ms; usually 10 = 100ms */
> -	int ppersist;  /* the p-persistence 0..255 */
> -	int fulldup;   /* some driver do not support full duplex, setting */
> -	               /* this just makes them send even if DCD is on */
> -};	
> -
> -struct hdlcdrv_old_channel_state {
> -  	int ptt;
> -  	int dcd;
> -  	int ptt_keyed;
> -};
> -
> -struct hdlcdrv_channel_state {
> - 	int ptt;
> - 	int dcd;
> - 	int ptt_keyed;
> - 	unsigned long tx_packets;
> - 	unsigned long tx_errors;
> - 	unsigned long rx_packets;
> - 	unsigned long rx_errors;
> -};
> -
> -struct hdlcdrv_ioctl {
> -	int cmd;
> -	union {
> -		struct hdlcdrv_params mp;
> -		struct hdlcdrv_channel_params cp;
> -		struct hdlcdrv_channel_state cs;
> -		struct hdlcdrv_old_channel_state ocs;
> -		unsigned int calibrate;
> -		unsigned char bits;
> -		char modename[128];
> -		char drivername[32];
> -	} data;
> -};
> -
> -/* -------------------------------------------------------------------- */
> -
> -/*
> - * ioctl values
> - */
> -#define HDLCDRVCTL_GETMODEMPAR       0
> -#define HDLCDRVCTL_SETMODEMPAR       1
> -#define HDLCDRVCTL_MODEMPARMASK      2  /* not handled by hdlcdrv */
> -#define HDLCDRVCTL_GETCHANNELPAR    10
> -#define HDLCDRVCTL_SETCHANNELPAR    11
> -#define HDLCDRVCTL_OLDGETSTAT       20
> -#define HDLCDRVCTL_CALIBRATE        21
> -#define HDLCDRVCTL_GETSTAT          22
> -
> -/*
> - * these are mainly for debugging purposes
> - */
> -#define HDLCDRVCTL_GETSAMPLES       30
> -#define HDLCDRVCTL_GETBITS          31
> -
> -/*
> - * not handled by hdlcdrv, but by its depending drivers
> - */
> -#define HDLCDRVCTL_GETMODE          40
> -#define HDLCDRVCTL_SETMODE          41
> -#define HDLCDRVCTL_MODELIST         42
> -#define HDLCDRVCTL_DRIVERNAME       43
> -
> -/*
> - * mask of needed modem parameters, returned by HDLCDRVCTL_MODEMPARMASK
> - */
> -#define HDLCDRV_PARMASK_IOBASE      (1<<0)
> -#define HDLCDRV_PARMASK_IRQ         (1<<1)
> -#define HDLCDRV_PARMASK_DMA         (1<<2)
> -#define HDLCDRV_PARMASK_DMA2        (1<<3)
> -#define HDLCDRV_PARMASK_SERIOBASE   (1<<4)
> -#define HDLCDRV_PARMASK_PARIOBASE   (1<<5)
> -#define HDLCDRV_PARMASK_MIDIIOBASE  (1<<6)
> -
> -/* -------------------------------------------------------------------- */
> -
> -
> -/* -------------------------------------------------------------------- */
> -
> -#endif /* _UAPI_HDLCDRV_H */
> -
> -/* -------------------------------------------------------------------- */
> diff --git a/include/uapi/linux/netrom.h b/include/uapi/linux/netrom.h
> deleted file mode 100644
> index 7498ea3c3940..000000000000
> --- a/include/uapi/linux/netrom.h
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> -/*
> - * These are the public elements of the Linux kernel NET/ROM implementation.
> - * For kernel AX.25 see the file ax25.h. This file requires ax25.h for the
> - * definition of the ax25_address structure.
> - */
> -
> -#ifndef	NETROM_KERNEL_H
> -#define	NETROM_KERNEL_H
> -
> -#include <linux/ax25.h>
> -
> -#define NETROM_MTU	236
> -
> -#define NETROM_T1	1
> -#define NETROM_T2	2
> -#define NETROM_N2	3
> -#define	NETROM_T4	6
> -#define	NETROM_IDLE	7
> -
> -#define	SIOCNRDECOBS		(SIOCPROTOPRIVATE+2)
> -
> -struct nr_route_struct {
> -#define	NETROM_NEIGH	0
> -#define	NETROM_NODE	1
> -	int		type;
> -	ax25_address	callsign;
> -	char		device[16];
> -	unsigned int	quality;
> -	char		mnemonic[7];
> -	ax25_address	neighbour;
> -	unsigned int	obs_count;
> -	unsigned int	ndigis;
> -	ax25_address	digipeaters[AX25_MAX_DIGIS];
> -};
> -
> -#endif
> diff --git a/include/uapi/linux/rose.h b/include/uapi/linux/rose.h
> deleted file mode 100644
> index 19aa4693c8fc..000000000000
> --- a/include/uapi/linux/rose.h
> +++ /dev/null
> @@ -1,91 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> -/*
> - * These are the public elements of the Linux kernel Rose implementation.
> - * For kernel AX.25 see the file ax25.h. This file requires ax25.h for the
> - * definition of the ax25_address structure.
> - */
> -
> -#ifndef	ROSE_KERNEL_H
> -#define	ROSE_KERNEL_H
> -
> -#include <linux/socket.h>
> -#include <linux/ax25.h>
> -
> -#define ROSE_MTU	251
> -
> -#define ROSE_MAX_DIGIS 6
> -
> -#define	ROSE_DEFER	1
> -#define ROSE_T1		2
> -#define	ROSE_T2		3
> -#define	ROSE_T3		4
> -#define	ROSE_IDLE	5
> -#define	ROSE_QBITINCL	6
> -#define	ROSE_HOLDBACK	7
> -
> -#define	SIOCRSGCAUSE		(SIOCPROTOPRIVATE+0)
> -#define	SIOCRSSCAUSE		(SIOCPROTOPRIVATE+1)
> -#define	SIOCRSL2CALL		(SIOCPROTOPRIVATE+2)
> -#define	SIOCRSSL2CALL		(SIOCPROTOPRIVATE+2)
> -#define	SIOCRSACCEPT		(SIOCPROTOPRIVATE+3)
> -#define	SIOCRSCLRRT		(SIOCPROTOPRIVATE+4)
> -#define	SIOCRSGL2CALL		(SIOCPROTOPRIVATE+5)
> -#define	SIOCRSGFACILITIES	(SIOCPROTOPRIVATE+6)
> -
> -#define	ROSE_DTE_ORIGINATED	0x00
> -#define	ROSE_NUMBER_BUSY	0x01
> -#define	ROSE_INVALID_FACILITY	0x03
> -#define	ROSE_NETWORK_CONGESTION	0x05
> -#define	ROSE_OUT_OF_ORDER	0x09
> -#define	ROSE_ACCESS_BARRED	0x0B
> -#define	ROSE_NOT_OBTAINABLE	0x0D
> -#define	ROSE_REMOTE_PROCEDURE	0x11
> -#define	ROSE_LOCAL_PROCEDURE	0x13
> -#define	ROSE_SHIP_ABSENT	0x39
> -
> -typedef struct {
> -	char		rose_addr[5];
> -} rose_address;
> -
> -struct sockaddr_rose {
> -	__kernel_sa_family_t srose_family;
> -	rose_address	srose_addr;
> -	ax25_address	srose_call;
> -	int		srose_ndigis;
> -	ax25_address	srose_digi;
> -};
> -
> -struct full_sockaddr_rose {
> -	__kernel_sa_family_t srose_family;
> -	rose_address	srose_addr;
> -	ax25_address	srose_call;
> -	unsigned int	srose_ndigis;
> -	ax25_address	srose_digis[ROSE_MAX_DIGIS];
> -};
> -
> -struct rose_route_struct {
> -	rose_address	address;
> -	unsigned short	mask;
> -	ax25_address	neighbour;
> -	char		device[16];
> -	unsigned char	ndigis;
> -	ax25_address	digipeaters[AX25_MAX_DIGIS];
> -};
> -
> -struct rose_cause_struct {
> -	unsigned char	cause;
> -	unsigned char	diagnostic;
> -};
> -
> -struct rose_facilities_struct {
> -	rose_address	source_addr,   dest_addr;
> -	ax25_address	source_call,   dest_call;
> -	unsigned char	source_ndigis, dest_ndigis;
> -	ax25_address	source_digis[ROSE_MAX_DIGIS];
> -	ax25_address	dest_digis[ROSE_MAX_DIGIS];
> -	unsigned int	rand;
> -	rose_address	fail_addr;
> -	ax25_address	fail_call;
> -};
> -
> -#endif
> diff --git a/include/uapi/linux/scc.h b/include/uapi/linux/scc.h
> deleted file mode 100644
> index 947edb17ce9d..000000000000
> --- a/include/uapi/linux/scc.h
> +++ /dev/null
> @@ -1,174 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> -/* $Id: scc.h,v 1.29 1997/04/02 14:56:45 jreuter Exp jreuter $ */
> -
> -#ifndef _UAPI_SCC_H
> -#define _UAPI_SCC_H
> -
> -#include <linux/sockios.h>
> -
> -/* selection of hardware types */
> -
> -#define PA0HZP		0x00	/* hardware type for PA0HZP SCC card and compatible */
> -#define EAGLE		0x01    /* hardware type for EAGLE card */
> -#define PC100		0x02	/* hardware type for PC100 card */
> -#define PRIMUS		0x04	/* hardware type for PRIMUS-PC (DG9BL) card */
> -#define DRSI		0x08	/* hardware type for DRSI PC*Packet card */
> -#define BAYCOM		0x10	/* hardware type for BayCom (U)SCC */
> -
> -/* DEV ioctl() commands */
> -
> -enum SCC_ioctl_cmds {
> -	SIOCSCCRESERVED = SIOCDEVPRIVATE,
> -	SIOCSCCCFG,
> -	SIOCSCCINI,
> -	SIOCSCCCHANINI,
> -	SIOCSCCSMEM,
> -	SIOCSCCGKISS,
> -	SIOCSCCSKISS,
> -	SIOCSCCGSTAT,
> -	SIOCSCCCAL
> -};
> -
> -/* Device parameter control (from WAMPES) */
> -
> -enum L1_params {
> -	PARAM_DATA,
> -	PARAM_TXDELAY,
> -	PARAM_PERSIST,
> -	PARAM_SLOTTIME,
> -	PARAM_TXTAIL,
> -	PARAM_FULLDUP,
> -	PARAM_SOFTDCD,		/* was: PARAM_HW */
> -	PARAM_MUTE,		/* ??? */
> -	PARAM_DTR,
> -	PARAM_RTS,
> -	PARAM_SPEED,
> -	PARAM_ENDDELAY,		/* ??? */
> -	PARAM_GROUP,
> -	PARAM_IDLE,
> -	PARAM_MIN,
> -	PARAM_MAXKEY,
> -	PARAM_WAIT,
> -	PARAM_MAXDEFER,
> -	PARAM_TX,
> -	PARAM_HWEVENT = 31,
> -	PARAM_RETURN = 255	/* reset kiss mode */
> -};
> -
> -/* fulldup parameter */
> -
> -enum FULLDUP_modes {
> -	KISS_DUPLEX_HALF,	/* normal CSMA operation */
> -	KISS_DUPLEX_FULL,	/* fullduplex, key down trx after transmission */
> -	KISS_DUPLEX_LINK,	/* fullduplex, key down trx after 'idletime' sec */
> -	KISS_DUPLEX_OPTIMA	/* fullduplex, let the protocol layer control the hw */
> -};
> -
> -/* misc. parameters */
> -
> -#define TIMER_OFF	65535U	/* to switch off timers */
> -#define NO_SUCH_PARAM	65534U	/* param not implemented */
> -
> -/* HWEVENT parameter */
> -
> -enum HWEVENT_opts {
> -	HWEV_DCD_ON,
> -	HWEV_DCD_OFF,
> -	HWEV_ALL_SENT
> -};
> -
> -/* channel grouping */
> -
> -#define RXGROUP		0100	/* if set, only tx when all channels clear */
> -#define TXGROUP		0200	/* if set, don't transmit simultaneously */
> -
> -/* Tx/Rx clock sources */
> -
> -enum CLOCK_sources {
> -	CLK_DPLL,	/* normal halfduplex operation */
> -	CLK_EXTERNAL,	/* external clocking (G3RUH/DF9IC modems) */
> -	CLK_DIVIDER,	/* Rx = DPLL, Tx = divider (fullduplex with */
> -			/* modems without clock regeneration */
> -	CLK_BRG		/* experimental fullduplex mode with DPLL/BRG for */
> -			/* MODEMs without clock recovery */
> -};
> -
> -/* Tx state */
> -
> -enum TX_state {
> -	TXS_IDLE,	/* Transmitter off, no data pending */
> -	TXS_BUSY,	/* waiting for permission to send / tailtime */
> -	TXS_ACTIVE,	/* Transmitter on, sending data */
> -	TXS_NEWFRAME,	/* reset CRC and send (next) frame */
> -	TXS_IDLE2,	/* Transmitter on, no data pending */
> -	TXS_WAIT,	/* Waiting for Mintime to expire */
> -	TXS_TIMEOUT	/* We had a transmission timeout */
> -};
> -
> -typedef unsigned long io_port;	/* type definition for an 'io port address' */
> -
> -/* SCC statistical information */
> -
> -struct scc_stat {
> -        long rxints;            /* Receiver interrupts */
> -        long txints;            /* Transmitter interrupts */
> -        long exints;            /* External/status interrupts */
> -        long spints;            /* Special receiver interrupts */
> -
> -        long txframes;          /* Packets sent */
> -        long rxframes;          /* Number of Frames Actually Received */
> -        long rxerrs;            /* CRC Errors */
> -        long txerrs;		/* KISS errors */
> -
> -	unsigned int nospace;	/* "Out of buffers" */
> -	unsigned int rx_over;	/* Receiver Overruns */
> -	unsigned int tx_under;	/* Transmitter Underruns */
> -
> -	unsigned int tx_state;	/* Transmitter state */
> -	int tx_queued;		/* tx frames enqueued */
> -
> -	unsigned int maxqueue;	/* allocated tx_buffers */
> -	unsigned int bufsize;	/* used buffersize */
> -};
> -
> -struct scc_modem {
> -	long speed;		/* Line speed, bps */
> -	char clocksrc;		/* 0 = DPLL, 1 = external, 2 = divider */
> -	char nrz;		/* NRZ instead of NRZI */	
> -};
> -
> -struct scc_kiss_cmd {
> -	int  	 command;	/* one of the KISS-Commands defined above */
> -	unsigned param;		/* KISS-Param */
> -};
> -
> -struct scc_hw_config {
> -	io_port data_a;		/* data port channel A */
> -	io_port ctrl_a;		/* control port channel A */
> -	io_port data_b;		/* data port channel B */
> -	io_port ctrl_b;		/* control port channel B */
> -	io_port vector_latch;	/* INTACK-Latch (#) */
> -	io_port	special;	/* special function port */
> -
> -	int	irq;		/* irq */
> -	long	clock;		/* clock */
> -	char	option;		/* command for function port */
> -
> -	char brand;		/* hardware type */
> -	char escc;		/* use ext. features of a 8580/85180/85280 */
> -};
> -
> -/* (#) only one INTACK latch allowed. */
> -
> -
> -struct scc_mem_config {
> -	unsigned int dummy;
> -	unsigned int bufsize;
> -};
> -
> -struct scc_calibrate {
> -	unsigned int time;
> -	unsigned char pattern;
> -};
> -
> -#endif /* _UAPI_SCC_H */
> diff --git a/drivers/net/hamradio/6pack.c b/drivers/net/hamradio/6pack.c
> deleted file mode 100644
> index c8b2dc5c1bec..000000000000
> --- a/drivers/net/hamradio/6pack.c
> +++ /dev/null
> @@ -1,912 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-only
> -/*
> - * 6pack.c	This module implements the 6pack protocol for kernel-based
> - *		devices like TTY. It interfaces between a raw TTY and the
> - *		kernel's AX.25 protocol layers.
> - *
> - * Authors:	Andreas Könsgen <ajk@comnets.uni-bremen.de>
> - *              Ralf Baechle DL5RB <ralf@linux-mips.org>
> - *
> - * Quite a lot of stuff "stolen" by Joerg Reuter from slip.c, written by
> - *
> - *		Laurence Culhane, <loz@holmes.demon.co.uk>
> - *		Fred N. van Kempen, <waltje@uwalt.nl.mugnet.org>
> - */
> -
> -#include <linux/module.h>
> -#include <linux/uaccess.h>
> -#include <linux/bitops.h>
> -#include <linux/string.h>
> -#include <linux/mm.h>
> -#include <linux/interrupt.h>
> -#include <linux/in.h>
> -#include <linux/tty.h>
> -#include <linux/errno.h>
> -#include <linux/netdevice.h>
> -#include <linux/timer.h>
> -#include <linux/slab.h>
> -#include <net/ax25.h>
> -#include <linux/etherdevice.h>
> -#include <linux/skbuff.h>
> -#include <linux/rtnetlink.h>
> -#include <linux/spinlock.h>
> -#include <linux/if_arp.h>
> -#include <linux/init.h>
> -#include <linux/ip.h>
> -#include <linux/tcp.h>
> -#include <linux/semaphore.h>
> -#include <linux/refcount.h>
> -
> -/* sixpack priority commands */
> -#define SIXP_SEOF		0x40	/* start and end of a 6pack frame */
> -#define SIXP_TX_URUN		0x48	/* transmit overrun */
> -#define SIXP_RX_ORUN		0x50	/* receive overrun */
> -#define SIXP_RX_BUF_OVL		0x58	/* receive buffer overflow */
> -
> -#define SIXP_CHKSUM		0xFF	/* valid checksum of a 6pack frame */
> -
> -/* masks to get certain bits out of the status bytes sent by the TNC */
> -
> -#define SIXP_CMD_MASK		0xC0
> -#define SIXP_CHN_MASK		0x07
> -#define SIXP_PRIO_CMD_MASK	0x80
> -#define SIXP_STD_CMD_MASK	0x40
> -#define SIXP_PRIO_DATA_MASK	0x38
> -#define SIXP_TX_MASK		0x20
> -#define SIXP_RX_MASK		0x10
> -#define SIXP_RX_DCD_MASK	0x18
> -#define SIXP_LEDS_ON		0x78
> -#define SIXP_LEDS_OFF		0x60
> -#define SIXP_CON		0x08
> -#define SIXP_STA		0x10
> -
> -#define SIXP_FOUND_TNC		0xe9
> -#define SIXP_CON_ON		0x68
> -#define SIXP_DCD_MASK		0x08
> -#define SIXP_DAMA_OFF		0
> -
> -/* default level 2 parameters */
> -#define SIXP_TXDELAY			25	/* 250 ms */
> -#define SIXP_PERSIST			50	/* in 256ths */
> -#define SIXP_SLOTTIME			10	/* 100 ms */
> -#define SIXP_INIT_RESYNC_TIMEOUT	(3*HZ/2) /* in 1 s */
> -#define SIXP_RESYNC_TIMEOUT		5*HZ	/* in 1 s */
> -
> -/* 6pack configuration. */
> -#define SIXP_NRUNIT			31      /* MAX number of 6pack channels */
> -#define SIXP_MTU			256	/* Default MTU */
> -
> -enum sixpack_flags {
> -	SIXPF_ERROR,	/* Parity, etc. error	*/
> -};
> -
> -struct sixpack {
> -	/* Various fields. */
> -	struct tty_struct	*tty;		/* ptr to TTY structure	*/
> -	struct net_device	*dev;		/* easy for intr handling  */
> -
> -	/* These are pointers to the malloc()ed frame buffers. */
> -	int			rcount;         /* received chars counter  */
> -	unsigned char		*xbuff;		/* transmitter buffer	*/
> -	unsigned char		*xhead;         /* next byte to XMIT */
> -	int			xleft;          /* bytes left in XMIT queue  */
> -
> -	u8			raw_buf[4];
> -	u8			cooked_buf[400];
> -
> -	unsigned int		rx_count;
> -	unsigned int		rx_count_cooked;
> -	spinlock_t		rxlock;
> -
> -	unsigned long		flags;		/* Flag values/ mode etc */
> -	unsigned char		mode;		/* 6pack mode */
> -
> -	/* 6pack stuff */
> -	unsigned char		tx_delay;
> -	unsigned char		persistence;
> -	unsigned char		slottime;
> -	unsigned char		duplex;
> -	unsigned char		led_state;
> -	u8			status;
> -	u8			status1;
> -	unsigned char		status2;
> -	unsigned char		tx_enable;
> -	unsigned char		tnc_state;
> -
> -	struct timer_list	tx_t;
> -	struct timer_list	resync_t;
> -	spinlock_t		lock;
> -};
> -
> -#define AX25_6PACK_HEADER_LEN 0
> -
> -static void sixpack_decode(struct sixpack *, const u8 *, size_t);
> -static int encode_sixpack(unsigned char *, unsigned char *, int, unsigned char);
> -
> -/*
> - * Perform the persistence/slottime algorithm for CSMA access. If the
> - * persistence check was successful, write the data to the serial driver.
> - * Note that in case of DAMA operation, the data is not sent here.
> - */
> -
> -static void sp_xmit_on_air(struct timer_list *t)
> -{
> -	struct sixpack *sp = timer_container_of(sp, t, tx_t);
> -	int actual, when = sp->slottime;
> -	static unsigned char random;
> -
> -	random = random * 17 + 41;
> -
> -	if (((sp->status1 & SIXP_DCD_MASK) == 0) && (random < sp->persistence)) {
> -		sp->led_state = 0x70;
> -		sp->tty->ops->write(sp->tty, &sp->led_state, 1);
> -		sp->tx_enable = 1;
> -		actual = sp->tty->ops->write(sp->tty, sp->xbuff, sp->status2);
> -		sp->xleft -= actual;
> -		sp->xhead += actual;
> -		sp->led_state = 0x60;
> -		sp->tty->ops->write(sp->tty, &sp->led_state, 1);
> -		sp->status2 = 0;
> -	} else
> -		mod_timer(&sp->tx_t, jiffies + ((when + 1) * HZ) / 100);
> -}
> -
> -/* ----> 6pack timer interrupt handler and friends. <---- */
> -
> -/* Encapsulate one AX.25 frame and stuff into a TTY queue. */
> -static void sp_encaps(struct sixpack *sp, unsigned char *icp, int len)
> -{
> -	unsigned char *msg, *p = icp;
> -	int actual, count;
> -
> -	if (len > AX25_MTU + 73) {
> -		msg = "oversized transmit packet!";
> -		goto out_drop;
> -	}
> -
> -	if (p[0] > 5) {
> -		msg = "invalid KISS command";
> -		goto out_drop;
> -	}
> -
> -	if ((p[0] != 0) && (len > 2)) {
> -		msg = "KISS control packet too long";
> -		goto out_drop;
> -	}
> -
> -	if ((p[0] == 0) && (len < 15)) {
> -		msg = "bad AX.25 packet to transmit";
> -		goto out_drop;
> -	}
> -
> -	count = encode_sixpack(p, sp->xbuff, len, sp->tx_delay);
> -	set_bit(TTY_DO_WRITE_WAKEUP, &sp->tty->flags);
> -
> -	switch (p[0]) {
> -	case 1:	sp->tx_delay = p[1];
> -		return;
> -	case 2:	sp->persistence = p[1];
> -		return;
> -	case 3:	sp->slottime = p[1];
> -		return;
> -	case 4:	/* ignored */
> -		return;
> -	case 5:	sp->duplex = p[1];
> -		return;
> -	}
> -
> -	if (p[0] != 0)
> -		return;
> -
> -	/*
> -	 * In case of fullduplex or DAMA operation, we don't take care about the
> -	 * state of the DCD or of any timers, as the determination of the
> -	 * correct time to send is the job of the AX.25 layer. We send
> -	 * immediately after data has arrived.
> -	 */
> -	if (sp->duplex == 1) {
> -		sp->led_state = 0x70;
> -		sp->tty->ops->write(sp->tty, &sp->led_state, 1);
> -		sp->tx_enable = 1;
> -		actual = sp->tty->ops->write(sp->tty, sp->xbuff, count);
> -		sp->xleft = count - actual;
> -		sp->xhead = sp->xbuff + actual;
> -		sp->led_state = 0x60;
> -		sp->tty->ops->write(sp->tty, &sp->led_state, 1);
> -	} else {
> -		sp->xleft = count;
> -		sp->xhead = sp->xbuff;
> -		sp->status2 = count;
> -		sp_xmit_on_air(&sp->tx_t);
> -	}
> -
> -	return;
> -
> -out_drop:
> -	sp->dev->stats.tx_dropped++;
> -	netif_start_queue(sp->dev);
> -	if (net_ratelimit())
> -		printk(KERN_DEBUG "%s: %s - dropped.\n", sp->dev->name, msg);
> -}
> -
> -/* Encapsulate an IP datagram and kick it into a TTY queue. */
> -
> -static netdev_tx_t sp_xmit(struct sk_buff *skb, struct net_device *dev)
> -{
> -	struct sixpack *sp = netdev_priv(dev);
> -
> -	if (skb->protocol == htons(ETH_P_IP))
> -		return ax25_ip_xmit(skb);
> -
> -	spin_lock_bh(&sp->lock);
> -	/* We were not busy, so we are now... :-) */
> -	netif_stop_queue(dev);
> -	dev->stats.tx_bytes += skb->len;
> -	sp_encaps(sp, skb->data, skb->len);
> -	spin_unlock_bh(&sp->lock);
> -
> -	dev_kfree_skb(skb);
> -
> -	return NETDEV_TX_OK;
> -}
> -
> -static int sp_open_dev(struct net_device *dev)
> -{
> -	struct sixpack *sp = netdev_priv(dev);
> -
> -	if (sp->tty == NULL)
> -		return -ENODEV;
> -	return 0;
> -}
> -
> -/* Close the low-level part of the 6pack channel. */
> -static int sp_close(struct net_device *dev)
> -{
> -	struct sixpack *sp = netdev_priv(dev);
> -
> -	spin_lock_bh(&sp->lock);
> -	if (sp->tty) {
> -		/* TTY discipline is running. */
> -		clear_bit(TTY_DO_WRITE_WAKEUP, &sp->tty->flags);
> -	}
> -	netif_stop_queue(dev);
> -	spin_unlock_bh(&sp->lock);
> -
> -	return 0;
> -}
> -
> -static int sp_set_mac_address(struct net_device *dev, void *addr)
> -{
> -	struct sockaddr_ax25 *sa = addr;
> -
> -	netif_tx_lock_bh(dev);
> -	netif_addr_lock(dev);
> -	__dev_addr_set(dev, &sa->sax25_call, AX25_ADDR_LEN);
> -	netif_addr_unlock(dev);
> -	netif_tx_unlock_bh(dev);
> -
> -	return 0;
> -}
> -
> -static const struct net_device_ops sp_netdev_ops = {
> -	.ndo_open		= sp_open_dev,
> -	.ndo_stop		= sp_close,
> -	.ndo_start_xmit		= sp_xmit,
> -	.ndo_set_mac_address    = sp_set_mac_address,
> -};
> -
> -static void sp_setup(struct net_device *dev)
> -{
> -	/* Finish setting up the DEVICE info. */
> -	dev->netdev_ops		= &sp_netdev_ops;
> -	dev->mtu		= SIXP_MTU;
> -	dev->hard_header_len	= AX25_MAX_HEADER_LEN;
> -	dev->header_ops 	= &ax25_header_ops;
> -
> -	dev->addr_len		= AX25_ADDR_LEN;
> -	dev->type		= ARPHRD_AX25;
> -	dev->tx_queue_len	= 10;
> -
> -	/* Only activated in AX.25 mode */
> -	memcpy(dev->broadcast, &ax25_bcast, AX25_ADDR_LEN);
> -	dev_addr_set(dev, (u8 *)&ax25_defaddr);
> -
> -	dev->flags		= 0;
> -}
> -
> -/* Send one completely decapsulated IP datagram to the IP layer. */
> -
> -/*
> - * This is the routine that sends the received data to the kernel AX.25.
> - * 'cmd' is the KISS command. For AX.25 data, it is zero.
> - */
> -
> -static void sp_bump(struct sixpack *sp, char cmd)
> -{
> -	struct sk_buff *skb;
> -	int count;
> -	u8 *ptr;
> -
> -	count = sp->rcount + 1;
> -
> -	sp->dev->stats.rx_bytes += count;
> -
> -	if ((skb = dev_alloc_skb(count + 1)) == NULL)
> -		goto out_mem;
> -
> -	ptr = skb_put(skb, count + 1);
> -	*ptr++ = cmd;	/* KISS command */
> -
> -	memcpy(ptr, sp->cooked_buf + 1, count);
> -	skb->protocol = ax25_type_trans(skb, sp->dev);
> -	netif_rx(skb);
> -	sp->dev->stats.rx_packets++;
> -
> -	return;
> -
> -out_mem:
> -	sp->dev->stats.rx_dropped++;
> -}
> -
> -
> -/* ----------------------------------------------------------------------- */
> -
> -/*
> - * Called by the TTY driver when there's room for more data.  If we have
> - * more packets to send, we send them here.
> - */
> -static void sixpack_write_wakeup(struct tty_struct *tty)
> -{
> -	struct sixpack *sp = tty->disc_data;
> -	int actual;
> -
> -	if (!sp)
> -		return;
> -	if (sp->xleft <= 0)  {
> -		/* Now serial buffer is almost free & we can start
> -		 * transmission of another packet */
> -		sp->dev->stats.tx_packets++;
> -		clear_bit(TTY_DO_WRITE_WAKEUP, &tty->flags);
> -		sp->tx_enable = 0;
> -		netif_wake_queue(sp->dev);
> -		return;
> -	}
> -
> -	if (sp->tx_enable) {
> -		actual = tty->ops->write(tty, sp->xhead, sp->xleft);
> -		sp->xleft -= actual;
> -		sp->xhead += actual;
> -	}
> -}
> -
> -/* ----------------------------------------------------------------------- */
> -
> -/*
> - * Handle the 'receiver data ready' interrupt.
> - * This function is called by the tty module in the kernel when
> - * a block of 6pack data has been received, which can now be decapsulated
> - * and sent on to some IP layer for further processing.
> - */
> -static void sixpack_receive_buf(struct tty_struct *tty, const u8 *cp,
> -				const u8 *fp, size_t count)
> -{
> -	struct sixpack *sp;
> -
> -	if (!count)
> -		return;
> -
> -	sp = tty->disc_data;
> -	if (!sp)
> -		return;
> -
> -	/* Read the characters out of the buffer */
> -	while (count--) {
> -		if (fp && *fp++) {
> -			if (!test_and_set_bit(SIXPF_ERROR, &sp->flags))
> -				sp->dev->stats.rx_errors++;
> -			cp++;
> -			continue;
> -		}
> -		sixpack_decode(sp, cp, 1);
> -		cp++;
> -	}
> -
> -	tty_unthrottle(tty);
> -}
> -
> -/*
> - * Try to resync the TNC. Called by the resync timer defined in
> - * decode_prio_command
> - */
> -
> -#define TNC_UNINITIALIZED	0
> -#define TNC_UNSYNC_STARTUP	1
> -#define TNC_UNSYNCED		2
> -#define TNC_IN_SYNC		3
> -
> -static void __tnc_set_sync_state(struct sixpack *sp, int new_tnc_state)
> -{
> -	char *msg;
> -
> -	switch (new_tnc_state) {
> -	default:			/* gcc oh piece-o-crap ... */
> -	case TNC_UNSYNC_STARTUP:
> -		msg = "Synchronizing with TNC";
> -		break;
> -	case TNC_UNSYNCED:
> -		msg = "Lost synchronization with TNC\n";
> -		break;
> -	case TNC_IN_SYNC:
> -		msg = "Found TNC";
> -		break;
> -	}
> -
> -	sp->tnc_state = new_tnc_state;
> -	printk(KERN_INFO "%s: %s\n", sp->dev->name, msg);
> -}
> -
> -static inline void tnc_set_sync_state(struct sixpack *sp, int new_tnc_state)
> -{
> -	int old_tnc_state = sp->tnc_state;
> -
> -	if (old_tnc_state != new_tnc_state)
> -		__tnc_set_sync_state(sp, new_tnc_state);
> -}
> -
> -static void resync_tnc(struct timer_list *t)
> -{
> -	struct sixpack *sp = timer_container_of(sp, t, resync_t);
> -	static char resync_cmd = 0xe8;
> -
> -	/* clear any data that might have been received */
> -
> -	sp->rx_count = 0;
> -	sp->rx_count_cooked = 0;
> -
> -	/* reset state machine */
> -
> -	sp->status = 1;
> -	sp->status1 = 1;
> -	sp->status2 = 0;
> -
> -	/* resync the TNC */
> -
> -	sp->led_state = 0x60;
> -	sp->tty->ops->write(sp->tty, &sp->led_state, 1);
> -	sp->tty->ops->write(sp->tty, &resync_cmd, 1);
> -
> -
> -	/* Start resync timer again -- the TNC might be still absent */
> -	mod_timer(&sp->resync_t, jiffies + SIXP_RESYNC_TIMEOUT);
> -}
> -
> -static inline int tnc_init(struct sixpack *sp)
> -{
> -	unsigned char inbyte = 0xe8;
> -
> -	tnc_set_sync_state(sp, TNC_UNSYNC_STARTUP);
> -
> -	sp->tty->ops->write(sp->tty, &inbyte, 1);
> -
> -	mod_timer(&sp->resync_t, jiffies + SIXP_RESYNC_TIMEOUT);
> -
> -	return 0;
> -}
> -
> -/*
> - * Open the high-level part of the 6pack channel.
> - * This function is called by the TTY module when the
> - * 6pack line discipline is called for.  Because we are
> - * sure the tty line exists, we only have to link it to
> - * a free 6pcack channel...
> - */
> -static int sixpack_open(struct tty_struct *tty)
> -{
> -	char *xbuff = NULL;
> -	struct net_device *dev;
> -	struct sixpack *sp;
> -	unsigned long len;
> -	int err = 0;
> -
> -	if (!capable(CAP_NET_ADMIN))
> -		return -EPERM;
> -	if (tty->ops->write == NULL)
> -		return -EOPNOTSUPP;
> -
> -	dev = alloc_netdev(sizeof(struct sixpack), "sp%d", NET_NAME_UNKNOWN,
> -			   sp_setup);
> -	if (!dev) {
> -		err = -ENOMEM;
> -		goto out;
> -	}
> -
> -	sp = netdev_priv(dev);
> -	sp->dev = dev;
> -
> -	spin_lock_init(&sp->lock);
> -	spin_lock_init(&sp->rxlock);
> -
> -	/* !!! length of the buffers. MTU is IP MTU, not PACLEN!  */
> -
> -	len = dev->mtu * 2;
> -
> -	xbuff = kmalloc(len + 4, GFP_KERNEL);
> -	if (xbuff == NULL) {
> -		err = -ENOBUFS;
> -		goto out_free;
> -	}
> -
> -	spin_lock_bh(&sp->lock);
> -
> -	sp->tty = tty;
> -
> -	sp->xbuff	= xbuff;
> -
> -	sp->rcount	= 0;
> -	sp->rx_count	= 0;
> -	sp->rx_count_cooked = 0;
> -	sp->xleft	= 0;
> -
> -	sp->flags	= 0;		/* Clear ESCAPE & ERROR flags */
> -
> -	sp->duplex	= 0;
> -	sp->tx_delay    = SIXP_TXDELAY;
> -	sp->persistence = SIXP_PERSIST;
> -	sp->slottime    = SIXP_SLOTTIME;
> -	sp->led_state   = 0x60;
> -	sp->status      = 1;
> -	sp->status1     = 1;
> -	sp->status2     = 0;
> -	sp->tx_enable   = 0;
> -
> -	netif_start_queue(dev);
> -
> -	timer_setup(&sp->tx_t, sp_xmit_on_air, 0);
> -
> -	timer_setup(&sp->resync_t, resync_tnc, 0);
> -
> -	spin_unlock_bh(&sp->lock);
> -
> -	/* Done.  We have linked the TTY line to a channel. */
> -	tty->disc_data = sp;
> -	tty->receive_room = 65536;
> -
> -	/* Now we're ready to register. */
> -	err = register_netdev(dev);
> -	if (err)
> -		goto out_free;
> -
> -	tnc_init(sp);
> -
> -	return 0;
> -
> -out_free:
> -	kfree(xbuff);
> -
> -	free_netdev(dev);
> -
> -out:
> -	return err;
> -}
> -
> -
> -/*
> - * Close down a 6pack channel.
> - * This means flushing out any pending queues, and then restoring the
> - * TTY line discipline to what it was before it got hooked to 6pack
> - * (which usually is TTY again).
> - */
> -static void sixpack_close(struct tty_struct *tty)
> -{
> -	struct sixpack *sp;
> -
> -	sp = tty->disc_data;
> -	if (!sp)
> -		return;
> -
> -	tty->disc_data = NULL;
> -
> -	/* We must stop the queue to avoid potentially scribbling
> -	 * on the free buffers. The sp->dead completion is not sufficient
> -	 * to protect us from sp->xbuff access.
> -	 */
> -	netif_stop_queue(sp->dev);
> -
> -	unregister_netdev(sp->dev);
> -
> -	timer_delete_sync(&sp->tx_t);
> -	timer_delete_sync(&sp->resync_t);
> -
> -	/* Free all 6pack frame buffers after unreg. */
> -	kfree(sp->xbuff);
> -
> -	free_netdev(sp->dev);
> -}
> -
> -/* Perform I/O control on an active 6pack channel. */
> -static int sixpack_ioctl(struct tty_struct *tty, unsigned int cmd,
> -		unsigned long arg)
> -{
> -	struct sixpack *sp = tty->disc_data;
> -	struct net_device *dev;
> -	unsigned int tmp, err;
> -
> -	if (!sp)
> -		return -ENXIO;
> -	dev = sp->dev;
> -
> -	switch(cmd) {
> -	case SIOCGIFNAME:
> -		err = copy_to_user((void __user *) arg, dev->name,
> -		                   strlen(dev->name) + 1) ? -EFAULT : 0;
> -		break;
> -
> -	case SIOCGIFENCAP:
> -		err = put_user(0, (int __user *) arg);
> -		break;
> -
> -	case SIOCSIFENCAP:
> -		if (get_user(tmp, (int __user *) arg)) {
> -			err = -EFAULT;
> -			break;
> -		}
> -
> -		sp->mode = tmp;
> -		dev->addr_len        = AX25_ADDR_LEN;
> -		dev->hard_header_len = AX25_KISS_HEADER_LEN +
> -		                       AX25_MAX_HEADER_LEN + 3;
> -		dev->type            = ARPHRD_AX25;
> -
> -		err = 0;
> -		break;
> -
> -	case SIOCSIFHWADDR: {
> -			char addr[AX25_ADDR_LEN];
> -
> -			if (copy_from_user(&addr,
> -					   (void __user *)arg, AX25_ADDR_LEN)) {
> -				err = -EFAULT;
> -				break;
> -			}
> -
> -			netif_tx_lock_bh(dev);
> -			__dev_addr_set(dev, &addr, AX25_ADDR_LEN);
> -			netif_tx_unlock_bh(dev);
> -			err = 0;
> -			break;
> -		}
> -	default:
> -		err = tty_mode_ioctl(tty, cmd, arg);
> -	}
> -
> -	return err;
> -}
> -
> -static struct tty_ldisc_ops sp_ldisc = {
> -	.owner		= THIS_MODULE,
> -	.num		= N_6PACK,
> -	.name		= "6pack",
> -	.open		= sixpack_open,
> -	.close		= sixpack_close,
> -	.ioctl		= sixpack_ioctl,
> -	.receive_buf	= sixpack_receive_buf,
> -	.write_wakeup	= sixpack_write_wakeup,
> -};
> -
> -/* Initialize 6pack control device -- register 6pack line discipline */
> -
> -static int __init sixpack_init_driver(void)
> -{
> -	int status;
> -
> -	/* Register the provided line protocol discipline */
> -	status = tty_register_ldisc(&sp_ldisc);
> -	if (status)
> -		pr_err("6pack: can't register line discipline (err = %d)\n", status);
> -
> -	return status;
> -}
> -
> -static void __exit sixpack_exit_driver(void)
> -{
> -	tty_unregister_ldisc(&sp_ldisc);
> -}
> -
> -/* encode an AX.25 packet into 6pack */
> -
> -static int encode_sixpack(unsigned char *tx_buf, unsigned char *tx_buf_raw,
> -	int length, unsigned char tx_delay)
> -{
> -	int count = 0;
> -	unsigned char checksum = 0, buf[400];
> -	int raw_count = 0;
> -
> -	tx_buf_raw[raw_count++] = SIXP_PRIO_CMD_MASK | SIXP_TX_MASK;
> -	tx_buf_raw[raw_count++] = SIXP_SEOF;
> -
> -	buf[0] = tx_delay;
> -	for (count = 1; count < length; count++)
> -		buf[count] = tx_buf[count];
> -
> -	for (count = 0; count < length; count++)
> -		checksum += buf[count];
> -	buf[length] = (unsigned char) 0xff - checksum;
> -
> -	for (count = 0; count <= length; count++) {
> -		if ((count % 3) == 0) {
> -			tx_buf_raw[raw_count++] = (buf[count] & 0x3f);
> -			tx_buf_raw[raw_count] = ((buf[count] >> 2) & 0x30);
> -		} else if ((count % 3) == 1) {
> -			tx_buf_raw[raw_count++] |= (buf[count] & 0x0f);
> -			tx_buf_raw[raw_count] =	((buf[count] >> 2) & 0x3c);
> -		} else {
> -			tx_buf_raw[raw_count++] |= (buf[count] & 0x03);
> -			tx_buf_raw[raw_count++] = (buf[count] >> 2);
> -		}
> -	}
> -	if ((length % 3) != 2)
> -		raw_count++;
> -	tx_buf_raw[raw_count++] = SIXP_SEOF;
> -	return raw_count;
> -}
> -
> -/* decode 4 sixpack-encoded bytes into 3 data bytes */
> -
> -static void decode_data(struct sixpack *sp, u8 inbyte)
> -{
> -	u8 *buf;
> -
> -	if (sp->rx_count != 3) {
> -		sp->raw_buf[sp->rx_count++] = inbyte;
> -
> -		return;
> -	}
> -
> -	if (sp->rx_count_cooked + 2 >= sizeof(sp->cooked_buf)) {
> -		pr_err("6pack: cooked buffer overrun, data loss\n");
> -		sp->rx_count = 0;
> -		return;
> -	}
> -
> -	buf = sp->raw_buf;
> -	sp->cooked_buf[sp->rx_count_cooked++] =
> -		buf[0] | ((buf[1] << 2) & 0xc0);
> -	sp->cooked_buf[sp->rx_count_cooked++] =
> -		(buf[1] & 0x0f) | ((buf[2] << 2) & 0xf0);
> -	sp->cooked_buf[sp->rx_count_cooked++] =
> -		(buf[2] & 0x03) | (inbyte << 2);
> -	sp->rx_count = 0;
> -}
> -
> -/* identify and execute a 6pack priority command byte */
> -
> -static void decode_prio_command(struct sixpack *sp, u8 cmd)
> -{
> -	ssize_t actual;
> -
> -	if ((cmd & SIXP_PRIO_DATA_MASK) != 0) {     /* idle ? */
> -
> -	/* RX and DCD flags can only be set in the same prio command,
> -	   if the DCD flag has been set without the RX flag in the previous
> -	   prio command. If DCD has not been set before, something in the
> -	   transmission has gone wrong. In this case, RX and DCD are
> -	   cleared in order to prevent the decode_data routine from
> -	   reading further data that might be corrupt. */
> -
> -		if (((sp->status & SIXP_DCD_MASK) == 0) &&
> -			((cmd & SIXP_RX_DCD_MASK) == SIXP_RX_DCD_MASK)) {
> -				if (sp->status != 1)
> -					printk(KERN_DEBUG "6pack: protocol violation\n");
> -				else
> -					sp->status = 0;
> -				cmd &= ~SIXP_RX_DCD_MASK;
> -		}
> -		sp->status = cmd & SIXP_PRIO_DATA_MASK;
> -	} else { /* output watchdog char if idle */
> -		if ((sp->status2 != 0) && (sp->duplex == 1)) {
> -			sp->led_state = 0x70;
> -			sp->tty->ops->write(sp->tty, &sp->led_state, 1);
> -			sp->tx_enable = 1;
> -			actual = sp->tty->ops->write(sp->tty, sp->xbuff, sp->status2);
> -			sp->xleft -= actual;
> -			sp->xhead += actual;
> -			sp->led_state = 0x60;
> -			sp->status2 = 0;
> -
> -		}
> -	}
> -
> -	/* needed to trigger the TNC watchdog */
> -	sp->tty->ops->write(sp->tty, &sp->led_state, 1);
> -
> -        /* if the state byte has been received, the TNC is present,
> -           so the resync timer can be reset. */
> -
> -	if (sp->tnc_state == TNC_IN_SYNC)
> -		mod_timer(&sp->resync_t, jiffies + SIXP_INIT_RESYNC_TIMEOUT);
> -
> -	sp->status1 = cmd & SIXP_PRIO_DATA_MASK;
> -}
> -
> -/* identify and execute a standard 6pack command byte */
> -
> -static void decode_std_command(struct sixpack *sp, u8 cmd)
> -{
> -	u8 checksum = 0, rest = 0;
> -	short i;
> -
> -	switch (cmd & SIXP_CMD_MASK) {     /* normal command */
> -	case SIXP_SEOF:
> -		if ((sp->rx_count == 0) && (sp->rx_count_cooked == 0)) {
> -			if ((sp->status & SIXP_RX_DCD_MASK) ==
> -				SIXP_RX_DCD_MASK) {
> -				sp->led_state = 0x68;
> -				sp->tty->ops->write(sp->tty, &sp->led_state, 1);
> -			}
> -		} else {
> -			sp->led_state = 0x60;
> -			/* fill trailing bytes with zeroes */
> -			sp->tty->ops->write(sp->tty, &sp->led_state, 1);
> -			spin_lock_bh(&sp->rxlock);
> -			rest = sp->rx_count;
> -			if (rest != 0)
> -				 for (i = rest; i <= 3; i++)
> -					decode_data(sp, 0);
> -			if (rest == 2)
> -				sp->rx_count_cooked -= 2;
> -			else if (rest == 3)
> -				sp->rx_count_cooked -= 1;
> -			for (i = 0; i < sp->rx_count_cooked; i++)
> -				checksum += sp->cooked_buf[i];
> -			if (checksum != SIXP_CHKSUM) {
> -				printk(KERN_DEBUG "6pack: bad checksum %2.2x\n", checksum);
> -			} else {
> -				sp->rcount = sp->rx_count_cooked-2;
> -				sp_bump(sp, 0);
> -			}
> -			sp->rx_count_cooked = 0;
> -			spin_unlock_bh(&sp->rxlock);
> -		}
> -		break;
> -	case SIXP_TX_URUN: printk(KERN_DEBUG "6pack: TX underrun\n");
> -		break;
> -	case SIXP_RX_ORUN: printk(KERN_DEBUG "6pack: RX overrun\n");
> -		break;
> -	case SIXP_RX_BUF_OVL:
> -		printk(KERN_DEBUG "6pack: RX buffer overflow\n");
> -	}
> -}
> -
> -/* decode a 6pack packet */
> -
> -static void
> -sixpack_decode(struct sixpack *sp, const u8 *pre_rbuff, size_t count)
> -{
> -	size_t count1;
> -	u8 inbyte;
> -
> -	for (count1 = 0; count1 < count; count1++) {
> -		inbyte = pre_rbuff[count1];
> -		if (inbyte == SIXP_FOUND_TNC) {
> -			tnc_set_sync_state(sp, TNC_IN_SYNC);
> -			timer_delete(&sp->resync_t);
> -		}
> -		if ((inbyte & SIXP_PRIO_CMD_MASK) != 0)
> -			decode_prio_command(sp, inbyte);
> -		else if ((inbyte & SIXP_STD_CMD_MASK) != 0)
> -			decode_std_command(sp, inbyte);
> -		else if ((sp->status & SIXP_RX_DCD_MASK) == SIXP_RX_DCD_MASK) {
> -			spin_lock_bh(&sp->rxlock);
> -			decode_data(sp, inbyte);
> -			spin_unlock_bh(&sp->rxlock);
> -		}
> -	}
> -}
> -
> -MODULE_AUTHOR("Ralf Baechle DO1GRB <ralf@linux-mips.org>");
> -MODULE_DESCRIPTION("6pack driver for AX.25");
> -MODULE_LICENSE("GPL");
> -MODULE_ALIAS_LDISC(N_6PACK);
> -
> -module_init(sixpack_init_driver);
> -module_exit(sixpack_exit_driver);
> diff --git a/drivers/net/hamradio/baycom_epp.c b/drivers/net/hamradio/baycom_epp.c
> deleted file mode 100644
> index 5fda7a0fcce0..000000000000
> --- a/drivers/net/hamradio/baycom_epp.c
> +++ /dev/null
> @@ -1,1316 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-or-later
> -/*****************************************************************************/
> -
> -/*
> - *	baycom_epp.c  -- baycom epp radio modem driver.
> - *
> - *	Copyright (C) 1998-2000
> - *          Thomas Sailer (sailer@ife.ee.ethz.ch)
> - *
> - *  Please note that the GPL allows you to use the driver, NOT the radio.
> - *  In order to use the radio, you need a license from the communications
> - *  authority of your country.
> - *
> - *  History:
> - *   0.1  xx.xx.1998  Initial version by Matthias Welwarsky (dg2fef)
> - *   0.2  21.04.1998  Massive rework by Thomas Sailer
> - *                    Integrated FPGA EPP modem configuration routines
> - *   0.3  11.05.1998  Took FPGA config out and moved it into a separate program
> - *   0.4  26.07.1999  Adapted to new lowlevel parport driver interface
> - *   0.5  03.08.1999  adapt to Linus' new __setup/__initcall
> - *                    removed some pre-2.2 kernel compatibility cruft
> - *   0.6  10.08.1999  Check if parport can do SPP and is safe to access during interrupt contexts
> - *   0.7  12.02.2000  adapted to softnet driver interface
> - */
> -
> -/*****************************************************************************/
> -
> -#include <linux/crc-ccitt.h>
> -#include <linux/module.h>
> -#include <linux/kernel.h>
> -#include <linux/init.h>
> -#include <linux/sched.h>
> -#include <linux/string.h>
> -#include <linux/workqueue.h>
> -#include <linux/fs.h>
> -#include <linux/parport.h>
> -#include <linux/if_arp.h>
> -#include <linux/hdlcdrv.h>
> -#include <linux/baycom.h>
> -#include <linux/jiffies.h>
> -#include <linux/random.h>
> -#include <net/ax25.h>
> -#include <linux/uaccess.h>
> -
> -/* --------------------------------------------------------------------- */
> -
> -#define BAYCOM_DEBUG
> -#define BAYCOM_MAGIC 19730510
> -
> -/* --------------------------------------------------------------------- */
> -
> -static const char paranoia_str[] = KERN_ERR
> -	"baycom_epp: bad magic number for hdlcdrv_state struct in routine %s\n";
> -
> -static const char bc_drvname[] = "baycom_epp";
> -static const char bc_drvinfo[] = KERN_INFO "baycom_epp: (C) 1998-2000 Thomas Sailer, HB9JNX/AE4WA\n"
> -"baycom_epp: version 0.7\n";
> -
> -/* --------------------------------------------------------------------- */
> -
> -#define NR_PORTS 4
> -
> -static struct net_device *baycom_device[NR_PORTS];
> -
> -/* --------------------------------------------------------------------- */
> -
> -/* EPP status register */
> -#define EPP_DCDBIT      0x80
> -#define EPP_PTTBIT      0x08
> -#define EPP_NREF        0x01
> -#define EPP_NRAEF       0x02
> -#define EPP_NRHF        0x04
> -#define EPP_NTHF        0x20
> -#define EPP_NTAEF       0x10
> -#define EPP_NTEF        EPP_PTTBIT
> -
> -/* EPP control register */
> -#define EPP_TX_FIFO_ENABLE 0x10
> -#define EPP_RX_FIFO_ENABLE 0x08
> -#define EPP_MODEM_ENABLE   0x20
> -#define EPP_LEDS           0xC0
> -#define EPP_IRQ_ENABLE     0x10
> -
> -/* LPT registers */
> -#define LPTREG_ECONTROL       0x402
> -#define LPTREG_CONFIGB        0x401
> -#define LPTREG_CONFIGA        0x400
> -#define LPTREG_EPPDATA        0x004
> -#define LPTREG_EPPADDR        0x003
> -#define LPTREG_CONTROL        0x002
> -#define LPTREG_STATUS         0x001
> -#define LPTREG_DATA           0x000
> -
> -/* LPT control register */
> -#define LPTCTRL_PROGRAM       0x04   /* 0 to reprogram */
> -#define LPTCTRL_WRITE         0x01
> -#define LPTCTRL_ADDRSTB       0x08
> -#define LPTCTRL_DATASTB       0x02
> -#define LPTCTRL_INTEN         0x10
> -
> -/* LPT status register */
> -#define LPTSTAT_SHIFT_NINTR   6
> -#define LPTSTAT_WAIT          0x80
> -#define LPTSTAT_NINTR         (1<<LPTSTAT_SHIFT_NINTR)
> -#define LPTSTAT_PE            0x20
> -#define LPTSTAT_DONE          0x10
> -#define LPTSTAT_NERROR        0x08
> -#define LPTSTAT_EPPTIMEOUT    0x01
> -
> -/* LPT data register */
> -#define LPTDATA_SHIFT_TDI     0
> -#define LPTDATA_SHIFT_TMS     2
> -#define LPTDATA_TDI           (1<<LPTDATA_SHIFT_TDI)
> -#define LPTDATA_TCK           0x02
> -#define LPTDATA_TMS           (1<<LPTDATA_SHIFT_TMS)
> -#define LPTDATA_INITBIAS      0x80
> -
> -
> -/* EPP modem config/status bits */
> -#define EPP_DCDBIT            0x80
> -#define EPP_PTTBIT            0x08
> -#define EPP_RXEBIT            0x01
> -#define EPP_RXAEBIT           0x02
> -#define EPP_RXHFULL           0x04
> -
> -#define EPP_NTHF              0x20
> -#define EPP_NTAEF             0x10
> -#define EPP_NTEF              EPP_PTTBIT
> -
> -#define EPP_TX_FIFO_ENABLE    0x10
> -#define EPP_RX_FIFO_ENABLE    0x08
> -#define EPP_MODEM_ENABLE      0x20
> -#define EPP_LEDS              0xC0
> -#define EPP_IRQ_ENABLE        0x10
> -
> -/* Xilinx 4k JTAG instructions */
> -#define XC4K_IRLENGTH   3
> -#define XC4K_EXTEST     0
> -#define XC4K_PRELOAD    1
> -#define XC4K_CONFIGURE  5
> -#define XC4K_BYPASS     7
> -
> -#define EPP_CONVENTIONAL  0
> -#define EPP_FPGA          1
> -#define EPP_FPGAEXTSTATUS 2
> -
> -#define TXBUFFER_SIZE     ((HDLCDRV_MAXFLEN*6/5)+8)
> -
> -/* ---------------------------------------------------------------------- */
> -/*
> - * Information that need to be kept for each board.
> - */
> -
> -struct baycom_state {
> -	int magic;
> -
> -        struct pardevice *pdev;
> -	struct net_device *dev;
> -	unsigned int work_running;
> -	struct delayed_work run_work;
> -	unsigned int modem;
> -	unsigned int bitrate;
> -	unsigned char stat;
> -
> -	struct {
> -		unsigned int intclk;
> -		unsigned int fclk;
> -		unsigned int bps;
> -		unsigned int extmodem;
> -		unsigned int loopback;
> -	} cfg;
> -
> -        struct hdlcdrv_channel_params ch_params;
> -
> -        struct {
> -		unsigned int bitbuf, bitstream, numbits, state;
> -		unsigned char *bufptr;
> -		int bufcnt;
> -		unsigned char buf[TXBUFFER_SIZE];
> -        } hdlcrx;
> -
> -        struct {
> -		int calibrate;
> -                int slotcnt;
> -		int flags;
> -		enum { tx_idle = 0, tx_keyup, tx_data, tx_tail } state;
> -		unsigned char *bufptr;
> -		int bufcnt;
> -		unsigned char buf[TXBUFFER_SIZE];
> -        } hdlctx;
> -
> -	unsigned int ptt_keyed;
> -	struct sk_buff *skb;  /* next transmit packet  */
> -
> -#ifdef BAYCOM_DEBUG
> -	struct debug_vals {
> -		unsigned long last_jiffies;
> -		unsigned cur_intcnt;
> -		unsigned last_intcnt;
> -		int cur_pllcorr;
> -		int last_pllcorr;
> -		unsigned int mod_cycles;
> -		unsigned int demod_cycles;
> -	} debug_vals;
> -#endif /* BAYCOM_DEBUG */
> -};
> -
> -/* --------------------------------------------------------------------- */
> -
> -#define KISS_VERBOSE
> -
> -/* --------------------------------------------------------------------- */
> -
> -#define PARAM_TXDELAY   1
> -#define PARAM_PERSIST   2
> -#define PARAM_SLOTTIME  3
> -#define PARAM_TXTAIL    4
> -#define PARAM_FULLDUP   5
> -#define PARAM_HARDWARE  6
> -#define PARAM_RETURN    255
> -
> -/* --------------------------------------------------------------------- */
> -/*
> - * the CRC routines are stolen from WAMPES
> - * by Dieter Deyke
> - */
> -
> -
> -/*---------------------------------------------------------------------------*/
> -
> -#if 0
> -static inline void append_crc_ccitt(unsigned char *buffer, int len)
> -{
> -	unsigned int crc = 0xffff;
> -
> -	for (;len>0;len--)
> -		crc = (crc >> 8) ^ crc_ccitt_table[(crc ^ *buffer++) & 0xff];
> -	crc ^= 0xffff;
> -	*buffer++ = crc;
> -	*buffer++ = crc >> 8;
> -}
> -#endif
> -
> -/*---------------------------------------------------------------------------*/
> -
> -static inline int check_crc_ccitt(const unsigned char *buf, int cnt)
> -{
> -	return (crc_ccitt(0xffff, buf, cnt) & 0xffff) == 0xf0b8;
> -}
> -
> -/*---------------------------------------------------------------------------*/
> -
> -static inline int calc_crc_ccitt(const unsigned char *buf, int cnt)
> -{
> -	return (crc_ccitt(0xffff, buf, cnt) ^ 0xffff) & 0xffff;
> -}
> -
> -/* ---------------------------------------------------------------------- */
> -
> -#define tenms_to_flags(bc,tenms) ((tenms * bc->bitrate) / 800)
> -
> -/* --------------------------------------------------------------------- */
> -
> -static inline void baycom_int_freq(struct baycom_state *bc)
> -{
> -#ifdef BAYCOM_DEBUG
> -	unsigned long cur_jiffies = jiffies;
> -	/*
> -	 * measure the interrupt frequency
> -	 */
> -	bc->debug_vals.cur_intcnt++;
> -	if (time_after_eq(cur_jiffies, bc->debug_vals.last_jiffies + HZ)) {
> -		bc->debug_vals.last_jiffies = cur_jiffies;
> -		bc->debug_vals.last_intcnt = bc->debug_vals.cur_intcnt;
> -		bc->debug_vals.cur_intcnt = 0;
> -		bc->debug_vals.last_pllcorr = bc->debug_vals.cur_pllcorr;
> -		bc->debug_vals.cur_pllcorr = 0;
> -	}
> -#endif /* BAYCOM_DEBUG */
> -}
> -
> -/* ---------------------------------------------------------------------- */
> -/*
> - *    eppconfig_path should be setable  via /proc/sys.
> - */
> -
> -static char const eppconfig_path[] = "/usr/sbin/eppfpga";
> -
> -static char *envp[] = { "HOME=/", "TERM=linux", "PATH=/usr/bin:/bin", NULL };
> -
> -/* eppconfig: called during ifconfig up to configure the modem */
> -static int eppconfig(struct baycom_state *bc)
> -{
> -	char modearg[256];
> -	char portarg[16];
> -        char *argv[] = {
> -		(char *)eppconfig_path,
> -		"-s",
> -		"-p", portarg,
> -		"-m", modearg,
> -		NULL };
> -
> -	/* set up arguments */
> -	sprintf(modearg, "%sclk,%smodem,fclk=%d,bps=%d,divider=%d%s,extstat",
> -		bc->cfg.intclk ? "int" : "ext",
> -		bc->cfg.extmodem ? "ext" : "int", bc->cfg.fclk, bc->cfg.bps,
> -		(bc->cfg.fclk + 8 * bc->cfg.bps) / (16 * bc->cfg.bps),
> -		bc->cfg.loopback ? ",loopback" : "");
> -	sprintf(portarg, "%ld", bc->pdev->port->base);
> -	printk(KERN_DEBUG "%s: %s -s -p %s -m %s\n", bc_drvname, eppconfig_path, portarg, modearg);
> -
> -	return call_usermodehelper(eppconfig_path, argv, envp, UMH_WAIT_PROC);
> -}
> -
> -/* ---------------------------------------------------------------------- */
> -
> -static inline void do_kiss_params(struct baycom_state *bc,
> -				  unsigned char *data, unsigned long len)
> -{
> -
> -#ifdef KISS_VERBOSE
> -#define PKP(a,b) printk(KERN_INFO "baycomm_epp: channel params: " a "\n", b)
> -#else /* KISS_VERBOSE */	
> -#define PKP(a,b)
> -#endif /* KISS_VERBOSE */	
> -
> -	if (len < 2)
> -		return;
> -	switch(data[0]) {
> -	case PARAM_TXDELAY:
> -		bc->ch_params.tx_delay = data[1];
> -		PKP("TX delay = %ums", 10 * bc->ch_params.tx_delay);
> -		break;
> -	case PARAM_PERSIST:
> -		bc->ch_params.ppersist = data[1];
> -		PKP("p persistence = %u", bc->ch_params.ppersist);
> -		break;
> -	case PARAM_SLOTTIME:
> -		bc->ch_params.slottime = data[1];
> -		PKP("slot time = %ums", bc->ch_params.slottime);
> -		break;
> -	case PARAM_TXTAIL:
> -		bc->ch_params.tx_tail = data[1];
> -		PKP("TX tail = %ums", bc->ch_params.tx_tail);
> -		break;
> -	case PARAM_FULLDUP:
> -		bc->ch_params.fulldup = !!data[1];
> -		PKP("%s duplex", bc->ch_params.fulldup ? "full" : "half");
> -		break;
> -	default:
> -		break;
> -	}
> -#undef PKP
> -}
> -
> -/* --------------------------------------------------------------------- */
> -
> -static void encode_hdlc(struct baycom_state *bc)
> -{
> -	struct sk_buff *skb;
> -	unsigned char *wp, *bp;
> -	int pkt_len;
> -        unsigned bitstream, notbitstream, bitbuf, numbit, crc;
> -	unsigned char crcarr[2];
> -	int j;
> -	
> -	if (bc->hdlctx.bufcnt > 0)
> -		return;
> -	skb = bc->skb;
> -	if (!skb)
> -		return;
> -	bc->skb = NULL;
> -	pkt_len = skb->len-1; /* strip KISS byte */
> -	wp = bc->hdlctx.buf;
> -	bp = skb->data+1;
> -	crc = calc_crc_ccitt(bp, pkt_len);
> -	crcarr[0] = crc;
> -	crcarr[1] = crc >> 8;
> -	*wp++ = 0x7e;
> -	bitstream = bitbuf = numbit = 0;
> -	while (pkt_len > -2) {
> -		bitstream >>= 8;
> -		bitstream |= ((unsigned int)*bp) << 8;
> -		bitbuf |= ((unsigned int)*bp) << numbit;
> -		notbitstream = ~bitstream;
> -		bp++;
> -		pkt_len--;
> -		if (!pkt_len)
> -			bp = crcarr;
> -		for (j = 0; j < 8; j++)
> -			if (unlikely(!(notbitstream & (0x1f0 << j)))) {
> -				bitstream &= ~(0x100 << j);
> -				bitbuf = (bitbuf & (((2 << j) << numbit) - 1)) |
> -					((bitbuf & ~(((2 << j) << numbit) - 1)) << 1);
> -				numbit++;
> -				notbitstream = ~bitstream;
> -			}
> -		numbit += 8;
> -		while (numbit >= 8) {
> -			*wp++ = bitbuf;
> -			bitbuf >>= 8;
> -			numbit -= 8;
> -		}
> -	}
> -	bitbuf |= 0x7e7e << numbit;
> -	numbit += 16;
> -	while (numbit >= 8) {
> -		*wp++ = bitbuf;
> -		bitbuf >>= 8;
> -		numbit -= 8;
> -	}
> -	bc->hdlctx.bufptr = bc->hdlctx.buf;
> -	bc->hdlctx.bufcnt = wp - bc->hdlctx.buf;
> -	dev_kfree_skb(skb);
> -	bc->dev->stats.tx_packets++;
> -}
> -
> -/* ---------------------------------------------------------------------- */
> -
> -static int transmit(struct baycom_state *bc, int cnt, unsigned char stat)
> -{
> -	struct parport *pp = bc->pdev->port;
> -	unsigned char tmp[128];
> -	int i, j;
> -
> -	if (bc->hdlctx.state == tx_tail && !(stat & EPP_PTTBIT))
> -		bc->hdlctx.state = tx_idle;
> -	if (bc->hdlctx.state == tx_idle && bc->hdlctx.calibrate <= 0) {
> -		if (bc->hdlctx.bufcnt <= 0)
> -			encode_hdlc(bc);
> -		if (bc->hdlctx.bufcnt <= 0)
> -			return 0;
> -		if (!bc->ch_params.fulldup) {
> -			if (!(stat & EPP_DCDBIT)) {
> -				bc->hdlctx.slotcnt = bc->ch_params.slottime;
> -				return 0;
> -			}
> -			if ((--bc->hdlctx.slotcnt) > 0)
> -				return 0;
> -			bc->hdlctx.slotcnt = bc->ch_params.slottime;
> -			if (get_random_u8() > bc->ch_params.ppersist)
> -				return 0;
> -		}
> -	}
> -	if (bc->hdlctx.state == tx_idle && bc->hdlctx.bufcnt > 0) {
> -		bc->hdlctx.state = tx_keyup;
> -		bc->hdlctx.flags = tenms_to_flags(bc, bc->ch_params.tx_delay);
> -		bc->ptt_keyed++;
> -	}
> -	while (cnt > 0) {
> -		switch (bc->hdlctx.state) {
> -		case tx_keyup:
> -			i = min_t(int, cnt, bc->hdlctx.flags);
> -			cnt -= i;
> -			bc->hdlctx.flags -= i;
> -			if (bc->hdlctx.flags <= 0)
> -				bc->hdlctx.state = tx_data;
> -			memset(tmp, 0x7e, sizeof(tmp));
> -			while (i > 0) {
> -				j = (i > sizeof(tmp)) ? sizeof(tmp) : i;
> -				if (j != pp->ops->epp_write_data(pp, tmp, j, 0))
> -					return -1;
> -				i -= j;
> -			}
> -			break;
> -
> -		case tx_data:
> -			if (bc->hdlctx.bufcnt <= 0) {
> -				encode_hdlc(bc);
> -				if (bc->hdlctx.bufcnt <= 0) {
> -					bc->hdlctx.state = tx_tail;
> -					bc->hdlctx.flags = tenms_to_flags(bc, bc->ch_params.tx_tail);
> -					break;
> -				}
> -			}
> -			i = min_t(int, cnt, bc->hdlctx.bufcnt);
> -			bc->hdlctx.bufcnt -= i;
> -			cnt -= i;
> -			if (i != pp->ops->epp_write_data(pp, bc->hdlctx.bufptr, i, 0))
> -					return -1;
> -			bc->hdlctx.bufptr += i;
> -			break;
> -			
> -		case tx_tail:
> -			encode_hdlc(bc);
> -			if (bc->hdlctx.bufcnt > 0) {
> -				bc->hdlctx.state = tx_data;
> -				break;
> -			}
> -			i = min_t(int, cnt, bc->hdlctx.flags);
> -			if (i) {
> -				cnt -= i;
> -				bc->hdlctx.flags -= i;
> -				memset(tmp, 0x7e, sizeof(tmp));
> -				while (i > 0) {
> -					j = (i > sizeof(tmp)) ? sizeof(tmp) : i;
> -					if (j != pp->ops->epp_write_data(pp, tmp, j, 0))
> -						return -1;
> -					i -= j;
> -				}
> -				break;
> -			}
> -			fallthrough;
> -
> -		default:
> -			if (bc->hdlctx.calibrate <= 0)
> -				return 0;
> -			i = min_t(int, cnt, bc->hdlctx.calibrate);
> -			cnt -= i;
> -			bc->hdlctx.calibrate -= i;
> -			memset(tmp, 0, sizeof(tmp));
> -			while (i > 0) {
> -				j = (i > sizeof(tmp)) ? sizeof(tmp) : i;
> -				if (j != pp->ops->epp_write_data(pp, tmp, j, 0))
> -					return -1;
> -				i -= j;
> -			}
> -			break;
> -		}
> -	}
> -	return 0;
> -}
> -
> -/* ---------------------------------------------------------------------- */
> -
> -static void do_rxpacket(struct net_device *dev)
> -{
> -	struct baycom_state *bc = netdev_priv(dev);
> -	struct sk_buff *skb;
> -	unsigned char *cp;
> -	unsigned pktlen;
> -
> -	if (bc->hdlcrx.bufcnt < 4)
> -		return;
> -	if (!check_crc_ccitt(bc->hdlcrx.buf, bc->hdlcrx.bufcnt))
> -		return;
> -	pktlen = bc->hdlcrx.bufcnt-2+1; /* KISS kludge */
> -	if (!(skb = dev_alloc_skb(pktlen))) {
> -		printk("%s: memory squeeze, dropping packet\n", dev->name);
> -		dev->stats.rx_dropped++;
> -		return;
> -	}
> -	cp = skb_put(skb, pktlen);
> -	*cp++ = 0; /* KISS kludge */
> -	memcpy(cp, bc->hdlcrx.buf, pktlen - 1);
> -	skb->protocol = ax25_type_trans(skb, dev);
> -	netif_rx(skb);
> -	dev->stats.rx_packets++;
> -}
> -
> -static int receive(struct net_device *dev, int cnt)
> -{
> -	struct baycom_state *bc = netdev_priv(dev);
> -	struct parport *pp = bc->pdev->port;
> -        unsigned int bitbuf, notbitstream, bitstream, numbits, state;
> -	unsigned char tmp[128];
> -        unsigned char *cp;
> -	int cnt2, ret = 0;
> -	int j;
> -
> -        numbits = bc->hdlcrx.numbits;
> -	state = bc->hdlcrx.state;
> -	bitstream = bc->hdlcrx.bitstream;
> -	bitbuf = bc->hdlcrx.bitbuf;
> -	while (cnt > 0) {
> -		cnt2 = (cnt > sizeof(tmp)) ? sizeof(tmp) : cnt;
> -		cnt -= cnt2;
> -		if (cnt2 != pp->ops->epp_read_data(pp, tmp, cnt2, 0)) {
> -			ret = -1;
> -			break;
> -		}
> -		cp = tmp;
> -		for (; cnt2 > 0; cnt2--, cp++) {
> -			bitstream >>= 8;
> -			bitstream |= (*cp) << 8;
> -			bitbuf >>= 8;
> -			bitbuf |= (*cp) << 8;
> -			numbits += 8;
> -			notbitstream = ~bitstream;
> -			for (j = 0; j < 8; j++) {
> -
> -				/* flag or abort */
> -			        if (unlikely(!(notbitstream & (0x0fc << j)))) {
> -
> -					/* abort received */
> -					if (!(notbitstream & (0x1fc << j)))
> -						state = 0;
> -
> -					/* flag received */
> -					else if ((bitstream & (0x1fe << j)) == (0x0fc << j)) {
> -						if (state)
> -							do_rxpacket(dev);
> -						bc->hdlcrx.bufcnt = 0;
> -						bc->hdlcrx.bufptr = bc->hdlcrx.buf;
> -						state = 1;
> -						numbits = 7-j;
> -					}
> -				}
> -
> -				/* stuffed bit */
> -				else if (unlikely((bitstream & (0x1f8 << j)) == (0xf8 << j))) {
> -					numbits--;
> -					bitbuf = (bitbuf & ((~0xff) << j)) | ((bitbuf & ~((~0xff) << j)) << 1);
> -					}
> -				}
> -			while (state && numbits >= 8) {
> -				if (bc->hdlcrx.bufcnt >= TXBUFFER_SIZE) {
> -					state = 0;
> -				} else {
> -					*(bc->hdlcrx.bufptr)++ = bitbuf >> (16-numbits);
> -					bc->hdlcrx.bufcnt++;
> -					numbits -= 8;
> -				}
> -			}
> -		}
> -	}
> -        bc->hdlcrx.numbits = numbits;
> -	bc->hdlcrx.state = state;
> -	bc->hdlcrx.bitstream = bitstream;
> -	bc->hdlcrx.bitbuf = bitbuf;
> -	return ret;
> -}
> -
> -/* --------------------------------------------------------------------- */
> -
> -#define GETTICK(x)						\
> -({								\
> -	x = (unsigned int)get_cycles();				\
> -})
> -
> -static void epp_bh(struct work_struct *work)
> -{
> -	struct net_device *dev;
> -	struct baycom_state *bc;
> -	struct parport *pp;
> -	unsigned char stat;
> -	unsigned char tmp[2];
> -	unsigned int time1 = 0, time2 = 0, time3 = 0;
> -	int cnt, cnt2;
> -
> -	bc = container_of(work, struct baycom_state, run_work.work);
> -	dev = bc->dev;
> -	if (!bc->work_running)
> -		return;
> -	baycom_int_freq(bc);
> -	pp = bc->pdev->port;
> -	/* update status */
> -	if (pp->ops->epp_read_addr(pp, &stat, 1, 0) != 1)
> -		goto epptimeout;
> -	bc->stat = stat;
> -	bc->debug_vals.last_pllcorr = stat;
> -	GETTICK(time1);
> -	if (bc->modem == EPP_FPGAEXTSTATUS) {
> -		/* get input count */
> -		tmp[0] = EPP_TX_FIFO_ENABLE|EPP_RX_FIFO_ENABLE|EPP_MODEM_ENABLE|1;
> -		if (pp->ops->epp_write_addr(pp, tmp, 1, 0) != 1)
> -			goto epptimeout;
> -		if (pp->ops->epp_read_addr(pp, tmp, 2, 0) != 2)
> -			goto epptimeout;
> -		cnt = tmp[0] | (tmp[1] << 8);
> -		cnt &= 0x7fff;
> -		/* get output count */
> -		tmp[0] = EPP_TX_FIFO_ENABLE|EPP_RX_FIFO_ENABLE|EPP_MODEM_ENABLE|2;
> -		if (pp->ops->epp_write_addr(pp, tmp, 1, 0) != 1)
> -			goto epptimeout;
> -		if (pp->ops->epp_read_addr(pp, tmp, 2, 0) != 2)
> -			goto epptimeout;
> -		cnt2 = tmp[0] | (tmp[1] << 8);
> -		cnt2 = 16384 - (cnt2 & 0x7fff);
> -		/* return to normal */
> -		tmp[0] = EPP_TX_FIFO_ENABLE|EPP_RX_FIFO_ENABLE|EPP_MODEM_ENABLE;
> -		if (pp->ops->epp_write_addr(pp, tmp, 1, 0) != 1)
> -			goto epptimeout;
> -		if (transmit(bc, cnt2, stat))
> -			goto epptimeout;
> -		GETTICK(time2);
> -		if (receive(dev, cnt))
> -			goto epptimeout;
> -		if (pp->ops->epp_read_addr(pp, &stat, 1, 0) != 1)
> -			goto epptimeout;
> -		bc->stat = stat;
> -	} else {
> -		/* try to tx */
> -		switch (stat & (EPP_NTAEF|EPP_NTHF)) {
> -		case EPP_NTHF:
> -			cnt = 2048 - 256;
> -			break;
> -		
> -		case EPP_NTAEF:
> -			cnt = 2048 - 1793;
> -			break;
> -		
> -		case 0:
> -			cnt = 0;
> -			break;
> -		
> -		default:
> -			cnt = 2048 - 1025;
> -			break;
> -		}
> -		if (transmit(bc, cnt, stat))
> -			goto epptimeout;
> -		GETTICK(time2);
> -		/* do receiver */
> -		while ((stat & (EPP_NRAEF|EPP_NRHF)) != EPP_NRHF) {
> -			switch (stat & (EPP_NRAEF|EPP_NRHF)) {
> -			case EPP_NRAEF:
> -				cnt = 1025;
> -				break;
> -
> -			case 0:
> -				cnt = 1793;
> -				break;
> -
> -			default:
> -				cnt = 256;
> -				break;
> -			}
> -			if (receive(dev, cnt))
> -				goto epptimeout;
> -			if (pp->ops->epp_read_addr(pp, &stat, 1, 0) != 1)
> -				goto epptimeout;
> -		}
> -		cnt = 0;
> -		if (bc->bitrate < 50000)
> -			cnt = 256;
> -		else if (bc->bitrate < 100000)
> -			cnt = 128;
> -		while (cnt > 0 && stat & EPP_NREF) {
> -			if (receive(dev, 1))
> -				goto epptimeout;
> -			cnt--;
> -			if (pp->ops->epp_read_addr(pp, &stat, 1, 0) != 1)
> -				goto epptimeout;
> -		}
> -	}
> -	GETTICK(time3);
> -#ifdef BAYCOM_DEBUG
> -	bc->debug_vals.mod_cycles = time2 - time1;
> -	bc->debug_vals.demod_cycles = time3 - time2;
> -#endif /* BAYCOM_DEBUG */
> -	schedule_delayed_work(&bc->run_work, 1);
> -	if (!bc->skb)
> -		netif_wake_queue(dev);
> -	return;
> - epptimeout:
> -	printk(KERN_ERR "%s: EPP timeout!\n", bc_drvname);
> -}
> -
> -/* ---------------------------------------------------------------------- */
> -/*
> - * ===================== network driver interface =========================
> - */
> -
> -static netdev_tx_t baycom_send_packet(struct sk_buff *skb, struct net_device *dev)
> -{
> -	struct baycom_state *bc = netdev_priv(dev);
> -
> -	if (skb->protocol == htons(ETH_P_IP))
> -		return ax25_ip_xmit(skb);
> -
> -	if (skb->data[0] != 0) {
> -		do_kiss_params(bc, skb->data, skb->len);
> -		dev_kfree_skb(skb);
> -		return NETDEV_TX_OK;
> -	}
> -	if (bc->skb) {
> -		dev_kfree_skb(skb);
> -		return NETDEV_TX_OK;
> -	}
> -	/* strip KISS byte */
> -	if (skb->len >= HDLCDRV_MAXFLEN+1 || skb->len < 3) {
> -		dev_kfree_skb(skb);
> -		return NETDEV_TX_OK;
> -	}
> -	netif_stop_queue(dev);
> -	bc->skb = skb;
> -	return NETDEV_TX_OK;
> -}
> -
> -/* --------------------------------------------------------------------- */
> -
> -static int baycom_set_mac_address(struct net_device *dev, void *addr)
> -{
> -	struct sockaddr *sa = (struct sockaddr *)addr;
> -
> -	/* addr is an AX.25 shifted ASCII mac address */
> -	dev_addr_set(dev, sa->sa_data);
> -	return 0;
> -}
> -
> -/* --------------------------------------------------------------------- */
> -
> -static void epp_wakeup(void *handle)
> -{
> -        struct net_device *dev = (struct net_device *)handle;
> -        struct baycom_state *bc = netdev_priv(dev);
> -
> -        printk(KERN_DEBUG "baycom_epp: %s: why am I being woken up?\n", dev->name);
> -        if (!parport_claim(bc->pdev))
> -                printk(KERN_DEBUG "baycom_epp: %s: I'm broken.\n", dev->name);
> -}
> -
> -/* --------------------------------------------------------------------- */
> -
> -/*
> - * Open/initialize the board. This is called (in the current kernel)
> - * sometime after booting when the 'ifconfig' program is run.
> - *
> - * This routine should set everything up anew at each open, even
> - * registers that "should" only need to be set once at boot, so that
> - * there is non-reboot way to recover if something goes wrong.
> - */
> -
> -static int epp_open(struct net_device *dev)
> -{
> -	struct baycom_state *bc = netdev_priv(dev);
> -        struct parport *pp = parport_find_base(dev->base_addr);
> -	unsigned int i, j;
> -	unsigned char tmp[128];
> -	unsigned char stat;
> -	unsigned long tstart;
> -	struct pardev_cb par_cb;
> -	
> -        if (!pp) {
> -                printk(KERN_ERR "%s: parport at 0x%lx unknown\n", bc_drvname, dev->base_addr);
> -                return -ENXIO;
> -        }
> -#if 0
> -        if (pp->irq < 0) {
> -                printk(KERN_ERR "%s: parport at 0x%lx has no irq\n", bc_drvname, pp->base);
> -		parport_put_port(pp);
> -                return -ENXIO;
> -        }
> -#endif
> -	if ((~pp->modes) & (PARPORT_MODE_TRISTATE | PARPORT_MODE_PCSPP | PARPORT_MODE_SAFEININT)) {
> -                printk(KERN_ERR "%s: parport at 0x%lx cannot be used\n",
> -		       bc_drvname, pp->base);
> -		parport_put_port(pp);
> -                return -EIO;
> -	}
> -	memset(&bc->modem, 0, sizeof(bc->modem));
> -	memset(&par_cb, 0, sizeof(par_cb));
> -	par_cb.wakeup = epp_wakeup;
> -	par_cb.private = (void *)dev;
> -	par_cb.flags = PARPORT_DEV_EXCL;
> -	for (i = 0; i < NR_PORTS; i++)
> -		if (baycom_device[i] == dev)
> -			break;
> -
> -	if (i == NR_PORTS) {
> -		pr_err("%s: no device found\n", bc_drvname);
> -		parport_put_port(pp);
> -		return -ENODEV;
> -	}
> -
> -	bc->pdev = parport_register_dev_model(pp, dev->name, &par_cb, i);
> -	parport_put_port(pp);
> -        if (!bc->pdev) {
> -                printk(KERN_ERR "%s: cannot register parport at 0x%lx\n", bc_drvname, pp->base);
> -                return -ENXIO;
> -        }
> -        if (parport_claim(bc->pdev)) {
> -                printk(KERN_ERR "%s: parport at 0x%lx busy\n", bc_drvname, pp->base);
> -                parport_unregister_device(bc->pdev);
> -                return -EBUSY;
> -        }
> -        dev->irq = /*pp->irq*/ 0;
> -	INIT_DELAYED_WORK(&bc->run_work, epp_bh);
> -	bc->work_running = 1;
> -	bc->modem = EPP_CONVENTIONAL;
> -	if (eppconfig(bc))
> -		printk(KERN_INFO "%s: no FPGA detected, assuming conventional EPP modem\n", bc_drvname);
> -	else
> -		bc->modem = /*EPP_FPGA*/ EPP_FPGAEXTSTATUS;
> -	parport_write_control(pp, LPTCTRL_PROGRAM); /* prepare EPP mode; we aren't using interrupts */
> -	/* reset the modem */
> -	tmp[0] = 0;
> -	tmp[1] = EPP_TX_FIFO_ENABLE|EPP_RX_FIFO_ENABLE|EPP_MODEM_ENABLE;
> -	if (pp->ops->epp_write_addr(pp, tmp, 2, 0) != 2)
> -		goto epptimeout;
> -	/* autoprobe baud rate */
> -	tstart = jiffies;
> -	i = 0;
> -	while (time_before(jiffies, tstart + HZ/3)) {
> -		if (pp->ops->epp_read_addr(pp, &stat, 1, 0) != 1)
> -			goto epptimeout;
> -		if ((stat & (EPP_NRAEF|EPP_NRHF)) == EPP_NRHF) {
> -			schedule();
> -			continue;
> -		}
> -		if (pp->ops->epp_read_data(pp, tmp, 128, 0) != 128)
> -			goto epptimeout;
> -		if (pp->ops->epp_read_data(pp, tmp, 128, 0) != 128)
> -			goto epptimeout;
> -		i += 256;
> -	}
> -	for (j = 0; j < 256; j++) {
> -		if (pp->ops->epp_read_addr(pp, &stat, 1, 0) != 1)
> -			goto epptimeout;
> -		if (!(stat & EPP_NREF))
> -			break;
> -		if (pp->ops->epp_read_data(pp, tmp, 1, 0) != 1)
> -			goto epptimeout;
> -		i++;
> -	}
> -	tstart = jiffies - tstart;
> -	bc->bitrate = i * (8 * HZ) / tstart;
> -	j = 1;
> -	i = bc->bitrate >> 3;
> -	while (j < 7 && i > 150) {
> -		j++;
> -		i >>= 1;
> -	}
> -	printk(KERN_INFO "%s: autoprobed bitrate: %d  int divider: %d  int rate: %d\n",
> -	       bc_drvname, bc->bitrate, j, bc->bitrate >> (j+2));
> -	tmp[0] = EPP_TX_FIFO_ENABLE|EPP_RX_FIFO_ENABLE|EPP_MODEM_ENABLE/*|j*/;
> -	if (pp->ops->epp_write_addr(pp, tmp, 1, 0) != 1)
> -		goto epptimeout;
> -	/*
> -	 * initialise hdlc variables
> -	 */
> -	bc->hdlcrx.state = 0;
> -	bc->hdlcrx.numbits = 0;
> -	bc->hdlctx.state = tx_idle;
> -	bc->hdlctx.bufcnt = 0;
> -	bc->hdlctx.slotcnt = bc->ch_params.slottime;
> -	bc->hdlctx.calibrate = 0;
> -	/* start the bottom half stuff */
> -	schedule_delayed_work(&bc->run_work, 1);
> -	netif_start_queue(dev);
> -	return 0;
> -
> - epptimeout:
> -	printk(KERN_ERR "%s: epp timeout during bitrate probe\n", bc_drvname);
> -	parport_write_control(pp, 0); /* reset the adapter */
> -        parport_release(bc->pdev);
> -        parport_unregister_device(bc->pdev);
> -	return -EIO;
> -}
> -
> -/* --------------------------------------------------------------------- */
> -
> -static int epp_close(struct net_device *dev)
> -{
> -	struct baycom_state *bc = netdev_priv(dev);
> -	struct parport *pp = bc->pdev->port;
> -	unsigned char tmp[1];
> -
> -	bc->work_running = 0;
> -	cancel_delayed_work_sync(&bc->run_work);
> -	bc->stat = EPP_DCDBIT;
> -	tmp[0] = 0;
> -	pp->ops->epp_write_addr(pp, tmp, 1, 0);
> -	parport_write_control(pp, 0); /* reset the adapter */
> -        parport_release(bc->pdev);
> -        parport_unregister_device(bc->pdev);
> -	dev_kfree_skb(bc->skb);
> -	bc->skb = NULL;
> -	printk(KERN_INFO "%s: close epp at iobase 0x%lx irq %u\n",
> -	       bc_drvname, dev->base_addr, dev->irq);
> -	return 0;
> -}
> -
> -/* --------------------------------------------------------------------- */
> -
> -static int baycom_setmode(struct baycom_state *bc, const char *modestr)
> -{
> -	const char *cp;
> -
> -	if (strstr(modestr,"intclk"))
> -		bc->cfg.intclk = 1;
> -	if (strstr(modestr,"extclk"))
> -		bc->cfg.intclk = 0;
> -	if (strstr(modestr,"intmodem"))
> -		bc->cfg.extmodem = 0;
> -	if (strstr(modestr,"extmodem"))
> -		bc->cfg.extmodem = 1;
> -	if (strstr(modestr,"loopback"))
> -		bc->cfg.loopback = 1;
> -	if (strstr(modestr, "noloopback"))
> -		bc->cfg.loopback = 0;
> -	if ((cp = strstr(modestr,"fclk="))) {
> -		bc->cfg.fclk = simple_strtoul(cp+5, NULL, 0);
> -		if (bc->cfg.fclk < 1000000)
> -			bc->cfg.fclk = 1000000;
> -		if (bc->cfg.fclk > 25000000)
> -			bc->cfg.fclk = 25000000;
> -	}
> -	if ((cp = strstr(modestr,"bps="))) {
> -		bc->cfg.bps = simple_strtoul(cp+4, NULL, 0);
> -		if (bc->cfg.bps < 1000)
> -			bc->cfg.bps = 1000;
> -		if (bc->cfg.bps > 1500000)
> -			bc->cfg.bps = 1500000;
> -	}
> -	return 0;
> -}
> -
> -/* --------------------------------------------------------------------- */
> -
> -static int baycom_siocdevprivate(struct net_device *dev, struct ifreq *ifr,
> -				 void __user *data, int cmd)
> -{
> -	struct baycom_state *bc = netdev_priv(dev);
> -	struct hdlcdrv_ioctl hi;
> -
> -	if (cmd != SIOCDEVPRIVATE)
> -		return -ENOIOCTLCMD;
> -
> -	if (copy_from_user(&hi, data, sizeof(hi)))
> -		return -EFAULT;
> -	switch (hi.cmd) {
> -	default:
> -		return -ENOIOCTLCMD;
> -
> -	case HDLCDRVCTL_GETCHANNELPAR:
> -		hi.data.cp.tx_delay = bc->ch_params.tx_delay;
> -		hi.data.cp.tx_tail = bc->ch_params.tx_tail;
> -		hi.data.cp.slottime = bc->ch_params.slottime;
> -		hi.data.cp.ppersist = bc->ch_params.ppersist;
> -		hi.data.cp.fulldup = bc->ch_params.fulldup;
> -		break;
> -
> -	case HDLCDRVCTL_SETCHANNELPAR:
> -		if (!capable(CAP_NET_ADMIN))
> -			return -EACCES;
> -		bc->ch_params.tx_delay = hi.data.cp.tx_delay;
> -		bc->ch_params.tx_tail = hi.data.cp.tx_tail;
> -		bc->ch_params.slottime = hi.data.cp.slottime;
> -		bc->ch_params.ppersist = hi.data.cp.ppersist;
> -		bc->ch_params.fulldup = hi.data.cp.fulldup;
> -		bc->hdlctx.slotcnt = 1;
> -		return 0;
> -		
> -	case HDLCDRVCTL_GETMODEMPAR:
> -		hi.data.mp.iobase = dev->base_addr;
> -		hi.data.mp.irq = dev->irq;
> -		hi.data.mp.dma = dev->dma;
> -		hi.data.mp.dma2 = 0;
> -		hi.data.mp.seriobase = 0;
> -		hi.data.mp.pariobase = 0;
> -		hi.data.mp.midiiobase = 0;
> -		break;
> -
> -	case HDLCDRVCTL_SETMODEMPAR:
> -		if ((!capable(CAP_SYS_RAWIO)) || netif_running(dev))
> -			return -EACCES;
> -		dev->base_addr = hi.data.mp.iobase;
> -		dev->irq = /*hi.data.mp.irq*/0;
> -		dev->dma = /*hi.data.mp.dma*/0;
> -		return 0;	
> -		
> -	case HDLCDRVCTL_GETSTAT:
> -		hi.data.cs.ptt = !!(bc->stat & EPP_PTTBIT);
> -		hi.data.cs.dcd = !(bc->stat & EPP_DCDBIT);
> -		hi.data.cs.ptt_keyed = bc->ptt_keyed;
> -		hi.data.cs.tx_packets = dev->stats.tx_packets;
> -		hi.data.cs.tx_errors = dev->stats.tx_errors;
> -		hi.data.cs.rx_packets = dev->stats.rx_packets;
> -		hi.data.cs.rx_errors = dev->stats.rx_errors;
> -		break;		
> -
> -	case HDLCDRVCTL_OLDGETSTAT:
> -		hi.data.ocs.ptt = !!(bc->stat & EPP_PTTBIT);
> -		hi.data.ocs.dcd = !(bc->stat & EPP_DCDBIT);
> -		hi.data.ocs.ptt_keyed = bc->ptt_keyed;
> -		break;		
> -
> -	case HDLCDRVCTL_CALIBRATE:
> -		if (!capable(CAP_SYS_RAWIO))
> -			return -EACCES;
> -		bc->hdlctx.calibrate = hi.data.calibrate * bc->bitrate / 8;
> -		return 0;
> -
> -	case HDLCDRVCTL_DRIVERNAME:
> -		strscpy_pad(hi.data.drivername, "baycom_epp");
> -		break;
> -		
> -	case HDLCDRVCTL_GETMODE:
> -		sprintf(hi.data.modename, "%sclk,%smodem,fclk=%d,bps=%d%s",
> -			bc->cfg.intclk ? "int" : "ext",
> -			bc->cfg.extmodem ? "ext" : "int", bc->cfg.fclk, bc->cfg.bps,
> -			bc->cfg.loopback ? ",loopback" : "");
> -		break;
> -
> -	case HDLCDRVCTL_SETMODE:
> -		if (!capable(CAP_NET_ADMIN) || netif_running(dev))
> -			return -EACCES;
> -		hi.data.modename[sizeof(hi.data.modename)-1] = '\0';
> -		return baycom_setmode(bc, hi.data.modename);
> -
> -	case HDLCDRVCTL_MODELIST:
> -		strscpy_pad(hi.data.modename, "intclk,extclk,intmodem,extmodem,divider=x");
> -		break;
> -
> -	case HDLCDRVCTL_MODEMPARMASK:
> -		return HDLCDRV_PARMASK_IOBASE;
> -
> -	}
> -	if (copy_to_user(data, &hi, sizeof(hi)))
> -		return -EFAULT;
> -	return 0;
> -}
> -
> -/* --------------------------------------------------------------------- */
> -
> -static const struct net_device_ops baycom_netdev_ops = {
> -	.ndo_open	     = epp_open,
> -	.ndo_stop	     = epp_close,
> -	.ndo_siocdevprivate  = baycom_siocdevprivate,
> -	.ndo_start_xmit      = baycom_send_packet,
> -	.ndo_set_mac_address = baycom_set_mac_address,
> -};
> -
> -/*
> - * Check for a network adaptor of this type, and return '0' if one exists.
> - * If dev->base_addr == 0, probe all likely locations.
> - * If dev->base_addr == 1, always return failure.
> - * If dev->base_addr == 2, allocate space for the device and return success
> - * (detachable devices only).
> - */
> -static void baycom_probe(struct net_device *dev)
> -{
> -	const struct hdlcdrv_channel_params dflt_ch_params = {
> -		20, 2, 10, 40, 0
> -	};
> -	struct baycom_state *bc;
> -
> -	/*
> -	 * not a real probe! only initialize data structures
> -	 */
> -	bc = netdev_priv(dev);
> -	/*
> -	 * initialize the baycom_state struct
> -	 */
> -	bc->ch_params = dflt_ch_params;
> -	bc->ptt_keyed = 0;
> -
> -	/*
> -	 * initialize the device struct
> -	 */
> -
> -	/* Fill in the fields of the device structure */
> -	bc->skb = NULL;
> -	
> -	dev->netdev_ops = &baycom_netdev_ops;
> -	dev->header_ops = &ax25_header_ops;
> -	
> -	dev->type = ARPHRD_AX25;           /* AF_AX25 device */
> -	dev->hard_header_len = AX25_MAX_HEADER_LEN + AX25_BPQ_HEADER_LEN;
> -	dev->mtu = AX25_DEF_PACLEN;        /* eth_mtu is the default */
> -	dev->addr_len = AX25_ADDR_LEN;     /* sizeof an ax.25 address */
> -	memcpy(dev->broadcast, &ax25_bcast, AX25_ADDR_LEN);
> -	dev_addr_set(dev, (u8 *)&null_ax25_address);
> -	dev->tx_queue_len = 16;
> -
> -	/* New style flags */
> -	dev->flags = 0;
> -}
> -
> -/* --------------------------------------------------------------------- */
> -
> -/*
> - * command line settable parameters
> - */
> -static char *mode[NR_PORTS] = { "", };
> -static int iobase[NR_PORTS] = { 0x378, };
> -
> -module_param_array(mode, charp, NULL, 0);
> -MODULE_PARM_DESC(mode, "baycom operating mode");
> -module_param_hw_array(iobase, int, ioport, NULL, 0);
> -MODULE_PARM_DESC(iobase, "baycom io base address");
> -
> -MODULE_AUTHOR("Thomas M. Sailer, sailer@ife.ee.ethz.ch, hb9jnx@hb9w.che.eu");
> -MODULE_DESCRIPTION("Baycom epp amateur radio modem driver");
> -MODULE_LICENSE("GPL");
> -
> -/* --------------------------------------------------------------------- */
> -
> -static int baycom_epp_par_probe(struct pardevice *par_dev)
> -{
> -	struct device_driver *drv = par_dev->dev.driver;
> -	int len = strlen(drv->name);
> -
> -	if (strncmp(par_dev->name, drv->name, len))
> -		return -ENODEV;
> -
> -	return 0;
> -}
> -
> -static struct parport_driver baycom_epp_par_driver = {
> -	.name = "bce",
> -	.probe = baycom_epp_par_probe,
> -};
> -
> -static void __init baycom_epp_dev_setup(struct net_device *dev)
> -{
> -	struct baycom_state *bc = netdev_priv(dev);
> -
> -	/*
> -	 * initialize part of the baycom_state struct
> -	 */
> -	bc->dev = dev;
> -	bc->magic = BAYCOM_MAGIC;
> -	bc->cfg.fclk = 19666600;
> -	bc->cfg.bps = 9600;
> -	/*
> -	 * initialize part of the device struct
> -	 */
> -	baycom_probe(dev);
> -}
> -
> -static int __init init_baycomepp(void)
> -{
> -	int i, found = 0, ret;
> -	char set_hw = 1;
> -
> -	printk(bc_drvinfo);
> -
> -	ret = parport_register_driver(&baycom_epp_par_driver);
> -	if (ret)
> -		return ret;
> -
> -	/*
> -	 * register net devices
> -	 */
> -	for (i = 0; i < NR_PORTS; i++) {
> -		struct net_device *dev;
> -		
> -		dev = alloc_netdev(sizeof(struct baycom_state), "bce%d",
> -				   NET_NAME_UNKNOWN, baycom_epp_dev_setup);
> -
> -		if (!dev) {
> -			printk(KERN_WARNING "bce%d : out of memory\n", i);
> -			return found ? 0 : -ENOMEM;
> -		}
> -			
> -		sprintf(dev->name, "bce%d", i);
> -		dev->base_addr = iobase[i];
> -
> -		if (!mode[i])
> -			set_hw = 0;
> -		if (!set_hw)
> -			iobase[i] = 0;
> -
> -		if (register_netdev(dev)) {
> -			printk(KERN_WARNING "%s: cannot register net device %s\n", bc_drvname, dev->name);
> -			free_netdev(dev);
> -			break;
> -		}
> -		if (set_hw && baycom_setmode(netdev_priv(dev), mode[i]))
> -			set_hw = 0;
> -		baycom_device[i] = dev;
> -		found++;
> -	}
> -
> -	if (found == 0) {
> -		parport_unregister_driver(&baycom_epp_par_driver);
> -		return -ENXIO;
> -	}
> -
> -	return 0;
> -}
> -
> -static void __exit cleanup_baycomepp(void)
> -{
> -	int i;
> -
> -	for(i = 0; i < NR_PORTS; i++) {
> -		struct net_device *dev = baycom_device[i];
> -
> -		if (dev) {
> -			struct baycom_state *bc = netdev_priv(dev);
> -			if (bc->magic == BAYCOM_MAGIC) {
> -				unregister_netdev(dev);
> -				free_netdev(dev);
> -			} else
> -				printk(paranoia_str, "cleanup_module");
> -		}
> -	}
> -	parport_unregister_driver(&baycom_epp_par_driver);
> -}
> -
> -module_init(init_baycomepp);
> -module_exit(cleanup_baycomepp);
> -
> -/* --------------------------------------------------------------------- */
> -
> -#ifndef MODULE
> -
> -/*
> - * format: baycom_epp=io,mode
> - * mode: fpga config options
> - */
> -
> -static int __init baycom_epp_setup(char *str)
> -{
> -        static unsigned __initdata nr_dev = 0;
> -	int ints[2];
> -
> -        if (nr_dev >= NR_PORTS)
> -                return 0;
> -	str = get_options(str, 2, ints);
> -	if (ints[0] < 1)
> -		return 0;
> -	mode[nr_dev] = str;
> -	iobase[nr_dev] = ints[1];
> -	nr_dev++;
> -	return 1;
> -}
> -
> -__setup("baycom_epp=", baycom_epp_setup);
> -
> -#endif /* MODULE */
> -/* --------------------------------------------------------------------- */
> diff --git a/drivers/net/hamradio/baycom_par.c b/drivers/net/hamradio/baycom_par.c
> deleted file mode 100644
> index f03797103c6a..000000000000
> --- a/drivers/net/hamradio/baycom_par.c
> +++ /dev/null
> @@ -1,598 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-or-later
> -/*****************************************************************************/
> -
> -/*
> - *	baycom_par.c  -- baycom par96 and picpar radio modem driver.
> - *
> - *	Copyright (C) 1996-2000  Thomas Sailer (sailer@ife.ee.ethz.ch)
> - *
> - *  Please note that the GPL allows you to use the driver, NOT the radio.
> - *  In order to use the radio, you need a license from the communications
> - *  authority of your country.
> - *
> - *  Supported modems
> - *
> - *  par96:  This is a modem for 9600 baud FSK compatible to the G3RUH standard.
> - *          The modem does all the filtering and regenerates the receiver clock.
> - *          Data is transferred from and to the PC via a shift register.
> - *          The shift register is filled with 16 bits and an interrupt is
> - *          signalled. The PC then empties the shift register in a burst. This
> - *          modem connects to the parallel port, hence the name. The modem
> - *          leaves the implementation of the HDLC protocol and the scrambler
> - *          polynomial to the PC. This modem is no longer available (at least
> - *          from Baycom) and has been replaced by the PICPAR modem (see below).
> - *          You may however still build one from the schematics published in
> - *          cq-DL :-).
> - *
> - *  picpar: This is a redesign of the par96 modem by Henning Rech, DF9IC. The
> - *          modem is protocol compatible to par96, but uses only three low
> - *          power ICs and can therefore be fed from the parallel port and
> - *          does not require an additional power supply. It features
> - *          built in DCD circuitry. The driver should therefore be configured
> - *          for hardware DCD.
> - *
> - *  Command line options (insmod command line)
> - *
> - *  mode     driver mode string. Valid choices are par96 and picpar.
> - *  iobase   base address of the port; common values are 0x378, 0x278, 0x3bc
> - *
> - *  History:
> - *   0.1  26.06.1996  Adapted from baycom.c and made network driver interface
> - *        18.10.1996  Changed to new user space access routines (copy_{to,from}_user)
> - *   0.3  26.04.1997  init code/data tagged
> - *   0.4  08.07.1997  alternative ser12 decoding algorithm (uses delta CTS ints)
> - *   0.5  11.11.1997  split into separate files for ser12/par96
> - *   0.6  03.08.1999  adapt to Linus' new __setup/__initcall
> - *                    removed some pre-2.2 kernel compatibility cruft
> - *   0.7  10.08.1999  Check if parport can do SPP and is safe to access during interrupt contexts
> - *   0.8  12.02.2000  adapted to softnet driver interface
> - *                    removed direct parport access, uses parport driver methods
> - *   0.9  03.07.2000  fix interface name handling
> - */
> -
> -/*****************************************************************************/
> -
> -#include <linux/module.h>
> -#include <linux/kernel.h>
> -#include <linux/types.h>
> -#include <linux/fcntl.h>
> -#include <linux/interrupt.h>
> -#include <linux/ioport.h>
> -#include <linux/in.h>
> -#include <linux/string.h>
> -#include <linux/init.h>
> -#include <linux/delay.h>
> -#include <linux/errno.h>
> -#include <linux/netdevice.h>
> -#include <linux/hdlcdrv.h>
> -#include <linux/baycom.h>
> -#include <linux/parport.h>
> -#include <linux/bitops.h>
> -#include <linux/jiffies.h>
> -
> -#include <linux/uaccess.h>
> -
> -/* --------------------------------------------------------------------- */
> -
> -#define BAYCOM_DEBUG
> -
> -/*
> - * modem options; bit mask
> - */
> -#define BAYCOM_OPTIONS_SOFTDCD  1
> -
> -/* --------------------------------------------------------------------- */
> -
> -static const char bc_drvname[] = "baycom_par";
> -static const char bc_drvinfo[] = KERN_INFO "baycom_par: (C) 1996-2000 Thomas Sailer, HB9JNX/AE4WA\n"
> -"baycom_par: version 0.9\n";
> -
> -/* --------------------------------------------------------------------- */
> -
> -#define NR_PORTS 4
> -
> -static struct net_device *baycom_device[NR_PORTS];
> -
> -/* --------------------------------------------------------------------- */
> -
> -#define PAR96_BURSTBITS 16
> -#define PAR96_BURST     4
> -#define PAR96_PTT       2
> -#define PAR96_TXBIT     1
> -#define PAR96_ACK       0x40
> -#define PAR96_RXBIT     0x20
> -#define PAR96_DCD       0x10
> -#define PAR97_POWER     0xf8
> -
> -/* ---------------------------------------------------------------------- */
> -/*
> - * Information that need to be kept for each board.
> - */
> -
> -struct baycom_state {
> -	struct hdlcdrv_state hdrv;
> -
> -	struct pardevice *pdev;
> -	unsigned int options;
> -
> -	struct modem_state {
> -		short arb_divider;
> -		unsigned char flags;
> -		unsigned int shreg;
> -		struct modem_state_par96 {
> -			int dcd_count;
> -			unsigned int dcd_shreg;
> -			unsigned long descram;
> -			unsigned long scram;
> -		} par96;
> -	} modem;
> -
> -#ifdef BAYCOM_DEBUG
> -	struct debug_vals {
> -		unsigned long last_jiffies;
> -		unsigned cur_intcnt;
> -		unsigned last_intcnt;
> -		int cur_pllcorr;
> -		int last_pllcorr;
> -	} debug_vals;
> -#endif /* BAYCOM_DEBUG */
> -};
> -
> -/* --------------------------------------------------------------------- */
> -
> -static inline void baycom_int_freq(struct baycom_state *bc)
> -{
> -#ifdef BAYCOM_DEBUG
> -	unsigned long cur_jiffies = jiffies;
> -	/*
> -	 * measure the interrupt frequency
> -	 */
> -	bc->debug_vals.cur_intcnt++;
> -	if (time_after_eq(cur_jiffies, bc->debug_vals.last_jiffies + HZ)) {
> -		bc->debug_vals.last_jiffies = cur_jiffies;
> -		bc->debug_vals.last_intcnt = bc->debug_vals.cur_intcnt;
> -		bc->debug_vals.cur_intcnt = 0;
> -		bc->debug_vals.last_pllcorr = bc->debug_vals.cur_pllcorr;
> -		bc->debug_vals.cur_pllcorr = 0;
> -	}
> -#endif /* BAYCOM_DEBUG */
> -}
> -
> -/* --------------------------------------------------------------------- */
> -/*
> - * ===================== PAR96 specific routines =========================
> - */
> -
> -#define PAR96_DESCRAM_TAP1 0x20000
> -#define PAR96_DESCRAM_TAP2 0x01000
> -#define PAR96_DESCRAM_TAP3 0x00001
> -
> -#define PAR96_DESCRAM_TAPSH1 17
> -#define PAR96_DESCRAM_TAPSH2 12
> -#define PAR96_DESCRAM_TAPSH3 0
> -
> -#define PAR96_SCRAM_TAP1 0x20000 /* X^17 */
> -#define PAR96_SCRAM_TAPN 0x00021 /* X^0+X^5 */
> -
> -/* --------------------------------------------------------------------- */
> -
> -static inline void par96_tx(struct net_device *dev, struct baycom_state *bc)
> -{
> -	int i;
> -	unsigned int data = hdlcdrv_getbits(&bc->hdrv);
> -	struct parport *pp = bc->pdev->port;
> -
> -	for(i = 0; i < PAR96_BURSTBITS; i++, data >>= 1) {
> -		unsigned char val = PAR97_POWER;
> -		bc->modem.par96.scram = ((bc->modem.par96.scram << 1) |
> -					 (bc->modem.par96.scram & 1));
> -		if (!(data & 1))
> -			bc->modem.par96.scram ^= 1;
> -		if (bc->modem.par96.scram & (PAR96_SCRAM_TAP1 << 1))
> -			bc->modem.par96.scram ^=
> -				(PAR96_SCRAM_TAPN << 1);
> -		if (bc->modem.par96.scram & (PAR96_SCRAM_TAP1 << 2))
> -			val |= PAR96_TXBIT;
> -		pp->ops->write_data(pp, val);
> -		pp->ops->write_data(pp, val | PAR96_BURST);
> -	}
> -}
> -
> -/* --------------------------------------------------------------------- */
> -
> -static inline void par96_rx(struct net_device *dev, struct baycom_state *bc)
> -{
> -	int i;
> -	unsigned int data, mask, mask2, descx;
> -	struct parport *pp = bc->pdev->port;
> -
> -	/*
> -	 * do receiver; differential decode and descramble on the fly
> -	 */
> -	for(data = i = 0; i < PAR96_BURSTBITS; i++) {
> -		bc->modem.par96.descram = (bc->modem.par96.descram << 1);
> -		if (pp->ops->read_status(pp) & PAR96_RXBIT)
> -			bc->modem.par96.descram |= 1;
> -		descx = bc->modem.par96.descram ^
> -			(bc->modem.par96.descram >> 1);
> -		/* now the diff decoded data is inverted in descram */
> -		pp->ops->write_data(pp, PAR97_POWER | PAR96_PTT);
> -		descx ^= ((descx >> PAR96_DESCRAM_TAPSH1) ^
> -			  (descx >> PAR96_DESCRAM_TAPSH2));
> -		data >>= 1;
> -		if (!(descx & 1))
> -			data |= 0x8000;
> -		pp->ops->write_data(pp, PAR97_POWER | PAR96_PTT | PAR96_BURST);
> -	}
> -	hdlcdrv_putbits(&bc->hdrv, data);
> -	/*
> -	 * do DCD algorithm
> -	 */
> -	if (bc->options & BAYCOM_OPTIONS_SOFTDCD) {
> -		bc->modem.par96.dcd_shreg = (bc->modem.par96.dcd_shreg >> 16)
> -			| (data << 16);
> -		/* search for flags and set the dcd counter appropriately */
> -		for(mask = 0x1fe00, mask2 = 0xfc00, i = 0;
> -		    i < PAR96_BURSTBITS; i++, mask <<= 1, mask2 <<= 1)
> -			if ((bc->modem.par96.dcd_shreg & mask) == mask2)
> -				bc->modem.par96.dcd_count = HDLCDRV_MAXFLEN+4;
> -		/* check for abort/noise sequences */
> -		for(mask = 0x1fe00, mask2 = 0x1fe00, i = 0;
> -		    i < PAR96_BURSTBITS; i++, mask <<= 1, mask2 <<= 1)
> -			if (((bc->modem.par96.dcd_shreg & mask) == mask2) &&
> -			    (bc->modem.par96.dcd_count >= 0))
> -				bc->modem.par96.dcd_count -= HDLCDRV_MAXFLEN-10;
> -		/* decrement and set the dcd variable */
> -		if (bc->modem.par96.dcd_count >= 0)
> -			bc->modem.par96.dcd_count -= 2;
> -		hdlcdrv_setdcd(&bc->hdrv, bc->modem.par96.dcd_count > 0);
> -	} else {
> -		hdlcdrv_setdcd(&bc->hdrv, !!(pp->ops->read_status(pp) & PAR96_DCD));
> -	}
> -}
> -
> -/* --------------------------------------------------------------------- */
> -
> -static void par96_interrupt(void *dev_id)
> -{
> -	struct net_device *dev = dev_id;
> -	struct baycom_state *bc = netdev_priv(dev);
> -
> -	baycom_int_freq(bc);
> -	/*
> -	 * check if transmitter active
> -	 */
> -	if (hdlcdrv_ptt(&bc->hdrv))
> -		par96_tx(dev, bc);
> -	else {
> -		par96_rx(dev, bc);
> -		if (--bc->modem.arb_divider <= 0) {
> -			bc->modem.arb_divider = 6;
> -			local_irq_enable();
> -			hdlcdrv_arbitrate(dev, &bc->hdrv);
> -		}
> -	}
> -	local_irq_enable();
> -	hdlcdrv_transmitter(dev, &bc->hdrv);
> -	hdlcdrv_receiver(dev, &bc->hdrv);
> -        local_irq_disable();
> -}
> -
> -/* --------------------------------------------------------------------- */
> -
> -static void par96_wakeup(void *handle)
> -{
> -        struct net_device *dev = (struct net_device *)handle;
> -	struct baycom_state *bc = netdev_priv(dev);
> -
> -	printk(KERN_DEBUG "baycom_par: %s: why am I being woken up?\n", dev->name);
> -	if (!parport_claim(bc->pdev))
> -		printk(KERN_DEBUG "baycom_par: %s: I'm broken.\n", dev->name);
> -}
> -
> -/* --------------------------------------------------------------------- */
> -
> -static int par96_open(struct net_device *dev)
> -{
> -	struct baycom_state *bc = netdev_priv(dev);
> -	struct pardev_cb par_cb;
> -	struct parport *pp;
> -	int i;
> -
> -	if (!dev || !bc)
> -		return -ENXIO;
> -	pp = parport_find_base(dev->base_addr);
> -	if (!pp) {
> -		printk(KERN_ERR "baycom_par: parport at 0x%lx unknown\n", dev->base_addr);
> -		return -ENXIO;
> -	}
> -	if (pp->irq < 0) {
> -		printk(KERN_ERR "baycom_par: parport at 0x%lx has no irq\n", pp->base);
> -		parport_put_port(pp);
> -		return -ENXIO;
> -	}
> -	if ((~pp->modes) & (PARPORT_MODE_PCSPP | PARPORT_MODE_SAFEININT)) {
> -		printk(KERN_ERR "baycom_par: parport at 0x%lx cannot be used\n", pp->base);
> -		parport_put_port(pp);
> -		return -ENXIO;
> -	}
> -	memset(&bc->modem, 0, sizeof(bc->modem));
> -	bc->hdrv.par.bitrate = 9600;
> -	memset(&par_cb, 0, sizeof(par_cb));
> -	par_cb.wakeup = par96_wakeup;
> -	par_cb.irq_func = par96_interrupt;
> -	par_cb.private = (void *)dev;
> -	par_cb.flags = PARPORT_DEV_EXCL;
> -	for (i = 0; i < NR_PORTS; i++)
> -		if (baycom_device[i] == dev)
> -			break;
> -
> -	if (i == NR_PORTS) {
> -		pr_err("%s: no device found\n", bc_drvname);
> -		parport_put_port(pp);
> -		return -ENODEV;
> -	}
> -	bc->pdev = parport_register_dev_model(pp, dev->name, &par_cb, i);
> -	parport_put_port(pp);
> -	if (!bc->pdev) {
> -		printk(KERN_ERR "baycom_par: cannot register parport at 0x%lx\n", dev->base_addr);
> -		return -ENXIO;
> -	}
> -	if (parport_claim(bc->pdev)) {
> -		printk(KERN_ERR "baycom_par: parport at 0x%lx busy\n", pp->base);
> -		parport_unregister_device(bc->pdev);
> -		return -EBUSY;
> -	}
> -	pp = bc->pdev->port;
> -	dev->irq = pp->irq;
> -	pp->ops->data_forward(pp);
> -        bc->hdrv.par.bitrate = 9600;
> -	pp->ops->write_data(pp, PAR96_PTT | PAR97_POWER); /* switch off PTT */
> -	pp->ops->enable_irq(pp);
> -	printk(KERN_INFO "%s: par96 at iobase 0x%lx irq %u options 0x%x\n",
> -	       bc_drvname, dev->base_addr, dev->irq, bc->options);
> -	return 0;
> -}
> -
> -/* --------------------------------------------------------------------- */
> -
> -static int par96_close(struct net_device *dev)
> -{
> -	struct baycom_state *bc = netdev_priv(dev);
> -	struct parport *pp;
> -
> -	if (!dev || !bc)
> -		return -EINVAL;
> -	pp = bc->pdev->port;
> -	/* disable interrupt */
> -	pp->ops->disable_irq(pp);
> -	/* switch off PTT */
> -	pp->ops->write_data(pp, PAR96_PTT | PAR97_POWER);
> -	parport_release(bc->pdev);
> -	parport_unregister_device(bc->pdev);
> -	printk(KERN_INFO "%s: close par96 at iobase 0x%lx irq %u\n",
> -	       bc_drvname, dev->base_addr, dev->irq);
> -	return 0;
> -}
> -
> -/* --------------------------------------------------------------------- */
> -/*
> - * ===================== hdlcdrv driver interface =========================
> - */
> -
> -static int baycom_ioctl(struct net_device *dev, void __user *data,
> -			struct hdlcdrv_ioctl *hi, int cmd);
> -
> -/* --------------------------------------------------------------------- */
> -
> -static const struct hdlcdrv_ops par96_ops = {
> -	.drvname = bc_drvname,
> -	.drvinfo = bc_drvinfo,
> -	.open    = par96_open,
> -	.close   = par96_close,
> -	.ioctl   = baycom_ioctl
> -};
> -
> -/* --------------------------------------------------------------------- */
> -
> -static int baycom_setmode(struct baycom_state *bc, const char *modestr)
> -{
> -	if (!strncmp(modestr, "picpar", 6))
> -		bc->options = 0;
> -	else if (!strncmp(modestr, "par96", 5))
> -		bc->options = BAYCOM_OPTIONS_SOFTDCD;
> -	else
> -		bc->options = !!strchr(modestr, '*');
> -	return 0;
> -}
> -
> -/* --------------------------------------------------------------------- */
> -
> -static int baycom_ioctl(struct net_device *dev, void __user *data,
> -			struct hdlcdrv_ioctl *hi, int cmd)
> -{
> -	struct baycom_state *bc;
> -	struct baycom_ioctl bi;
> -
> -	if (!dev)
> -		return -EINVAL;
> -
> -	bc = netdev_priv(dev);
> -	BUG_ON(bc->hdrv.magic != HDLCDRV_MAGIC);
> -
> -	if (cmd != SIOCDEVPRIVATE)
> -		return -ENOIOCTLCMD;
> -	switch (hi->cmd) {
> -	default:
> -		break;
> -
> -	case HDLCDRVCTL_GETMODE:
> -		strscpy(hi->data.modename, bc->options ? "par96" : "picpar");
> -		if (copy_to_user(data, hi, sizeof(struct hdlcdrv_ioctl)))
> -			return -EFAULT;
> -		return 0;
> -
> -	case HDLCDRVCTL_SETMODE:
> -		if (netif_running(dev) || !capable(CAP_NET_ADMIN))
> -			return -EACCES;
> -		hi->data.modename[sizeof(hi->data.modename)-1] = '\0';
> -		return baycom_setmode(bc, hi->data.modename);
> -
> -	case HDLCDRVCTL_MODELIST:
> -		strscpy(hi->data.modename, "par96,picpar");
> -		if (copy_to_user(data, hi, sizeof(struct hdlcdrv_ioctl)))
> -			return -EFAULT;
> -		return 0;
> -
> -	case HDLCDRVCTL_MODEMPARMASK:
> -		return HDLCDRV_PARMASK_IOBASE;
> -
> -	}
> -
> -	if (copy_from_user(&bi, data, sizeof(bi)))
> -		return -EFAULT;
> -	switch (bi.cmd) {
> -	default:
> -		return -ENOIOCTLCMD;
> -
> -#ifdef BAYCOM_DEBUG
> -	case BAYCOMCTL_GETDEBUG:
> -		bi.data.dbg.debug1 = bc->hdrv.ptt_keyed;
> -		bi.data.dbg.debug2 = bc->debug_vals.last_intcnt;
> -		bi.data.dbg.debug3 = bc->debug_vals.last_pllcorr;
> -		break;
> -#endif /* BAYCOM_DEBUG */
> -
> -	}
> -	if (copy_to_user(data, &bi, sizeof(bi)))
> -		return -EFAULT;
> -	return 0;
> -
> -}
> -
> -/* --------------------------------------------------------------------- */
> -
> -/*
> - * command line settable parameters
> - */
> -static char *mode[NR_PORTS] = { "picpar", };
> -static int iobase[NR_PORTS] = { 0x378, };
> -
> -module_param_array(mode, charp, NULL, 0);
> -MODULE_PARM_DESC(mode, "baycom operating mode; eg. par96 or picpar");
> -module_param_hw_array(iobase, int, ioport, NULL, 0);
> -MODULE_PARM_DESC(iobase, "baycom io base address");
> -
> -MODULE_AUTHOR("Thomas M. Sailer, sailer@ife.ee.ethz.ch, hb9jnx@hb9w.che.eu");
> -MODULE_DESCRIPTION("Baycom par96 and picpar amateur radio modem driver");
> -MODULE_LICENSE("GPL");
> -
> -/* --------------------------------------------------------------------- */
> -
> -static int baycom_par_probe(struct pardevice *par_dev)
> -{
> -	struct device_driver *drv = par_dev->dev.driver;
> -	int len = strlen(drv->name);
> -
> -	if (strncmp(par_dev->name, drv->name, len))
> -		return -ENODEV;
> -
> -	return 0;
> -}
> -
> -static struct parport_driver baycom_par_driver = {
> -	.name = "bcp",
> -	.probe = baycom_par_probe,
> -};
> -
> -static int __init init_baycompar(void)
> -{
> -	int i, found = 0, ret;
> -	char set_hw = 1;
> -
> -	printk(bc_drvinfo);
> -
> -	ret = parport_register_driver(&baycom_par_driver);
> -	if (ret)
> -		return ret;
> -
> -	/*
> -	 * register net devices
> -	 */
> -	for (i = 0; i < NR_PORTS; i++) {
> -		struct net_device *dev;
> -		struct baycom_state *bc;
> -		char ifname[IFNAMSIZ];
> -
> -		sprintf(ifname, "bcp%d", i);
> -
> -		if (!mode[i])
> -			set_hw = 0;
> -		if (!set_hw)
> -			iobase[i] = 0;
> -
> -		dev = hdlcdrv_register(&par96_ops,
> -				       sizeof(struct baycom_state),
> -				       ifname, iobase[i], 0, 0);
> -		if (IS_ERR(dev))
> -			break;
> -
> -		bc = netdev_priv(dev);
> -		if (set_hw && baycom_setmode(bc, mode[i]))
> -			set_hw = 0;
> -		found++;
> -		baycom_device[i] = dev;
> -	}
> -
> -	if (!found) {
> -		parport_unregister_driver(&baycom_par_driver);
> -		return -ENXIO;
> -	}
> -	return 0;
> -}
> -
> -static void __exit cleanup_baycompar(void)
> -{
> -	int i;
> -
> -	for(i = 0; i < NR_PORTS; i++) {
> -		struct net_device *dev = baycom_device[i];
> -
> -		if (dev)
> -			hdlcdrv_unregister(dev);
> -	}
> -	parport_unregister_driver(&baycom_par_driver);
> -}
> -
> -module_init(init_baycompar);
> -module_exit(cleanup_baycompar);
> -
> -/* --------------------------------------------------------------------- */
> -
> -#ifndef MODULE
> -
> -/*
> - * format: baycom_par=io,mode
> - * mode: par96,picpar
> - */
> -
> -static int __init baycom_par_setup(char *str)
> -{
> -        static unsigned nr_dev;
> -	int ints[2];
> -
> -        if (nr_dev >= NR_PORTS)
> -                return 0;
> -        str = get_options(str, 2, ints);
> -        if (ints[0] < 1)
> -                return 0;
> -        mode[nr_dev] = str;
> -        iobase[nr_dev] = ints[1];
> -	nr_dev++;
> -	return 1;
> -}
> -
> -__setup("baycom_par=", baycom_par_setup);
> -
> -#endif /* MODULE */
> -/* --------------------------------------------------------------------- */
> diff --git a/drivers/net/hamradio/baycom_ser_fdx.c b/drivers/net/hamradio/baycom_ser_fdx.c
> deleted file mode 100644
> index ee5bd3c12040..000000000000
> --- a/drivers/net/hamradio/baycom_ser_fdx.c
> +++ /dev/null
> @@ -1,678 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-or-later
> -/*****************************************************************************/
> -
> -/*
> - *	baycom_ser_fdx.c  -- baycom ser12 fullduplex radio modem driver.
> - *
> - *	Copyright (C) 1996-2000  Thomas Sailer (sailer@ife.ee.ethz.ch)
> - *
> - *  Please note that the GPL allows you to use the driver, NOT the radio.
> - *  In order to use the radio, you need a license from the communications
> - *  authority of your country.
> - *
> - *  Supported modems
> - *
> - *  ser12:  This is a very simple 1200 baud AFSK modem. The modem consists only
> - *          of a modulator/demodulator chip, usually a TI TCM3105. The computer
> - *          is responsible for regenerating the receiver bit clock, as well as
> - *          for handling the HDLC protocol. The modem connects to a serial port,
> - *          hence the name. Since the serial port is not used as an async serial
> - *          port, the kernel driver for serial ports cannot be used, and this
> - *          driver only supports standard serial hardware (8250, 16450, 16550A)
> - *
> - *          This modem usually draws its supply current out of the otherwise unused
> - *          TXD pin of the serial port. Thus a contiguous stream of 0x00-bytes
> - *          is transmitted to achieve a positive supply voltage.
> - *
> - *  hsk:    This is a 4800 baud FSK modem, designed for TNC use. It works fine
> - *          in 'baycom-mode' :-)  In contrast to the TCM3105 modem, power is
> - *          externally supplied. So there's no need to provide the 0x00-byte-stream
> - *          when receiving or idle, which drastically reduces interrupt load.
> - *
> - *  Command line options (insmod command line)
> - *
> - *  mode     ser#    hardware DCD
> - *           ser#*   software DCD
> - *           ser#+   hardware DCD, inverted signal at DCD pin
> - *           '#' denotes the baud rate / 100, eg. ser12* is '1200 baud, soft DCD'
> - *  iobase   base address of the port; common values are 0x3f8, 0x2f8, 0x3e8, 0x2e8
> - *  baud     baud rate (between 300 and 4800)
> - *  irq      interrupt line of the port; common values are 4,3
> - *
> - *  History:
> - *   0.1  26.06.1996  Adapted from baycom.c and made network driver interface
> - *        18.10.1996  Changed to new user space access routines (copy_{to,from}_user)
> - *   0.3  26.04.1997  init code/data tagged
> - *   0.4  08.07.1997  alternative ser12 decoding algorithm (uses delta CTS ints)
> - *   0.5  11.11.1997  ser12/par96 split into separate files
> - *   0.6  24.01.1998  Thorsten Kranzkowski, dl8bcu and Thomas Sailer:
> - *                    reduced interrupt load in transmit case
> - *                    reworked receiver
> - *   0.7  03.08.1999  adapt to Linus' new __setup/__initcall
> - *   0.8  10.08.1999  use module_init/module_exit
> - *   0.9  12.02.2000  adapted to softnet driver interface
> - *   0.10 03.07.2000  fix interface name handling
> - */
> -
> -/*****************************************************************************/
> -
> -#include <linux/capability.h>
> -#include <linux/module.h>
> -#include <linux/ioport.h>
> -#include <linux/string.h>
> -#include <linux/init.h>
> -#include <linux/interrupt.h>
> -#include <linux/hdlcdrv.h>
> -#include <linux/baycom.h>
> -#include <linux/jiffies.h>
> -#include <linux/time64.h>
> -
> -#include <linux/uaccess.h>
> -#include <asm/io.h>
> -#include <asm/irq.h>
> -
> -/* --------------------------------------------------------------------- */
> -
> -#define BAYCOM_DEBUG
> -
> -/* --------------------------------------------------------------------- */
> -
> -static const char bc_drvname[] = "baycom_ser_fdx";
> -static const char bc_drvinfo[] = KERN_INFO "baycom_ser_fdx: (C) 1996-2000 Thomas Sailer, HB9JNX/AE4WA\n"
> -"baycom_ser_fdx: version 0.10\n";
> -
> -/* --------------------------------------------------------------------- */
> -
> -#define NR_PORTS 4
> -
> -static struct net_device *baycom_device[NR_PORTS];
> -
> -/* --------------------------------------------------------------------- */
> -
> -#define RBR(iobase) (iobase+0)
> -#define THR(iobase) (iobase+0)
> -#define IER(iobase) (iobase+1)
> -#define IIR(iobase) (iobase+2)
> -#define FCR(iobase) (iobase+2)
> -#define LCR(iobase) (iobase+3)
> -#define MCR(iobase) (iobase+4)
> -#define LSR(iobase) (iobase+5)
> -#define MSR(iobase) (iobase+6)
> -#define SCR(iobase) (iobase+7)
> -#define DLL(iobase) (iobase+0)
> -#define DLM(iobase) (iobase+1)
> -
> -#define SER12_EXTENT 8
> -
> -/* ---------------------------------------------------------------------- */
> -/*
> - * Information that need to be kept for each board.
> - */
> -
> -struct baycom_state {
> -	struct hdlcdrv_state hdrv;
> -
> -	unsigned int baud, baud_us, baud_arbdiv, baud_uartdiv, baud_dcdtimeout;
> -	int opt_dcd;
> -
> -	struct modem_state {
> -		unsigned char flags;
> -		unsigned char ptt;
> -		unsigned int shreg;
> -		struct modem_state_ser12 {
> -			unsigned char tx_bit;
> -			unsigned char last_rxbit;
> -			int dcd_sum0, dcd_sum1, dcd_sum2;
> -			int dcd_time;
> -			unsigned int pll_time;
> -			unsigned int txshreg;
> -		} ser12;
> -	} modem;
> -
> -#ifdef BAYCOM_DEBUG
> -	struct debug_vals {
> -		unsigned long last_jiffies;
> -		unsigned cur_intcnt;
> -		unsigned last_intcnt;
> -		int cur_pllcorr;
> -		int last_pllcorr;
> -	} debug_vals;
> -#endif /* BAYCOM_DEBUG */
> -};
> -
> -/* --------------------------------------------------------------------- */
> -
> -static inline void baycom_int_freq(struct baycom_state *bc)
> -{
> -#ifdef BAYCOM_DEBUG
> -	unsigned long cur_jiffies = jiffies;
> -	/*
> -	 * measure the interrupt frequency
> -	 */
> -	bc->debug_vals.cur_intcnt++;
> -	if (time_after_eq(cur_jiffies, bc->debug_vals.last_jiffies + HZ)) {
> -		bc->debug_vals.last_jiffies = cur_jiffies;
> -		bc->debug_vals.last_intcnt = bc->debug_vals.cur_intcnt;
> -		bc->debug_vals.cur_intcnt = 0;
> -		bc->debug_vals.last_pllcorr = bc->debug_vals.cur_pllcorr;
> -		bc->debug_vals.cur_pllcorr = 0;
> -	}
> -#endif /* BAYCOM_DEBUG */
> -}
> -
> -/* --------------------------------------------------------------------- */
> -/*
> - * ===================== SER12 specific routines =========================
> - */
> -
> -/* --------------------------------------------------------------------- */
> -
> -static inline void ser12_set_divisor(struct net_device *dev,
> -                                     unsigned int divisor)
> -{
> -        outb(0x81, LCR(dev->base_addr));        /* DLAB = 1 */
> -        outb(divisor, DLL(dev->base_addr));
> -        outb(divisor >> 8, DLM(dev->base_addr));
> -        outb(0x01, LCR(dev->base_addr));        /* word length = 6 */
> -        /*
> -         * make sure the next interrupt is generated;
> -         * 0 must be used to power the modem; the modem draws its
> -         * power from the TxD line
> -         */
> -        outb(0x00, THR(dev->base_addr));
> -        /*
> -         * it is important not to set the divider while transmitting;
> -         * this reportedly makes some UARTs generating interrupts
> -         * in the hundredthousands per second region
> -         * Reported by: Ignacio.Arenaza@studi.epfl.ch (Ignacio Arenaza Nuno)
> -         */
> -}
> -
> -static __inline__ void ser12_rx(struct net_device *dev, struct baycom_state *bc, struct timespec64 *ts, unsigned char curs)
> -{
> -	int timediff;
> -	int bdus8 = bc->baud_us >> 3;
> -	int bdus4 = bc->baud_us >> 2;
> -	int bdus2 = bc->baud_us >> 1;
> -
> -	timediff = 1000000 + ts->tv_nsec / NSEC_PER_USEC -
> -					bc->modem.ser12.pll_time;
> -	while (timediff >= 500000)
> -		timediff -= 1000000;
> -	while (timediff >= bdus2) {
> -		timediff -= bc->baud_us;
> -		bc->modem.ser12.pll_time += bc->baud_us;
> -		bc->modem.ser12.dcd_time--;
> -		/* first check if there is room to add a bit */
> -		if (bc->modem.shreg & 1) {
> -			hdlcdrv_putbits(&bc->hdrv, (bc->modem.shreg >> 1) ^ 0xffff);
> -			bc->modem.shreg = 0x10000;
> -		}
> -		/* add a one bit */
> -		bc->modem.shreg >>= 1;
> -	}
> -	if (bc->modem.ser12.dcd_time <= 0) {
> -		if (!bc->opt_dcd)
> -			hdlcdrv_setdcd(&bc->hdrv, (bc->modem.ser12.dcd_sum0 +
> -						   bc->modem.ser12.dcd_sum1 +
> -						   bc->modem.ser12.dcd_sum2) < 0);
> -		bc->modem.ser12.dcd_sum2 = bc->modem.ser12.dcd_sum1;
> -		bc->modem.ser12.dcd_sum1 = bc->modem.ser12.dcd_sum0;
> -		bc->modem.ser12.dcd_sum0 = 2; /* slight bias */
> -		bc->modem.ser12.dcd_time += 120;
> -	}
> -	if (bc->modem.ser12.last_rxbit != curs) {
> -		bc->modem.ser12.last_rxbit = curs;
> -		bc->modem.shreg |= 0x10000;
> -		/* adjust the PLL */
> -		if (timediff > 0)
> -			bc->modem.ser12.pll_time += bdus8;
> -		else
> -			bc->modem.ser12.pll_time += 1000000 - bdus8;
> -		/* update DCD */
> -		if (abs(timediff) > bdus4)
> -			bc->modem.ser12.dcd_sum0 += 4;
> -		else
> -			bc->modem.ser12.dcd_sum0--;
> -#ifdef BAYCOM_DEBUG
> -		bc->debug_vals.cur_pllcorr = timediff;
> -#endif /* BAYCOM_DEBUG */
> -	}
> -	while (bc->modem.ser12.pll_time >= 1000000)
> -		bc->modem.ser12.pll_time -= 1000000;
> -}
> -
> -/* --------------------------------------------------------------------- */
> -
> -static irqreturn_t ser12_interrupt(int irq, void *dev_id)
> -{
> -	struct net_device *dev = (struct net_device *)dev_id;
> -	struct baycom_state *bc = netdev_priv(dev);
> -	struct timespec64 ts;
> -	unsigned char iir, msr;
> -	unsigned int txcount = 0;
> -
> -	if (!bc || bc->hdrv.magic != HDLCDRV_MAGIC)
> -		return IRQ_NONE;
> -	/* fast way out for shared irq */
> -	if ((iir = inb(IIR(dev->base_addr))) & 1) 	
> -		return IRQ_NONE;
> -	/* get current time */
> -	ktime_get_ts64(&ts);
> -	msr = inb(MSR(dev->base_addr));
> -	/* delta DCD */
> -	if ((msr & 8) && bc->opt_dcd)
> -		hdlcdrv_setdcd(&bc->hdrv, !((msr ^ bc->opt_dcd) & 0x80));
> -	do {
> -		switch (iir & 6) {
> -		case 6:
> -			inb(LSR(dev->base_addr));
> -			break;
> -			
> -		case 4:
> -			inb(RBR(dev->base_addr));
> -			break;
> -			
> -		case 2:
> -			/*
> -			 * make sure the next interrupt is generated;
> -			 * 0 must be used to power the modem; the modem draws its
> -			 * power from the TxD line
> -			 */
> -			outb(0x00, THR(dev->base_addr));
> -			baycom_int_freq(bc);
> -			txcount++;
> -			/*
> -			 * first output the last bit (!) then call HDLC transmitter,
> -			 * since this may take quite long
> -			 */
> -			if (bc->modem.ptt)
> -				outb(0x0e | (!!bc->modem.ser12.tx_bit), MCR(dev->base_addr));
> -			else
> -				outb(0x0d, MCR(dev->base_addr));       /* transmitter off */
> -			break;
> -			
> -		default:
> -			msr = inb(MSR(dev->base_addr));
> -			/* delta DCD */
> -			if ((msr & 8) && bc->opt_dcd)
> -				hdlcdrv_setdcd(&bc->hdrv, !((msr ^ bc->opt_dcd) & 0x80));
> -			break;
> -		}
> -		iir = inb(IIR(dev->base_addr));
> -	} while (!(iir & 1));
> -	ser12_rx(dev, bc, &ts, msr & 0x10); /* CTS */
> -	if (bc->modem.ptt && txcount) {
> -		if (bc->modem.ser12.txshreg <= 1) {
> -			bc->modem.ser12.txshreg = 0x10000 | hdlcdrv_getbits(&bc->hdrv);
> -			if (!hdlcdrv_ptt(&bc->hdrv)) {
> -				ser12_set_divisor(dev, 115200/100/8);
> -				bc->modem.ptt = 0;
> -				goto end_transmit;
> -			}
> -		}
> -		bc->modem.ser12.tx_bit = !(bc->modem.ser12.tx_bit ^ (bc->modem.ser12.txshreg & 1));
> -		bc->modem.ser12.txshreg >>= 1;
> -	}
> - end_transmit:
> -	local_irq_enable();
> -	if (!bc->modem.ptt && txcount) {
> -		hdlcdrv_arbitrate(dev, &bc->hdrv);
> -		if (hdlcdrv_ptt(&bc->hdrv)) {
> -			ser12_set_divisor(dev, bc->baud_uartdiv);
> -			bc->modem.ser12.txshreg = 1;
> -			bc->modem.ptt = 1;
> -		}
> -	}
> -	hdlcdrv_transmitter(dev, &bc->hdrv);
> -	hdlcdrv_receiver(dev, &bc->hdrv);
> -	local_irq_disable();
> -	return IRQ_HANDLED;
> -}
> -
> -/* --------------------------------------------------------------------- */
> -
> -enum uart { c_uart_unknown, c_uart_8250,
> -	    c_uart_16450, c_uart_16550, c_uart_16550A};
> -static const char *uart_str[] = {
> -	"unknown", "8250", "16450", "16550", "16550A"
> -};
> -
> -static enum uart ser12_check_uart(unsigned int iobase)
> -{
> -	unsigned char b1,b2,b3;
> -	enum uart u;
> -	enum uart uart_tab[] =
> -		{ c_uart_16450, c_uart_unknown, c_uart_16550, c_uart_16550A };
> -
> -	b1 = inb(MCR(iobase));
> -	outb(b1 | 0x10, MCR(iobase));	/* loopback mode */
> -	b2 = inb(MSR(iobase));
> -	outb(0x1a, MCR(iobase));
> -	b3 = inb(MSR(iobase)) & 0xf0;
> -	outb(b1, MCR(iobase));			/* restore old values */
> -	outb(b2, MSR(iobase));
> -	if (b3 != 0x90)
> -		return c_uart_unknown;
> -	inb(RBR(iobase));
> -	inb(RBR(iobase));
> -	outb(0x01, FCR(iobase));		/* enable FIFOs */
> -	u = uart_tab[(inb(IIR(iobase)) >> 6) & 3];
> -	if (u == c_uart_16450) {
> -		outb(0x5a, SCR(iobase));
> -		b1 = inb(SCR(iobase));
> -		outb(0xa5, SCR(iobase));
> -		b2 = inb(SCR(iobase));
> -		if ((b1 != 0x5a) || (b2 != 0xa5))
> -			u = c_uart_8250;
> -	}
> -	return u;
> -}
> -
> -/* --------------------------------------------------------------------- */
> -
> -static int ser12_open(struct net_device *dev)
> -{
> -	const unsigned int nr_irqs = irq_get_nr_irqs();
> -	struct baycom_state *bc = netdev_priv(dev);
> -	enum uart u;
> -
> -	if (!dev || !bc)
> -		return -ENXIO;
> -	if (!dev->base_addr || dev->base_addr > 0xffff-SER12_EXTENT ||
> -	    dev->irq < 2 || dev->irq > nr_irqs) {
> -		printk(KERN_INFO "baycom_ser_fdx: invalid portnumber (max %u) "
> -				"or irq (2 <= irq <= %d)\n",
> -				0xffff-SER12_EXTENT, nr_irqs);
> -		return -ENXIO;
> -	}
> -	if (bc->baud < 300 || bc->baud > 4800) {
> -		printk(KERN_INFO "baycom_ser_fdx: invalid baudrate "
> -				"(300...4800)\n");
> -		return -EINVAL;
> -	}
> -	if (!request_region(dev->base_addr, SER12_EXTENT, "baycom_ser_fdx")) {
> -		printk(KERN_WARNING "BAYCOM_SER_FSX: I/O port 0x%04lx busy\n",
> -		       dev->base_addr);
> -		return -EACCES;
> -	}
> -	memset(&bc->modem, 0, sizeof(bc->modem));
> -	bc->hdrv.par.bitrate = bc->baud;
> -	bc->baud_us = 1000000/bc->baud;
> -	bc->baud_uartdiv = (115200/8)/bc->baud;
> -	if ((u = ser12_check_uart(dev->base_addr)) == c_uart_unknown){
> -		release_region(dev->base_addr, SER12_EXTENT);
> -		return -EIO;
> -	}
> -	outb(0, FCR(dev->base_addr));  /* disable FIFOs */
> -	outb(0x0d, MCR(dev->base_addr));
> -	outb(0, IER(dev->base_addr));
> -	if (request_irq(dev->irq, ser12_interrupt, IRQF_SHARED,
> -			"baycom_ser_fdx", dev)) {
> -		release_region(dev->base_addr, SER12_EXTENT);
> -		return -EBUSY;
> -	}
> -	/*
> -	 * set the SIO to 6 Bits/character; during receive,
> -	 * the baud rate is set to produce 100 ints/sec
> -	 * to feed the channel arbitration process,
> -	 * during transmit to baud ints/sec to run
> -	 * the transmitter
> -	 */
> -	ser12_set_divisor(dev, 115200/100/8);
> -	/*
> -	 * enable transmitter empty interrupt and modem status interrupt
> -	 */
> -	outb(0x0a, IER(dev->base_addr));
> -	/*
> -	 * make sure the next interrupt is generated;
> -	 * 0 must be used to power the modem; the modem draws its
> -	 * power from the TxD line
> -	 */
> -	outb(0x00, THR(dev->base_addr));
> -	hdlcdrv_setdcd(&bc->hdrv, 0);
> -	printk(KERN_INFO "%s: ser_fdx at iobase 0x%lx irq %u baud %u uart %s\n",
> -	       bc_drvname, dev->base_addr, dev->irq, bc->baud, uart_str[u]);
> -	return 0;
> -}
> -
> -/* --------------------------------------------------------------------- */
> -
> -static int ser12_close(struct net_device *dev)
> -{
> -	struct baycom_state *bc = netdev_priv(dev);
> -
> -	if (!dev || !bc)
> -		return -EINVAL;
> -	/*
> -	 * disable interrupts
> -	 */
> -	outb(0, IER(dev->base_addr));
> -	outb(1, MCR(dev->base_addr));
> -	free_irq(dev->irq, dev);
> -	release_region(dev->base_addr, SER12_EXTENT);
> -	printk(KERN_INFO "%s: close ser_fdx at iobase 0x%lx irq %u\n",
> -	       bc_drvname, dev->base_addr, dev->irq);
> -	return 0;
> -}
> -
> -/* --------------------------------------------------------------------- */
> -/*
> - * ===================== hdlcdrv driver interface =========================
> - */
> -
> -/* --------------------------------------------------------------------- */
> -
> -static int baycom_ioctl(struct net_device *dev, void __user *data,
> -			struct hdlcdrv_ioctl *hi, int cmd);
> -
> -/* --------------------------------------------------------------------- */
> -
> -static const struct hdlcdrv_ops ser12_ops = {
> -	.drvname = bc_drvname,
> -	.drvinfo = bc_drvinfo,
> -	.open    = ser12_open,
> -	.close   = ser12_close,
> -	.ioctl   = baycom_ioctl,
> -};
> -
> -/* --------------------------------------------------------------------- */
> -
> -static int baycom_setmode(struct baycom_state *bc, const char *modestr)
> -{
> -	unsigned int baud;
> -
> -	if (!strncmp(modestr, "ser", 3)) {
> -		baud = simple_strtoul(modestr+3, NULL, 10);
> -		if (baud >= 3 && baud <= 48)
> -			bc->baud = baud*100;
> -	}
> -	if (strchr(modestr, '*'))
> -		bc->opt_dcd = 0;
> -	else if (strchr(modestr, '+'))
> -		bc->opt_dcd = -1;
> -	else
> -		bc->opt_dcd = 1;
> -	return 0;
> -}
> -
> -/* --------------------------------------------------------------------- */
> -
> -static int baycom_ioctl(struct net_device *dev, void __user *data,
> -			struct hdlcdrv_ioctl *hi, int cmd)
> -{
> -	struct baycom_state *bc;
> -	struct baycom_ioctl bi;
> -
> -	if (!dev)
> -		return -EINVAL;
> -
> -	bc = netdev_priv(dev);
> -	BUG_ON(bc->hdrv.magic != HDLCDRV_MAGIC);
> -
> -	if (cmd != SIOCDEVPRIVATE)
> -		return -ENOIOCTLCMD;
> -	switch (hi->cmd) {
> -	default:
> -		break;
> -
> -	case HDLCDRVCTL_GETMODE:
> -		sprintf(hi->data.modename, "ser%u", bc->baud / 100);
> -		if (bc->opt_dcd <= 0)
> -			strcat(hi->data.modename, (!bc->opt_dcd) ? "*" : "+");
> -		if (copy_to_user(data, hi, sizeof(struct hdlcdrv_ioctl)))
> -			return -EFAULT;
> -		return 0;
> -
> -	case HDLCDRVCTL_SETMODE:
> -		if (netif_running(dev) || !capable(CAP_NET_ADMIN))
> -			return -EACCES;
> -		hi->data.modename[sizeof(hi->data.modename)-1] = '\0';
> -		return baycom_setmode(bc, hi->data.modename);
> -
> -	case HDLCDRVCTL_MODELIST:
> -		strscpy(hi->data.modename, "ser12,ser3,ser24");
> -		if (copy_to_user(data, hi, sizeof(struct hdlcdrv_ioctl)))
> -			return -EFAULT;
> -		return 0;
> -
> -	case HDLCDRVCTL_MODEMPARMASK:
> -		return HDLCDRV_PARMASK_IOBASE | HDLCDRV_PARMASK_IRQ;
> -
> -	}
> -
> -	if (copy_from_user(&bi, data, sizeof(bi)))
> -		return -EFAULT;
> -	switch (bi.cmd) {
> -	default:
> -		return -ENOIOCTLCMD;
> -
> -#ifdef BAYCOM_DEBUG
> -	case BAYCOMCTL_GETDEBUG:
> -		bi.data.dbg.debug1 = bc->hdrv.ptt_keyed;
> -		bi.data.dbg.debug2 = bc->debug_vals.last_intcnt;
> -		bi.data.dbg.debug3 = bc->debug_vals.last_pllcorr;
> -		break;
> -#endif /* BAYCOM_DEBUG */
> -
> -	}
> -	if (copy_to_user(data, &bi, sizeof(bi)))
> -		return -EFAULT;
> -	return 0;
> -
> -}
> -
> -/* --------------------------------------------------------------------- */
> -
> -/*
> - * command line settable parameters
> - */
> -static char *mode[NR_PORTS] = { "ser12*", };
> -static int iobase[NR_PORTS] = { 0x3f8, };
> -static int irq[NR_PORTS] = { 4, };
> -static int baud[NR_PORTS] = { [0 ... NR_PORTS-1] = 1200 };
> -
> -module_param_array(mode, charp, NULL, 0);
> -MODULE_PARM_DESC(mode, "baycom operating mode; * for software DCD");
> -module_param_hw_array(iobase, int, ioport, NULL, 0);
> -MODULE_PARM_DESC(iobase, "baycom io base address");
> -module_param_hw_array(irq, int, irq, NULL, 0);
> -MODULE_PARM_DESC(irq, "baycom irq number");
> -module_param_array(baud, int, NULL, 0);
> -MODULE_PARM_DESC(baud, "baycom baud rate (300 to 4800)");
> -
> -MODULE_AUTHOR("Thomas M. Sailer, sailer@ife.ee.ethz.ch, hb9jnx@hb9w.che.eu");
> -MODULE_DESCRIPTION("Baycom ser12 full duplex amateur radio modem driver");
> -MODULE_LICENSE("GPL");
> -
> -/* --------------------------------------------------------------------- */
> -
> -static int __init init_baycomserfdx(void)
> -{
> -	int i, found = 0;
> -	char set_hw = 1;
> -
> -	printk(bc_drvinfo);
> -	/*
> -	 * register net devices
> -	 */
> -	for (i = 0; i < NR_PORTS; i++) {
> -		struct net_device *dev;
> -		struct baycom_state *bc;
> -		char ifname[IFNAMSIZ];
> -
> -		sprintf(ifname, "bcsf%d", i);
> -
> -		if (!mode[i])
> -			set_hw = 0;
> -		if (!set_hw)
> -			iobase[i] = irq[i] = 0;
> -
> -		dev = hdlcdrv_register(&ser12_ops,
> -				       sizeof(struct baycom_state),
> -				       ifname, iobase[i], irq[i], 0);
> -		if (IS_ERR(dev))
> -			break;
> -
> -		bc = netdev_priv(dev);
> -		if (set_hw && baycom_setmode(bc, mode[i]))
> -			set_hw = 0;
> -		bc->baud = baud[i];
> -		found++;
> -		baycom_device[i] = dev;
> -	}
> -
> -	if (!found)
> -		return -ENXIO;
> -	return 0;
> -}
> -
> -static void __exit cleanup_baycomserfdx(void)
> -{
> -	int i;
> -
> -	for(i = 0; i < NR_PORTS; i++) {
> -		struct net_device *dev = baycom_device[i];
> -		if (dev)
> -			hdlcdrv_unregister(dev);
> -	}
> -}
> -
> -module_init(init_baycomserfdx);
> -module_exit(cleanup_baycomserfdx);
> -
> -/* --------------------------------------------------------------------- */
> -
> -#ifndef MODULE
> -
> -/*
> - * format: baycom_ser_fdx=io,irq,mode
> - * mode: ser#    hardware DCD
> - *       ser#*   software DCD
> - *       ser#+   hardware DCD, inverted signal at DCD pin
> - * '#' denotes the baud rate / 100, eg. ser12* is '1200 baud, soft DCD'
> - */
> -
> -static int __init baycom_ser_fdx_setup(char *str)
> -{
> -        static unsigned nr_dev;
> -        int ints[4];
> -
> -        if (nr_dev >= NR_PORTS)
> -                return 0;
> -        str = get_options(str, 4, ints);
> -        if (ints[0] < 2)
> -                return 0;
> -        mode[nr_dev] = str;
> -        iobase[nr_dev] = ints[1];
> -        irq[nr_dev] = ints[2];
> -	if (ints[0] >= 3)
> -		baud[nr_dev] = ints[3];
> -	nr_dev++;
> -	return 1;
> -}
> -
> -__setup("baycom_ser_fdx=", baycom_ser_fdx_setup);
> -
> -#endif /* MODULE */
> -/* --------------------------------------------------------------------- */
> diff --git a/drivers/net/hamradio/baycom_ser_hdx.c b/drivers/net/hamradio/baycom_ser_hdx.c
> deleted file mode 100644
> index 05bdad214799..000000000000
> --- a/drivers/net/hamradio/baycom_ser_hdx.c
> +++ /dev/null
> @@ -1,727 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-or-later
> -/*****************************************************************************/
> -
> -/*
> - *	baycom_ser_hdx.c  -- baycom ser12 halfduplex radio modem driver.
> - *
> - *	Copyright (C) 1996-2000  Thomas Sailer (sailer@ife.ee.ethz.ch)
> - *
> - *  Please note that the GPL allows you to use the driver, NOT the radio.
> - *  In order to use the radio, you need a license from the communications
> - *  authority of your country.
> - *
> - *  Supported modems
> - *
> - *  ser12:  This is a very simple 1200 baud AFSK modem. The modem consists only
> - *          of a modulator/demodulator chip, usually a TI TCM3105. The computer
> - *          is responsible for regenerating the receiver bit clock, as well as
> - *          for handling the HDLC protocol. The modem connects to a serial port,
> - *          hence the name. Since the serial port is not used as an async serial
> - *          port, the kernel driver for serial ports cannot be used, and this
> - *          driver only supports standard serial hardware (8250, 16450, 16550A)
> - *
> - *  Command line options (insmod command line)
> - *
> - *  mode     ser12    hardware DCD
> - *           ser12*   software DCD
> - *           ser12@   hardware/software DCD, i.e. no explicit DCD signal but hardware
> - *                    mutes audio input to the modem
> - *           ser12+   hardware DCD, inverted signal at DCD pin
> - *  iobase   base address of the port; common values are 0x3f8, 0x2f8, 0x3e8, 0x2e8
> - *  irq      interrupt line of the port; common values are 4,3
> - *
> - *  History:
> - *   0.1  26.06.1996  Adapted from baycom.c and made network driver interface
> - *        18.10.1996  Changed to new user space access routines (copy_{to,from}_user)
> - *   0.3  26.04.1997  init code/data tagged
> - *   0.4  08.07.1997  alternative ser12 decoding algorithm (uses delta CTS ints)
> - *   0.5  11.11.1997  ser12/par96 split into separate files
> - *   0.6  14.04.1998  cleanups
> - *   0.7  03.08.1999  adapt to Linus' new __setup/__initcall
> - *   0.8  10.08.1999  use module_init/module_exit
> - *   0.9  12.02.2000  adapted to softnet driver interface
> - *   0.10 03.07.2000  fix interface name handling
> - */
> -
> -/*****************************************************************************/
> -
> -#include <linux/capability.h>
> -#include <linux/module.h>
> -#include <linux/ioport.h>
> -#include <linux/string.h>
> -#include <linux/init.h>
> -#include <linux/interrupt.h>
> -#include <linux/uaccess.h>
> -#include <asm/io.h>
> -#include <linux/hdlcdrv.h>
> -#include <linux/baycom.h>
> -#include <linux/jiffies.h>
> -
> -/* --------------------------------------------------------------------- */
> -
> -#define BAYCOM_DEBUG
> -
> -/* --------------------------------------------------------------------- */
> -
> -static const char bc_drvname[] = "baycom_ser_hdx";
> -static const char bc_drvinfo[] = KERN_INFO "baycom_ser_hdx: (C) 1996-2000 Thomas Sailer, HB9JNX/AE4WA\n"
> -"baycom_ser_hdx: version 0.10\n";
> -
> -/* --------------------------------------------------------------------- */
> -
> -#define NR_PORTS 4
> -
> -static struct net_device *baycom_device[NR_PORTS];
> -
> -/* --------------------------------------------------------------------- */
> -
> -#define RBR(iobase) (iobase+0)
> -#define THR(iobase) (iobase+0)
> -#define IER(iobase) (iobase+1)
> -#define IIR(iobase) (iobase+2)
> -#define FCR(iobase) (iobase+2)
> -#define LCR(iobase) (iobase+3)
> -#define MCR(iobase) (iobase+4)
> -#define LSR(iobase) (iobase+5)
> -#define MSR(iobase) (iobase+6)
> -#define SCR(iobase) (iobase+7)
> -#define DLL(iobase) (iobase+0)
> -#define DLM(iobase) (iobase+1)
> -
> -#define SER12_EXTENT 8
> -
> -/* ---------------------------------------------------------------------- */
> -/*
> - * Information that need to be kept for each board.
> - */
> -
> -struct baycom_state {
> -	struct hdlcdrv_state hdrv;
> -
> -	int opt_dcd;
> -
> -	struct modem_state {
> -		short arb_divider;
> -		unsigned char flags;
> -		unsigned int shreg;
> -		struct modem_state_ser12 {
> -			unsigned char tx_bit;
> -			int dcd_sum0, dcd_sum1, dcd_sum2;
> -			unsigned char last_sample;
> -			unsigned char last_rxbit;
> -			unsigned int dcd_shreg;
> -			unsigned int dcd_time;
> -			unsigned int bit_pll;
> -			unsigned char interm_sample;
> -		} ser12;
> -	} modem;
> -
> -#ifdef BAYCOM_DEBUG
> -	struct debug_vals {
> -		unsigned long last_jiffies;
> -		unsigned cur_intcnt;
> -		unsigned last_intcnt;
> -		int cur_pllcorr;
> -		int last_pllcorr;
> -	} debug_vals;
> -#endif /* BAYCOM_DEBUG */
> -};
> -
> -/* --------------------------------------------------------------------- */
> -
> -static inline void baycom_int_freq(struct baycom_state *bc)
> -{
> -#ifdef BAYCOM_DEBUG
> -	unsigned long cur_jiffies = jiffies;
> -	/*
> -	 * measure the interrupt frequency
> -	 */
> -	bc->debug_vals.cur_intcnt++;
> -	if (time_after_eq(cur_jiffies, bc->debug_vals.last_jiffies + HZ)) {
> -		bc->debug_vals.last_jiffies = cur_jiffies;
> -		bc->debug_vals.last_intcnt = bc->debug_vals.cur_intcnt;
> -		bc->debug_vals.cur_intcnt = 0;
> -		bc->debug_vals.last_pllcorr = bc->debug_vals.cur_pllcorr;
> -		bc->debug_vals.cur_pllcorr = 0;
> -	}
> -#endif /* BAYCOM_DEBUG */
> -}
> -
> -/* --------------------------------------------------------------------- */
> -/*
> - * ===================== SER12 specific routines =========================
> - */
> -
> -static inline void ser12_set_divisor(struct net_device *dev,
> -				     unsigned char divisor)
> -{
> -	outb(0x81, LCR(dev->base_addr));	/* DLAB = 1 */
> -	outb(divisor, DLL(dev->base_addr));
> -	outb(0, DLM(dev->base_addr));
> -	outb(0x01, LCR(dev->base_addr));	/* word length = 6 */
> -	/*
> -	 * make sure the next interrupt is generated;
> -	 * 0 must be used to power the modem; the modem draws its
> -	 * power from the TxD line
> -	 */
> -	outb(0x00, THR(dev->base_addr));
> -	/*
> -	 * it is important not to set the divider while transmitting;
> -	 * this reportedly makes some UARTs generating interrupts
> -	 * in the hundredthousands per second region
> -	 * Reported by: Ignacio.Arenaza@studi.epfl.ch (Ignacio Arenaza Nuno)
> -	 */
> -}
> -
> -/* --------------------------------------------------------------------- */
> -
> -/*
> - * must call the TX arbitrator every 10ms
> - */
> -#define SER12_ARB_DIVIDER(bc)  (bc->opt_dcd ? 24 : 36)
> -			
> -#define SER12_DCD_INTERVAL(bc) (bc->opt_dcd ? 12 : 240)
> -
> -static inline void ser12_tx(struct net_device *dev, struct baycom_state *bc)
> -{
> -	/* one interrupt per channel bit */
> -	ser12_set_divisor(dev, 12);
> -	/*
> -	 * first output the last bit (!) then call HDLC transmitter,
> -	 * since this may take quite long
> -	 */
> -	outb(0x0e | (!!bc->modem.ser12.tx_bit), MCR(dev->base_addr));
> -	if (bc->modem.shreg <= 1)
> -		bc->modem.shreg = 0x10000 | hdlcdrv_getbits(&bc->hdrv);
> -	bc->modem.ser12.tx_bit = !(bc->modem.ser12.tx_bit ^
> -				   (bc->modem.shreg & 1));
> -	bc->modem.shreg >>= 1;
> -}
> -
> -/* --------------------------------------------------------------------- */
> -
> -static inline void ser12_rx(struct net_device *dev, struct baycom_state *bc)
> -{
> -	unsigned char cur_s;
> -	/*
> -	 * do demodulator
> -	 */
> -	cur_s = inb(MSR(dev->base_addr)) & 0x10;	/* the CTS line */
> -	hdlcdrv_channelbit(&bc->hdrv, cur_s);
> -	bc->modem.ser12.dcd_shreg = (bc->modem.ser12.dcd_shreg << 1) |
> -		(cur_s != bc->modem.ser12.last_sample);
> -	bc->modem.ser12.last_sample = cur_s;
> -	if(bc->modem.ser12.dcd_shreg & 1) {
> -		if (!bc->opt_dcd) {
> -			unsigned int dcdspos, dcdsneg;
> -
> -			dcdspos = dcdsneg = 0;
> -			dcdspos += ((bc->modem.ser12.dcd_shreg >> 1) & 1);
> -			if (!(bc->modem.ser12.dcd_shreg & 0x7ffffffe))
> -				dcdspos += 2;
> -			dcdsneg += ((bc->modem.ser12.dcd_shreg >> 2) & 1);
> -			dcdsneg += ((bc->modem.ser12.dcd_shreg >> 3) & 1);
> -			dcdsneg += ((bc->modem.ser12.dcd_shreg >> 4) & 1);
> -
> -			bc->modem.ser12.dcd_sum0 += 16*dcdspos - dcdsneg;
> -		} else
> -			bc->modem.ser12.dcd_sum0--;
> -	}
> -	if(!bc->modem.ser12.dcd_time) {
> -		hdlcdrv_setdcd(&bc->hdrv, (bc->modem.ser12.dcd_sum0 +
> -					   bc->modem.ser12.dcd_sum1 +
> -					   bc->modem.ser12.dcd_sum2) < 0);
> -		bc->modem.ser12.dcd_sum2 = bc->modem.ser12.dcd_sum1;
> -		bc->modem.ser12.dcd_sum1 = bc->modem.ser12.dcd_sum0;
> -		/* offset to ensure DCD off on silent input */
> -		bc->modem.ser12.dcd_sum0 = 2;
> -		bc->modem.ser12.dcd_time = SER12_DCD_INTERVAL(bc);
> -	}
> -	bc->modem.ser12.dcd_time--;
> -	if (!bc->opt_dcd) {
> -		/*
> -		 * PLL code for the improved software DCD algorithm
> -		 */
> -		if (bc->modem.ser12.interm_sample) {
> -			/*
> -			 * intermediate sample; set timing correction to normal
> -			 */
> -			ser12_set_divisor(dev, 4);
> -		} else {
> -			/*
> -			 * do PLL correction and call HDLC receiver
> -			 */
> -			switch (bc->modem.ser12.dcd_shreg & 7) {
> -			case 1: /* transition too late */
> -				ser12_set_divisor(dev, 5);
> -#ifdef BAYCOM_DEBUG
> -				bc->debug_vals.cur_pllcorr++;
> -#endif /* BAYCOM_DEBUG */
> -				break;
> -			case 4:	/* transition too early */
> -				ser12_set_divisor(dev, 3);
> -#ifdef BAYCOM_DEBUG
> -				bc->debug_vals.cur_pllcorr--;
> -#endif /* BAYCOM_DEBUG */
> -				break;
> -			default:
> -				ser12_set_divisor(dev, 4);
> -				break;
> -			}
> -			bc->modem.shreg >>= 1;
> -			if (bc->modem.ser12.last_sample ==
> -			    bc->modem.ser12.last_rxbit)
> -				bc->modem.shreg |= 0x10000;
> -			bc->modem.ser12.last_rxbit =
> -				bc->modem.ser12.last_sample;
> -		}
> -		if (++bc->modem.ser12.interm_sample >= 3)
> -			bc->modem.ser12.interm_sample = 0;
> -		/*
> -		 * DCD stuff
> -		 */
> -		if (bc->modem.ser12.dcd_shreg & 1) {
> -			unsigned int dcdspos, dcdsneg;
> -
> -			dcdspos = dcdsneg = 0;
> -			dcdspos += ((bc->modem.ser12.dcd_shreg >> 1) & 1);
> -			dcdspos += (!(bc->modem.ser12.dcd_shreg & 0x7ffffffe))
> -				<< 1;
> -			dcdsneg += ((bc->modem.ser12.dcd_shreg >> 2) & 1);
> -			dcdsneg += ((bc->modem.ser12.dcd_shreg >> 3) & 1);
> -			dcdsneg += ((bc->modem.ser12.dcd_shreg >> 4) & 1);
> -
> -			bc->modem.ser12.dcd_sum0 += 16*dcdspos - dcdsneg;
> -		}
> -	} else {
> -		/*
> -		 * PLL algorithm for the hardware squelch DCD algorithm
> -		 */
> -		if (bc->modem.ser12.interm_sample) {
> -			/*
> -			 * intermediate sample; set timing correction to normal
> -			 */
> -			ser12_set_divisor(dev, 6);
> -		} else {
> -			/*
> -			 * do PLL correction and call HDLC receiver
> -			 */
> -			switch (bc->modem.ser12.dcd_shreg & 3) {
> -			case 1: /* transition too late */
> -				ser12_set_divisor(dev, 7);
> -#ifdef BAYCOM_DEBUG
> -				bc->debug_vals.cur_pllcorr++;
> -#endif /* BAYCOM_DEBUG */
> -				break;
> -			case 2:	/* transition too early */
> -				ser12_set_divisor(dev, 5);
> -#ifdef BAYCOM_DEBUG
> -				bc->debug_vals.cur_pllcorr--;
> -#endif /* BAYCOM_DEBUG */
> -				break;
> -			default:
> -				ser12_set_divisor(dev, 6);
> -				break;
> -			}
> -			bc->modem.shreg >>= 1;
> -			if (bc->modem.ser12.last_sample ==
> -			    bc->modem.ser12.last_rxbit)
> -				bc->modem.shreg |= 0x10000;
> -			bc->modem.ser12.last_rxbit =
> -				bc->modem.ser12.last_sample;
> -		}
> -		bc->modem.ser12.interm_sample = !bc->modem.ser12.interm_sample;
> -		/*
> -		 * DCD stuff
> -		 */
> -		bc->modem.ser12.dcd_sum0 -= (bc->modem.ser12.dcd_shreg & 1);
> -	}
> -	outb(0x0d, MCR(dev->base_addr));		/* transmitter off */
> -	if (bc->modem.shreg & 1) {
> -		hdlcdrv_putbits(&bc->hdrv, bc->modem.shreg >> 1);
> -		bc->modem.shreg = 0x10000;
> -	}
> -	if(!bc->modem.ser12.dcd_time) {
> -		if (bc->opt_dcd & 1)
> -			hdlcdrv_setdcd(&bc->hdrv, !((inb(MSR(dev->base_addr)) ^ bc->opt_dcd) & 0x80));
> -		else
> -			hdlcdrv_setdcd(&bc->hdrv, (bc->modem.ser12.dcd_sum0 +
> -						   bc->modem.ser12.dcd_sum1 +
> -						   bc->modem.ser12.dcd_sum2) < 0);
> -		bc->modem.ser12.dcd_sum2 = bc->modem.ser12.dcd_sum1;
> -		bc->modem.ser12.dcd_sum1 = bc->modem.ser12.dcd_sum0;
> -		/* offset to ensure DCD off on silent input */
> -		bc->modem.ser12.dcd_sum0 = 2;
> -		bc->modem.ser12.dcd_time = SER12_DCD_INTERVAL(bc);
> -	}
> -	bc->modem.ser12.dcd_time--;
> -}
> -
> -/* --------------------------------------------------------------------- */
> -
> -static irqreturn_t ser12_interrupt(int irq, void *dev_id)
> -{
> -	struct net_device *dev = (struct net_device *)dev_id;
> -	struct baycom_state *bc = netdev_priv(dev);
> -	unsigned char iir;
> -
> -	if (!dev || !bc || bc->hdrv.magic != HDLCDRV_MAGIC)
> -		return IRQ_NONE;
> -	/* fast way out */
> -	if ((iir = inb(IIR(dev->base_addr))) & 1)
> -		return IRQ_NONE;
> -	baycom_int_freq(bc);
> -	do {
> -		switch (iir & 6) {
> -		case 6:
> -			inb(LSR(dev->base_addr));
> -			break;
> -			
> -		case 4:
> -			inb(RBR(dev->base_addr));
> -			break;
> -			
> -		case 2:
> -			/*
> -			 * check if transmitter active
> -			 */
> -			if (hdlcdrv_ptt(&bc->hdrv))
> -				ser12_tx(dev, bc);
> -			else {
> -				ser12_rx(dev, bc);
> -				bc->modem.arb_divider--;
> -			}
> -			outb(0x00, THR(dev->base_addr));
> -			break;
> -			
> -		default:
> -			inb(MSR(dev->base_addr));
> -			break;
> -		}
> -		iir = inb(IIR(dev->base_addr));
> -	} while (!(iir & 1));
> -	if (bc->modem.arb_divider <= 0) {
> -		bc->modem.arb_divider = SER12_ARB_DIVIDER(bc);
> -		local_irq_enable();
> -		hdlcdrv_arbitrate(dev, &bc->hdrv);
> -	}
> -	local_irq_enable();
> -	hdlcdrv_transmitter(dev, &bc->hdrv);
> -	hdlcdrv_receiver(dev, &bc->hdrv);
> -	local_irq_disable();
> -	return IRQ_HANDLED;
> -}
> -
> -/* --------------------------------------------------------------------- */
> -
> -enum uart { c_uart_unknown, c_uart_8250,
> -	    c_uart_16450, c_uart_16550, c_uart_16550A};
> -static const char *uart_str[] = {
> -	"unknown", "8250", "16450", "16550", "16550A"
> -};
> -
> -static enum uart ser12_check_uart(unsigned int iobase)
> -{
> -	unsigned char b1,b2,b3;
> -	enum uart u;
> -	enum uart uart_tab[] =
> -		{ c_uart_16450, c_uart_unknown, c_uart_16550, c_uart_16550A };
> -
> -	b1 = inb(MCR(iobase));
> -	outb(b1 | 0x10, MCR(iobase));	/* loopback mode */
> -	b2 = inb(MSR(iobase));
> -	outb(0x1a, MCR(iobase));
> -	b3 = inb(MSR(iobase)) & 0xf0;
> -	outb(b1, MCR(iobase));			/* restore old values */
> -	outb(b2, MSR(iobase));
> -	if (b3 != 0x90)
> -		return c_uart_unknown;
> -	inb(RBR(iobase));
> -	inb(RBR(iobase));
> -	outb(0x01, FCR(iobase));		/* enable FIFOs */
> -	u = uart_tab[(inb(IIR(iobase)) >> 6) & 3];
> -	if (u == c_uart_16450) {
> -		outb(0x5a, SCR(iobase));
> -		b1 = inb(SCR(iobase));
> -		outb(0xa5, SCR(iobase));
> -		b2 = inb(SCR(iobase));
> -		if ((b1 != 0x5a) || (b2 != 0xa5))
> -			u = c_uart_8250;
> -	}
> -	return u;
> -}
> -
> -/* --------------------------------------------------------------------- */
> -
> -static int ser12_open(struct net_device *dev)
> -{
> -	struct baycom_state *bc = netdev_priv(dev);
> -	enum uart u;
> -
> -	if (!dev || !bc)
> -		return -ENXIO;
> -	if (!dev->base_addr || dev->base_addr > 0x1000-SER12_EXTENT ||
> -	    dev->irq < 2 || dev->irq > 15)
> -		return -ENXIO;
> -	if (!request_region(dev->base_addr, SER12_EXTENT, "baycom_ser12"))
> -		return -EACCES;
> -	memset(&bc->modem, 0, sizeof(bc->modem));
> -	bc->hdrv.par.bitrate = 1200;
> -	if ((u = ser12_check_uart(dev->base_addr)) == c_uart_unknown) {
> -		release_region(dev->base_addr, SER12_EXTENT);
> -		return -EIO;
> -	}
> -	outb(0, FCR(dev->base_addr));  /* disable FIFOs */
> -	outb(0x0d, MCR(dev->base_addr));
> -	outb(0, IER(dev->base_addr));
> -	if (request_irq(dev->irq, ser12_interrupt, IRQF_SHARED,
> -			"baycom_ser12", dev)) {
> -		release_region(dev->base_addr, SER12_EXTENT);
> -		return -EBUSY;
> -	}
> -	/*
> -	 * enable transmitter empty interrupt
> -	 */
> -	outb(2, IER(dev->base_addr));
> -	/*
> -	 * set the SIO to 6 Bits/character and 19200 or 28800 baud, so that
> -	 * we get exactly (hopefully) 2 or 3 interrupts per radio symbol,
> -	 * depending on the usage of the software DCD routine
> -	 */
> -	ser12_set_divisor(dev, bc->opt_dcd ? 6 : 4);
> -	printk(KERN_INFO "%s: ser12 at iobase 0x%lx irq %u uart %s\n",
> -	       bc_drvname, dev->base_addr, dev->irq, uart_str[u]);
> -	return 0;
> -}
> -
> -/* --------------------------------------------------------------------- */
> -
> -static int ser12_close(struct net_device *dev)
> -{
> -	struct baycom_state *bc = netdev_priv(dev);
> -
> -	if (!dev || !bc)
> -		return -EINVAL;
> -	/*
> -	 * disable interrupts
> -	 */
> -	outb(0, IER(dev->base_addr));
> -	outb(1, MCR(dev->base_addr));
> -	free_irq(dev->irq, dev);
> -	release_region(dev->base_addr, SER12_EXTENT);
> -	printk(KERN_INFO "%s: close ser12 at iobase 0x%lx irq %u\n",
> -	       bc_drvname, dev->base_addr, dev->irq);
> -	return 0;
> -}
> -
> -/* --------------------------------------------------------------------- */
> -/*
> - * ===================== hdlcdrv driver interface =========================
> - */
> -
> -/* --------------------------------------------------------------------- */
> -
> -static int baycom_ioctl(struct net_device *dev, void __user *data,
> -			struct hdlcdrv_ioctl *hi, int cmd);
> -
> -/* --------------------------------------------------------------------- */
> -
> -static const struct hdlcdrv_ops ser12_ops = {
> -	.drvname = bc_drvname,
> -	.drvinfo = bc_drvinfo,
> -	.open    = ser12_open,
> -	.close   = ser12_close,
> -	.ioctl   = baycom_ioctl,
> -};
> -
> -/* --------------------------------------------------------------------- */
> -
> -static int baycom_setmode(struct baycom_state *bc, const char *modestr)
> -{
> -	if (strchr(modestr, '*'))
> -		bc->opt_dcd = 0;
> -	else if (strchr(modestr, '+'))
> -		bc->opt_dcd = -1;
> -	else if (strchr(modestr, '@'))
> -		bc->opt_dcd = -2;
> -	else
> -		bc->opt_dcd = 1;
> -	return 0;
> -}
> -
> -/* --------------------------------------------------------------------- */
> -
> -static int baycom_ioctl(struct net_device *dev, void __user *data,
> -			struct hdlcdrv_ioctl *hi, int cmd)
> -{
> -	struct baycom_state *bc;
> -	struct baycom_ioctl bi;
> -
> -	if (!dev)
> -		return -EINVAL;
> -
> -	bc = netdev_priv(dev);
> -	BUG_ON(bc->hdrv.magic != HDLCDRV_MAGIC);
> -
> -	if (cmd != SIOCDEVPRIVATE)
> -		return -ENOIOCTLCMD;
> -	switch (hi->cmd) {
> -	default:
> -		break;
> -
> -	case HDLCDRVCTL_GETMODE:
> -		strscpy(hi->data.modename, "ser12");
> -		if (bc->opt_dcd <= 0)
> -			strcat(hi->data.modename, (!bc->opt_dcd) ? "*" : (bc->opt_dcd == -2) ? "@" : "+");
> -		if (copy_to_user(data, hi, sizeof(struct hdlcdrv_ioctl)))
> -			return -EFAULT;
> -		return 0;
> -
> -	case HDLCDRVCTL_SETMODE:
> -		if (netif_running(dev) || !capable(CAP_NET_ADMIN))
> -			return -EACCES;
> -		hi->data.modename[sizeof(hi->data.modename)-1] = '\0';
> -		return baycom_setmode(bc, hi->data.modename);
> -
> -	case HDLCDRVCTL_MODELIST:
> -		strscpy(hi->data.modename, "ser12");
> -		if (copy_to_user(data, hi, sizeof(struct hdlcdrv_ioctl)))
> -			return -EFAULT;
> -		return 0;
> -
> -	case HDLCDRVCTL_MODEMPARMASK:
> -		return HDLCDRV_PARMASK_IOBASE | HDLCDRV_PARMASK_IRQ;
> -
> -	}
> -
> -	if (copy_from_user(&bi, data, sizeof(bi)))
> -		return -EFAULT;
> -	switch (bi.cmd) {
> -	default:
> -		return -ENOIOCTLCMD;
> -
> -#ifdef BAYCOM_DEBUG
> -	case BAYCOMCTL_GETDEBUG:
> -		bi.data.dbg.debug1 = bc->hdrv.ptt_keyed;
> -		bi.data.dbg.debug2 = bc->debug_vals.last_intcnt;
> -		bi.data.dbg.debug3 = bc->debug_vals.last_pllcorr;
> -		break;
> -#endif /* BAYCOM_DEBUG */
> -
> -	}
> -	if (copy_to_user(data, &bi, sizeof(bi)))
> -		return -EFAULT;
> -	return 0;
> -
> -}
> -
> -/* --------------------------------------------------------------------- */
> -
> -/*
> - * command line settable parameters
> - */
> -static char *mode[NR_PORTS] = { "ser12*", };
> -static int iobase[NR_PORTS] = { 0x3f8, };
> -static int irq[NR_PORTS] = { 4, };
> -
> -module_param_array(mode, charp, NULL, 0);
> -MODULE_PARM_DESC(mode, "baycom operating mode; * for software DCD");
> -module_param_hw_array(iobase, int, ioport, NULL, 0);
> -MODULE_PARM_DESC(iobase, "baycom io base address");
> -module_param_hw_array(irq, int, irq, NULL, 0);
> -MODULE_PARM_DESC(irq, "baycom irq number");
> -
> -MODULE_AUTHOR("Thomas M. Sailer, sailer@ife.ee.ethz.ch, hb9jnx@hb9w.che.eu");
> -MODULE_DESCRIPTION("Baycom ser12 half duplex amateur radio modem driver");
> -MODULE_LICENSE("GPL");
> -
> -/* --------------------------------------------------------------------- */
> -
> -static int __init init_baycomserhdx(void)
> -{
> -	int i, found = 0;
> -	char set_hw = 1;
> -
> -	printk(bc_drvinfo);
> -	/*
> -	 * register net devices
> -	 */
> -	for (i = 0; i < NR_PORTS; i++) {
> -		struct net_device *dev;
> -		struct baycom_state *bc;
> -		char ifname[IFNAMSIZ];
> -
> -		sprintf(ifname, "bcsh%d", i);
> -
> -		if (!mode[i])
> -			set_hw = 0;
> -		if (!set_hw)
> -			iobase[i] = irq[i] = 0;
> -
> -		dev = hdlcdrv_register(&ser12_ops,
> -				       sizeof(struct baycom_state),
> -				       ifname, iobase[i], irq[i], 0);
> -		if (IS_ERR(dev))
> -			break;
> -
> -		bc = netdev_priv(dev);
> -		if (set_hw && baycom_setmode(bc, mode[i]))
> -			set_hw = 0;
> -		found++;
> -		baycom_device[i] = dev;
> -	}
> -
> -	if (!found)
> -		return -ENXIO;
> -	return 0;
> -}
> -
> -static void __exit cleanup_baycomserhdx(void)
> -{
> -	int i;
> -
> -	for(i = 0; i < NR_PORTS; i++) {
> -		struct net_device *dev = baycom_device[i];
> -
> -		if (dev)
> -			hdlcdrv_unregister(dev);
> -	}
> -}
> -
> -module_init(init_baycomserhdx);
> -module_exit(cleanup_baycomserhdx);
> -
> -/* --------------------------------------------------------------------- */
> -
> -#ifndef MODULE
> -
> -/*
> - * format: baycom_ser_hdx=io,irq,mode
> - * mode: ser12    hardware DCD
> - *       ser12*   software DCD
> - *       ser12@   hardware/software DCD, i.e. no explicit DCD signal but hardware
> - *                mutes audio input to the modem
> - *       ser12+   hardware DCD, inverted signal at DCD pin
> - */
> -
> -static int __init baycom_ser_hdx_setup(char *str)
> -{
> -        static unsigned nr_dev;
> -	int ints[3];
> -
> -        if (nr_dev >= NR_PORTS)
> -                return 0;
> -	str = get_options(str, 3, ints);
> -	if (ints[0] < 2)
> -		return 0;
> -	mode[nr_dev] = str;
> -	iobase[nr_dev] = ints[1];
> -	irq[nr_dev] = ints[2];
> -	nr_dev++;
> -	return 1;
> -}
> -
> -__setup("baycom_ser_hdx=", baycom_ser_hdx_setup);
> -
> -#endif /* MODULE */
> -/* --------------------------------------------------------------------- */
> diff --git a/drivers/net/hamradio/bpqether.c b/drivers/net/hamradio/bpqether.c
> deleted file mode 100644
> index 214fd1f819a1..000000000000
> --- a/drivers/net/hamradio/bpqether.c
> +++ /dev/null
> @@ -1,593 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-or-later
> -/*
> - *	G8BPQ compatible "AX.25 via ethernet" driver release 004
> - *
> - *	This code REQUIRES 2.0.0 or higher/ NET3.029
> - *
> - *	This is a "pseudo" network driver to allow AX.25 over Ethernet
> - *	using G8BPQ encapsulation. It has been extracted from the protocol
> - *	implementation because
> - *
> - *		- things got unreadable within the protocol stack
> - *		- to cure the protocol stack from "feature-ism"
> - *		- a protocol implementation shouldn't need to know on
> - *		  which hardware it is running
> - *		- user-level programs like the AX.25 utilities shouldn't
> - *		  need to know about the hardware.
> - *		- IP over ethernet encapsulated AX.25 was impossible
> - *		- rxecho.c did not work
> - *		- to have room for extensions
> - *		- it just deserves to "live" as an own driver
> - *
> - *	This driver can use any ethernet destination address, and can be
> - *	limited to accept frames from one dedicated ethernet card only.
> - *
> - *	Note that the driver sets up the BPQ devices automagically on
> - *	startup or (if started before the "insmod" of an ethernet device)
> - *	on "ifconfig up". It hopefully will remove the BPQ on "rmmod"ing
> - *	the ethernet device (in fact: as soon as another ethernet or bpq
> - *	device gets "ifconfig"ured).
> - *
> - *	I have heard that several people are thinking of experiments
> - *	with highspeed packet radio using existing ethernet cards.
> - *	Well, this driver is prepared for this purpose, just add
> - *	your tx key control and a txdelay / tailtime algorithm,
> - *	probably some buffering, and /voila/...
> - *
> - *	History
> - *	BPQ   001	Joerg(DL1BKE)		Extracted BPQ code from AX.25
> - *						protocol stack and added my own
> - *						yet existing patches
> - *	BPQ   002	Joerg(DL1BKE)		Scan network device list on
> - *						startup.
> - *	BPQ   003	Joerg(DL1BKE)		Ethernet destination address
> - *						and accepted source address
> - *						can be configured by an ioctl()
> - *						call.
> - *						Fixed to match Linux networking
> - *						changes - 2.1.15.
> - *	BPQ   004	Joerg(DL1BKE)		Fixed to not lock up on ifconfig.
> - */
> -
> -#include <linux/errno.h>
> -#include <linux/types.h>
> -#include <linux/socket.h>
> -#include <linux/in.h>
> -#include <linux/kernel.h>
> -#include <linux/string.h>
> -#include <linux/net.h>
> -#include <linux/slab.h>
> -#include <net/ax25.h>
> -#include <linux/inet.h>
> -#include <linux/netdevice.h>
> -#include <linux/etherdevice.h>
> -#include <linux/if_arp.h>
> -#include <linux/skbuff.h>
> -#include <net/sock.h>
> -#include <linux/uaccess.h>
> -#include <linux/mm.h>
> -#include <linux/interrupt.h>
> -#include <linux/notifier.h>
> -#include <linux/proc_fs.h>
> -#include <linux/seq_file.h>
> -#include <linux/stat.h>
> -#include <linux/module.h>
> -#include <linux/init.h>
> -#include <linux/rtnetlink.h>
> -
> -#include <net/ip.h>
> -#include <net/arp.h>
> -#include <net/netdev_lock.h>
> -#include <net/net_namespace.h>
> -
> -#include <linux/bpqether.h>
> -
> -static const char banner[] __initconst = KERN_INFO \
> -	"AX.25: bpqether driver version 004\n";
> -
> -static int bpq_rcv(struct sk_buff *, struct net_device *, struct packet_type *, struct net_device *);
> -static int bpq_device_event(struct notifier_block *, unsigned long, void *);
> -
> -static struct packet_type bpq_packet_type __read_mostly = {
> -	.type	= cpu_to_be16(ETH_P_BPQ),
> -	.func	= bpq_rcv,
> -};
> -
> -static struct notifier_block bpq_dev_notifier = {
> -	.notifier_call = bpq_device_event,
> -};
> -
> -
> -struct bpqdev {
> -	struct list_head bpq_list;	/* list of bpq devices chain */
> -	struct net_device *ethdev;	/* link to ethernet device */
> -	struct net_device *axdev;	/* bpq device (bpq#) */
> -	char   dest_addr[6];		/* ether destination address */
> -	char   acpt_addr[6];		/* accept ether frames from this address only */
> -};
> -
> -static LIST_HEAD(bpq_devices);
> -
> -/* ------------------------------------------------------------------------ */
> -
> -
> -/*
> - *	Get the ethernet device for a BPQ device
> - */
> -static inline struct net_device *bpq_get_ether_dev(struct net_device *dev)
> -{
> -	struct bpqdev *bpq = netdev_priv(dev);
> -
> -	return bpq ? bpq->ethdev : NULL;
> -}
> -
> -/*
> - *	Get the BPQ device for the ethernet device
> - */
> -static inline struct net_device *bpq_get_ax25_dev(struct net_device *dev)
> -{
> -	struct bpqdev *bpq;
> -
> -	list_for_each_entry_rcu(bpq, &bpq_devices, bpq_list,
> -				lockdep_rtnl_is_held()) {
> -		if (bpq->ethdev == dev)
> -			return bpq->axdev;
> -	}
> -	return NULL;
> -}
> -
> -static inline int dev_is_ethdev(struct net_device *dev)
> -{
> -	return dev->type == ARPHRD_ETHER && !netdev_need_ops_lock(dev);
> -}
> -
> -/* ------------------------------------------------------------------------ */
> -
> -
> -/*
> - *	Receive an AX.25 frame via an ethernet interface.
> - */
> -static int bpq_rcv(struct sk_buff *skb, struct net_device *dev, struct packet_type *ptype, struct net_device *orig_dev)
> -{
> -	int len;
> -	char * ptr;
> -	struct ethhdr *eth;
> -	struct bpqdev *bpq;
> -
> -	if (!net_eq(dev_net(dev), &init_net))
> -		goto drop;
> -
> -	if ((skb = skb_share_check(skb, GFP_ATOMIC)) == NULL)
> -		return NET_RX_DROP;
> -
> -	if (!pskb_may_pull(skb, sizeof(struct ethhdr)))
> -		goto drop;
> -
> -	rcu_read_lock();
> -	dev = bpq_get_ax25_dev(dev);
> -
> -	if (dev == NULL || !netif_running(dev))
> -		goto drop_unlock;
> -
> -	/*
> -	 * if we want to accept frames from just one ethernet device
> -	 * we check the source address of the sender.
> -	 */
> -
> -	bpq = netdev_priv(dev);
> -
> -	eth = eth_hdr(skb);
> -
> -	if (!(bpq->acpt_addr[0] & 0x01) &&
> -	    !ether_addr_equal(eth->h_source, bpq->acpt_addr))
> -		goto drop_unlock;
> -
> -	if (skb_cow(skb, sizeof(struct ethhdr)))
> -		goto drop_unlock;
> -
> -	len = skb->data[0] + skb->data[1] * 256 - 5;
> -
> -	if (len < 0 || len > skb->len - 2)
> -		goto drop_unlock;
> -
> -	skb_pull(skb, 2);	/* Remove the length bytes */
> -	skb_trim(skb, len);	/* Set the length of the data */
> -
> -	dev->stats.rx_packets++;
> -	dev->stats.rx_bytes += len;
> -
> -	ptr = skb_push(skb, 1);
> -	*ptr = 0;
> -
> -	skb->protocol = ax25_type_trans(skb, dev);
> -	netif_rx(skb);
> -unlock:
> -
> -	rcu_read_unlock();
> -
> -	return 0;
> -drop_unlock:
> -	kfree_skb(skb);
> -	goto unlock;
> -
> -drop:
> -	kfree_skb(skb);
> -	return 0;
> -}
> -
> -/*
> - * 	Send an AX.25 frame via an ethernet interface
> - */
> -static netdev_tx_t bpq_xmit(struct sk_buff *skb, struct net_device *dev)
> -{
> -	unsigned char *ptr;
> -	struct bpqdev *bpq;
> -	struct net_device *orig_dev;
> -	int size;
> -
> -	if (skb->protocol == htons(ETH_P_IP))
> -		return ax25_ip_xmit(skb);
> -
> -	/*
> -	 * Just to be *really* sure not to send anything if the interface
> -	 * is down, the ethernet device may have gone.
> -	 */
> -	if (!netif_running(dev)) {
> -		kfree_skb(skb);
> -		return NETDEV_TX_OK;
> -	}
> -
> -	skb_pull(skb, 1);			/* Drop KISS byte */
> -	size = skb->len;
> -
> -	/*
> -	 * We're about to mess with the skb which may still shared with the
> -	 * generic networking code so unshare and ensure it's got enough
> -	 * space for the BPQ headers.
> -	 */
> -	if (skb_cow(skb, AX25_BPQ_HEADER_LEN)) {
> -		if (net_ratelimit())
> -			pr_err("bpqether: out of memory\n");
> -		kfree_skb(skb);
> -
> -		return NETDEV_TX_OK;
> -	}
> -
> -	ptr = skb_push(skb, 2);			/* Make space for length */
> -
> -	*ptr++ = (size + 5) % 256;
> -	*ptr++ = (size + 5) / 256;
> -
> -	bpq = netdev_priv(dev);
> -
> -	orig_dev = dev;
> -	if ((dev = bpq_get_ether_dev(dev)) == NULL) {
> -		orig_dev->stats.tx_dropped++;
> -		kfree_skb(skb);
> -		return NETDEV_TX_OK;
> -	}
> -
> -	skb->protocol = ax25_type_trans(skb, dev);
> -	skb_reset_network_header(skb);
> -	dev_hard_header(skb, dev, ETH_P_BPQ, bpq->dest_addr, NULL, 0);
> -	dev->stats.tx_packets++;
> -	dev->stats.tx_bytes+=skb->len;
> -
> -	dev_queue_xmit(skb);
> -	netif_wake_queue(dev);
> -	return NETDEV_TX_OK;
> -}
> -
> -/*
> - *	Set AX.25 callsign
> - */
> -static int bpq_set_mac_address(struct net_device *dev, void *addr)
> -{
> -    struct sockaddr *sa = (struct sockaddr *)addr;
> -
> -    dev_addr_set(dev, sa->sa_data);
> -
> -    return 0;
> -}
> -
> -/*	Ioctl commands
> - *
> - *		SIOCSBPQETHOPT		reserved for enhancements
> - *		SIOCSBPQETHADDR		set the destination and accepted
> - *					source ethernet address (broadcast
> - *					or multicast: accept all)
> - */
> -static int bpq_siocdevprivate(struct net_device *dev, struct ifreq *ifr,
> -			      void __user *data, int cmd)
> -{
> -	struct bpq_ethaddr __user *ethaddr = data;
> -	struct bpqdev *bpq = netdev_priv(dev);
> -	struct bpq_req req;
> -
> -	if (!capable(CAP_NET_ADMIN))
> -		return -EPERM;
> -
> -	switch (cmd) {
> -		case SIOCSBPQETHOPT:
> -			if (copy_from_user(&req, data, sizeof(struct bpq_req)))
> -				return -EFAULT;
> -			switch (req.cmd) {
> -				case SIOCGBPQETHPARAM:
> -				case SIOCSBPQETHPARAM:
> -				default:
> -					return -EINVAL;
> -			}
> -
> -			break;
> -
> -		case SIOCSBPQETHADDR:
> -			if (copy_from_user(bpq->dest_addr, ethaddr->destination, ETH_ALEN))
> -				return -EFAULT;
> -			if (copy_from_user(bpq->acpt_addr, ethaddr->accept, ETH_ALEN))
> -				return -EFAULT;
> -			break;
> -
> -		default:
> -			return -EINVAL;
> -	}
> -
> -	return 0;
> -}
> -
> -/*
> - * open/close a device
> - */
> -static int bpq_open(struct net_device *dev)
> -{
> -	netif_start_queue(dev);
> -	return 0;
> -}
> -
> -static int bpq_close(struct net_device *dev)
> -{
> -	netif_stop_queue(dev);
> -	return 0;
> -}
> -
> -
> -/* ------------------------------------------------------------------------ */
> -
> -#ifdef CONFIG_PROC_FS
> -/*
> - *	Proc filesystem
> - */
> -static void *bpq_seq_start(struct seq_file *seq, loff_t *pos)
> -	__acquires(RCU)
> -{
> -	int i = 1;
> -	struct bpqdev *bpqdev;
> -
> -	rcu_read_lock();
> -
> -	if (*pos == 0)
> -		return SEQ_START_TOKEN;
> -	
> -	list_for_each_entry_rcu(bpqdev, &bpq_devices, bpq_list) {
> -		if (i == *pos)
> -			return bpqdev;
> -	}
> -	return NULL;
> -}
> -
> -static void *bpq_seq_next(struct seq_file *seq, void *v, loff_t *pos)
> -{
> -	struct list_head *p;
> -	struct bpqdev *bpqdev = v;
> -
> -	++*pos;
> -
> -	if (v == SEQ_START_TOKEN)
> -		p = rcu_dereference(list_next_rcu(&bpq_devices));
> -	else
> -		p = rcu_dereference(list_next_rcu(&bpqdev->bpq_list));
> -
> -	return (p == &bpq_devices) ? NULL
> -		: list_entry(p, struct bpqdev, bpq_list);
> -}
> -
> -static void bpq_seq_stop(struct seq_file *seq, void *v)
> -	__releases(RCU)
> -{
> -	rcu_read_unlock();
> -}
> -
> -
> -static int bpq_seq_show(struct seq_file *seq, void *v)
> -{
> -	if (v == SEQ_START_TOKEN)
> -		seq_puts(seq,
> -			 "dev   ether      destination        accept from\n");
> -	else {
> -		const struct bpqdev *bpqdev = v;
> -
> -		seq_printf(seq, "%-5s %-10s %pM  ",
> -			bpqdev->axdev->name, bpqdev->ethdev->name,
> -			bpqdev->dest_addr);
> -
> -		if (is_multicast_ether_addr(bpqdev->acpt_addr))
> -			seq_printf(seq, "*\n");
> -		else
> -			seq_printf(seq, "%pM\n", bpqdev->acpt_addr);
> -
> -	}
> -	return 0;
> -}
> -
> -static const struct seq_operations bpq_seqops = {
> -	.start = bpq_seq_start,
> -	.next = bpq_seq_next,
> -	.stop = bpq_seq_stop,
> -	.show = bpq_seq_show,
> -};
> -#endif
> -/* ------------------------------------------------------------------------ */
> -
> -static const struct net_device_ops bpq_netdev_ops = {
> -	.ndo_open	     = bpq_open,
> -	.ndo_stop	     = bpq_close,
> -	.ndo_start_xmit	     = bpq_xmit,
> -	.ndo_set_mac_address = bpq_set_mac_address,
> -	.ndo_siocdevprivate  = bpq_siocdevprivate,
> -};
> -
> -static void bpq_setup(struct net_device *dev)
> -{
> -	netdev_lockdep_set_classes(dev);
> -
> -	dev->netdev_ops	     = &bpq_netdev_ops;
> -	dev->needs_free_netdev = true;
> -
> -	dev->flags      = 0;
> -	dev->lltx = true;	/* Allow recursion */
> -
> -#if IS_ENABLED(CONFIG_AX25)
> -	dev->header_ops      = &ax25_header_ops;
> -#endif
> -
> -	dev->type            = ARPHRD_AX25;
> -	dev->hard_header_len = AX25_MAX_HEADER_LEN + AX25_BPQ_HEADER_LEN;
> -	dev->mtu             = AX25_DEF_PACLEN;
> -	dev->addr_len        = AX25_ADDR_LEN;
> -
> -	memcpy(dev->broadcast, &ax25_bcast, AX25_ADDR_LEN);
> -	dev_addr_set(dev, (u8 *)&ax25_defaddr);
> -}
> -
> -/*
> - *	Setup a new device.
> - */
> -static int bpq_new_device(struct net_device *edev)
> -{
> -	int err;
> -	struct net_device *ndev;
> -	struct bpqdev *bpq;
> -
> -	ndev = alloc_netdev(sizeof(struct bpqdev), "bpq%d", NET_NAME_UNKNOWN,
> -			    bpq_setup);
> -	if (!ndev)
> -		return -ENOMEM;
> -
> -		
> -	bpq = netdev_priv(ndev);
> -	dev_hold(edev);
> -	bpq->ethdev = edev;
> -	bpq->axdev = ndev;
> -
> -	eth_broadcast_addr(bpq->dest_addr);
> -	eth_broadcast_addr(bpq->acpt_addr);
> -
> -	err = register_netdevice(ndev);
> -	if (err)
> -		goto error;
> -
> -	/* List protected by RTNL */
> -	list_add_rcu(&bpq->bpq_list, &bpq_devices);
> -	return 0;
> -
> - error:
> -	dev_put(edev);
> -	free_netdev(ndev);
> -	return err;
> -	
> -}
> -
> -static void bpq_free_device(struct net_device *ndev)
> -{
> -	struct bpqdev *bpq = netdev_priv(ndev);
> -
> -	dev_put(bpq->ethdev);
> -	list_del_rcu(&bpq->bpq_list);
> -
> -	unregister_netdevice(ndev);
> -}
> -
> -/*
> - *	Handle device status changes.
> - */
> -static int bpq_device_event(struct notifier_block *this,
> -			    unsigned long event, void *ptr)
> -{
> -	struct net_device *dev = netdev_notifier_info_to_dev(ptr);
> -
> -	if (!net_eq(dev_net(dev), &init_net))
> -		return NOTIFY_DONE;
> -
> -	if (!dev_is_ethdev(dev) && !bpq_get_ax25_dev(dev))
> -		return NOTIFY_DONE;
> -
> -	switch (event) {
> -	case NETDEV_UP:		/* new ethernet device -> new BPQ interface */
> -		if (bpq_get_ax25_dev(dev) == NULL)
> -			bpq_new_device(dev);
> -		break;
> -
> -	case NETDEV_DOWN:	/* ethernet device closed -> close BPQ interface */
> -		if ((dev = bpq_get_ax25_dev(dev)) != NULL)
> -			dev_close(dev);
> -		break;
> -
> -	case NETDEV_UNREGISTER:	/* ethernet device removed -> free BPQ interface */
> -		if ((dev = bpq_get_ax25_dev(dev)) != NULL)
> -			bpq_free_device(dev);
> -		break;
> -	default:
> -		break;
> -	}
> -
> -	return NOTIFY_DONE;
> -}
> -
> -
> -/* ------------------------------------------------------------------------ */
> -
> -/*
> - * Initialize driver. To be called from af_ax25 if not compiled as a
> - * module
> - */
> -static int __init bpq_init_driver(void)
> -{
> -#ifdef CONFIG_PROC_FS
> -	if (!proc_create_seq("bpqether", 0444, init_net.proc_net, &bpq_seqops)) {
> -		printk(KERN_ERR
> -			"bpq: cannot create /proc/net/bpqether entry.\n");
> -		return -ENOENT;
> -	}
> -#endif  /* CONFIG_PROC_FS */
> -
> -	dev_add_pack(&bpq_packet_type);
> -
> -	register_netdevice_notifier(&bpq_dev_notifier);
> -
> -	printk(banner);
> -
> -	return 0;
> -}
> -
> -static void __exit bpq_cleanup_driver(void)
> -{
> -	struct bpqdev *bpq;
> -
> -	dev_remove_pack(&bpq_packet_type);
> -
> -	unregister_netdevice_notifier(&bpq_dev_notifier);
> -
> -	remove_proc_entry("bpqether", init_net.proc_net);
> -
> -	rtnl_lock();
> -	while (!list_empty(&bpq_devices)) {
> -		bpq = list_entry(bpq_devices.next, struct bpqdev, bpq_list);
> -		bpq_free_device(bpq->axdev);
> -	}
> -	rtnl_unlock();
> -}
> -
> -MODULE_AUTHOR("Joerg Reuter DL1BKE <jreuter@yaina.de>");
> -MODULE_DESCRIPTION("Transmit and receive AX.25 packets over Ethernet");
> -MODULE_LICENSE("GPL");
> -module_init(bpq_init_driver);
> -module_exit(bpq_cleanup_driver);
> diff --git a/drivers/net/hamradio/hdlcdrv.c b/drivers/net/hamradio/hdlcdrv.c
> deleted file mode 100644
> index 3b88e465d08f..000000000000
> --- a/drivers/net/hamradio/hdlcdrv.c
> +++ /dev/null
> @@ -1,747 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-or-later
> -/*****************************************************************************/
> -
> -/*
> - *	hdlcdrv.c  -- HDLC packet radio network driver.
> - *
> - *	Copyright (C) 1996-2000  Thomas Sailer (sailer@ife.ee.ethz.ch)
> - *
> - *  Please note that the GPL allows you to use the driver, NOT the radio.
> - *  In order to use the radio, you need a license from the communications
> - *  authority of your country.
> - *
> - *  The driver was derived from Donald Beckers skeleton.c
> - *	Written 1993-94 by Donald Becker.
> - *
> - *  History:
> - *   0.1  21.09.1996  Started
> - *        18.10.1996  Changed to new user space access routines
> - *                    (copy_{to,from}_user)
> - *   0.2  21.11.1996  various small changes
> - *   0.3  03.03.1997  fixed (hopefully) IP not working with ax.25 as a module
> - *   0.4  16.04.1997  init code/data tagged
> - *   0.5  30.07.1997  made HDLC buffers bigger (solves a problem with the
> - *                    soundmodem driver)
> - *   0.6  05.04.1998  add spinlocks
> - *   0.7  03.08.1999  removed some old compatibility cruft
> - *   0.8  12.02.2000  adapted to softnet driver interface
> - */
> -
> -/*****************************************************************************/
> -
> -#include <linux/capability.h>
> -#include <linux/compat.h>
> -#include <linux/module.h>
> -#include <linux/types.h>
> -#include <linux/net.h>
> -#include <linux/in.h>
> -#include <linux/if.h>
> -#include <linux/errno.h>
> -#include <linux/init.h>
> -#include <linux/bitops.h>
> -
> -#include <linux/netdevice.h>
> -#include <linux/if_arp.h>
> -#include <linux/skbuff.h>
> -#include <linux/hdlcdrv.h>
> -#include <linux/random.h>
> -#include <net/ax25.h>
> -#include <linux/uaccess.h>
> -
> -#include <linux/crc-ccitt.h>
> -
> -/* --------------------------------------------------------------------- */
> -
> -#define KISS_VERBOSE
> -
> -/* --------------------------------------------------------------------- */
> -
> -#define PARAM_TXDELAY   1
> -#define PARAM_PERSIST   2
> -#define PARAM_SLOTTIME  3
> -#define PARAM_TXTAIL    4
> -#define PARAM_FULLDUP   5
> -#define PARAM_HARDWARE  6
> -#define PARAM_RETURN    255
> -
> -/* --------------------------------------------------------------------- */
> -/*
> - * the CRC routines are stolen from WAMPES
> - * by Dieter Deyke
> - */
> -
> -
> -/*---------------------------------------------------------------------------*/
> -
> -static inline void append_crc_ccitt(unsigned char *buffer, int len)
> -{
> -	unsigned int crc = crc_ccitt(0xffff, buffer, len) ^ 0xffff;
> -	buffer += len;
> -	*buffer++ = crc;
> -	*buffer++ = crc >> 8;
> -}
> -
> -/*---------------------------------------------------------------------------*/
> -
> -static inline int check_crc_ccitt(const unsigned char *buf, int cnt)
> -{
> -	return (crc_ccitt(0xffff, buf, cnt) & 0xffff) == 0xf0b8;
> -}
> -
> -/*---------------------------------------------------------------------------*/
> -
> -#if 0
> -static int calc_crc_ccitt(const unsigned char *buf, int cnt)
> -{
> -	unsigned int crc = 0xffff;
> -
> -	for (; cnt > 0; cnt--)
> -		crc = (crc >> 8) ^ crc_ccitt_table[(crc ^ *buf++) & 0xff];
> -	crc ^= 0xffff;
> -	return crc & 0xffff;
> -}
> -#endif
> -
> -/* ---------------------------------------------------------------------- */
> -
> -#define tenms_to_2flags(s,tenms) ((tenms * s->par.bitrate) / 100 / 16)
> -
> -/* ---------------------------------------------------------------------- */
> -/*
> - * The HDLC routines
> - */
> -
> -static int hdlc_rx_add_bytes(struct hdlcdrv_state *s, unsigned int bits,
> -			     int num)
> -{
> -	int added = 0;
> -	
> -	while (s->hdlcrx.rx_state && num >= 8) {
> -		if (s->hdlcrx.len >= sizeof(s->hdlcrx.buffer)) {
> -			s->hdlcrx.rx_state = 0;
> -			return 0;
> -		}
> -		*s->hdlcrx.bp++ = bits >> (32-num);
> -		s->hdlcrx.len++;
> -		num -= 8;
> -		added += 8;
> -	}
> -	return added;
> -}
> -
> -static void hdlc_rx_flag(struct net_device *dev, struct hdlcdrv_state *s)
> -{
> -	struct sk_buff *skb;
> -	int pkt_len;
> -	unsigned char *cp;
> -
> -	if (s->hdlcrx.len < 4)
> -		return;
> -	if (!check_crc_ccitt(s->hdlcrx.buffer, s->hdlcrx.len))
> -		return;
> -	pkt_len = s->hdlcrx.len - 2 + 1; /* KISS kludge */
> -	if (!(skb = dev_alloc_skb(pkt_len))) {
> -		printk("%s: memory squeeze, dropping packet\n", dev->name);
> -		dev->stats.rx_dropped++;
> -		return;
> -	}
> -	cp = skb_put(skb, pkt_len);
> -	*cp++ = 0; /* KISS kludge */
> -	memcpy(cp, s->hdlcrx.buffer, pkt_len - 1);
> -	skb->protocol = ax25_type_trans(skb, dev);
> -	netif_rx(skb);
> -	dev->stats.rx_packets++;
> -}
> -
> -void hdlcdrv_receiver(struct net_device *dev, struct hdlcdrv_state *s)
> -{
> -	int i;
> -	unsigned int mask1, mask2, mask3, mask4, mask5, mask6, word;
> -	
> -	if (!s || s->magic != HDLCDRV_MAGIC)
> -		return;
> -	if (test_and_set_bit(0, &s->hdlcrx.in_hdlc_rx))
> -		return;
> -
> -	while (!hdlcdrv_hbuf_empty(&s->hdlcrx.hbuf)) {
> -		word = hdlcdrv_hbuf_get(&s->hdlcrx.hbuf);	
> -
> -#ifdef HDLCDRV_DEBUG
> -		hdlcdrv_add_bitbuffer_word(&s->bitbuf_hdlc, word);
> -#endif /* HDLCDRV_DEBUG */
> -	       	s->hdlcrx.bitstream >>= 16;
> -		s->hdlcrx.bitstream |= word << 16;
> -		s->hdlcrx.bitbuf >>= 16;
> -		s->hdlcrx.bitbuf |= word << 16;
> -		s->hdlcrx.numbits += 16;
> -		for(i = 15, mask1 = 0x1fc00, mask2 = 0x1fe00, mask3 = 0x0fc00,
> -		    mask4 = 0x1f800, mask5 = 0xf800, mask6 = 0xffff;
> -		    i >= 0;
> -		    i--, mask1 <<= 1, mask2 <<= 1, mask3 <<= 1, mask4 <<= 1,
> -		    mask5 <<= 1, mask6 = (mask6 << 1) | 1) {
> -			if ((s->hdlcrx.bitstream & mask1) == mask1)
> -				s->hdlcrx.rx_state = 0; /* abort received */
> -			else if ((s->hdlcrx.bitstream & mask2) == mask3) {
> -				/* flag received */
> -				if (s->hdlcrx.rx_state) {
> -					hdlc_rx_add_bytes(s, s->hdlcrx.bitbuf
> -							  << (8+i),
> -							  s->hdlcrx.numbits
> -							  -8-i);
> -					hdlc_rx_flag(dev, s);
> -				}
> -				s->hdlcrx.len = 0;
> -				s->hdlcrx.bp = s->hdlcrx.buffer;
> -				s->hdlcrx.rx_state = 1;
> -				s->hdlcrx.numbits = i;
> -			} else if ((s->hdlcrx.bitstream & mask4) == mask5) {
> -				/* stuffed bit */
> -				s->hdlcrx.numbits--;
> -				s->hdlcrx.bitbuf = (s->hdlcrx.bitbuf & (~mask6)) |
> -					((s->hdlcrx.bitbuf & mask6) << 1);
> -			}
> -		}
> -		s->hdlcrx.numbits -= hdlc_rx_add_bytes(s, s->hdlcrx.bitbuf,
> -						       s->hdlcrx.numbits);
> -	}
> -	clear_bit(0, &s->hdlcrx.in_hdlc_rx);
> -}
> -
> -/* ---------------------------------------------------------------------- */
> -
> -static inline void do_kiss_params(struct hdlcdrv_state *s,
> -				  unsigned char *data, unsigned long len)
> -{
> -
> -#ifdef KISS_VERBOSE
> -#define PKP(a,b) printk(KERN_INFO "hdlcdrv.c: channel params: " a "\n", b)
> -#else /* KISS_VERBOSE */	
> -#define PKP(a,b)
> -#endif /* KISS_VERBOSE */	
> -
> -	if (len < 2)
> -		return;
> -	switch(data[0]) {
> -	case PARAM_TXDELAY:
> -		s->ch_params.tx_delay = data[1];
> -		PKP("TX delay = %ums", 10 * s->ch_params.tx_delay);
> -		break;
> -	case PARAM_PERSIST:
> -		s->ch_params.ppersist = data[1];
> -		PKP("p persistence = %u", s->ch_params.ppersist);
> -		break;
> -	case PARAM_SLOTTIME:
> -		s->ch_params.slottime = data[1];
> -		PKP("slot time = %ums", s->ch_params.slottime);
> -		break;
> -	case PARAM_TXTAIL:
> -		s->ch_params.tx_tail = data[1];
> -		PKP("TX tail = %ums", s->ch_params.tx_tail);
> -		break;
> -	case PARAM_FULLDUP:
> -		s->ch_params.fulldup = !!data[1];
> -		PKP("%s duplex", s->ch_params.fulldup ? "full" : "half");
> -		break;
> -	default:
> -		break;
> -	}
> -#undef PKP
> -}
> -
> -/* ---------------------------------------------------------------------- */
> -
> -void hdlcdrv_transmitter(struct net_device *dev, struct hdlcdrv_state *s)
> -{
> -	unsigned int mask1, mask2, mask3;
> -	int i;
> -	struct sk_buff *skb;
> -	int pkt_len;
> -
> -	if (!s || s->magic != HDLCDRV_MAGIC)
> -		return;
> -	if (test_and_set_bit(0, &s->hdlctx.in_hdlc_tx))
> -		return;
> -	for (;;) {
> -		if (s->hdlctx.numbits >= 16) {
> -			if (hdlcdrv_hbuf_full(&s->hdlctx.hbuf)) {
> -				clear_bit(0, &s->hdlctx.in_hdlc_tx);
> -				return;
> -			}
> -			hdlcdrv_hbuf_put(&s->hdlctx.hbuf, s->hdlctx.bitbuf);
> -			s->hdlctx.bitbuf >>= 16;
> -			s->hdlctx.numbits -= 16;
> -		}
> -		switch (s->hdlctx.tx_state) {
> -		default:
> -			clear_bit(0, &s->hdlctx.in_hdlc_tx);
> -			return;
> -		case 0:
> -		case 1:
> -			if (s->hdlctx.numflags) {
> -				s->hdlctx.numflags--;
> -				s->hdlctx.bitbuf |=
> -					0x7e7e << s->hdlctx.numbits;
> -				s->hdlctx.numbits += 16;
> -				break;
> -			}
> -			if (s->hdlctx.tx_state == 1) {
> -				clear_bit(0, &s->hdlctx.in_hdlc_tx);
> -				return;
> -			}
> -			if (!(skb = s->skb)) {
> -				int flgs = tenms_to_2flags(s, s->ch_params.tx_tail);
> -				if (flgs < 2)
> -					flgs = 2;
> -				s->hdlctx.tx_state = 1;
> -				s->hdlctx.numflags = flgs;
> -				break;
> -			}
> -			s->skb = NULL;
> -			netif_wake_queue(dev);
> -			pkt_len = skb->len-1; /* strip KISS byte */
> -			if (pkt_len >= HDLCDRV_MAXFLEN || pkt_len < 2) {
> -				s->hdlctx.tx_state = 0;
> -				s->hdlctx.numflags = 1;
> -				dev_kfree_skb_irq(skb);
> -				break;
> -			}
> -			skb_copy_from_linear_data_offset(skb, 1,
> -							 s->hdlctx.buffer,
> -							 pkt_len);
> -			dev_kfree_skb_irq(skb);
> -			s->hdlctx.bp = s->hdlctx.buffer;
> -			append_crc_ccitt(s->hdlctx.buffer, pkt_len);
> -			s->hdlctx.len = pkt_len+2; /* the appended CRC */
> -			s->hdlctx.tx_state = 2;
> -			s->hdlctx.bitstream = 0;
> -			dev->stats.tx_packets++;
> -			break;
> -		case 2:
> -			if (!s->hdlctx.len) {
> -				s->hdlctx.tx_state = 0;
> -				s->hdlctx.numflags = 1;
> -				break;
> -			}
> -			s->hdlctx.len--;
> -			s->hdlctx.bitbuf |= *s->hdlctx.bp <<
> -				s->hdlctx.numbits;
> -			s->hdlctx.bitstream >>= 8;
> -			s->hdlctx.bitstream |= (*s->hdlctx.bp++) << 16;
> -			mask1 = 0x1f000;
> -			mask2 = 0x10000;
> -			mask3 = 0xffffffff >> (31-s->hdlctx.numbits);
> -			s->hdlctx.numbits += 8;
> -			for(i = 0; i < 8; i++, mask1 <<= 1, mask2 <<= 1,
> -			    mask3 = (mask3 << 1) | 1) {
> -				if ((s->hdlctx.bitstream & mask1) != mask1)
> -					continue;
> -				s->hdlctx.bitstream &= ~mask2;
> -				s->hdlctx.bitbuf =
> -					(s->hdlctx.bitbuf & mask3) |
> -						((s->hdlctx.bitbuf &
> -						 (~mask3)) << 1);
> -				s->hdlctx.numbits++;
> -				mask3 = (mask3 << 1) | 1;
> -			}
> -			break;
> -		}
> -	}
> -}
> -
> -/* ---------------------------------------------------------------------- */
> -
> -static void start_tx(struct net_device *dev, struct hdlcdrv_state *s)
> -{
> -	s->hdlctx.tx_state = 0;
> -	s->hdlctx.numflags = tenms_to_2flags(s, s->ch_params.tx_delay);
> -	s->hdlctx.bitbuf = s->hdlctx.bitstream = s->hdlctx.numbits = 0;
> -	hdlcdrv_transmitter(dev, s);
> -	s->hdlctx.ptt = 1;
> -	s->ptt_keyed++;
> -}
> -
> -/* ---------------------------------------------------------------------- */
> -
> -void hdlcdrv_arbitrate(struct net_device *dev, struct hdlcdrv_state *s)
> -{
> -	if (!s || s->magic != HDLCDRV_MAGIC || s->hdlctx.ptt || !s->skb)
> -		return;
> -	if (s->ch_params.fulldup) {
> -		start_tx(dev, s);
> -		return;
> -	}
> -	if (s->hdlcrx.dcd) {
> -		s->hdlctx.slotcnt = s->ch_params.slottime;
> -		return;
> -	}
> -	if ((--s->hdlctx.slotcnt) > 0)
> -		return;
> -	s->hdlctx.slotcnt = s->ch_params.slottime;
> -	if (get_random_u8() > s->ch_params.ppersist)
> -		return;
> -	start_tx(dev, s);
> -}
> -
> -/* --------------------------------------------------------------------- */
> -/*
> - * ===================== network driver interface =========================
> - */
> -
> -static netdev_tx_t hdlcdrv_send_packet(struct sk_buff *skb,
> -				       struct net_device *dev)
> -{
> -	struct hdlcdrv_state *sm = netdev_priv(dev);
> -
> -	if (skb->protocol == htons(ETH_P_IP))
> -		return ax25_ip_xmit(skb);
> -
> -	if (skb->data[0] != 0) {
> -		do_kiss_params(sm, skb->data, skb->len);
> -		dev_kfree_skb(skb);
> -		return NETDEV_TX_OK;
> -	}
> -	if (sm->skb) {
> -		dev_kfree_skb(skb);
> -		return NETDEV_TX_OK;
> -	}
> -	netif_stop_queue(dev);
> -	sm->skb = skb;
> -	return NETDEV_TX_OK;
> -}
> -
> -/* --------------------------------------------------------------------- */
> -
> -static int hdlcdrv_set_mac_address(struct net_device *dev, void *addr)
> -{
> -	struct sockaddr *sa = (struct sockaddr *)addr;
> -
> -	/* addr is an AX.25 shifted ASCII mac address */
> -	dev_addr_set(dev, sa->sa_data);
> -	return 0;
> -}
> -
> -/* --------------------------------------------------------------------- */
> -/*
> - * Open/initialize the board. This is called (in the current kernel)
> - * sometime after booting when the 'ifconfig' program is run.
> - *
> - * This routine should set everything up anew at each open, even
> - * registers that "should" only need to be set once at boot, so that
> - * there is non-reboot way to recover if something goes wrong.
> - */
> -
> -static int hdlcdrv_open(struct net_device *dev)
> -{
> -	struct hdlcdrv_state *s = netdev_priv(dev);
> -	int i;
> -
> -	if (!s->ops || !s->ops->open)
> -		return -ENODEV;
> -
> -	/*
> -	 * initialise some variables
> -	 */
> -	s->opened = 1;
> -	s->hdlcrx.hbuf.rd = s->hdlcrx.hbuf.wr = 0;
> -	s->hdlcrx.in_hdlc_rx = 0;
> -	s->hdlcrx.rx_state = 0;
> -	
> -	s->hdlctx.hbuf.rd = s->hdlctx.hbuf.wr = 0;
> -	s->hdlctx.in_hdlc_tx = 0;
> -	s->hdlctx.tx_state = 1;
> -	s->hdlctx.numflags = 0;
> -	s->hdlctx.bitstream = s->hdlctx.bitbuf = s->hdlctx.numbits = 0;
> -	s->hdlctx.ptt = 0;
> -	s->hdlctx.slotcnt = s->ch_params.slottime;
> -	s->hdlctx.calibrate = 0;
> -
> -	i = s->ops->open(dev);
> -	if (i)
> -		return i;
> -	netif_start_queue(dev);
> -	return 0;
> -}
> -
> -/* --------------------------------------------------------------------- */
> -/*
> - * The inverse routine to hdlcdrv_open().
> - */
> -
> -static int hdlcdrv_close(struct net_device *dev)
> -{
> -	struct hdlcdrv_state *s = netdev_priv(dev);
> -	int i = 0;
> -
> -	netif_stop_queue(dev);
> -
> -	if (s->ops && s->ops->close)
> -		i = s->ops->close(dev);
> -	dev_kfree_skb(s->skb);
> -	s->skb = NULL;
> -	s->opened = 0;
> -	return i;
> -}
> -
> -/* --------------------------------------------------------------------- */
> -
> -static int hdlcdrv_siocdevprivate(struct net_device *dev, struct ifreq *ifr,
> -				  void __user *data, int cmd)
> -{
> -	struct hdlcdrv_state *s = netdev_priv(dev);
> -	struct hdlcdrv_ioctl bi;
> -
> -	if (cmd != SIOCDEVPRIVATE)
> -		return -ENOIOCTLCMD;
> -
> -	if (in_compat_syscall()) /* to be implemented */
> -		return -ENOIOCTLCMD;
> -
> -	if (copy_from_user(&bi, data, sizeof(bi)))
> -		return -EFAULT;
> -
> -	switch (bi.cmd) {
> -	default:
> -		if (s->ops && s->ops->ioctl)
> -			return s->ops->ioctl(dev, data, &bi, cmd);
> -		return -ENOIOCTLCMD;
> -
> -	case HDLCDRVCTL_GETCHANNELPAR:
> -		bi.data.cp.tx_delay = s->ch_params.tx_delay;
> -		bi.data.cp.tx_tail = s->ch_params.tx_tail;
> -		bi.data.cp.slottime = s->ch_params.slottime;
> -		bi.data.cp.ppersist = s->ch_params.ppersist;
> -		bi.data.cp.fulldup = s->ch_params.fulldup;
> -		break;
> -
> -	case HDLCDRVCTL_SETCHANNELPAR:
> -		if (!capable(CAP_NET_ADMIN))
> -			return -EACCES;
> -		s->ch_params.tx_delay = bi.data.cp.tx_delay;
> -		s->ch_params.tx_tail = bi.data.cp.tx_tail;
> -		s->ch_params.slottime = bi.data.cp.slottime;
> -		s->ch_params.ppersist = bi.data.cp.ppersist;
> -		s->ch_params.fulldup = bi.data.cp.fulldup;
> -		s->hdlctx.slotcnt = 1;
> -		return 0;
> -		
> -	case HDLCDRVCTL_GETMODEMPAR:
> -		bi.data.mp.iobase = dev->base_addr;
> -		bi.data.mp.irq = dev->irq;
> -		bi.data.mp.dma = dev->dma;
> -		bi.data.mp.dma2 = s->ptt_out.dma2;
> -		bi.data.mp.seriobase = s->ptt_out.seriobase;
> -		bi.data.mp.pariobase = s->ptt_out.pariobase;
> -		bi.data.mp.midiiobase = s->ptt_out.midiiobase;
> -		break;
> -
> -	case HDLCDRVCTL_SETMODEMPAR:
> -		if ((!capable(CAP_SYS_RAWIO)) || netif_running(dev))
> -			return -EACCES;
> -		dev->base_addr = bi.data.mp.iobase;
> -		dev->irq = bi.data.mp.irq;
> -		dev->dma = bi.data.mp.dma;
> -		s->ptt_out.dma2 = bi.data.mp.dma2;
> -		s->ptt_out.seriobase = bi.data.mp.seriobase;
> -		s->ptt_out.pariobase = bi.data.mp.pariobase;
> -		s->ptt_out.midiiobase = bi.data.mp.midiiobase;
> -		return 0;	
> -	
> -	case HDLCDRVCTL_GETSTAT:
> -		bi.data.cs.ptt = hdlcdrv_ptt(s);
> -		bi.data.cs.dcd = s->hdlcrx.dcd;
> -		bi.data.cs.ptt_keyed = s->ptt_keyed;
> -		bi.data.cs.tx_packets = dev->stats.tx_packets;
> -		bi.data.cs.tx_errors = dev->stats.tx_errors;
> -		bi.data.cs.rx_packets = dev->stats.rx_packets;
> -		bi.data.cs.rx_errors = dev->stats.rx_errors;
> -		break;		
> -
> -	case HDLCDRVCTL_OLDGETSTAT:
> -		bi.data.ocs.ptt = hdlcdrv_ptt(s);
> -		bi.data.ocs.dcd = s->hdlcrx.dcd;
> -		bi.data.ocs.ptt_keyed = s->ptt_keyed;
> -		break;		
> -
> -	case HDLCDRVCTL_CALIBRATE:
> -		if(!capable(CAP_SYS_RAWIO))
> -			return -EPERM;
> -		if (s->par.bitrate <= 0)
> -			return -EINVAL;
> -		if (bi.data.calibrate > INT_MAX / s->par.bitrate)
> -			return -EINVAL;
> -		s->hdlctx.calibrate = bi.data.calibrate * s->par.bitrate / 16;
> -		return 0;
> -
> -	case HDLCDRVCTL_GETSAMPLES:
> -#ifndef HDLCDRV_DEBUG
> -		return -EPERM;
> -#else /* HDLCDRV_DEBUG */
> -		if (s->bitbuf_channel.rd == s->bitbuf_channel.wr)
> -			return -EAGAIN;
> -		bi.data.bits =
> -			s->bitbuf_channel.buffer[s->bitbuf_channel.rd];
> -		s->bitbuf_channel.rd = (s->bitbuf_channel.rd+1) %
> -			sizeof(s->bitbuf_channel.buffer);
> -		break;
> -#endif /* HDLCDRV_DEBUG */
> -				
> -	case HDLCDRVCTL_GETBITS:
> -#ifndef HDLCDRV_DEBUG
> -		return -EPERM;
> -#else /* HDLCDRV_DEBUG */
> -		if (s->bitbuf_hdlc.rd == s->bitbuf_hdlc.wr)
> -			return -EAGAIN;
> -		bi.data.bits =
> -			s->bitbuf_hdlc.buffer[s->bitbuf_hdlc.rd];
> -		s->bitbuf_hdlc.rd = (s->bitbuf_hdlc.rd+1) %
> -			sizeof(s->bitbuf_hdlc.buffer);
> -		break;		
> -#endif /* HDLCDRV_DEBUG */
> -
> -	case HDLCDRVCTL_DRIVERNAME:
> -		if (s->ops && s->ops->drvname) {
> -			strscpy(bi.data.drivername, s->ops->drvname,
> -				sizeof(bi.data.drivername));
> -			break;
> -		}
> -		bi.data.drivername[0] = '\0';
> -		break;
> -		
> -	}
> -	if (copy_to_user(data, &bi, sizeof(bi)))
> -		return -EFAULT;
> -	return 0;
> -
> -}
> -
> -/* --------------------------------------------------------------------- */
> -
> -static const struct net_device_ops hdlcdrv_netdev = {
> -	.ndo_open	= hdlcdrv_open,
> -	.ndo_stop	= hdlcdrv_close,
> -	.ndo_start_xmit = hdlcdrv_send_packet,
> -	.ndo_siocdevprivate  = hdlcdrv_siocdevprivate,
> -	.ndo_set_mac_address = hdlcdrv_set_mac_address,
> -};
> -
> -/*
> - * Initialize fields in hdlcdrv
> - */
> -static void hdlcdrv_setup(struct net_device *dev)
> -{
> -	static const struct hdlcdrv_channel_params dflt_ch_params = {
> -		20, 2, 10, 40, 0
> -	};
> -	struct hdlcdrv_state *s = netdev_priv(dev);
> -
> -	/*
> -	 * initialize the hdlcdrv_state struct
> -	 */
> -	s->ch_params = dflt_ch_params;
> -	s->ptt_keyed = 0;
> -
> -	spin_lock_init(&s->hdlcrx.hbuf.lock);
> -	s->hdlcrx.hbuf.rd = s->hdlcrx.hbuf.wr = 0;
> -	s->hdlcrx.in_hdlc_rx = 0;
> -	s->hdlcrx.rx_state = 0;
> -	
> -	spin_lock_init(&s->hdlctx.hbuf.lock);
> -	s->hdlctx.hbuf.rd = s->hdlctx.hbuf.wr = 0;
> -	s->hdlctx.in_hdlc_tx = 0;
> -	s->hdlctx.tx_state = 1;
> -	s->hdlctx.numflags = 0;
> -	s->hdlctx.bitstream = s->hdlctx.bitbuf = s->hdlctx.numbits = 0;
> -	s->hdlctx.ptt = 0;
> -	s->hdlctx.slotcnt = s->ch_params.slottime;
> -	s->hdlctx.calibrate = 0;
> -
> -#ifdef HDLCDRV_DEBUG
> -	s->bitbuf_channel.rd = s->bitbuf_channel.wr = 0;
> -	s->bitbuf_channel.shreg = 0x80;
> -
> -	s->bitbuf_hdlc.rd = s->bitbuf_hdlc.wr = 0;
> -	s->bitbuf_hdlc.shreg = 0x80;
> -#endif /* HDLCDRV_DEBUG */
> -
> -
> -	/* Fill in the fields of the device structure */
> -
> -	s->skb = NULL;
> -	
> -	dev->netdev_ops = &hdlcdrv_netdev;
> -	dev->header_ops = &ax25_header_ops;
> -	
> -	dev->type = ARPHRD_AX25;           /* AF_AX25 device */
> -	dev->hard_header_len = AX25_MAX_HEADER_LEN + AX25_BPQ_HEADER_LEN;
> -	dev->mtu = AX25_DEF_PACLEN;        /* eth_mtu is the default */
> -	dev->addr_len = AX25_ADDR_LEN;     /* sizeof an ax.25 address */
> -	memcpy(dev->broadcast, &ax25_bcast, AX25_ADDR_LEN);
> -	dev_addr_set(dev, (u8 *)&ax25_defaddr);
> -	dev->tx_queue_len = 16;
> -}
> -
> -/* --------------------------------------------------------------------- */
> -struct net_device *hdlcdrv_register(const struct hdlcdrv_ops *ops,
> -				    unsigned int privsize, const char *ifname,
> -				    unsigned int baseaddr, unsigned int irq,
> -				    unsigned int dma)
> -{
> -	struct net_device *dev;
> -	struct hdlcdrv_state *s;
> -	int err;
> -
> -	if (privsize < sizeof(struct hdlcdrv_state))
> -		privsize = sizeof(struct hdlcdrv_state);
> -
> -	dev = alloc_netdev(privsize, ifname, NET_NAME_UNKNOWN, hdlcdrv_setup);
> -	if (!dev)
> -		return ERR_PTR(-ENOMEM);
> -
> -	/*
> -	 * initialize part of the hdlcdrv_state struct
> -	 */
> -	s = netdev_priv(dev);
> -	s->magic = HDLCDRV_MAGIC;
> -	s->ops = ops;
> -	dev->base_addr = baseaddr;
> -	dev->irq = irq;
> -	dev->dma = dma;
> -
> -	err = register_netdev(dev);
> -	if (err < 0) {
> -		printk(KERN_WARNING "hdlcdrv: cannot register net "
> -		       "device %s\n", dev->name);
> -		free_netdev(dev);
> -		dev = ERR_PTR(err);
> -	}
> -	return dev;
> -}
> -
> -/* --------------------------------------------------------------------- */
> -
> -void hdlcdrv_unregister(struct net_device *dev)
> -{
> -	struct hdlcdrv_state *s = netdev_priv(dev);
> -
> -	BUG_ON(s->magic != HDLCDRV_MAGIC);
> -
> -	if (s->opened && s->ops->close)
> -		s->ops->close(dev);
> -	unregister_netdev(dev);
> -	
> -	free_netdev(dev);
> -}
> -
> -/* --------------------------------------------------------------------- */
> -
> -EXPORT_SYMBOL(hdlcdrv_receiver);
> -EXPORT_SYMBOL(hdlcdrv_transmitter);
> -EXPORT_SYMBOL(hdlcdrv_arbitrate);
> -EXPORT_SYMBOL(hdlcdrv_register);
> -EXPORT_SYMBOL(hdlcdrv_unregister);
> -
> -/* --------------------------------------------------------------------- */
> -
> -MODULE_AUTHOR("Thomas M. Sailer, sailer@ife.ee.ethz.ch, hb9jnx@hb9w.che.eu");
> -MODULE_DESCRIPTION("Packet Radio network interface HDLC encoder/decoder");
> -MODULE_LICENSE("GPL");
> diff --git a/drivers/net/hamradio/mkiss.c b/drivers/net/hamradio/mkiss.c
> deleted file mode 100644
> index 5f38a002bd9e..000000000000
> --- a/drivers/net/hamradio/mkiss.c
> +++ /dev/null
> @@ -1,980 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-only
> -/*
> - *
> - * Copyright (C) Hans Alblas PE1AYX <hans@esrac.ele.tue.nl>
> - * Copyright (C) 2004, 05 Ralf Baechle DL5RB <ralf@linux-mips.org>
> - * Copyright (C) 2004, 05 Thomas Osterried DL9SAU <thomas@x-berg.in-berlin.de>
> - */
> -#include <linux/module.h>
> -#include <linux/bitops.h>
> -#include <linux/uaccess.h>
> -#include <linux/crc16.h>
> -#include <linux/string.h>
> -#include <linux/mm.h>
> -#include <linux/interrupt.h>
> -#include <linux/in.h>
> -#include <linux/inet.h>
> -#include <linux/slab.h>
> -#include <linux/tty.h>
> -#include <linux/errno.h>
> -#include <linux/netdevice.h>
> -#include <linux/major.h>
> -#include <linux/init.h>
> -#include <linux/rtnetlink.h>
> -#include <linux/etherdevice.h>
> -#include <linux/skbuff.h>
> -#include <linux/if_arp.h>
> -#include <linux/jiffies.h>
> -#include <linux/refcount.h>
> -
> -#include <net/ax25.h>
> -
> -#define AX_MTU		236
> -
> -/* some arch define END as assembly function ending, just undef it */
> -#undef	END
> -/* SLIP/KISS protocol characters. */
> -#define END             0300		/* indicates end of frame	*/
> -#define ESC             0333		/* indicates byte stuffing	*/
> -#define ESC_END         0334		/* ESC ESC_END means END 'data'	*/
> -#define ESC_ESC         0335		/* ESC ESC_ESC means ESC 'data'	*/
> -
> -struct mkiss {
> -	struct tty_struct	*tty;	/* ptr to TTY structure		*/
> -	struct net_device	*dev;	/* easy for intr handling	*/
> -
> -	/* These are pointers to the malloc()ed frame buffers. */
> -	spinlock_t		buflock;/* lock for rbuf and xbuf */
> -	unsigned char		*rbuff;	/* receiver buffer		*/
> -	int			rcount;	/* received chars counter       */
> -	unsigned char		*xbuff;	/* transmitter buffer		*/
> -	unsigned char		*xhead;	/* pointer to next byte to XMIT */
> -	int			xleft;	/* bytes left in XMIT queue     */
> -
> -	/* Detailed SLIP statistics. */
> -	int		mtu;		/* Our mtu (to spot changes!)   */
> -	int		buffsize;	/* Max buffers sizes            */
> -
> -	unsigned long	flags;		/* Flag values/ mode etc	*/
> -					/* long req'd: used by set_bit --RR */
> -#define AXF_INUSE	0		/* Channel in use               */
> -#define AXF_ESCAPE	1               /* ESC received                 */
> -#define AXF_ERROR	2               /* Parity, etc. error           */
> -#define AXF_KEEPTEST	3		/* Keepalive test flag		*/
> -#define AXF_OUTWAIT	4		/* is outpacket was flag	*/
> -
> -	int		mode;
> -        int		crcmode;	/* MW: for FlexNet, SMACK etc.  */
> -	int		crcauto;	/* CRC auto mode */
> -
> -#define CRC_MODE_NONE		0
> -#define CRC_MODE_FLEX		1
> -#define CRC_MODE_SMACK		2
> -#define CRC_MODE_FLEX_TEST	3
> -#define CRC_MODE_SMACK_TEST	4
> -
> -	refcount_t		refcnt;
> -	struct completion	dead;
> -};
> -
> -/*---------------------------------------------------------------------------*/
> -
> -static const unsigned short crc_flex_table[] = {
> -	0x0f87, 0x1e0e, 0x2c95, 0x3d1c, 0x49a3, 0x582a, 0x6ab1, 0x7b38,
> -	0x83cf, 0x9246, 0xa0dd, 0xb154, 0xc5eb, 0xd462, 0xe6f9, 0xf770,
> -	0x1f06, 0x0e8f, 0x3c14, 0x2d9d, 0x5922, 0x48ab, 0x7a30, 0x6bb9,
> -	0x934e, 0x82c7, 0xb05c, 0xa1d5, 0xd56a, 0xc4e3, 0xf678, 0xe7f1,
> -	0x2e85, 0x3f0c, 0x0d97, 0x1c1e, 0x68a1, 0x7928, 0x4bb3, 0x5a3a,
> -	0xa2cd, 0xb344, 0x81df, 0x9056, 0xe4e9, 0xf560, 0xc7fb, 0xd672,
> -	0x3e04, 0x2f8d, 0x1d16, 0x0c9f, 0x7820, 0x69a9, 0x5b32, 0x4abb,
> -	0xb24c, 0xa3c5, 0x915e, 0x80d7, 0xf468, 0xe5e1, 0xd77a, 0xc6f3,
> -	0x4d83, 0x5c0a, 0x6e91, 0x7f18, 0x0ba7, 0x1a2e, 0x28b5, 0x393c,
> -	0xc1cb, 0xd042, 0xe2d9, 0xf350, 0x87ef, 0x9666, 0xa4fd, 0xb574,
> -	0x5d02, 0x4c8b, 0x7e10, 0x6f99, 0x1b26, 0x0aaf, 0x3834, 0x29bd,
> -	0xd14a, 0xc0c3, 0xf258, 0xe3d1, 0x976e, 0x86e7, 0xb47c, 0xa5f5,
> -	0x6c81, 0x7d08, 0x4f93, 0x5e1a, 0x2aa5, 0x3b2c, 0x09b7, 0x183e,
> -	0xe0c9, 0xf140, 0xc3db, 0xd252, 0xa6ed, 0xb764, 0x85ff, 0x9476,
> -	0x7c00, 0x6d89, 0x5f12, 0x4e9b, 0x3a24, 0x2bad, 0x1936, 0x08bf,
> -	0xf048, 0xe1c1, 0xd35a, 0xc2d3, 0xb66c, 0xa7e5, 0x957e, 0x84f7,
> -	0x8b8f, 0x9a06, 0xa89d, 0xb914, 0xcdab, 0xdc22, 0xeeb9, 0xff30,
> -	0x07c7, 0x164e, 0x24d5, 0x355c, 0x41e3, 0x506a, 0x62f1, 0x7378,
> -	0x9b0e, 0x8a87, 0xb81c, 0xa995, 0xdd2a, 0xcca3, 0xfe38, 0xefb1,
> -	0x1746, 0x06cf, 0x3454, 0x25dd, 0x5162, 0x40eb, 0x7270, 0x63f9,
> -	0xaa8d, 0xbb04, 0x899f, 0x9816, 0xeca9, 0xfd20, 0xcfbb, 0xde32,
> -	0x26c5, 0x374c, 0x05d7, 0x145e, 0x60e1, 0x7168, 0x43f3, 0x527a,
> -	0xba0c, 0xab85, 0x991e, 0x8897, 0xfc28, 0xeda1, 0xdf3a, 0xceb3,
> -	0x3644, 0x27cd, 0x1556, 0x04df, 0x7060, 0x61e9, 0x5372, 0x42fb,
> -	0xc98b, 0xd802, 0xea99, 0xfb10, 0x8faf, 0x9e26, 0xacbd, 0xbd34,
> -	0x45c3, 0x544a, 0x66d1, 0x7758, 0x03e7, 0x126e, 0x20f5, 0x317c,
> -	0xd90a, 0xc883, 0xfa18, 0xeb91, 0x9f2e, 0x8ea7, 0xbc3c, 0xadb5,
> -	0x5542, 0x44cb, 0x7650, 0x67d9, 0x1366, 0x02ef, 0x3074, 0x21fd,
> -	0xe889, 0xf900, 0xcb9b, 0xda12, 0xaead, 0xbf24, 0x8dbf, 0x9c36,
> -	0x64c1, 0x7548, 0x47d3, 0x565a, 0x22e5, 0x336c, 0x01f7, 0x107e,
> -	0xf808, 0xe981, 0xdb1a, 0xca93, 0xbe2c, 0xafa5, 0x9d3e, 0x8cb7,
> -	0x7440, 0x65c9, 0x5752, 0x46db, 0x3264, 0x23ed, 0x1176, 0x00ff
> -};
> -
> -static unsigned short calc_crc_flex(unsigned char *cp, int size)
> -{
> -	unsigned short crc = 0xffff;
> -
> -	while (size--)
> -		crc = (crc << 8) ^ crc_flex_table[((crc >> 8) ^ *cp++) & 0xff];
> -
> -	return crc;
> -}
> -
> -static int check_crc_flex(unsigned char *cp, int size)
> -{
> -	unsigned short crc = 0xffff;
> -
> -	if (size < 3)
> -		return -1;
> -
> -	while (size--)
> -		crc = (crc << 8) ^ crc_flex_table[((crc >> 8) ^ *cp++) & 0xff];
> -
> -	if ((crc & 0xffff) != 0x7070)
> -		return -1;
> -
> -	return 0;
> -}
> -
> -static int check_crc_16(unsigned char *cp, int size)
> -{
> -	unsigned short crc = 0x0000;
> -
> -	if (size < 3)
> -		return -1;
> -
> -	crc = crc16(0, cp, size);
> -
> -	if (crc != 0x0000)
> -		return -1;
> -
> -	return 0;
> -}
> -
> -/*
> - * Standard encapsulation
> - */
> -
> -static int kiss_esc(unsigned char *s, unsigned char *d, int len)
> -{
> -	unsigned char *ptr = d;
> -	unsigned char c;
> -
> -	/*
> -	 * Send an initial END character to flush out any data that may have
> -	 * accumulated in the receiver due to line noise.
> -	 */
> -
> -	*ptr++ = END;
> -
> -	while (len-- > 0) {
> -		switch (c = *s++) {
> -		case END:
> -			*ptr++ = ESC;
> -			*ptr++ = ESC_END;
> -			break;
> -		case ESC:
> -			*ptr++ = ESC;
> -			*ptr++ = ESC_ESC;
> -			break;
> -		default:
> -			*ptr++ = c;
> -			break;
> -		}
> -	}
> -
> -	*ptr++ = END;
> -
> -	return ptr - d;
> -}
> -
> -/*
> - * MW:
> - * OK its ugly, but tell me a better solution without copying the
> - * packet to a temporary buffer :-)
> - */
> -static int kiss_esc_crc(unsigned char *s, unsigned char *d, unsigned short crc,
> -	int len)
> -{
> -	unsigned char *ptr = d;
> -	unsigned char c=0;
> -
> -	*ptr++ = END;
> -	while (len > 0) {
> -		if (len > 2)
> -			c = *s++;
> -		else if (len > 1)
> -			c = crc >> 8;
> -		else
> -			c = crc & 0xff;
> -
> -		len--;
> -
> -		switch (c) {
> -		case END:
> -			*ptr++ = ESC;
> -			*ptr++ = ESC_END;
> -			break;
> -		case ESC:
> -			*ptr++ = ESC;
> -			*ptr++ = ESC_ESC;
> -			break;
> -		default:
> -			*ptr++ = c;
> -			break;
> -		}
> -	}
> -	*ptr++ = END;
> -
> -	return ptr - d;
> -}
> -
> -/* Send one completely decapsulated AX.25 packet to the AX.25 layer. */
> -static void ax_bump(struct mkiss *ax)
> -{
> -	struct sk_buff *skb;
> -	int count;
> -
> -	spin_lock_bh(&ax->buflock);
> -	if (ax->rbuff[0] > 0x0f) {
> -		if (ax->rbuff[0] & 0x80) {
> -			if (check_crc_16(ax->rbuff, ax->rcount) < 0) {
> -				ax->dev->stats.rx_errors++;
> -				spin_unlock_bh(&ax->buflock);
> -
> -				return;
> -			}
> -			if (ax->crcmode != CRC_MODE_SMACK && ax->crcauto) {
> -				printk(KERN_INFO
> -				       "mkiss: %s: Switching to crc-smack\n",
> -				       ax->dev->name);
> -				ax->crcmode = CRC_MODE_SMACK;
> -			}
> -			ax->rcount -= 2;
> -			*ax->rbuff &= ~0x80;
> -		} else if (ax->rbuff[0] & 0x20)  {
> -			if (check_crc_flex(ax->rbuff, ax->rcount) < 0) {
> -				ax->dev->stats.rx_errors++;
> -				spin_unlock_bh(&ax->buflock);
> -				return;
> -			}
> -			if (ax->crcmode != CRC_MODE_FLEX && ax->crcauto) {
> -				printk(KERN_INFO
> -				       "mkiss: %s: Switching to crc-flexnet\n",
> -				       ax->dev->name);
> -				ax->crcmode = CRC_MODE_FLEX;
> -			}
> -			ax->rcount -= 2;
> -
> -			/*
> -			 * dl9sau bugfix: the trailling two bytes flexnet crc
> -			 * will not be passed to the kernel. thus we have to
> -			 * correct the kissparm signature, because it indicates
> -			 * a crc but there's none
> -			 */
> -			*ax->rbuff &= ~0x20;
> -		}
> -	}
> -
> -	count = ax->rcount;
> -
> -	if ((skb = dev_alloc_skb(count)) == NULL) {
> -		printk(KERN_ERR "mkiss: %s: memory squeeze, dropping packet.\n",
> -		       ax->dev->name);
> -		ax->dev->stats.rx_dropped++;
> -		spin_unlock_bh(&ax->buflock);
> -		return;
> -	}
> -
> -	skb_put_data(skb, ax->rbuff, count);
> -	skb->protocol = ax25_type_trans(skb, ax->dev);
> -	netif_rx(skb);
> -	ax->dev->stats.rx_packets++;
> -	ax->dev->stats.rx_bytes += count;
> -	spin_unlock_bh(&ax->buflock);
> -}
> -
> -static void kiss_unesc(struct mkiss *ax, unsigned char s)
> -{
> -	switch (s) {
> -	case END:
> -		/* drop keeptest bit = VSV */
> -		if (test_bit(AXF_KEEPTEST, &ax->flags))
> -			clear_bit(AXF_KEEPTEST, &ax->flags);
> -
> -		if (!test_and_clear_bit(AXF_ERROR, &ax->flags) && (ax->rcount > 2))
> -			ax_bump(ax);
> -
> -		clear_bit(AXF_ESCAPE, &ax->flags);
> -		ax->rcount = 0;
> -		return;
> -
> -	case ESC:
> -		set_bit(AXF_ESCAPE, &ax->flags);
> -		return;
> -	case ESC_ESC:
> -		if (test_and_clear_bit(AXF_ESCAPE, &ax->flags))
> -			s = ESC;
> -		break;
> -	case ESC_END:
> -		if (test_and_clear_bit(AXF_ESCAPE, &ax->flags))
> -			s = END;
> -		break;
> -	}
> -
> -	spin_lock_bh(&ax->buflock);
> -	if (!test_bit(AXF_ERROR, &ax->flags)) {
> -		if (ax->rcount < ax->buffsize) {
> -			ax->rbuff[ax->rcount++] = s;
> -			spin_unlock_bh(&ax->buflock);
> -			return;
> -		}
> -
> -		ax->dev->stats.rx_over_errors++;
> -		set_bit(AXF_ERROR, &ax->flags);
> -	}
> -	spin_unlock_bh(&ax->buflock);
> -}
> -
> -static int ax_set_mac_address(struct net_device *dev, void *addr)
> -{
> -	struct sockaddr_ax25 *sa = addr;
> -
> -	netif_tx_lock_bh(dev);
> -	netif_addr_lock(dev);
> -	__dev_addr_set(dev, &sa->sax25_call, AX25_ADDR_LEN);
> -	netif_addr_unlock(dev);
> -	netif_tx_unlock_bh(dev);
> -
> -	return 0;
> -}
> -
> -/*---------------------------------------------------------------------------*/
> -
> -static void ax_changedmtu(struct mkiss *ax)
> -{
> -	struct net_device *dev = ax->dev;
> -	unsigned char *xbuff, *rbuff, *oxbuff, *orbuff;
> -	int len;
> -
> -	len = dev->mtu * 2;
> -
> -	/*
> -	 * allow for arrival of larger UDP packets, even if we say not to
> -	 * also fixes a bug in which SunOS sends 512-byte packets even with
> -	 * an MSS of 128
> -	 */
> -	if (len < 576 * 2)
> -		len = 576 * 2;
> -
> -	xbuff = kmalloc(len + 4, GFP_ATOMIC);
> -	rbuff = kmalloc(len + 4, GFP_ATOMIC);
> -
> -	if (xbuff == NULL || rbuff == NULL)  {
> -		printk(KERN_ERR "mkiss: %s: unable to grow ax25 buffers, "
> -		       "MTU change cancelled.\n",
> -		       ax->dev->name);
> -		dev->mtu = ax->mtu;
> -		kfree(xbuff);
> -		kfree(rbuff);
> -		return;
> -	}
> -
> -	spin_lock_bh(&ax->buflock);
> -
> -	oxbuff    = ax->xbuff;
> -	ax->xbuff = xbuff;
> -	orbuff    = ax->rbuff;
> -	ax->rbuff = rbuff;
> -
> -	if (ax->xleft) {
> -		if (ax->xleft <= len) {
> -			memcpy(ax->xbuff, ax->xhead, ax->xleft);
> -		} else  {
> -			ax->xleft = 0;
> -			dev->stats.tx_dropped++;
> -		}
> -	}
> -
> -	ax->xhead = ax->xbuff;
> -
> -	if (ax->rcount) {
> -		if (ax->rcount <= len) {
> -			memcpy(ax->rbuff, orbuff, ax->rcount);
> -		} else  {
> -			ax->rcount = 0;
> -			dev->stats.rx_over_errors++;
> -			set_bit(AXF_ERROR, &ax->flags);
> -		}
> -	}
> -
> -	ax->mtu      = dev->mtu + 73;
> -	ax->buffsize = len;
> -
> -	spin_unlock_bh(&ax->buflock);
> -
> -	kfree(oxbuff);
> -	kfree(orbuff);
> -}
> -
> -/* Encapsulate one AX.25 packet and stuff into a TTY queue. */
> -static void ax_encaps(struct net_device *dev, unsigned char *icp, int len)
> -{
> -	struct mkiss *ax = netdev_priv(dev);
> -	unsigned char *p;
> -	int actual, count;
> -
> -	if (ax->mtu != ax->dev->mtu + 73)	/* Someone has been ifconfigging */
> -		ax_changedmtu(ax);
> -
> -	if (len > ax->mtu) {		/* Sigh, shouldn't occur BUT ... */
> -		printk(KERN_ERR "mkiss: %s: truncating oversized transmit packet!\n", ax->dev->name);
> -		dev->stats.tx_dropped++;
> -		netif_start_queue(dev);
> -		return;
> -	}
> -
> -	p = icp;
> -
> -	spin_lock_bh(&ax->buflock);
> -	if ((*p & 0x0f) != 0) {
> -		/* Configuration Command (kissparms(1).
> -		 * Protocol spec says: never append CRC.
> -		 * This fixes a very old bug in the linux
> -		 * kiss driver. -- dl9sau */
> -		switch (*p & 0xff) {
> -		case 0x85:
> -			/* command from userspace especially for us,
> -			 * not for delivery to the tnc */
> -			if (len > 1) {
> -				int cmd = (p[1] & 0xff);
> -				switch(cmd) {
> -				case 3:
> -				  ax->crcmode = CRC_MODE_SMACK;
> -				  break;
> -				case 2:
> -				  ax->crcmode = CRC_MODE_FLEX;
> -				  break;
> -				case 1:
> -				  ax->crcmode = CRC_MODE_NONE;
> -				  break;
> -				case 0:
> -				default:
> -				  ax->crcmode = CRC_MODE_SMACK_TEST;
> -				  cmd = 0;
> -				}
> -				ax->crcauto = (cmd ? 0 : 1);
> -				printk(KERN_INFO "mkiss: %s: crc mode set to %d\n",
> -				       ax->dev->name, cmd);
> -			}
> -			spin_unlock_bh(&ax->buflock);
> -			netif_start_queue(dev);
> -
> -			return;
> -		default:
> -			count = kiss_esc(p, ax->xbuff, len);
> -		}
> -	} else {
> -		unsigned short crc;
> -		switch (ax->crcmode) {
> -		case CRC_MODE_SMACK_TEST:
> -			ax->crcmode  = CRC_MODE_FLEX_TEST;
> -			printk(KERN_INFO "mkiss: %s: Trying crc-smack\n", ax->dev->name);
> -			fallthrough;
> -		case CRC_MODE_SMACK:
> -			*p |= 0x80;
> -			crc = swab16(crc16(0, p, len));
> -			count = kiss_esc_crc(p, ax->xbuff, crc, len+2);
> -			break;
> -		case CRC_MODE_FLEX_TEST:
> -			ax->crcmode = CRC_MODE_NONE;
> -			printk(KERN_INFO "mkiss: %s: Trying crc-flexnet\n", ax->dev->name);
> -			fallthrough;
> -		case CRC_MODE_FLEX:
> -			*p |= 0x20;
> -			crc = calc_crc_flex(p, len);
> -			count = kiss_esc_crc(p, ax->xbuff, crc, len+2);
> -			break;
> -
> -		default:
> -			count = kiss_esc(p, ax->xbuff, len);
> -		}
> -	}
> -	spin_unlock_bh(&ax->buflock);
> -
> -	set_bit(TTY_DO_WRITE_WAKEUP, &ax->tty->flags);
> -	actual = ax->tty->ops->write(ax->tty, ax->xbuff, count);
> -	dev->stats.tx_packets++;
> -	dev->stats.tx_bytes += actual;
> -
> -	netif_trans_update(ax->dev);
> -	ax->xleft = count - actual;
> -	ax->xhead = ax->xbuff + actual;
> -}
> -
> -/* Encapsulate an AX.25 packet and kick it into a TTY queue. */
> -static netdev_tx_t ax_xmit(struct sk_buff *skb, struct net_device *dev)
> -{
> -	struct mkiss *ax = netdev_priv(dev);
> -
> -	if (skb->protocol == htons(ETH_P_IP))
> -		return ax25_ip_xmit(skb);
> -
> -	if (!netif_running(dev))  {
> -		printk(KERN_ERR "mkiss: %s: xmit call when iface is down\n", dev->name);
> -		return NETDEV_TX_BUSY;
> -	}
> -
> -	if (netif_queue_stopped(dev)) {
> -		/*
> -		 * May be we must check transmitter timeout here ?
> -		 *      14 Oct 1994 Dmitry Gorodchanin.
> -		 */
> -		if (time_before(jiffies, dev_trans_start(dev) + 20 * HZ)) {
> -			/* 20 sec timeout not reached */
> -			return NETDEV_TX_BUSY;
> -		}
> -
> -		printk(KERN_ERR "mkiss: %s: transmit timed out, %s?\n", dev->name,
> -		       (tty_chars_in_buffer(ax->tty) || ax->xleft) ?
> -		       "bad line quality" : "driver error");
> -
> -		ax->xleft = 0;
> -		clear_bit(TTY_DO_WRITE_WAKEUP, &ax->tty->flags);
> -		netif_start_queue(dev);
> -	}
> -
> -	/* We were not busy, so we are now... :-) */
> -	netif_stop_queue(dev);
> -	ax_encaps(dev, skb->data, skb->len);
> -	kfree_skb(skb);
> -
> -	return NETDEV_TX_OK;
> -}
> -
> -static int ax_open_dev(struct net_device *dev)
> -{
> -	struct mkiss *ax = netdev_priv(dev);
> -
> -	if (ax->tty == NULL)
> -		return -ENODEV;
> -
> -	return 0;
> -}
> -
> -/* Open the low-level part of the AX25 channel. Easy! */
> -static int ax_open(struct net_device *dev)
> -{
> -	struct mkiss *ax = netdev_priv(dev);
> -	unsigned long len;
> -
> -	if (ax->tty == NULL)
> -		return -ENODEV;
> -
> -	/*
> -	 * Allocate the frame buffers:
> -	 *
> -	 * rbuff	Receive buffer.
> -	 * xbuff	Transmit buffer.
> -	 */
> -	len = dev->mtu * 2;
> -
> -	/*
> -	 * allow for arrival of larger UDP packets, even if we say not to
> -	 * also fixes a bug in which SunOS sends 512-byte packets even with
> -	 * an MSS of 128
> -	 */
> -	if (len < 576 * 2)
> -		len = 576 * 2;
> -
> -	if ((ax->rbuff = kmalloc(len + 4, GFP_KERNEL)) == NULL)
> -		goto norbuff;
> -
> -	if ((ax->xbuff = kmalloc(len + 4, GFP_KERNEL)) == NULL)
> -		goto noxbuff;
> -
> -	ax->mtu	     = dev->mtu + 73;
> -	ax->buffsize = len;
> -	ax->rcount   = 0;
> -	ax->xleft    = 0;
> -
> -	ax->flags   &= (1 << AXF_INUSE);      /* Clear ESCAPE & ERROR flags */
> -
> -	spin_lock_init(&ax->buflock);
> -
> -	return 0;
> -
> -noxbuff:
> -	kfree(ax->rbuff);
> -
> -norbuff:
> -	return -ENOMEM;
> -}
> -
> -
> -/* Close the low-level part of the AX25 channel. Easy! */
> -static int ax_close(struct net_device *dev)
> -{
> -	struct mkiss *ax = netdev_priv(dev);
> -
> -	if (ax->tty)
> -		clear_bit(TTY_DO_WRITE_WAKEUP, &ax->tty->flags);
> -
> -	netif_stop_queue(dev);
> -
> -	return 0;
> -}
> -
> -static const struct net_device_ops ax_netdev_ops = {
> -	.ndo_open            = ax_open_dev,
> -	.ndo_stop            = ax_close,
> -	.ndo_start_xmit	     = ax_xmit,
> -	.ndo_set_mac_address = ax_set_mac_address,
> -};
> -
> -static void ax_setup(struct net_device *dev)
> -{
> -	/* Finish setting up the DEVICE info. */
> -	dev->mtu             = AX_MTU;
> -	dev->hard_header_len = AX25_MAX_HEADER_LEN;
> -	dev->addr_len        = AX25_ADDR_LEN;
> -	dev->type            = ARPHRD_AX25;
> -	dev->tx_queue_len    = 10;
> -	dev->header_ops      = &ax25_header_ops;
> -	dev->netdev_ops	     = &ax_netdev_ops;
> -
> -
> -	memcpy(dev->broadcast, &ax25_bcast, AX25_ADDR_LEN);
> -	dev_addr_set(dev, (u8 *)&ax25_defaddr);
> -
> -	dev->flags      = IFF_BROADCAST | IFF_MULTICAST;
> -}
> -
> -/*
> - * We have a potential race on dereferencing tty->disc_data, because the tty
> - * layer provides no locking at all - thus one cpu could be running
> - * sixpack_receive_buf while another calls sixpack_close, which zeroes
> - * tty->disc_data and frees the memory that sixpack_receive_buf is using.  The
> - * best way to fix this is to use a rwlock in the tty struct, but for now we
> - * use a single global rwlock for all ttys in ppp line discipline.
> - */
> -static DEFINE_RWLOCK(disc_data_lock);
> -
> -static struct mkiss *mkiss_get(struct tty_struct *tty)
> -{
> -	struct mkiss *ax;
> -
> -	read_lock(&disc_data_lock);
> -	ax = tty->disc_data;
> -	if (ax)
> -		refcount_inc(&ax->refcnt);
> -	read_unlock(&disc_data_lock);
> -
> -	return ax;
> -}
> -
> -static void mkiss_put(struct mkiss *ax)
> -{
> -	if (refcount_dec_and_test(&ax->refcnt))
> -		complete(&ax->dead);
> -}
> -
> -static int crc_force = 0;	/* Can be overridden with insmod */
> -
> -static int mkiss_open(struct tty_struct *tty)
> -{
> -	struct net_device *dev;
> -	struct mkiss *ax;
> -	int err;
> -
> -	if (!capable(CAP_NET_ADMIN))
> -		return -EPERM;
> -	if (tty->ops->write == NULL)
> -		return -EOPNOTSUPP;
> -
> -	dev = alloc_netdev(sizeof(struct mkiss), "ax%d", NET_NAME_UNKNOWN,
> -			   ax_setup);
> -	if (!dev) {
> -		err = -ENOMEM;
> -		goto out;
> -	}
> -
> -	ax = netdev_priv(dev);
> -	ax->dev = dev;
> -
> -	spin_lock_init(&ax->buflock);
> -	refcount_set(&ax->refcnt, 1);
> -	init_completion(&ax->dead);
> -
> -	ax->tty = tty;
> -	tty->disc_data = ax;
> -	tty->receive_room = 65535;
> -
> -	tty_driver_flush_buffer(tty);
> -
> -	/* Restore default settings */
> -	dev->type = ARPHRD_AX25;
> -
> -	/* Perform the low-level AX25 initialization. */
> -	err = ax_open(ax->dev);
> -	if (err)
> -		goto out_free_netdev;
> -
> -	err = register_netdev(dev);
> -	if (err)
> -		goto out_free_buffers;
> -
> -	/* after register_netdev() - because else printk smashes the kernel */
> -	switch (crc_force) {
> -	case 3:
> -		ax->crcmode  = CRC_MODE_SMACK;
> -		printk(KERN_INFO "mkiss: %s: crc mode smack forced.\n",
> -		       ax->dev->name);
> -		break;
> -	case 2:
> -		ax->crcmode  = CRC_MODE_FLEX;
> -		printk(KERN_INFO "mkiss: %s: crc mode flexnet forced.\n",
> -		       ax->dev->name);
> -		break;
> -	case 1:
> -		ax->crcmode  = CRC_MODE_NONE;
> -		printk(KERN_INFO "mkiss: %s: crc mode disabled.\n",
> -		       ax->dev->name);
> -		break;
> -	case 0:
> -	default:
> -		crc_force = 0;
> -		printk(KERN_INFO "mkiss: %s: crc mode is auto.\n",
> -		       ax->dev->name);
> -		ax->crcmode  = CRC_MODE_SMACK_TEST;
> -	}
> -	ax->crcauto = (crc_force ? 0 : 1);
> -
> -	netif_start_queue(dev);
> -
> -	/* Done.  We have linked the TTY line to a channel. */
> -	return 0;
> -
> -out_free_buffers:
> -	kfree(ax->rbuff);
> -	kfree(ax->xbuff);
> -
> -out_free_netdev:
> -	free_netdev(dev);
> -
> -out:
> -	return err;
> -}
> -
> -static void mkiss_close(struct tty_struct *tty)
> -{
> -	struct mkiss *ax;
> -
> -	write_lock_irq(&disc_data_lock);
> -	ax = tty->disc_data;
> -	tty->disc_data = NULL;
> -	write_unlock_irq(&disc_data_lock);
> -
> -	if (!ax)
> -		return;
> -
> -	/*
> -	 * We have now ensured that nobody can start using ap from now on, but
> -	 * we have to wait for all existing users to finish.
> -	 */
> -	if (!refcount_dec_and_test(&ax->refcnt))
> -		wait_for_completion(&ax->dead);
> -	/*
> -	 * Halt the transmit queue so that a new transmit cannot scribble
> -	 * on our buffers
> -	 */
> -	netif_stop_queue(ax->dev);
> -
> -	unregister_netdev(ax->dev);
> -
> -	/* Free all AX25 frame buffers after unreg. */
> -	kfree(ax->rbuff);
> -	kfree(ax->xbuff);
> -
> -	ax->tty = NULL;
> -
> -	free_netdev(ax->dev);
> -}
> -
> -/* Perform I/O control on an active ax25 channel. */
> -static int mkiss_ioctl(struct tty_struct *tty, unsigned int cmd,
> -		unsigned long arg)
> -{
> -	struct mkiss *ax = mkiss_get(tty);
> -	struct net_device *dev;
> -	unsigned int tmp, err;
> -
> -	/* First make sure we're connected. */
> -	if (ax == NULL)
> -		return -ENXIO;
> -	dev = ax->dev;
> -
> -	switch (cmd) {
> -	case SIOCGIFNAME:
> -		err = copy_to_user((void __user *) arg, ax->dev->name,
> -		                   strlen(ax->dev->name) + 1) ? -EFAULT : 0;
> -		break;
> -
> -	case SIOCGIFENCAP:
> -		err = put_user(4, (int __user *) arg);
> -		break;
> -
> -	case SIOCSIFENCAP:
> -		if (get_user(tmp, (int __user *) arg)) {
> -			err = -EFAULT;
> -			break;
> -		}
> -
> -		ax->mode = tmp;
> -		dev->addr_len        = AX25_ADDR_LEN;
> -		dev->hard_header_len = AX25_KISS_HEADER_LEN +
> -		                       AX25_MAX_HEADER_LEN + 3;
> -		dev->type            = ARPHRD_AX25;
> -
> -		err = 0;
> -		break;
> -
> -	case SIOCSIFHWADDR: {
> -		char addr[AX25_ADDR_LEN];
> -
> -		if (copy_from_user(&addr,
> -		                   (void __user *) arg, AX25_ADDR_LEN)) {
> -			err = -EFAULT;
> -			break;
> -		}
> -
> -		netif_tx_lock_bh(dev);
> -		__dev_addr_set(dev, addr, AX25_ADDR_LEN);
> -		netif_tx_unlock_bh(dev);
> -
> -		err = 0;
> -		break;
> -	}
> -	default:
> -		err = -ENOIOCTLCMD;
> -	}
> -
> -	mkiss_put(ax);
> -
> -	return err;
> -}
> -
> -/*
> - * Handle the 'receiver data ready' interrupt.
> - * This function is called by the 'tty_io' module in the kernel when
> - * a block of data has been received, which can now be decapsulated
> - * and sent on to the AX.25 layer for further processing.
> - */
> -static void mkiss_receive_buf(struct tty_struct *tty, const u8 *cp,
> -			      const u8 *fp, size_t count)
> -{
> -	struct mkiss *ax = mkiss_get(tty);
> -
> -	if (!ax)
> -		return;
> -
> -	/*
> -	 * Argh! mtu change time! - costs us the packet part received
> -	 * at the change
> -	 */
> -	if (ax->mtu != ax->dev->mtu + 73)
> -		ax_changedmtu(ax);
> -
> -	/* Read the characters out of the buffer */
> -	while (count--) {
> -		if (fp != NULL && *fp++) {
> -			if (!test_and_set_bit(AXF_ERROR, &ax->flags))
> -				ax->dev->stats.rx_errors++;
> -			cp++;
> -			continue;
> -		}
> -
> -		kiss_unesc(ax, *cp++);
> -	}
> -
> -	mkiss_put(ax);
> -	tty_unthrottle(tty);
> -}
> -
> -/*
> - * Called by the driver when there's room for more data.  If we have
> - * more packets to send, we send them here.
> - */
> -static void mkiss_write_wakeup(struct tty_struct *tty)
> -{
> -	struct mkiss *ax = mkiss_get(tty);
> -	int actual;
> -
> -	if (!ax)
> -		return;
> -
> -	if (ax->xleft <= 0)  {
> -		/* Now serial buffer is almost free & we can start
> -		 * transmission of another packet
> -		 */
> -		clear_bit(TTY_DO_WRITE_WAKEUP, &tty->flags);
> -
> -		netif_wake_queue(ax->dev);
> -		goto out;
> -	}
> -
> -	actual = tty->ops->write(tty, ax->xhead, ax->xleft);
> -	ax->xleft -= actual;
> -	ax->xhead += actual;
> -
> -out:
> -	mkiss_put(ax);
> -}
> -
> -static struct tty_ldisc_ops ax_ldisc = {
> -	.owner		= THIS_MODULE,
> -	.num		= N_AX25,
> -	.name		= "mkiss",
> -	.open		= mkiss_open,
> -	.close		= mkiss_close,
> -	.ioctl		= mkiss_ioctl,
> -	.receive_buf	= mkiss_receive_buf,
> -	.write_wakeup	= mkiss_write_wakeup
> -};
> -
> -static const char banner[] __initconst = KERN_INFO \
> -	"mkiss: AX.25 Multikiss, Hans Albas PE1AYX\n";
> -static const char msg_regfail[] __initconst = KERN_ERR \
> -	"mkiss: can't register line discipline (err = %d)\n";
> -
> -static int __init mkiss_init_driver(void)
> -{
> -	int status;
> -
> -	printk(banner);
> -
> -	status = tty_register_ldisc(&ax_ldisc);
> -	if (status != 0)
> -		printk(msg_regfail, status);
> -
> -	return status;
> -}
> -
> -static void __exit mkiss_exit_driver(void)
> -{
> -	tty_unregister_ldisc(&ax_ldisc);
> -}
> -
> -MODULE_AUTHOR("Ralf Baechle DL5RB <ralf@linux-mips.org>");
> -MODULE_DESCRIPTION("KISS driver for AX.25 over TTYs");
> -module_param(crc_force, int, 0);
> -MODULE_PARM_DESC(crc_force, "crc [0 = auto | 1 = none | 2 = flexnet | 3 = smack]");
> -MODULE_LICENSE("GPL");
> -MODULE_ALIAS_LDISC(N_AX25);
> -
> -module_init(mkiss_init_driver);
> -module_exit(mkiss_exit_driver);
> diff --git a/drivers/net/hamradio/scc.c b/drivers/net/hamradio/scc.c
> deleted file mode 100644
> index 8569db4a7140..000000000000
> --- a/drivers/net/hamradio/scc.c
> +++ /dev/null
> @@ -1,2179 +0,0 @@
> -#define RCS_ID "$Id: scc.c,v 1.75 1998/11/04 15:15:01 jreuter Exp jreuter $"
> -
> -#define VERSION "3.0"
> -
> -/*
> - * Please use z8530drv-utils-3.0 with this version.
> - *            ------------------
> - *
> - * You can find a subset of the documentation in
> - * Documentation/networking/device_drivers/hamradio/z8530drv.rst.
> - */
> -
> -/*
> -   ********************************************************************
> -   *   SCC.C - Linux driver for Z8530 based HDLC cards for AX.25      *
> -   ********************************************************************
> -
> -
> -   ********************************************************************
> -
> -	Copyright (c) 1993, 2000 Joerg Reuter DL1BKE
> -
> -	portions (c) 1993 Guido ten Dolle PE1NNZ
> -
> -   ********************************************************************
> -
> -   The driver and the programs in the archive are UNDER CONSTRUCTION.
> -   The code is likely to fail, and so your kernel could --- even
> -   a whole network.
> -
> -   This driver is intended for Amateur Radio use. If you are running it
> -   for commercial purposes, please drop me a note. I am nosy...
> -
> -   ...BUT:
> -
> -   ! You  m u s t  recognize the appropriate legislations of your country !
> -   ! before you connect a radio to the SCC board and start to transmit or !
> -   ! receive. The GPL allows you to use the  d r i v e r,  NOT the RADIO! !
> -
> -   For non-Amateur-Radio use please note that you might need a special
> -   allowance/licence from the designer of the SCC Board and/or the
> -   MODEM.
> -
> -   This program is free software; you can redistribute it and/or modify
> -   it under the terms of the (modified) GNU General Public License
> -   delivered with the Linux kernel source.
> -
> -   This program is distributed in the hope that it will be useful,
> -   but WITHOUT ANY WARRANTY; without even the implied warranty of
> -   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> -   GNU General Public License for more details.
> -
> -   You should find a copy of the GNU General Public License in
> -   /usr/src/linux/COPYING;
> -
> -   ********************************************************************
> -
> -		
> -   Incomplete history of z8530drv:
> -   -------------------------------
> -
> -   1994-09-13	started to write the driver, rescued most of my own
> -		code (and Hans Alblas' memory buffer pool concept) from
> -		an earlier project "sccdrv" which was initiated by
> -		Guido ten Dolle. Not much of the old driver survived,
> -		though. The first version I put my hands on was sccdrv1.3
> -		from August 1993. The memory buffer pool concept
> -		appeared in an unauthorized sccdrv version (1.5) from
> -		August 1994.
> -
> -   1995-01-31	changed copyright notice to GPL without limitations.
> -
> -     .
> -     .	<SNIP>
> -     .
> -   		
> -   1996-10-05	New semester, new driver...
> -
> -   		  * KISS TNC emulator removed (TTY driver)
> -   		  * Source moved to drivers/net/
> -   		  * Includes Z8530 defines from drivers/net/z8530.h
> -   		  * Uses sk_buffer memory management
> -   		  * Reduced overhead of /proc/net/z8530drv output
> -   		  * Streamlined quite a lot things
> -   		  * Invents brand new bugs... ;-)
> -
> -   		  The move to version number 3.0 reflects theses changes.
> -   		  You can use 'kissbridge' if you need a KISS TNC emulator.
> -
> -   1996-12-13	Fixed for Linux networking changes. (G4KLX)
> -   1997-01-08	Fixed the remaining problems.
> -   1997-04-02	Hopefully fixed the problems with the new *_timer()
> -   		routines, added calibration code.
> -   1997-10-12	Made SCC_DELAY a CONFIG option, added CONFIG_SCC_TRXECHO
> -   1998-01-29	Small fix to avoid lock-up on initialization
> -   1998-09-29	Fixed the "grouping" bugs, tx_inhibit works again,
> -   		using dev->tx_queue_len now instead of MAXQUEUE now.
> -   1998-10-21	Postponed the spinlock changes, would need a lot of
> -   		testing I currently don't have the time to. Softdcd doesn't
> -   		work.
> -   1998-11-04	Softdcd does not work correctly in DPLL mode, in fact it
> -   		never did. The DPLL locks on noise, the SYNC unit sees
> -   		flags that aren't... Restarting the DPLL does not help
> -   		either, it resynchronizes too slow and the first received
> -   		frame gets lost.
> -   2000-02-13	Fixed for new network driver interface changes, still
> -   		does TX timeouts itself since it uses its own queue
> -   		scheme.
> -
> -   Thanks to all who contributed to this driver with ideas and bug
> -   reports!
> -
> -   NB -- if you find errors, change something, please let me know
> -      	 first before you distribute it... And please don't touch
> -   	 the version number. Just replace my callsign in
> -   	 "v3.0.dl1bke" with your own. Just to avoid confusion...
> -
> -   If you want to add your modification to the linux distribution
> -   please (!) contact me first.
> -
> -   New versions of the driver will be announced on the linux-hams
> -   mailing list on vger.kernel.org. To subscribe send an e-mail
> -   to majordomo@vger.kernel.org with the following line in
> -   the body of the mail:
> -
> -	   subscribe linux-hams
> -	
> -   The content of the "Subject" field will be ignored.
> -
> -   vy 73,
> -   Joerg Reuter	ampr-net: dl1bke@db0pra.ampr.org
> -		AX-25   : DL1BKE @ DB0ABH.#BAY.DEU.EU
> -		Internet: jreuter@yaina.de
> -		www     : http://yaina.de/jreuter
> -*/
> -
> -/* ----------------------------------------------------------------------- */
> -
> -#undef  SCC_LDELAY		/* slow it even a bit more down */
> -#undef  SCC_DONT_CHECK		/* don't look if the SCCs you specified are available */
> -
> -#define SCC_MAXCHIPS	4       /* number of max. supported chips */
> -#define SCC_BUFSIZE	384     /* must not exceed 4096 */
> -#undef	SCC_DEBUG
> -
> -#define SCC_DEFAULT_CLOCK	4915200
> -				/* default pclock if nothing is specified */
> -
> -/* ----------------------------------------------------------------------- */
> -
> -#include <linux/compat.h>
> -#include <linux/module.h>
> -#include <linux/errno.h>
> -#include <linux/signal.h>
> -#include <linux/timer.h>
> -#include <linux/interrupt.h>
> -#include <linux/ioport.h>
> -#include <linux/string.h>
> -#include <linux/in.h>
> -#include <linux/fcntl.h>
> -#include <linux/ptrace.h>
> -#include <linux/delay.h>
> -#include <linux/skbuff.h>
> -#include <linux/netdevice.h>
> -#include <linux/rtnetlink.h>
> -#include <linux/if_ether.h>
> -#include <linux/if_arp.h>
> -#include <linux/socket.h>
> -#include <linux/init.h>
> -#include <linux/scc.h>
> -#include <linux/ctype.h>
> -#include <linux/kernel.h>
> -#include <linux/proc_fs.h>
> -#include <linux/seq_file.h>
> -#include <linux/bitops.h>
> -
> -#include <net/net_namespace.h>
> -#include <net/ax25.h>
> -
> -#include <asm/irq.h>
> -#include <asm/io.h>
> -#include <linux/uaccess.h>
> -
> -#include "z8530.h"
> -
> -static const char banner[] __initconst = KERN_INFO \
> -	"AX.25: Z8530 SCC driver version "VERSION".dl1bke\n";
> -
> -static void t_dwait(struct timer_list *t);
> -static void t_txdelay(struct timer_list *t);
> -static void t_tail(struct timer_list *t);
> -static void t_busy(struct timer_list *);
> -static void t_maxkeyup(struct timer_list *);
> -static void t_idle(struct timer_list *t);
> -static void scc_tx_done(struct scc_channel *);
> -static void scc_start_tx_timer(struct scc_channel *,
> -			       void (*)(struct timer_list *), unsigned long);
> -static void scc_start_maxkeyup(struct scc_channel *);
> -static void scc_start_defer(struct scc_channel *);
> -
> -static void z8530_init(void);
> -
> -static void init_channel(struct scc_channel *scc);
> -static void scc_key_trx (struct scc_channel *scc, char tx);
> -static void scc_init_timer(struct scc_channel *scc);
> -
> -static int scc_net_alloc(const char *name, struct scc_channel *scc);
> -static void scc_net_setup(struct net_device *dev);
> -static int scc_net_open(struct net_device *dev);
> -static int scc_net_close(struct net_device *dev);
> -static void scc_net_rx(struct scc_channel *scc, struct sk_buff *skb);
> -static netdev_tx_t scc_net_tx(struct sk_buff *skb,
> -			      struct net_device *dev);
> -static int scc_net_siocdevprivate(struct net_device *dev, struct ifreq *ifr,
> -				  void __user *data, int cmd);
> -static int scc_net_set_mac_address(struct net_device *dev, void *addr);
> -static struct net_device_stats * scc_net_get_stats(struct net_device *dev);
> -
> -static unsigned char SCC_DriverName[] = "scc";
> -
> -static struct irqflags { unsigned char used : 1; } Ivec[NR_IRQS];
> -	
> -static struct scc_channel SCC_Info[2 * SCC_MAXCHIPS];	/* information per channel */
> -
> -static struct scc_ctrl {
> -	io_port chan_A;
> -	io_port chan_B;
> -	int irq;
> -} SCC_ctrl[SCC_MAXCHIPS+1];
> -
> -static unsigned char Driver_Initialized;
> -static int Nchips;
> -static io_port Vector_Latch;
> -
> -
> -/* ******************************************************************** */
> -/* *			Port Access Functions			      * */
> -/* ******************************************************************** */
> -
> -/* These provide interrupt save 2-step access to the Z8530 registers */
> -
> -static DEFINE_SPINLOCK(iolock);	/* Guards paired accesses */
> -
> -static inline unsigned char InReg(io_port port, unsigned char reg)
> -{
> -	unsigned long flags;
> -	unsigned char r;
> -
> -	spin_lock_irqsave(&iolock, flags);	
> -#ifdef SCC_LDELAY
> -	Outb(port, reg);
> -	udelay(SCC_LDELAY);
> -	r=Inb(port);
> -	udelay(SCC_LDELAY);
> -#else
> -	Outb(port, reg);
> -	r=Inb(port);
> -#endif
> -	spin_unlock_irqrestore(&iolock, flags);
> -	return r;
> -}
> -
> -static inline void OutReg(io_port port, unsigned char reg, unsigned char val)
> -{
> -	unsigned long flags;
> -
> -	spin_lock_irqsave(&iolock, flags);
> -#ifdef SCC_LDELAY
> -	Outb(port, reg); udelay(SCC_LDELAY);
> -	Outb(port, val); udelay(SCC_LDELAY);
> -#else
> -	Outb(port, reg);
> -	Outb(port, val);
> -#endif
> -	spin_unlock_irqrestore(&iolock, flags);
> -}
> -
> -static inline void wr(struct scc_channel *scc, unsigned char reg,
> -	unsigned char val)
> -{
> -	OutReg(scc->ctrl, reg, (scc->wreg[reg] = val));
> -}
> -
> -static inline void or(struct scc_channel *scc, unsigned char reg, unsigned char val)
> -{
> -	OutReg(scc->ctrl, reg, (scc->wreg[reg] |= val));
> -}
> -
> -static inline void cl(struct scc_channel *scc, unsigned char reg, unsigned char val)
> -{
> -	OutReg(scc->ctrl, reg, (scc->wreg[reg] &= ~val));
> -}
> -
> -/* ******************************************************************** */
> -/* *			Some useful macros			      * */
> -/* ******************************************************************** */
> -
> -static inline void scc_discard_buffers(struct scc_channel *scc)
> -{
> -	unsigned long flags;
> -	
> -	spin_lock_irqsave(&scc->lock, flags);	
> -	if (scc->tx_buff != NULL)
> -	{
> -		dev_kfree_skb_irq(scc->tx_buff);
> -		scc->tx_buff = NULL;
> -	}
> -	
> -	while (!skb_queue_empty(&scc->tx_queue))
> -		dev_kfree_skb_irq(skb_dequeue(&scc->tx_queue));
> -
> -	spin_unlock_irqrestore(&scc->lock, flags);
> -}
> -
> -
> -
> -/* ******************************************************************** */
> -/* *			Interrupt Service Routines		      * */
> -/* ******************************************************************** */
> -
> -
> -/* ----> subroutines for the interrupt handlers <---- */
> -
> -static inline void scc_notify(struct scc_channel *scc, int event)
> -{
> -	struct sk_buff *skb;
> -	char *bp;
> -	
> -        if (scc->kiss.fulldup != KISS_DUPLEX_OPTIMA)
> -		return;
> -
> -	skb = dev_alloc_skb(2);
> -	if (skb != NULL)
> -	{
> -		bp = skb_put(skb, 2);
> -		*bp++ = PARAM_HWEVENT;
> -		*bp++ = event;
> -		scc_net_rx(scc, skb);
> -	} else
> -		scc->stat.nospace++;
> -}
> -
> -static inline void flush_rx_FIFO(struct scc_channel *scc)
> -{
> -	int k;
> -	
> -	for (k=0; k<3; k++)
> -		Inb(scc->data);
> -		
> -	if(scc->rx_buff != NULL)		/* did we receive something? */
> -	{
> -		scc->stat.rxerrs++;  /* then count it as an error */
> -		dev_kfree_skb_irq(scc->rx_buff);
> -		scc->rx_buff = NULL;
> -	}
> -}
> -
> -static void start_hunt(struct scc_channel *scc)
> -{
> -	if ((scc->modem.clocksrc != CLK_EXTERNAL))
> -		OutReg(scc->ctrl,R14,SEARCH|scc->wreg[R14]); /* DPLL: enter search mode */
> -	or(scc,R3,ENT_HM|RxENABLE);  /* enable the receiver, hunt mode */
> -}
> -
> -/* ----> four different interrupt handlers for Tx, Rx, changing of	*/
> -/*       DCD/CTS and Rx/Tx errors					*/
> -
> -/* Transmitter interrupt handler */
> -static inline void scc_txint(struct scc_channel *scc)
> -{
> -	struct sk_buff *skb;
> -
> -	scc->stat.txints++;
> -	skb = scc->tx_buff;
> -	
> -	/* send first octet */
> -	
> -	if (skb == NULL)
> -	{
> -		skb = skb_dequeue(&scc->tx_queue);
> -		scc->tx_buff = skb;
> -		netif_wake_queue(scc->dev);
> -
> -		if (skb == NULL)
> -		{
> -			scc_tx_done(scc);
> -			Outb(scc->ctrl, RES_Tx_P);
> -			return;
> -		}
> -		
> -		if (skb->len == 0)		/* Paranoia... */
> -		{
> -			dev_kfree_skb_irq(skb);
> -			scc->tx_buff = NULL;
> -			scc_tx_done(scc);
> -			Outb(scc->ctrl, RES_Tx_P);
> -			return;
> -		}
> -
> -		scc->stat.tx_state = TXS_ACTIVE;
> -
> -		OutReg(scc->ctrl, R0, RES_Tx_CRC);
> -						/* reset CRC generator */
> -		or(scc,R10,ABUNDER);		/* re-install underrun protection */
> -		Outb(scc->data,*skb->data);	/* send byte */
> -		skb_pull(skb, 1);
> -
> -		if (!scc->enhanced)		/* reset EOM latch */
> -			Outb(scc->ctrl,RES_EOM_L);
> -		return;
> -	}
> -	
> -	/* End Of Frame... */
> -	
> -	if (skb->len == 0)
> -	{
> -		Outb(scc->ctrl, RES_Tx_P);	/* reset pending int */
> -		cl(scc, R10, ABUNDER);		/* send CRC */
> -		dev_kfree_skb_irq(skb);
> -		scc->tx_buff = NULL;
> -		scc->stat.tx_state = TXS_NEWFRAME; /* next frame... */
> -		return;
> -	}
> -	
> -	/* send octet */
> -	
> -	Outb(scc->data,*skb->data);		
> -	skb_pull(skb, 1);
> -}
> -
> -
> -/* External/Status interrupt handler */
> -static inline void scc_exint(struct scc_channel *scc)
> -{
> -	unsigned char status,changes,chg_and_stat;
> -
> -	scc->stat.exints++;
> -
> -	status = InReg(scc->ctrl,R0);
> -	changes = status ^ scc->status;
> -	chg_and_stat = changes & status;
> -	
> -	/* ABORT: generated whenever DCD drops while receiving */
> -
> -	if (chg_and_stat & BRK_ABRT)		/* Received an ABORT */
> -		flush_rx_FIFO(scc);
> -
> -	/* HUNT: software DCD; on = waiting for SYNC, off = receiving frame */
> -
> -	if ((changes & SYNC_HUNT) && scc->kiss.softdcd)
> -	{
> -		if (status & SYNC_HUNT)
> -		{
> -			scc->dcd = 0;
> -			flush_rx_FIFO(scc);
> -			if ((scc->modem.clocksrc != CLK_EXTERNAL))
> -				OutReg(scc->ctrl,R14,SEARCH|scc->wreg[R14]); /* DPLL: enter search mode */
> -		} else {
> -			scc->dcd = 1;
> -		}
> -
> -		scc_notify(scc, scc->dcd? HWEV_DCD_OFF:HWEV_DCD_ON);
> -	}
> -
> -	/* DCD: on = start to receive packet, off = ABORT condition */
> -	/* (a successfully received packet generates a special condition int) */
> -	
> -	if((changes & DCD) && !scc->kiss.softdcd) /* DCD input changed state */
> -	{
> -		if(status & DCD)                /* DCD is now ON */
> -		{
> -			start_hunt(scc);
> -			scc->dcd = 1;
> -		} else {                        /* DCD is now OFF */
> -			cl(scc,R3,ENT_HM|RxENABLE); /* disable the receiver */
> -			flush_rx_FIFO(scc);
> -			scc->dcd = 0;
> -		}
> -		
> -		scc_notify(scc, scc->dcd? HWEV_DCD_ON:HWEV_DCD_OFF);
> -	}
> -
> -#ifdef notdef
> -	/* CTS: use external TxDelay (what's that good for?!)
> -	 * Anyway: If we _could_ use it (BayCom USCC uses CTS for
> -	 * own purposes) we _should_ use the "autoenable" feature
> -	 * of the Z8530 and not this interrupt...
> -	 */
> -	
> -	if (chg_and_stat & CTS)			/* CTS is now ON */
> -	{
> -		if (scc->kiss.txdelay == 0)	/* zero TXDELAY = wait for CTS */
> -			scc_start_tx_timer(scc, t_txdelay, 0);
> -	}
> -#endif
> -	
> -	if (scc->stat.tx_state == TXS_ACTIVE && (status & TxEOM))
> -	{
> -		scc->stat.tx_under++;	  /* oops, an underrun! count 'em */
> -		Outb(scc->ctrl, RES_EXT_INT);	/* reset ext/status interrupts */
> -
> -		if (scc->tx_buff != NULL)
> -		{
> -			dev_kfree_skb_irq(scc->tx_buff);
> -			scc->tx_buff = NULL;
> -		}
> -		
> -		or(scc,R10,ABUNDER);
> -		scc_start_tx_timer(scc, t_txdelay, 0);	/* restart transmission */
> -	}
> -		
> -	scc->status = status;
> -	Outb(scc->ctrl,RES_EXT_INT);
> -}
> -
> -
> -/* Receiver interrupt handler */
> -static inline void scc_rxint(struct scc_channel *scc)
> -{
> -	struct sk_buff *skb;
> -
> -	scc->stat.rxints++;
> -
> -	if((scc->wreg[5] & RTS) && scc->kiss.fulldup == KISS_DUPLEX_HALF)
> -	{
> -		Inb(scc->data);		/* discard char */
> -		or(scc,R3,ENT_HM);	/* enter hunt mode for next flag */
> -		return;
> -	}
> -
> -	skb = scc->rx_buff;
> -	
> -	if (skb == NULL)
> -	{
> -		skb = dev_alloc_skb(scc->stat.bufsize);
> -		if (skb == NULL)
> -		{
> -			scc->dev_stat.rx_dropped++;
> -			scc->stat.nospace++;
> -			Inb(scc->data);
> -			or(scc, R3, ENT_HM);
> -			return;
> -		}
> -		
> -		scc->rx_buff = skb;
> -		skb_put_u8(skb, 0);	/* KISS data */
> -	}
> -	
> -	if (skb->len >= scc->stat.bufsize)
> -	{
> -#ifdef notdef
> -		printk(KERN_DEBUG "z8530drv: oops, scc_rxint() received huge frame...\n");
> -#endif
> -		dev_kfree_skb_irq(skb);
> -		scc->rx_buff = NULL;
> -		Inb(scc->data);
> -		or(scc, R3, ENT_HM);
> -		return;
> -	}
> -
> -	skb_put_u8(skb, Inb(scc->data));
> -}
> -
> -
> -/* Receive Special Condition interrupt handler */
> -static inline void scc_spint(struct scc_channel *scc)
> -{
> -	unsigned char status;
> -	struct sk_buff *skb;
> -
> -	scc->stat.spints++;
> -
> -	status = InReg(scc->ctrl,R1);		/* read receiver status */
> -	
> -	Inb(scc->data);				/* throw away Rx byte */
> -	skb = scc->rx_buff;
> -
> -	if(status & Rx_OVR)			/* receiver overrun */
> -	{
> -		scc->stat.rx_over++;             /* count them */
> -		or(scc,R3,ENT_HM);               /* enter hunt mode for next flag */
> -		
> -		if (skb != NULL)
> -			dev_kfree_skb_irq(skb);
> -		scc->rx_buff = skb = NULL;
> -	}
> -
> -	if(status & END_FR && skb != NULL)	/* end of frame */
> -	{
> -		/* CRC okay, frame ends on 8 bit boundary and received something ? */
> -		
> -		if (!(status & CRC_ERR) && (status & 0xe) == RES8 && skb->len > 0)
> -		{
> -			/* ignore last received byte (first of the CRC bytes) */
> -			skb_trim(skb, skb->len-1);
> -			scc_net_rx(scc, skb);
> -			scc->rx_buff = NULL;
> -			scc->stat.rxframes++;
> -		} else {				/* a bad frame */
> -			dev_kfree_skb_irq(skb);
> -			scc->rx_buff = NULL;
> -			scc->stat.rxerrs++;
> -		}
> -	}
> -
> -	Outb(scc->ctrl,ERR_RES);
> -}
> -
> -
> -/* ----> interrupt service routine for the Z8530 <---- */
> -
> -static void scc_isr_dispatch(struct scc_channel *scc, int vector)
> -{
> -	spin_lock(&scc->lock);
> -	switch (vector & VECTOR_MASK)
> -	{
> -		case TXINT: scc_txint(scc); break;
> -		case EXINT: scc_exint(scc); break;
> -		case RXINT: scc_rxint(scc); break;
> -		case SPINT: scc_spint(scc); break;
> -	}
> -	spin_unlock(&scc->lock);
> -}
> -
> -/* If the card has a latch for the interrupt vector (like the PA0HZP card)
> -   use it to get the number of the chip that generated the int.
> -   If not: poll all defined chips.
> - */
> -
> -#define SCC_IRQTIMEOUT 30000
> -
> -static irqreturn_t scc_isr(int irq, void *dev_id)
> -{
> -	int chip_irq = (long) dev_id;
> -	unsigned char vector;	
> -	struct scc_channel *scc;
> -	struct scc_ctrl *ctrl;
> -	int k;
> -	
> -	if (Vector_Latch)
> -	{
> -	    	for(k=0; k < SCC_IRQTIMEOUT; k++)
> -    		{
> -			Outb(Vector_Latch, 0);      /* Generate INTACK */
> -
> -			/* Read the vector */
> -			if((vector=Inb(Vector_Latch)) >= 16 * Nchips) break;
> -			if (vector & 0x01) break;
> -        	
> -		        scc=&SCC_Info[vector >> 3 ^ 0x01];
> -			if (!scc->dev) break;
> -
> -			scc_isr_dispatch(scc, vector);
> -
> -			OutReg(scc->ctrl,R0,RES_H_IUS);              /* Reset Highest IUS */
> -		}
> -
> -		if (k == SCC_IRQTIMEOUT)
> -			printk(KERN_WARNING "z8530drv: endless loop in scc_isr()?\n");
> -
> -		return IRQ_HANDLED;
> -	}
> -
> -	/* Find the SCC generating the interrupt by polling all attached SCCs
> -	 * reading RR3A (the interrupt pending register)
> -	 */
> -
> -	ctrl = SCC_ctrl;
> -	while (ctrl->chan_A)
> -	{
> -		if (ctrl->irq != chip_irq)
> -		{
> -			ctrl++;
> -			continue;
> -		}
> -
> -		scc = NULL;
> -		for (k = 0; InReg(ctrl->chan_A,R3) && k < SCC_IRQTIMEOUT; k++)
> -		{
> -			vector=InReg(ctrl->chan_B,R2);	/* Read the vector */
> -			if (vector & 0x01) break;
> -
> -			scc = &SCC_Info[vector >> 3 ^ 0x01];
> -		        if (!scc->dev) break;
> -
> -			scc_isr_dispatch(scc, vector);
> -		}
> -
> -		if (k == SCC_IRQTIMEOUT)
> -		{
> -			printk(KERN_WARNING "z8530drv: endless loop in scc_isr()?!\n");
> -			break;
> -		}
> -
> -		/* This looks weird and it is. At least the BayCom USCC doesn't
> -		 * use the Interrupt Daisy Chain, thus we'll have to start
> -		 * all over again to be sure not to miss an interrupt from
> -		 * (any of) the other chip(s)...
> -		 * Honestly, the situation *is* braindamaged...
> -		 */
> -
> -		if (scc != NULL)
> -		{
> -			OutReg(scc->ctrl,R0,RES_H_IUS);
> -			ctrl = SCC_ctrl;
> -		} else
> -			ctrl++;
> -	}
> -	return IRQ_HANDLED;
> -}
> -
> -
> -
> -/* ******************************************************************** */
> -/* *			Init Channel					*/
> -/* ******************************************************************** */
> -
> -
> -/* ----> set SCC channel speed <---- */
> -
> -static inline void set_brg(struct scc_channel *scc, unsigned int tc)
> -{
> -	cl(scc,R14,BRENABL);		/* disable baudrate generator */
> -	wr(scc,R12,tc & 255);		/* brg rate LOW */
> -	wr(scc,R13,tc >> 8);   		/* brg rate HIGH */
> -	or(scc,R14,BRENABL);		/* enable baudrate generator */
> -}
> -
> -static inline void set_speed(struct scc_channel *scc)
> -{
> -	unsigned long flags;
> -	spin_lock_irqsave(&scc->lock, flags);
> -
> -	if (scc->modem.speed > 0)	/* paranoia... */
> -		set_brg(scc, (unsigned) (scc->clock / (scc->modem.speed * 64)) - 2);
> -		
> -	spin_unlock_irqrestore(&scc->lock, flags);
> -}
> -
> -
> -/* ----> initialize a SCC channel <---- */
> -
> -static inline void init_brg(struct scc_channel *scc)
> -{
> -	wr(scc, R14, BRSRC);				/* BRG source = PCLK */
> -	OutReg(scc->ctrl, R14, SSBR|scc->wreg[R14]);	/* DPLL source = BRG */
> -	OutReg(scc->ctrl, R14, SNRZI|scc->wreg[R14]);	/* DPLL NRZI mode */
> -}
> -
> -/*
> - * Initialization according to the Z8530 manual (SGS-Thomson's version):
> - *
> - * 1. Modes and constants
> - *
> - * WR9	11000000	chip reset
> - * WR4	XXXXXXXX	Tx/Rx control, async or sync mode
> - * WR1	0XX00X00	select W/REQ (optional)
> - * WR2	XXXXXXXX	program interrupt vector
> - * WR3	XXXXXXX0	select Rx control
> - * WR5	XXXX0XXX	select Tx control
> - * WR6	XXXXXXXX	sync character
> - * WR7	XXXXXXXX	sync character
> - * WR9	000X0XXX	select interrupt control
> - * WR10	XXXXXXXX	miscellaneous control (optional)
> - * WR11	XXXXXXXX	clock control
> - * WR12	XXXXXXXX	time constant lower byte (optional)
> - * WR13	XXXXXXXX	time constant upper byte (optional)
> - * WR14	XXXXXXX0	miscellaneous control
> - * WR14	XXXSSSSS	commands (optional)
> - *
> - * 2. Enables
> - *
> - * WR14	000SSSS1	baud rate enable
> - * WR3	SSSSSSS1	Rx enable
> - * WR5	SSSS1SSS	Tx enable
> - * WR0	10000000	reset Tx CRG (optional)
> - * WR1	XSS00S00	DMA enable (optional)
> - *
> - * 3. Interrupt status
> - *
> - * WR15	XXXXXXXX	enable external/status
> - * WR0	00010000	reset external status
> - * WR0	00010000	reset external status twice
> - * WR1	SSSXXSXX	enable Rx, Tx and Ext/status
> - * WR9	000SXSSS	enable master interrupt enable
> - *
> - * 1 = set to one, 0 = reset to zero
> - * X = user defined, S = same as previous init
> - *
> - *
> - * Note that the implementation differs in some points from above scheme.
> - *
> - */
> -
> -static void init_channel(struct scc_channel *scc)
> -{
> -	timer_delete(&scc->tx_t);
> -	timer_delete(&scc->tx_wdog);
> -
> -	disable_irq(scc->irq);
> -
> -	wr(scc,R4,X1CLK|SDLC);		/* *1 clock, SDLC mode */
> -	wr(scc,R1,0);			/* no W/REQ operation */
> -	wr(scc,R3,Rx8|RxCRC_ENAB);	/* RX 8 bits/char, CRC, disabled */	
> -	wr(scc,R5,Tx8|DTR|TxCRC_ENAB);	/* TX 8 bits/char, disabled, DTR */
> -	wr(scc,R6,0);			/* SDLC address zero (not used) */
> -	wr(scc,R7,FLAG);		/* SDLC flag value */
> -	wr(scc,R9,VIS);			/* vector includes status */
> -	wr(scc,R10,(scc->modem.nrz? NRZ : NRZI)|CRCPS|ABUNDER); /* abort on underrun, preset CRC generator, NRZ(I) */
> -	wr(scc,R14, 0);
> -
> -
> -/* set clock sources:
> -
> -   CLK_DPLL: normal halfduplex operation
> -
> -		RxClk: use DPLL
> -		TxClk: use DPLL
> -		TRxC mode DPLL output
> -		
> -   CLK_EXTERNAL: external clocking (G3RUH or DF9IC modem)
> -
> -  	        BayCom: 		others:
> -  	
> -  	        TxClk = pin RTxC	TxClk = pin TRxC
> -  	        RxClk = pin TRxC 	RxClk = pin RTxC
> -  	
> -
> -   CLK_DIVIDER:
> -   		RxClk = use DPLL
> -   		TxClk = pin RTxC
> -   		
> -   		BayCom:			others:
> -   		pin TRxC = DPLL		pin TRxC = BRG
> -   		(RxClk * 1)		(RxClk * 32)
> -*/
> -
> -   		
> -	switch(scc->modem.clocksrc)
> -	{
> -		case CLK_DPLL:
> -			wr(scc, R11, RCDPLL|TCDPLL|TRxCOI|TRxCDP);
> -			init_brg(scc);
> -			break;
> -
> -		case CLK_DIVIDER:
> -			wr(scc, R11, ((scc->brand & BAYCOM)? TRxCDP : TRxCBR) | RCDPLL|TCRTxCP|TRxCOI);
> -			init_brg(scc);
> -			break;
> -
> -		case CLK_EXTERNAL:
> -			wr(scc, R11, (scc->brand & BAYCOM)? RCTRxCP|TCRTxCP : RCRTxCP|TCTRxCP);
> -			OutReg(scc->ctrl, R14, DISDPLL);
> -			break;
> -
> -	}
> -	
> -	set_speed(scc);			/* set baudrate */
> -	
> -	if(scc->enhanced)
> -	{
> -		or(scc,R15,SHDLCE|FIFOE);	/* enable FIFO, SDLC/HDLC Enhancements (From now R7 is R7') */
> -		wr(scc,R7,AUTOEOM);
> -	}
> -
> -	if(scc->kiss.softdcd || (InReg(scc->ctrl,R0) & DCD))
> -						/* DCD is now ON */
> -	{
> -		start_hunt(scc);
> -	}
> -	
> -	/* enable ABORT, DCD & SYNC/HUNT interrupts */
> -
> -	wr(scc,R15, BRKIE|TxUIE|(scc->kiss.softdcd? SYNCIE:DCDIE));
> -
> -	Outb(scc->ctrl,RES_EXT_INT);	/* reset ext/status interrupts */
> -	Outb(scc->ctrl,RES_EXT_INT);	/* must be done twice */
> -
> -	or(scc,R1,INT_ALL_Rx|TxINT_ENAB|EXT_INT_ENAB); /* enable interrupts */
> -	
> -	scc->status = InReg(scc->ctrl,R0);	/* read initial status */
> -	
> -	or(scc,R9,MIE);			/* master interrupt enable */
> -	
> -	scc_init_timer(scc);
> -			
> -	enable_irq(scc->irq);
> -}
> -
> -
> -
> -
> -/* ******************************************************************** */
> -/* *			SCC timer functions			      * */
> -/* ******************************************************************** */
> -
> -
> -/* ----> scc_key_trx sets the time constant for the baudrate
> -         generator and keys the transmitter		     <---- */
> -
> -static void scc_key_trx(struct scc_channel *scc, char tx)
> -{
> -	unsigned int time_const;
> -		
> -	if (scc->brand & PRIMUS)
> -		Outb(scc->ctrl + 4, scc->option | (tx? 0x80 : 0));
> -
> -	if (scc->modem.speed < 300)
> -		scc->modem.speed = 1200;
> -
> -	time_const = (unsigned) (scc->clock / (scc->modem.speed * (tx? 2:64))) - 2;
> -
> -	disable_irq(scc->irq);
> -
> -	if (tx)
> -	{
> -		or(scc, R1, TxINT_ENAB);	/* t_maxkeyup may have reset these */
> -		or(scc, R15, TxUIE);
> -	}
> -
> -	if (scc->modem.clocksrc == CLK_DPLL)
> -	{				/* force simplex operation */
> -		if (tx)
> -		{
> -#ifdef CONFIG_SCC_TRXECHO
> -			cl(scc, R3, RxENABLE|ENT_HM);	/* switch off receiver */
> -			cl(scc, R15, DCDIE|SYNCIE);	/* No DCD changes, please */
> -#endif
> -			set_brg(scc, time_const);	/* reprogram baudrate generator */
> -
> -			/* DPLL -> Rx clk, BRG -> Tx CLK, TRxC mode output, TRxC = BRG */
> -			wr(scc, R11, RCDPLL|TCBR|TRxCOI|TRxCBR);
> -			
> -			/* By popular demand: tx_inhibit */
> -			if (scc->kiss.tx_inhibit)
> -			{
> -				or(scc,R5, TxENAB);
> -				scc->wreg[R5] |= RTS;
> -			} else {
> -				or(scc,R5,RTS|TxENAB);	/* set the RTS line and enable TX */
> -			}
> -		} else {
> -			cl(scc,R5,RTS|TxENAB);
> -			
> -			set_brg(scc, time_const);	/* reprogram baudrate generator */
> -			
> -			/* DPLL -> Rx clk, DPLL -> Tx CLK, TRxC mode output, TRxC = DPLL */
> -			wr(scc, R11, RCDPLL|TCDPLL|TRxCOI|TRxCDP);
> -
> -#ifndef CONFIG_SCC_TRXECHO
> -			if (scc->kiss.softdcd)
> -#endif
> -			{
> -				or(scc,R15, scc->kiss.softdcd? SYNCIE:DCDIE);
> -				start_hunt(scc);
> -			}
> -		}
> -	} else {
> -		if (tx)
> -		{
> -#ifdef CONFIG_SCC_TRXECHO
> -			if (scc->kiss.fulldup == KISS_DUPLEX_HALF)
> -			{
> -				cl(scc, R3, RxENABLE);
> -				cl(scc, R15, DCDIE|SYNCIE);
> -			}
> -#endif
> -				
> -			if (scc->kiss.tx_inhibit)
> -			{
> -				or(scc,R5, TxENAB);
> -				scc->wreg[R5] |= RTS;
> -			} else {	
> -				or(scc,R5,RTS|TxENAB);	/* enable tx */
> -			}
> -		} else {
> -			cl(scc,R5,RTS|TxENAB);		/* disable tx */
> -
> -			if ((scc->kiss.fulldup == KISS_DUPLEX_HALF) &&
> -#ifndef CONFIG_SCC_TRXECHO
> -			    scc->kiss.softdcd)
> -#else
> -			    1)
> -#endif
> -			{
> -				or(scc, R15, scc->kiss.softdcd? SYNCIE:DCDIE);
> -				start_hunt(scc);
> -			}
> -		}
> -	}
> -
> -	enable_irq(scc->irq);
> -}
> -
> -
> -/* ----> SCC timer interrupt handler and friends. <---- */
> -
> -static void __scc_start_tx_timer(struct scc_channel *scc,
> -				 void (*handler)(struct timer_list *t),
> -				 unsigned long when)
> -{
> -	timer_delete(&scc->tx_t);
> -
> -	if (when == 0)
> -	{
> -		handler(&scc->tx_t);
> -	} else
> -	if (when != TIMER_OFF)
> -	{
> -		scc->tx_t.function = handler;
> -		scc->tx_t.expires = jiffies + (when*HZ)/100;
> -		add_timer(&scc->tx_t);
> -	}
> -}
> -
> -static void scc_start_tx_timer(struct scc_channel *scc,
> -			       void (*handler)(struct timer_list *t),
> -			       unsigned long when)
> -{
> -	unsigned long flags;
> -	
> -	spin_lock_irqsave(&scc->lock, flags);
> -	__scc_start_tx_timer(scc, handler, when);
> -	spin_unlock_irqrestore(&scc->lock, flags);
> -}
> -
> -static void scc_start_defer(struct scc_channel *scc)
> -{
> -	unsigned long flags;
> -	
> -	spin_lock_irqsave(&scc->lock, flags);
> -	timer_delete(&scc->tx_wdog);
> -	
> -	if (scc->kiss.maxdefer != 0 && scc->kiss.maxdefer != TIMER_OFF)
> -	{
> -		scc->tx_wdog.function = t_busy;
> -		scc->tx_wdog.expires = jiffies + HZ*scc->kiss.maxdefer;
> -		add_timer(&scc->tx_wdog);
> -	}
> -	spin_unlock_irqrestore(&scc->lock, flags);
> -}
> -
> -static void scc_start_maxkeyup(struct scc_channel *scc)
> -{
> -	unsigned long flags;
> -	
> -	spin_lock_irqsave(&scc->lock, flags);
> -	timer_delete(&scc->tx_wdog);
> -	
> -	if (scc->kiss.maxkeyup != 0 && scc->kiss.maxkeyup != TIMER_OFF)
> -	{
> -		scc->tx_wdog.function = t_maxkeyup;
> -		scc->tx_wdog.expires = jiffies + HZ*scc->kiss.maxkeyup;
> -		add_timer(&scc->tx_wdog);
> -	}
> -	spin_unlock_irqrestore(&scc->lock, flags);
> -}
> -
> -/*
> - * This is called from scc_txint() when there are no more frames to send.
> - * Not exactly a timer function, but it is a close friend of the family...
> - */
> -
> -static void scc_tx_done(struct scc_channel *scc)
> -{
> -	/*
> -	 * trx remains keyed in fulldup mode 2 until t_idle expires.
> -	 */
> -				
> -	switch (scc->kiss.fulldup)
> -	{
> -		case KISS_DUPLEX_LINK:
> -			scc->stat.tx_state = TXS_IDLE2;
> -			if (scc->kiss.idletime != TIMER_OFF)
> -				scc_start_tx_timer(scc, t_idle,
> -						   scc->kiss.idletime*100);
> -			break;
> -		case KISS_DUPLEX_OPTIMA:
> -			scc_notify(scc, HWEV_ALL_SENT);
> -			break;
> -		default:
> -			scc->stat.tx_state = TXS_BUSY;
> -			scc_start_tx_timer(scc, t_tail, scc->kiss.tailtime);
> -	}
> -
> -	netif_wake_queue(scc->dev);
> -}
> -
> -
> -static unsigned char Rand = 17;
> -
> -static inline int is_grouped(struct scc_channel *scc)
> -{
> -	int k;
> -	struct scc_channel *scc2;
> -	unsigned char grp1, grp2;
> -
> -	grp1 = scc->kiss.group;
> -	
> -	for (k = 0; k < (Nchips * 2); k++)
> -	{
> -		scc2 = &SCC_Info[k];
> -		grp2 = scc2->kiss.group;
> -		
> -		if (scc2 == scc || !(scc2->dev && grp2))
> -			continue;
> -		
> -		if ((grp1 & 0x3f) == (grp2 & 0x3f))
> -		{
> -			if ( (grp1 & TXGROUP) && (scc2->wreg[R5] & RTS) )
> -				return 1;
> -			
> -			if ( (grp1 & RXGROUP) && scc2->dcd )
> -				return 1;
> -		}
> -	}
> -	return 0;
> -}
> -
> -/* DWAIT and SLOTTIME expired
> - *
> - * fulldup == 0:  DCD is active or Rand > P-persistence: start t_busy timer
> - *                else key trx and start txdelay
> - * fulldup == 1:  key trx and start txdelay
> - * fulldup == 2:  mintime expired, reset status or key trx and start txdelay
> - */
> -
> -static void t_dwait(struct timer_list *t)
> -{
> -	struct scc_channel *scc = timer_container_of(scc, t, tx_t);
> -	
> -	if (scc->stat.tx_state == TXS_WAIT)	/* maxkeyup or idle timeout */
> -	{
> -		if (skb_queue_empty(&scc->tx_queue)) {	/* nothing to send */
> -			scc->stat.tx_state = TXS_IDLE;
> -			netif_wake_queue(scc->dev);	/* t_maxkeyup locked it. */
> -			return;
> -		}
> -
> -		scc->stat.tx_state = TXS_BUSY;
> -	}
> -
> -	if (scc->kiss.fulldup == KISS_DUPLEX_HALF)
> -	{
> -		Rand = Rand * 17 + 31;
> -		
> -		if (scc->dcd || (scc->kiss.persist) < Rand || (scc->kiss.group && is_grouped(scc)) )
> -		{
> -			scc_start_defer(scc);
> -			scc_start_tx_timer(scc, t_dwait, scc->kiss.slottime);
> -			return ;
> -		}
> -	}
> -
> -	if ( !(scc->wreg[R5] & RTS) )
> -	{
> -		scc_key_trx(scc, TX_ON);
> -		scc_start_tx_timer(scc, t_txdelay, scc->kiss.txdelay);
> -	} else {
> -		scc_start_tx_timer(scc, t_txdelay, 0);
> -	}
> -}
> -
> -
> -/* TXDELAY expired
> - *
> - * kick transmission by a fake scc_txint(scc), start 'maxkeyup' watchdog.
> - */
> -
> -static void t_txdelay(struct timer_list *t)
> -{
> -	struct scc_channel *scc = timer_container_of(scc, t, tx_t);
> -
> -	scc_start_maxkeyup(scc);
> -
> -	if (scc->tx_buff == NULL)
> -	{
> -		disable_irq(scc->irq);
> -		scc_txint(scc);	
> -		enable_irq(scc->irq);
> -	}
> -}
> -	
> -
> -/* TAILTIME expired
> - *
> - * switch off transmitter. If we were stopped by Maxkeyup restart
> - * transmission after 'mintime' seconds
> - */
> -
> -static void t_tail(struct timer_list *t)
> -{
> -	struct scc_channel *scc = timer_container_of(scc, t, tx_t);
> -	unsigned long flags;
> -	
> -	spin_lock_irqsave(&scc->lock, flags);
> -	timer_delete(&scc->tx_wdog);
> -	scc_key_trx(scc, TX_OFF);
> -	spin_unlock_irqrestore(&scc->lock, flags);
> -
> -	if (scc->stat.tx_state == TXS_TIMEOUT)		/* we had a timeout? */
> -	{
> -		scc->stat.tx_state = TXS_WAIT;
> -		scc_start_tx_timer(scc, t_dwait, scc->kiss.mintime*100);
> -		return;
> -	}
> -
> -	scc->stat.tx_state = TXS_IDLE;
> -	netif_wake_queue(scc->dev);
> -}
> -
> -
> -/* BUSY timeout
> - *
> - * throw away send buffers if DCD remains active too long.
> - */
> -
> -static void t_busy(struct timer_list *t)
> -{
> -	struct scc_channel *scc = timer_container_of(scc, t, tx_wdog);
> -
> -	timer_delete(&scc->tx_t);
> -	netif_stop_queue(scc->dev);	/* don't pile on the wabbit! */
> -
> -	scc_discard_buffers(scc);
> -	scc->stat.txerrs++;
> -	scc->stat.tx_state = TXS_IDLE;
> -
> -	netif_wake_queue(scc->dev);	
> -}
> -
> -/* MAXKEYUP timeout
> - *
> - * this is our watchdog.
> - */
> -
> -static void t_maxkeyup(struct timer_list *t)
> -{
> -	struct scc_channel *scc = timer_container_of(scc, t, tx_wdog);
> -	unsigned long flags;
> -
> -	spin_lock_irqsave(&scc->lock, flags);
> -	/*
> -	 * let things settle down before we start to
> -	 * accept new data.
> -	 */
> -
> -	netif_stop_queue(scc->dev);
> -	scc_discard_buffers(scc);
> -
> -	timer_delete(&scc->tx_t);
> -
> -	cl(scc, R1, TxINT_ENAB);	/* force an ABORT, but don't */
> -	cl(scc, R15, TxUIE);		/* count it. */
> -	OutReg(scc->ctrl, R0, RES_Tx_P);
> -
> -	spin_unlock_irqrestore(&scc->lock, flags);
> -
> -	scc->stat.txerrs++;
> -	scc->stat.tx_state = TXS_TIMEOUT;
> -	scc_start_tx_timer(scc, t_tail, scc->kiss.tailtime);
> -}
> -
> -/* IDLE timeout
> - *
> - * in fulldup mode 2 it keys down the transmitter after 'idle' seconds
> - * of inactivity. We will not restart transmission before 'mintime'
> - * expires.
> - */
> -
> -static void t_idle(struct timer_list *t)
> -{
> -	struct scc_channel *scc = timer_container_of(scc, t, tx_t);
> -	
> -	timer_delete(&scc->tx_wdog);
> -
> -	scc_key_trx(scc, TX_OFF);
> -	if(scc->kiss.mintime)
> -		scc_start_tx_timer(scc, t_dwait, scc->kiss.mintime*100);
> -	scc->stat.tx_state = TXS_WAIT;
> -}
> -
> -static void scc_init_timer(struct scc_channel *scc)
> -{
> -	unsigned long flags;
> -
> -	spin_lock_irqsave(&scc->lock, flags);	
> -	scc->stat.tx_state = TXS_IDLE;
> -	spin_unlock_irqrestore(&scc->lock, flags);
> -}
> -
> -
> -/* ******************************************************************** */
> -/* *			Set/get L1 parameters			      * */
> -/* ******************************************************************** */
> -
> -
> -/*
> - * this will set the "hardware" parameters through KISS commands or ioctl()
> - */
> -
> -#define CAST(x) (unsigned long)(x)
> -
> -static unsigned int scc_set_param(struct scc_channel *scc, unsigned int cmd, unsigned int arg)
> -{
> -	switch (cmd)
> -	{
> -		case PARAM_TXDELAY:	scc->kiss.txdelay=arg;		break;
> -		case PARAM_PERSIST:	scc->kiss.persist=arg;		break;
> -		case PARAM_SLOTTIME:	scc->kiss.slottime=arg;		break;
> -		case PARAM_TXTAIL:	scc->kiss.tailtime=arg;		break;
> -		case PARAM_FULLDUP:	scc->kiss.fulldup=arg;		break;
> -		case PARAM_DTR:		break; /* does someone need this? */
> -		case PARAM_GROUP:	scc->kiss.group=arg;		break;
> -		case PARAM_IDLE:	scc->kiss.idletime=arg;		break;
> -		case PARAM_MIN:		scc->kiss.mintime=arg;		break;
> -		case PARAM_MAXKEY:	scc->kiss.maxkeyup=arg;		break;
> -		case PARAM_WAIT:	scc->kiss.waittime=arg;		break;
> -		case PARAM_MAXDEFER:	scc->kiss.maxdefer=arg;		break;
> -		case PARAM_TX:		scc->kiss.tx_inhibit=arg;	break;
> -
> -		case PARAM_SOFTDCD:	
> -			scc->kiss.softdcd=arg;
> -			if (arg)
> -			{
> -				or(scc, R15, SYNCIE);
> -				cl(scc, R15, DCDIE);
> -				start_hunt(scc);
> -			} else {
> -				or(scc, R15, DCDIE);
> -				cl(scc, R15, SYNCIE);
> -			}
> -			break;
> -				
> -		case PARAM_SPEED:
> -			if (arg < 256)
> -				scc->modem.speed=arg*100;
> -			else
> -				scc->modem.speed=arg;
> -
> -			if (scc->stat.tx_state == 0)	/* only switch baudrate on rx... ;-) */
> -				set_speed(scc);
> -			break;
> -			
> -		case PARAM_RTS:	
> -			if ( !(scc->wreg[R5] & RTS) )
> -			{
> -				if (arg != TX_OFF) {
> -					scc_key_trx(scc, TX_ON);
> -					scc_start_tx_timer(scc, t_txdelay, scc->kiss.txdelay);
> -				}
> -			} else {
> -				if (arg == TX_OFF)
> -				{
> -					scc->stat.tx_state = TXS_BUSY;
> -					scc_start_tx_timer(scc, t_tail, scc->kiss.tailtime);
> -				}
> -			}
> -			break;
> -			
> -		case PARAM_HWEVENT:
> -			scc_notify(scc, scc->dcd? HWEV_DCD_ON:HWEV_DCD_OFF);
> -			break;
> -
> -		default:		return -EINVAL;
> -	}
> -	
> -	return 0;
> -}
> -
> -
> -
> -static unsigned long scc_get_param(struct scc_channel *scc, unsigned int cmd)
> -{
> -	switch (cmd)
> -	{
> -		case PARAM_TXDELAY:	return CAST(scc->kiss.txdelay);
> -		case PARAM_PERSIST:	return CAST(scc->kiss.persist);
> -		case PARAM_SLOTTIME:	return CAST(scc->kiss.slottime);
> -		case PARAM_TXTAIL:	return CAST(scc->kiss.tailtime);
> -		case PARAM_FULLDUP:	return CAST(scc->kiss.fulldup);
> -		case PARAM_SOFTDCD:	return CAST(scc->kiss.softdcd);
> -		case PARAM_DTR:		return CAST((scc->wreg[R5] & DTR)? 1:0);
> -		case PARAM_RTS:		return CAST((scc->wreg[R5] & RTS)? 1:0);
> -		case PARAM_SPEED:	return CAST(scc->modem.speed);
> -		case PARAM_GROUP:	return CAST(scc->kiss.group);
> -		case PARAM_IDLE:	return CAST(scc->kiss.idletime);
> -		case PARAM_MIN:		return CAST(scc->kiss.mintime);
> -		case PARAM_MAXKEY:	return CAST(scc->kiss.maxkeyup);
> -		case PARAM_WAIT:	return CAST(scc->kiss.waittime);
> -		case PARAM_MAXDEFER:	return CAST(scc->kiss.maxdefer);
> -		case PARAM_TX:		return CAST(scc->kiss.tx_inhibit);
> -		default:		return NO_SUCH_PARAM;
> -	}
> -
> -}
> -
> -#undef CAST
> -
> -/* ******************************************************************* */
> -/* *			Send calibration pattern		     * */
> -/* ******************************************************************* */
> -
> -static void scc_stop_calibrate(struct timer_list *t)
> -{
> -	struct scc_channel *scc = timer_container_of(scc, t, tx_wdog);
> -	unsigned long flags;
> -	
> -	spin_lock_irqsave(&scc->lock, flags);
> -	timer_delete(&scc->tx_wdog);
> -	scc_key_trx(scc, TX_OFF);
> -	wr(scc, R6, 0);
> -	wr(scc, R7, FLAG);
> -	Outb(scc->ctrl,RES_EXT_INT);	/* reset ext/status interrupts */
> -	Outb(scc->ctrl,RES_EXT_INT);
> -
> -	netif_wake_queue(scc->dev);
> -	spin_unlock_irqrestore(&scc->lock, flags);
> -}
> -
> -
> -static void
> -scc_start_calibrate(struct scc_channel *scc, int duration, unsigned char pattern)
> -{
> -	unsigned long flags;
> -	
> -	spin_lock_irqsave(&scc->lock, flags);
> -	netif_stop_queue(scc->dev);
> -	scc_discard_buffers(scc);
> -
> -	timer_delete(&scc->tx_wdog);
> -
> -	scc->tx_wdog.function = scc_stop_calibrate;
> -	scc->tx_wdog.expires = jiffies + HZ*duration;
> -	add_timer(&scc->tx_wdog);
> -
> -	/* This doesn't seem to work. Why not? */	
> -	wr(scc, R6, 0);
> -	wr(scc, R7, pattern);
> -
> -	/*
> -	 * Don't know if this works.
> -	 * Damn, where is my Z8530 programming manual...?
> -	 */
> -
> -	Outb(scc->ctrl,RES_EXT_INT);	/* reset ext/status interrupts */
> -	Outb(scc->ctrl,RES_EXT_INT);
> -
> -	scc_key_trx(scc, TX_ON);
> -	spin_unlock_irqrestore(&scc->lock, flags);
> -}
> -
> -/* ******************************************************************* */
> -/* *		Init channel structures, special HW, etc...	     * */
> -/* ******************************************************************* */
> -
> -/*
> - * Reset the Z8530s and setup special hardware
> - */
> -
> -static void z8530_init(void)
> -{
> -	const unsigned int nr_irqs = irq_get_nr_irqs();
> -	struct scc_channel *scc;
> -	int chip, k;
> -	unsigned long flags;
> -	char *flag;
> -
> -
> -	printk(KERN_INFO "Init Z8530 driver: %u channels, IRQ", Nchips*2);
> -	
> -	flag=" ";
> -	for (k = 0; k < nr_irqs; k++)
> -		if (Ivec[k].used)
> -		{
> -			printk("%s%d", flag, k);
> -			flag=",";
> -		}
> -	printk("\n");
> -
> -
> -	/* reset and pre-init all chips in the system */
> -	for (chip = 0; chip < Nchips; chip++)
> -	{
> -		scc=&SCC_Info[2*chip];
> -		if (!scc->ctrl) continue;
> -
> -		/* Special SCC cards */
> -
> -		if(scc->brand & EAGLE)			/* this is an EAGLE card */
> -			Outb(scc->special,0x08);	/* enable interrupt on the board */
> -			
> -		if(scc->brand & (PC100 | PRIMUS))	/* this is a PC100/PRIMUS card */
> -			Outb(scc->special,scc->option);	/* set the MODEM mode (0x22) */
> -
> -			
> -		/* Reset and pre-init Z8530 */
> -
> -		spin_lock_irqsave(&scc->lock, flags);
> -				
> -		Outb(scc->ctrl, 0);
> -		OutReg(scc->ctrl,R9,FHWRES);		/* force hardware reset */
> -		udelay(100);				/* give it 'a bit' more time than required */
> -		wr(scc, R2, chip*16);			/* interrupt vector */
> -		wr(scc, R9, VIS);			/* vector includes status */
> -		spin_unlock_irqrestore(&scc->lock, flags);		
> -        }
> -
> -
> -	Driver_Initialized = 1;
> -}
> -
> -/*
> - * Allocate device structure, err, instance, and register driver
> - */
> -
> -static int scc_net_alloc(const char *name, struct scc_channel *scc)
> -{
> -	int err;
> -	struct net_device *dev;
> -
> -	dev = alloc_netdev(0, name, NET_NAME_UNKNOWN, scc_net_setup);
> -	if (!dev)
> -		return -ENOMEM;
> -
> -	dev->ml_priv = scc;
> -	scc->dev = dev;
> -	spin_lock_init(&scc->lock);
> -	timer_setup(&scc->tx_t, NULL, 0);
> -	timer_setup(&scc->tx_wdog, NULL, 0);
> -
> -	err = register_netdevice(dev);
> -	if (err) {
> -		printk(KERN_ERR "%s: can't register network device (%d)\n",
> -		       name, err);
> -		free_netdev(dev);
> -		scc->dev = NULL;
> -		return err;
> -	}
> -
> -	return 0;
> -}
> -
> -
> -
> -/* ******************************************************************** */
> -/* *			    Network driver methods		      * */
> -/* ******************************************************************** */
> -
> -static const struct net_device_ops scc_netdev_ops = {
> -	.ndo_open            = scc_net_open,
> -	.ndo_stop	     = scc_net_close,
> -	.ndo_start_xmit	     = scc_net_tx,
> -	.ndo_set_mac_address = scc_net_set_mac_address,
> -	.ndo_get_stats       = scc_net_get_stats,
> -	.ndo_siocdevprivate  = scc_net_siocdevprivate,
> -};
> -
> -/* ----> Initialize device <----- */
> -
> -static void scc_net_setup(struct net_device *dev)
> -{
> -	dev->tx_queue_len    = 16;	/* should be enough... */
> -
> -	dev->netdev_ops	     = &scc_netdev_ops;
> -	dev->header_ops      = &ax25_header_ops;
> -
> -	dev->flags      = 0;
> -
> -	dev->type = ARPHRD_AX25;
> -	dev->hard_header_len = AX25_MAX_HEADER_LEN + AX25_BPQ_HEADER_LEN;
> -	dev->mtu = AX25_DEF_PACLEN;
> -	dev->addr_len = AX25_ADDR_LEN;
> -
> -	memcpy(dev->broadcast, &ax25_bcast,  AX25_ADDR_LEN);
> -	dev_addr_set(dev, (u8 *)&ax25_defaddr);
> -}
> -
> -/* ----> open network device <---- */
> -
> -static int scc_net_open(struct net_device *dev)
> -{
> -	struct scc_channel *scc = (struct scc_channel *) dev->ml_priv;
> -
> -	if (!scc->init)
> -		return -EINVAL;
> -
> -	scc->tx_buff = NULL;
> -	skb_queue_head_init(&scc->tx_queue);
> -
> -	init_channel(scc);
> -
> -	netif_start_queue(dev);
> -	return 0;
> -}
> -
> -/* ----> close network device <---- */
> -
> -static int scc_net_close(struct net_device *dev)
> -{
> -	struct scc_channel *scc = (struct scc_channel *) dev->ml_priv;
> -	unsigned long flags;
> -
> -	netif_stop_queue(dev);
> -
> -	spin_lock_irqsave(&scc->lock, flags);	
> -	Outb(scc->ctrl,0);		/* Make sure pointer is written */
> -	wr(scc,R1,0);			/* disable interrupts */
> -	wr(scc,R3,0);
> -	spin_unlock_irqrestore(&scc->lock, flags);
> -
> -	timer_delete_sync(&scc->tx_t);
> -	timer_delete_sync(&scc->tx_wdog);
> -	
> -	scc_discard_buffers(scc);
> -
> -	return 0;
> -}
> -
> -/* ----> receive frame, called from scc_rxint() <---- */
> -
> -static void scc_net_rx(struct scc_channel *scc, struct sk_buff *skb)
> -{
> -	if (skb->len == 0) {
> -		dev_kfree_skb_irq(skb);
> -		return;
> -	}
> -		
> -	scc->dev_stat.rx_packets++;
> -	scc->dev_stat.rx_bytes += skb->len;
> -
> -	skb->protocol = ax25_type_trans(skb, scc->dev);
> -	
> -	netif_rx(skb);
> -}
> -
> -/* ----> transmit frame <---- */
> -
> -static netdev_tx_t scc_net_tx(struct sk_buff *skb, struct net_device *dev)
> -{
> -	struct scc_channel *scc = (struct scc_channel *) dev->ml_priv;
> -	unsigned long flags;
> -	char kisscmd;
> -
> -	if (skb->protocol == htons(ETH_P_IP))
> -		return ax25_ip_xmit(skb);
> -
> -	if (skb->len > scc->stat.bufsize || skb->len < 2) {
> -		scc->dev_stat.tx_dropped++;	/* bogus frame */
> -		dev_kfree_skb(skb);
> -		return NETDEV_TX_OK;
> -	}
> -	
> -	scc->dev_stat.tx_packets++;
> -	scc->dev_stat.tx_bytes += skb->len;
> -	scc->stat.txframes++;
> -	
> -	kisscmd = *skb->data & 0x1f;
> -	skb_pull(skb, 1);
> -
> -	if (kisscmd) {
> -		scc_set_param(scc, kisscmd, *skb->data);
> -		dev_kfree_skb(skb);
> -		return NETDEV_TX_OK;
> -	}
> -
> -	spin_lock_irqsave(&scc->lock, flags);
> -		
> -	if (skb_queue_len(&scc->tx_queue) > scc->dev->tx_queue_len) {
> -		struct sk_buff *skb_del;
> -		skb_del = skb_dequeue(&scc->tx_queue);
> -		dev_kfree_skb_irq(skb_del);
> -	}
> -	skb_queue_tail(&scc->tx_queue, skb);
> -	netif_trans_update(dev);
> -	
> -
> -	/*
> -	 * Start transmission if the trx state is idle or
> -	 * t_idle hasn't expired yet. Use dwait/persistence/slottime
> -	 * algorithm for normal halfduplex operation.
> -	 */
> -
> -	if(scc->stat.tx_state == TXS_IDLE || scc->stat.tx_state == TXS_IDLE2) {
> -		scc->stat.tx_state = TXS_BUSY;
> -		if (scc->kiss.fulldup == KISS_DUPLEX_HALF)
> -			__scc_start_tx_timer(scc, t_dwait, scc->kiss.waittime);
> -		else
> -			__scc_start_tx_timer(scc, t_dwait, 0);
> -	}
> -	spin_unlock_irqrestore(&scc->lock, flags);
> -	return NETDEV_TX_OK;
> -}
> -
> -/* ----> ioctl functions <---- */
> -
> -/*
> - * SIOCSCCCFG		- configure driver	arg: (struct scc_hw_config *) arg
> - * SIOCSCCINI		- initialize driver	arg: ---
> - * SIOCSCCCHANINI	- initialize channel	arg: (struct scc_modem *) arg
> - * SIOCSCCSMEM		- set memory		arg: (struct scc_mem_config *) arg
> - * SIOCSCCGKISS		- get level 1 parameter	arg: (struct scc_kiss_cmd *) arg
> - * SIOCSCCSKISS		- set level 1 parameter arg: (struct scc_kiss_cmd *) arg
> - * SIOCSCCGSTAT		- get driver status	arg: (struct scc_stat *) arg
> - * SIOCSCCCAL		- send calib. pattern	arg: (struct scc_calibrate *) arg
> - */
> -
> -static int scc_net_siocdevprivate(struct net_device *dev,
> -				  struct ifreq *ifr, void __user *arg, int cmd)
> -{
> -	struct scc_kiss_cmd kiss_cmd;
> -	struct scc_mem_config memcfg;
> -	struct scc_hw_config hwcfg;
> -	struct scc_calibrate cal;
> -	struct scc_channel *scc = (struct scc_channel *) dev->ml_priv;
> -	int chan;
> -	unsigned char device_name[IFNAMSIZ];
> -	
> -	if (!Driver_Initialized)
> -	{
> -		if (cmd == SIOCSCCCFG)
> -		{
> -			int found = 1;
> -
> -			if (!capable(CAP_SYS_RAWIO)) return -EPERM;
> -			if (in_compat_syscall())
> -				return -EOPNOTSUPP;
> -
> -			if (!arg) return -EFAULT;
> -
> -			if (Nchips >= SCC_MAXCHIPS)
> -				return -EINVAL;
> -
> -			if (copy_from_user(&hwcfg, arg, sizeof(hwcfg)))
> -				return -EFAULT;
> -
> -			if (hwcfg.irq == 2) hwcfg.irq = 9;
> -
> -			if (hwcfg.irq < 0 || hwcfg.irq >= irq_get_nr_irqs())
> -				return -EINVAL;
> -				
> -			if (!Ivec[hwcfg.irq].used && hwcfg.irq)
> -			{
> -				if (request_irq(hwcfg.irq, scc_isr,
> -						0, "AX.25 SCC",
> -						(void *)(long) hwcfg.irq))
> -					printk(KERN_WARNING "z8530drv: warning, cannot get IRQ %d\n", hwcfg.irq);
> -				else
> -					Ivec[hwcfg.irq].used = 1;
> -			}
> -
> -			if (hwcfg.vector_latch && !Vector_Latch) {
> -				if (!request_region(hwcfg.vector_latch, 1, "scc vector latch"))
> -					printk(KERN_WARNING "z8530drv: warning, cannot reserve vector latch port 0x%lx\n, disabled.", hwcfg.vector_latch);
> -				else
> -					Vector_Latch = hwcfg.vector_latch;
> -			}
> -
> -			if (hwcfg.clock == 0)
> -				hwcfg.clock = SCC_DEFAULT_CLOCK;
> -
> -#ifndef SCC_DONT_CHECK
> -
> -			if(request_region(hwcfg.ctrl_a, 1, "scc-probe"))
> -			{
> -				disable_irq(hwcfg.irq);
> -				Outb(hwcfg.ctrl_a, 0);
> -				OutReg(hwcfg.ctrl_a, R9, FHWRES);
> -				udelay(100);
> -				OutReg(hwcfg.ctrl_a,R13,0x55);		/* is this chip really there? */
> -				udelay(5);
> -
> -				if (InReg(hwcfg.ctrl_a,R13) != 0x55)
> -					found = 0;
> -				enable_irq(hwcfg.irq);
> -				release_region(hwcfg.ctrl_a, 1);
> -			}
> -			else
> -				found = 0;
> -#endif
> -
> -			if (found)
> -			{
> -				SCC_Info[2*Nchips  ].ctrl = hwcfg.ctrl_a;
> -				SCC_Info[2*Nchips  ].data = hwcfg.data_a;
> -				SCC_Info[2*Nchips  ].irq  = hwcfg.irq;
> -				SCC_Info[2*Nchips+1].ctrl = hwcfg.ctrl_b;
> -				SCC_Info[2*Nchips+1].data = hwcfg.data_b;
> -				SCC_Info[2*Nchips+1].irq  = hwcfg.irq;
> -			
> -				SCC_ctrl[Nchips].chan_A = hwcfg.ctrl_a;
> -				SCC_ctrl[Nchips].chan_B = hwcfg.ctrl_b;
> -				SCC_ctrl[Nchips].irq    = hwcfg.irq;
> -			}
> -
> -
> -			for (chan = 0; chan < 2; chan++)
> -			{
> -				sprintf(device_name, "%s%i", SCC_DriverName, 2*Nchips+chan);
> -
> -				SCC_Info[2*Nchips+chan].special = hwcfg.special;
> -				SCC_Info[2*Nchips+chan].clock = hwcfg.clock;
> -				SCC_Info[2*Nchips+chan].brand = hwcfg.brand;
> -				SCC_Info[2*Nchips+chan].option = hwcfg.option;
> -				SCC_Info[2*Nchips+chan].enhanced = hwcfg.escc;
> -
> -#ifdef SCC_DONT_CHECK
> -				printk(KERN_INFO "%s: data port = 0x%3.3x  control port = 0x%3.3x\n",
> -					device_name,
> -					SCC_Info[2*Nchips+chan].data,
> -					SCC_Info[2*Nchips+chan].ctrl);
> -
> -#else
> -				printk(KERN_INFO "%s: data port = 0x%3.3lx  control port = 0x%3.3lx -- %s\n",
> -					device_name,
> -					chan? hwcfg.data_b : hwcfg.data_a,
> -					chan? hwcfg.ctrl_b : hwcfg.ctrl_a,
> -					found? "found" : "missing");
> -#endif
> -
> -				if (found)
> -				{
> -					request_region(SCC_Info[2*Nchips+chan].ctrl, 1, "scc ctrl");
> -					request_region(SCC_Info[2*Nchips+chan].data, 1, "scc data");
> -					if (Nchips+chan != 0 &&
> -					    scc_net_alloc(device_name,
> -							  &SCC_Info[2*Nchips+chan]))
> -					    return -EINVAL;
> -				}
> -			}
> -			
> -			if (found) Nchips++;
> -			
> -			return 0;
> -		}
> -		
> -		if (cmd == SIOCSCCINI)
> -		{
> -			if (!capable(CAP_SYS_RAWIO))
> -				return -EPERM;
> -				
> -			if (Nchips == 0)
> -				return -EINVAL;
> -
> -			z8530_init();
> -			return 0;
> -		}
> -		
> -		return -EINVAL;	/* confuse the user */
> -	}
> -	
> -	if (!scc->init)
> -	{
> -		if (cmd == SIOCSCCCHANINI)
> -		{
> -			if (!capable(CAP_NET_ADMIN)) return -EPERM;
> -			if (!arg) return -EINVAL;
> -			
> -			scc->stat.bufsize   = SCC_BUFSIZE;
> -
> -			if (copy_from_user(&scc->modem, arg, sizeof(struct scc_modem)))
> -				return -EINVAL;
> -			
> -			/* default KISS Params */
> -		
> -			if (scc->modem.speed < 4800)
> -			{
> -				scc->kiss.txdelay = 36;		/* 360 ms */
> -				scc->kiss.persist = 42;		/* 25% persistence */			/* was 25 */
> -				scc->kiss.slottime = 16;	/* 160 ms */
> -				scc->kiss.tailtime = 4;		/* minimal reasonable value */
> -				scc->kiss.fulldup = 0;		/* CSMA */
> -				scc->kiss.waittime = 50;	/* 500 ms */
> -				scc->kiss.maxkeyup = 10;	/* 10 s */
> -				scc->kiss.mintime = 3;		/* 3 s */
> -				scc->kiss.idletime = 30;	/* 30 s */
> -				scc->kiss.maxdefer = 120;	/* 2 min */
> -				scc->kiss.softdcd = 0;		/* hardware dcd */
> -			} else {
> -				scc->kiss.txdelay = 10;		/* 100 ms */
> -				scc->kiss.persist = 64;		/* 25% persistence */			/* was 25 */
> -				scc->kiss.slottime = 8;		/* 160 ms */
> -				scc->kiss.tailtime = 1;		/* minimal reasonable value */
> -				scc->kiss.fulldup = 0;		/* CSMA */
> -				scc->kiss.waittime = 50;	/* 500 ms */
> -				scc->kiss.maxkeyup = 7;		/* 7 s */
> -				scc->kiss.mintime = 3;		/* 3 s */
> -				scc->kiss.idletime = 30;	/* 30 s */
> -				scc->kiss.maxdefer = 120;	/* 2 min */
> -				scc->kiss.softdcd = 0;		/* hardware dcd */
> -			}
> -			
> -			scc->tx_buff = NULL;
> -			skb_queue_head_init(&scc->tx_queue);
> -			scc->init = 1;
> -			
> -			return 0;
> -		}
> -		
> -		return -EINVAL;
> -	}
> -	
> -	switch(cmd)
> -	{
> -		case SIOCSCCRESERVED:
> -			return -ENOIOCTLCMD;
> -
> -		case SIOCSCCSMEM:
> -			if (!capable(CAP_SYS_RAWIO)) return -EPERM;
> -			if (!arg || copy_from_user(&memcfg, arg, sizeof(memcfg)))
> -				return -EINVAL;
> -			if (memcfg.bufsize < 16)
> -				return -EINVAL;
> -			scc->stat.bufsize   = memcfg.bufsize;
> -			return 0;
> -		
> -		case SIOCSCCGSTAT:
> -			if (!arg || copy_to_user(arg, &scc->stat, sizeof(scc->stat)))
> -				return -EINVAL;
> -			return 0;
> -		
> -		case SIOCSCCGKISS:
> -			if (!arg || copy_from_user(&kiss_cmd, arg, sizeof(kiss_cmd)))
> -				return -EINVAL;
> -			kiss_cmd.param = scc_get_param(scc, kiss_cmd.command);
> -			if (copy_to_user(arg, &kiss_cmd, sizeof(kiss_cmd)))
> -				return -EINVAL;
> -			return 0;
> -		
> -		case SIOCSCCSKISS:
> -			if (!capable(CAP_NET_ADMIN)) return -EPERM;
> -			if (!arg || copy_from_user(&kiss_cmd, arg, sizeof(kiss_cmd)))
> -				return -EINVAL;
> -			return scc_set_param(scc, kiss_cmd.command, kiss_cmd.param);
> -		
> -		case SIOCSCCCAL:
> -			if (!capable(CAP_SYS_RAWIO)) return -EPERM;
> -			if (!arg || copy_from_user(&cal, arg, sizeof(cal)) || cal.time == 0)
> -				return -EINVAL;
> -
> -			scc_start_calibrate(scc, cal.time, cal.pattern);
> -			return 0;
> -
> -		default:
> -			return -ENOIOCTLCMD;
> -		
> -	}
> -	
> -	return -EINVAL;
> -}
> -
> -/* ----> set interface callsign <---- */
> -
> -static int scc_net_set_mac_address(struct net_device *dev, void *addr)
> -{
> -	struct sockaddr *sa = (struct sockaddr *) addr;
> -	dev_addr_set(dev, sa->sa_data);
> -	return 0;
> -}
> -
> -/* ----> get statistics <---- */
> -
> -static struct net_device_stats *scc_net_get_stats(struct net_device *dev)
> -{
> -	struct scc_channel *scc = (struct scc_channel *) dev->ml_priv;
> -	
> -	scc->dev_stat.rx_errors = scc->stat.rxerrs + scc->stat.rx_over;
> -	scc->dev_stat.tx_errors = scc->stat.txerrs + scc->stat.tx_under;
> -	scc->dev_stat.rx_fifo_errors = scc->stat.rx_over;
> -	scc->dev_stat.tx_fifo_errors = scc->stat.tx_under;
> -
> -	return &scc->dev_stat;
> -}
> -
> -/* ******************************************************************** */
> -/* *		dump statistics to /proc/net/z8530drv		      * */
> -/* ******************************************************************** */
> -
> -#ifdef CONFIG_PROC_FS
> -
> -static inline struct scc_channel *scc_net_seq_idx(loff_t pos)
> -{
> -	int k;
> -
> -	for (k = 0; k < Nchips*2; ++k) {
> -		if (!SCC_Info[k].init)
> -			continue;
> -		if (pos-- == 0)
> -			return &SCC_Info[k];
> -	}
> -	return NULL;
> -}
> -
> -static void *scc_net_seq_start(struct seq_file *seq, loff_t *pos)
> -{
> -	return *pos ? scc_net_seq_idx(*pos - 1) : SEQ_START_TOKEN;
> -	
> -}
> -
> -static void *scc_net_seq_next(struct seq_file *seq, void *v, loff_t *pos)
> -{
> -	unsigned k;
> -	struct scc_channel *scc = v;
> -	++*pos;
> -	
> -	for (k = (v == SEQ_START_TOKEN) ? 0 : (scc - SCC_Info)+1;
> -	     k < Nchips*2; ++k) {
> -		if (SCC_Info[k].init)
> -			return &SCC_Info[k];
> -	}
> -	return NULL;
> -}
> -
> -static void scc_net_seq_stop(struct seq_file *seq, void *v)
> -{
> -}
> -
> -static int scc_net_seq_show(struct seq_file *seq, void *v)
> -{
> -	if (v == SEQ_START_TOKEN) {
> -		seq_puts(seq, "z8530drv-"VERSION"\n");
> -	} else if (!Driver_Initialized) {
> -		seq_puts(seq, "not initialized\n");
> -	} else if (!Nchips) {
> -		seq_puts(seq, "chips missing\n");
> -	} else {
> -		const struct scc_channel *scc = v;
> -		const struct scc_stat *stat = &scc->stat;
> -		const struct scc_kiss *kiss = &scc->kiss;
> -
> -
> -		/* dev	data ctrl irq clock brand enh vector special option
> -		 *	baud nrz clocksrc softdcd bufsize
> -		 *	rxints txints exints spints
> -		 *	rcvd rxerrs over / xmit txerrs under / nospace bufsize
> -		 *	txd pers slot tail ful wait min maxk idl defr txof grp
> -		 *	W ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ##
> -		 *	R ## ## XX ## ## ## ## ## XX ## ## ## ## ## ## ##
> -		 */
> -
> -		seq_printf(seq, "%s\t%3.3lx %3.3lx %d %lu %2.2x %d %3.3lx %3.3lx %d\n",
> -				scc->dev->name,
> -				scc->data, scc->ctrl, scc->irq, scc->clock, scc->brand,
> -				scc->enhanced, Vector_Latch, scc->special,
> -				scc->option);
> -		seq_printf(seq, "\t%lu %d %d %d %d\n",
> -				scc->modem.speed, scc->modem.nrz,
> -				scc->modem.clocksrc, kiss->softdcd,
> -				stat->bufsize);
> -		seq_printf(seq, "\t%lu %lu %lu %lu\n",
> -				stat->rxints, stat->txints, stat->exints, stat->spints);
> -		seq_printf(seq, "\t%lu %lu %d / %lu %lu %d / %d %d\n",
> -				stat->rxframes, stat->rxerrs, stat->rx_over,
> -				stat->txframes, stat->txerrs, stat->tx_under,
> -				stat->nospace,  stat->tx_state);
> -
> -#define K(x) kiss->x
> -		seq_printf(seq, "\t%d %d %d %d %d %d %d %d %d %d %d %d\n",
> -				K(txdelay), K(persist), K(slottime), K(tailtime),
> -				K(fulldup), K(waittime), K(mintime), K(maxkeyup),
> -				K(idletime), K(maxdefer), K(tx_inhibit), K(group));
> -#undef K
> -#ifdef SCC_DEBUG
> -		{
> -			int reg;
> -
> -		seq_printf(seq, "\tW ");
> -			for (reg = 0; reg < 16; reg++)
> -				seq_printf(seq, "%2.2x ", scc->wreg[reg]);
> -			seq_printf(seq, "\n");
> -			
> -		seq_printf(seq, "\tR %2.2x %2.2x XX ", InReg(scc->ctrl,R0), InReg(scc->ctrl,R1));
> -			for (reg = 3; reg < 8; reg++)
> -				seq_printf(seq, "%2.2x ", InReg(scc->ctrl, reg));
> -			seq_printf(seq, "XX ");
> -			for (reg = 9; reg < 16; reg++)
> -				seq_printf(seq, "%2.2x ", InReg(scc->ctrl, reg));
> -			seq_printf(seq, "\n");
> -		}
> -#endif
> -		seq_putc(seq, '\n');
> -	}
> -
> -        return 0;
> -}
> -
> -static const struct seq_operations scc_net_seq_ops = {
> -	.start  = scc_net_seq_start,
> -	.next   = scc_net_seq_next,
> -	.stop   = scc_net_seq_stop,
> -	.show   = scc_net_seq_show,
> -};
> -#endif /* CONFIG_PROC_FS */
> -
> -
> -/* ******************************************************************** */
> -/* * 			Init SCC driver 			      * */
> -/* ******************************************************************** */
> -
> -static int __init scc_init_driver (void)
> -{
> -	char devname[IFNAMSIZ];
> -	
> -	printk(banner);
> -	
> -	sprintf(devname,"%s0", SCC_DriverName);
> -	
> -	rtnl_lock();
> -	if (scc_net_alloc(devname, SCC_Info)) {
> -		rtnl_unlock();
> -		printk(KERN_ERR "z8530drv: cannot initialize module\n");
> -		return -EIO;
> -	}
> -	rtnl_unlock();
> -
> -	proc_create_seq("z8530drv", 0, init_net.proc_net, &scc_net_seq_ops);
> -
> -	return 0;
> -}
> -
> -static void __exit scc_cleanup_driver(void)
> -{
> -	const unsigned int nr_irqs = irq_get_nr_irqs();
> -	io_port ctrl;
> -	int k;
> -	struct scc_channel *scc;
> -	struct net_device *dev;
> -	
> -	if (Nchips == 0 && (dev = SCC_Info[0].dev))
> -	{
> -		unregister_netdev(dev);
> -		free_netdev(dev);
> -	}
> -
> -	/* Guard against chip prattle */
> -	local_irq_disable();
> -	
> -	for (k = 0; k < Nchips; k++)
> -		if ( (ctrl = SCC_ctrl[k].chan_A) )
> -		{
> -			Outb(ctrl, 0);
> -			OutReg(ctrl,R9,FHWRES);	/* force hardware reset */
> -			udelay(50);
> -		}
> -		
> -	/* To unload the port must be closed so no real IRQ pending */
> -	for (k = 0; k < nr_irqs ; k++)
> -		if (Ivec[k].used) free_irq(k, NULL);
> -		
> -	local_irq_enable();
> -		
> -	/* Now clean up */
> -	for (k = 0; k < Nchips*2; k++)
> -	{
> -		scc = &SCC_Info[k];
> -		if (scc->ctrl)
> -		{
> -			release_region(scc->ctrl, 1);
> -			release_region(scc->data, 1);
> -		}
> -		if (scc->dev)
> -		{
> -			unregister_netdev(scc->dev);
> -			free_netdev(scc->dev);
> -		}
> -	}
> -	
> -		
> -	if (Vector_Latch)
> -		release_region(Vector_Latch, 1);
> -
> -	remove_proc_entry("z8530drv", init_net.proc_net);
> -}
> -
> -MODULE_AUTHOR("Joerg Reuter <jreuter@yaina.de>");
> -MODULE_DESCRIPTION("AX.25 Device Driver for Z8530 based HDLC cards");
> -MODULE_LICENSE("GPL");
> -module_init(scc_init_driver);
> -module_exit(scc_cleanup_driver);
> diff --git a/drivers/net/hamradio/yam.c b/drivers/net/hamradio/yam.c
> deleted file mode 100644
> index 4106f0301ab4..000000000000
> --- a/drivers/net/hamradio/yam.c
> +++ /dev/null
> @@ -1,1191 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-or-later
> -/*****************************************************************************/
> -
> -/*
> - *    yam.c  -- YAM radio modem driver.
> - *
> - *      Copyright (C) 1998 Frederic Rible F1OAT (frible@teaser.fr)
> - *      Adapted from baycom.c driver written by Thomas Sailer (sailer@ife.ee.ethz.ch)
> - *
> - *  Please note that the GPL allows you to use the driver, NOT the radio.
> - *  In order to use the radio, you need a license from the communications
> - *  authority of your country.
> - *
> - *  History:
> - *   0.0 F1OAT 06.06.98  Begin of work with baycom.c source code V 0.3
> - *   0.1 F1OAT 07.06.98  Add timer polling routine for channel arbitration
> - *   0.2 F6FBB 08.06.98  Added delay after FPGA programming
> - *   0.3 F6FBB 29.07.98  Delayed PTT implementation for dupmode=2
> - *   0.4 F6FBB 30.07.98  Added TxTail, Slottime and Persistence
> - *   0.5 F6FBB 01.08.98  Shared IRQs, /proc/net and network statistics
> - *   0.6 F6FBB 25.08.98  Added 1200Bds format
> - *   0.7 F6FBB 12.09.98  Added to the kernel configuration
> - *   0.8 F6FBB 14.10.98  Fixed slottime/persistence timing bug
> - *       OK1ZIA 2.09.01  Fixed "kfree_skb on hard IRQ"
> - *                       using dev_kfree_skb_any(). (important in 2.4 kernel)
> - */
> -
> -/*****************************************************************************/
> -
> -#include <linux/module.h>
> -#include <linux/types.h>
> -#include <linux/net.h>
> -#include <linux/in.h>
> -#include <linux/if.h>
> -#include <linux/slab.h>
> -#include <linux/errno.h>
> -#include <linux/bitops.h>
> -#include <linux/random.h>
> -#include <asm/io.h>
> -#include <linux/interrupt.h>
> -#include <linux/ioport.h>
> -#include <linux/firmware.h>
> -#include <linux/platform_device.h>
> -
> -#include <linux/netdevice.h>
> -#include <linux/if_arp.h>
> -#include <linux/etherdevice.h>
> -#include <linux/skbuff.h>
> -#include <net/ax25.h>
> -
> -#include <linux/kernel.h>
> -#include <linux/proc_fs.h>
> -#include <linux/seq_file.h>
> -#include <net/net_namespace.h>
> -
> -#include <linux/uaccess.h>
> -#include <linux/init.h>
> -
> -#include <linux/yam.h>
> -
> -/* --------------------------------------------------------------------- */
> -
> -static const char yam_drvname[] = "yam";
> -static const char yam_drvinfo[] __initconst = KERN_INFO \
> -	"YAM driver version 0.8 by F1OAT/F6FBB\n";
> -
> -/* --------------------------------------------------------------------- */
> -
> -#define FIRMWARE_9600	"yam/9600.bin"
> -#define FIRMWARE_1200	"yam/1200.bin"
> -
> -#define YAM_9600	1
> -#define YAM_1200	2
> -
> -#define NR_PORTS	4
> -#define YAM_MAGIC	0xF10A7654
> -
> -/* Transmitter states */
> -
> -#define TX_OFF		0
> -#define TX_HEAD		1
> -#define TX_DATA		2
> -#define TX_CRC1		3
> -#define TX_CRC2		4
> -#define TX_TAIL		5
> -
> -#define YAM_MAX_FRAME	1024
> -
> -#define DEFAULT_BITRATE	9600			/* bps */
> -#define DEFAULT_HOLDD	10			/* sec */
> -#define DEFAULT_TXD	300			/* ms */
> -#define DEFAULT_TXTAIL	10			/* ms */
> -#define DEFAULT_SLOT	100			/* ms */
> -#define DEFAULT_PERS	64			/* 0->255 */
> -
> -struct yam_port {
> -	int magic;
> -	int bitrate;
> -	int baudrate;
> -	int iobase;
> -	int irq;
> -	int dupmode;
> -
> -	struct net_device *dev;
> -
> -	int nb_rxint;
> -	int nb_mdint;
> -
> -	/* Parameters section */
> -
> -	int txd;				/* tx delay */
> -	int holdd;				/* duplex ptt delay */
> -	int txtail;				/* txtail delay */
> -	int slot;				/* slottime */
> -	int pers;				/* persistence */
> -
> -	/* Tx section */
> -
> -	int tx_state;
> -	int tx_count;
> -	int slotcnt;
> -	unsigned char tx_buf[YAM_MAX_FRAME];
> -	int tx_len;
> -	int tx_crcl, tx_crch;
> -	struct sk_buff_head send_queue;		/* Packets awaiting transmission */
> -
> -	/* Rx section */
> -
> -	int dcd;
> -	unsigned char rx_buf[YAM_MAX_FRAME];
> -	int rx_len;
> -	int rx_crcl, rx_crch;
> -};
> -
> -struct yam_mcs {
> -	unsigned char bits[YAM_FPGA_SIZE];
> -	int bitrate;
> -	struct yam_mcs *next;
> -};
> -
> -static struct net_device *yam_devs[NR_PORTS];
> -
> -static struct yam_mcs *yam_data;
> -
> -static DEFINE_TIMER(yam_timer, NULL);
> -
> -/* --------------------------------------------------------------------- */
> -
> -#define RBR(iobase)	(iobase+0)
> -#define THR(iobase)	(iobase+0)
> -#define IER(iobase)	(iobase+1)
> -#define IIR(iobase)	(iobase+2)
> -#define FCR(iobase)	(iobase+2)
> -#define LCR(iobase)	(iobase+3)
> -#define MCR(iobase)	(iobase+4)
> -#define LSR(iobase)	(iobase+5)
> -#define MSR(iobase)	(iobase+6)
> -#define SCR(iobase)	(iobase+7)
> -#define DLL(iobase)	(iobase+0)
> -#define DLM(iobase)	(iobase+1)
> -
> -#define YAM_EXTENT	8
> -
> -/* Interrupt Identification Register Bit Masks */
> -#define IIR_NOPEND	1
> -#define IIR_MSR		0
> -#define IIR_TX		2
> -#define IIR_RX		4
> -#define IIR_LSR		6
> -#define IIR_TIMEOUT	12			/* Fifo mode only */
> -
> -#define IIR_MASK	0x0F
> -
> -/* Interrupt Enable Register Bit Masks */
> -#define IER_RX		1			/* enable rx interrupt */
> -#define IER_TX		2			/* enable tx interrupt */
> -#define IER_LSR		4			/* enable line status interrupts */
> -#define IER_MSR		8			/* enable modem status interrupts */
> -
> -/* Modem Control Register Bit Masks */
> -#define MCR_DTR		0x01			/* DTR output */
> -#define MCR_RTS		0x02			/* RTS output */
> -#define MCR_OUT1	0x04			/* OUT1 output (not accessible in RS232) */
> -#define MCR_OUT2	0x08			/* Master Interrupt enable (must be set on PCs) */
> -#define MCR_LOOP	0x10			/* Loopback enable */
> -
> -/* Modem Status Register Bit Masks */
> -#define MSR_DCTS	0x01			/* Delta CTS input */
> -#define MSR_DDSR	0x02			/* Delta DSR */
> -#define MSR_DRIN	0x04			/* Delta RI */
> -#define MSR_DDCD	0x08			/* Delta DCD */
> -#define MSR_CTS		0x10			/* CTS input */
> -#define MSR_DSR		0x20			/* DSR input */
> -#define MSR_RING	0x40			/* RI  input */
> -#define MSR_DCD		0x80			/* DCD input */
> -
> -/* line status register bit mask */
> -#define LSR_RXC		0x01
> -#define LSR_OE		0x02
> -#define LSR_PE		0x04
> -#define LSR_FE		0x08
> -#define LSR_BREAK	0x10
> -#define LSR_THRE	0x20
> -#define LSR_TSRE	0x40
> -
> -/* Line Control Register Bit Masks */
> -#define LCR_DLAB	0x80
> -#define LCR_BREAK	0x40
> -#define LCR_PZERO	0x28
> -#define LCR_PEVEN	0x18
> -#define LCR_PODD	0x08
> -#define LCR_STOP1	0x00
> -#define LCR_STOP2	0x04
> -#define LCR_BIT5	0x00
> -#define LCR_BIT6	0x02
> -#define LCR_BIT7	0x01
> -#define LCR_BIT8	0x03
> -
> -/* YAM Modem <-> UART Port mapping */
> -
> -#define TX_RDY		MSR_DCTS		/* transmitter ready to send */
> -#define RX_DCD		MSR_DCD			/* carrier detect */
> -#define RX_FLAG		MSR_RING		/* hdlc flag received */
> -#define FPGA_DONE	MSR_DSR			/* FPGA is configured */
> -#define PTT_ON		(MCR_RTS|MCR_OUT2)	/* activate PTT */
> -#define PTT_OFF		(MCR_DTR|MCR_OUT2)	/* release PTT */
> -
> -#define ENABLE_RXINT	IER_RX			/* enable uart rx interrupt during rx */
> -#define ENABLE_TXINT	IER_MSR			/* enable uart ms interrupt during tx */
> -#define ENABLE_RTXINT	(IER_RX|IER_MSR)	/* full duplex operations */
> -
> -
> -/*************************************************************************
> -* CRC Tables
> -************************************************************************/
> -
> -static const unsigned char chktabl[256] =
> -{0x00, 0x89, 0x12, 0x9b, 0x24, 0xad, 0x36, 0xbf, 0x48, 0xc1, 0x5a, 0xd3, 0x6c, 0xe5, 0x7e,
> - 0xf7, 0x81, 0x08, 0x93, 0x1a, 0xa5, 0x2c, 0xb7, 0x3e, 0xc9, 0x40, 0xdb, 0x52, 0xed, 0x64,
> - 0xff, 0x76, 0x02, 0x8b, 0x10, 0x99, 0x26, 0xaf, 0x34, 0xbd, 0x4a, 0xc3, 0x58, 0xd1, 0x6e,
> - 0xe7, 0x7c, 0xf5, 0x83, 0x0a, 0x91, 0x18, 0xa7, 0x2e, 0xb5, 0x3c, 0xcb, 0x42, 0xd9, 0x50,
> - 0xef, 0x66, 0xfd, 0x74, 0x04, 0x8d, 0x16, 0x9f, 0x20, 0xa9, 0x32, 0xbb, 0x4c, 0xc5, 0x5e,
> - 0xd7, 0x68, 0xe1, 0x7a, 0xf3, 0x85, 0x0c, 0x97, 0x1e, 0xa1, 0x28, 0xb3, 0x3a, 0xcd, 0x44,
> - 0xdf, 0x56, 0xe9, 0x60, 0xfb, 0x72, 0x06, 0x8f, 0x14, 0x9d, 0x22, 0xab, 0x30, 0xb9, 0x4e,
> - 0xc7, 0x5c, 0xd5, 0x6a, 0xe3, 0x78, 0xf1, 0x87, 0x0e, 0x95, 0x1c, 0xa3, 0x2a, 0xb1, 0x38,
> - 0xcf, 0x46, 0xdd, 0x54, 0xeb, 0x62, 0xf9, 0x70, 0x08, 0x81, 0x1a, 0x93, 0x2c, 0xa5, 0x3e,
> - 0xb7, 0x40, 0xc9, 0x52, 0xdb, 0x64, 0xed, 0x76, 0xff, 0x89, 0x00, 0x9b, 0x12, 0xad, 0x24,
> - 0xbf, 0x36, 0xc1, 0x48, 0xd3, 0x5a, 0xe5, 0x6c, 0xf7, 0x7e, 0x0a, 0x83, 0x18, 0x91, 0x2e,
> - 0xa7, 0x3c, 0xb5, 0x42, 0xcb, 0x50, 0xd9, 0x66, 0xef, 0x74, 0xfd, 0x8b, 0x02, 0x99, 0x10,
> - 0xaf, 0x26, 0xbd, 0x34, 0xc3, 0x4a, 0xd1, 0x58, 0xe7, 0x6e, 0xf5, 0x7c, 0x0c, 0x85, 0x1e,
> - 0x97, 0x28, 0xa1, 0x3a, 0xb3, 0x44, 0xcd, 0x56, 0xdf, 0x60, 0xe9, 0x72, 0xfb, 0x8d, 0x04,
> - 0x9f, 0x16, 0xa9, 0x20, 0xbb, 0x32, 0xc5, 0x4c, 0xd7, 0x5e, 0xe1, 0x68, 0xf3, 0x7a, 0x0e,
> - 0x87, 0x1c, 0x95, 0x2a, 0xa3, 0x38, 0xb1, 0x46, 0xcf, 0x54, 0xdd, 0x62, 0xeb, 0x70, 0xf9,
> - 0x8f, 0x06, 0x9d, 0x14, 0xab, 0x22, 0xb9, 0x30, 0xc7, 0x4e, 0xd5, 0x5c, 0xe3, 0x6a, 0xf1,
> - 0x78};
> -static const unsigned char chktabh[256] =
> -{0x00, 0x11, 0x23, 0x32, 0x46, 0x57, 0x65, 0x74, 0x8c, 0x9d, 0xaf, 0xbe, 0xca, 0xdb, 0xe9,
> - 0xf8, 0x10, 0x01, 0x33, 0x22, 0x56, 0x47, 0x75, 0x64, 0x9c, 0x8d, 0xbf, 0xae, 0xda, 0xcb,
> - 0xf9, 0xe8, 0x21, 0x30, 0x02, 0x13, 0x67, 0x76, 0x44, 0x55, 0xad, 0xbc, 0x8e, 0x9f, 0xeb,
> - 0xfa, 0xc8, 0xd9, 0x31, 0x20, 0x12, 0x03, 0x77, 0x66, 0x54, 0x45, 0xbd, 0xac, 0x9e, 0x8f,
> - 0xfb, 0xea, 0xd8, 0xc9, 0x42, 0x53, 0x61, 0x70, 0x04, 0x15, 0x27, 0x36, 0xce, 0xdf, 0xed,
> - 0xfc, 0x88, 0x99, 0xab, 0xba, 0x52, 0x43, 0x71, 0x60, 0x14, 0x05, 0x37, 0x26, 0xde, 0xcf,
> - 0xfd, 0xec, 0x98, 0x89, 0xbb, 0xaa, 0x63, 0x72, 0x40, 0x51, 0x25, 0x34, 0x06, 0x17, 0xef,
> - 0xfe, 0xcc, 0xdd, 0xa9, 0xb8, 0x8a, 0x9b, 0x73, 0x62, 0x50, 0x41, 0x35, 0x24, 0x16, 0x07,
> - 0xff, 0xee, 0xdc, 0xcd, 0xb9, 0xa8, 0x9a, 0x8b, 0x84, 0x95, 0xa7, 0xb6, 0xc2, 0xd3, 0xe1,
> - 0xf0, 0x08, 0x19, 0x2b, 0x3a, 0x4e, 0x5f, 0x6d, 0x7c, 0x94, 0x85, 0xb7, 0xa6, 0xd2, 0xc3,
> - 0xf1, 0xe0, 0x18, 0x09, 0x3b, 0x2a, 0x5e, 0x4f, 0x7d, 0x6c, 0xa5, 0xb4, 0x86, 0x97, 0xe3,
> - 0xf2, 0xc0, 0xd1, 0x29, 0x38, 0x0a, 0x1b, 0x6f, 0x7e, 0x4c, 0x5d, 0xb5, 0xa4, 0x96, 0x87,
> - 0xf3, 0xe2, 0xd0, 0xc1, 0x39, 0x28, 0x1a, 0x0b, 0x7f, 0x6e, 0x5c, 0x4d, 0xc6, 0xd7, 0xe5,
> - 0xf4, 0x80, 0x91, 0xa3, 0xb2, 0x4a, 0x5b, 0x69, 0x78, 0x0c, 0x1d, 0x2f, 0x3e, 0xd6, 0xc7,
> - 0xf5, 0xe4, 0x90, 0x81, 0xb3, 0xa2, 0x5a, 0x4b, 0x79, 0x68, 0x1c, 0x0d, 0x3f, 0x2e, 0xe7,
> - 0xf6, 0xc4, 0xd5, 0xa1, 0xb0, 0x82, 0x93, 0x6b, 0x7a, 0x48, 0x59, 0x2d, 0x3c, 0x0e, 0x1f,
> - 0xf7, 0xe6, 0xd4, 0xc5, 0xb1, 0xa0, 0x92, 0x83, 0x7b, 0x6a, 0x58, 0x49, 0x3d, 0x2c, 0x1e,
> - 0x0f};
> -
> -/*************************************************************************
> -* FPGA functions
> -************************************************************************/
> -
> -static void delay(int ms)
> -{
> -	unsigned long timeout = jiffies + ((ms * HZ) / 1000);
> -	while (time_before(jiffies, timeout))
> -		cpu_relax();
> -}
> -
> -/*
> - * reset FPGA
> - */
> -
> -static void fpga_reset(int iobase)
> -{
> -	outb(0, IER(iobase));
> -	outb(LCR_DLAB | LCR_BIT5, LCR(iobase));
> -	outb(1, DLL(iobase));
> -	outb(0, DLM(iobase));
> -
> -	outb(LCR_BIT5, LCR(iobase));
> -	inb(LSR(iobase));
> -	inb(MSR(iobase));
> -	/* turn off FPGA supply voltage */
> -	outb(MCR_OUT1 | MCR_OUT2, MCR(iobase));
> -	delay(100);
> -	/* turn on FPGA supply voltage again */
> -	outb(MCR_DTR | MCR_RTS | MCR_OUT1 | MCR_OUT2, MCR(iobase));
> -	delay(100);
> -}
> -
> -/*
> - * send one byte to FPGA
> - */
> -
> -static int fpga_write(int iobase, unsigned char wrd)
> -{
> -	unsigned char bit;
> -	int k;
> -	unsigned long timeout = jiffies + HZ / 10;
> -
> -	for (k = 0; k < 8; k++) {
> -		bit = (wrd & 0x80) ? (MCR_RTS | MCR_DTR) : MCR_DTR;
> -		outb(bit | MCR_OUT1 | MCR_OUT2, MCR(iobase));
> -		wrd <<= 1;
> -		outb(0xfc, THR(iobase));
> -		while ((inb(LSR(iobase)) & LSR_TSRE) == 0)
> -			if (time_after(jiffies, timeout))
> -				return -1;
> -	}
> -
> -	return 0;
> -}
> -
> -/*
> - * predef should be 0 for loading user defined mcs
> - * predef should be YAM_1200 for loading predef 1200 mcs
> - * predef should be YAM_9600 for loading predef 9600 mcs
> - */
> -static unsigned char *add_mcs(unsigned char *bits, int bitrate,
> -			      unsigned int predef)
> -{
> -	const char *fw_name[2] = {FIRMWARE_9600, FIRMWARE_1200};
> -	const struct firmware *fw;
> -	struct platform_device *pdev;
> -	struct yam_mcs *p;
> -	int err;
> -
> -	switch (predef) {
> -	case 0:
> -		fw = NULL;
> -		break;
> -	case YAM_1200:
> -	case YAM_9600:
> -		predef--;
> -		pdev = platform_device_register_simple("yam", 0, NULL, 0);
> -		if (IS_ERR(pdev)) {
> -			printk(KERN_ERR "yam: Failed to register firmware\n");
> -			return NULL;
> -		}
> -		err = request_firmware(&fw, fw_name[predef], &pdev->dev);
> -		platform_device_unregister(pdev);
> -		if (err) {
> -			printk(KERN_ERR "Failed to load firmware \"%s\"\n",
> -			       fw_name[predef]);
> -			return NULL;
> -		}
> -		if (fw->size != YAM_FPGA_SIZE) {
> -			printk(KERN_ERR "Bogus length %zu in firmware \"%s\"\n",
> -			       fw->size, fw_name[predef]);
> -			release_firmware(fw);
> -			return NULL;
> -		}
> -		bits = (unsigned char *)fw->data;
> -		break;
> -	default:
> -		printk(KERN_ERR "yam: Invalid predef number %u\n", predef);
> -		return NULL;
> -	}
> -
> -	/* If it already exists, replace the bit data */
> -	p = yam_data;
> -	while (p) {
> -		if (p->bitrate == bitrate) {
> -			memcpy(p->bits, bits, YAM_FPGA_SIZE);
> -			goto out;
> -		}
> -		p = p->next;
> -	}
> -
> -	/* Allocate a new mcs */
> -	if ((p = kmalloc_obj(struct yam_mcs)) == NULL) {
> -		release_firmware(fw);
> -		return NULL;
> -	}
> -	memcpy(p->bits, bits, YAM_FPGA_SIZE);
> -	p->bitrate = bitrate;
> -	p->next = yam_data;
> -	yam_data = p;
> - out:
> -	release_firmware(fw);
> -	return p->bits;
> -}
> -
> -static unsigned char *get_mcs(int bitrate)
> -{
> -	struct yam_mcs *p;
> -
> -	p = yam_data;
> -	while (p) {
> -		if (p->bitrate == bitrate)
> -			return p->bits;
> -		p = p->next;
> -	}
> -
> -	/* Load predefined mcs data */
> -	switch (bitrate) {
> -	case 1200:
> -		/* setting predef as YAM_1200 for loading predef 1200 mcs */
> -		return add_mcs(NULL, bitrate, YAM_1200);
> -	default:
> -		/* setting predef as YAM_9600 for loading predef 9600 mcs */
> -		return add_mcs(NULL, bitrate, YAM_9600);
> -	}
> -}
> -
> -/*
> - * download bitstream to FPGA
> - * data is contained in bits[] array in yam1200.h resp. yam9600.h
> - */
> -
> -static int fpga_download(int iobase, int bitrate)
> -{
> -	int i, rc;
> -	unsigned char *pbits;
> -
> -	pbits = get_mcs(bitrate);
> -	if (pbits == NULL)
> -		return -1;
> -
> -	fpga_reset(iobase);
> -	for (i = 0; i < YAM_FPGA_SIZE; i++) {
> -		if (fpga_write(iobase, pbits[i])) {
> -			printk(KERN_ERR "yam: error in write cycle\n");
> -			return -1;			/* write... */
> -		}
> -	}
> -
> -	fpga_write(iobase, 0xFF);
> -	rc = inb(MSR(iobase));		/* check DONE signal */
> -
> -	/* Needed for some hardwares */
> -	delay(50);
> -
> -	return (rc & MSR_DSR) ? 0 : -1;
> -}
> -
> -
> -/************************************************************************
> -* Serial port init
> -************************************************************************/
> -
> -static void yam_set_uart(struct net_device *dev)
> -{
> -	struct yam_port *yp = netdev_priv(dev);
> -	int divisor = 115200 / yp->baudrate;
> -
> -	outb(0, IER(dev->base_addr));
> -	outb(LCR_DLAB | LCR_BIT8, LCR(dev->base_addr));
> -	outb(divisor, DLL(dev->base_addr));
> -	outb(0, DLM(dev->base_addr));
> -	outb(LCR_BIT8, LCR(dev->base_addr));
> -	outb(PTT_OFF, MCR(dev->base_addr));
> -	outb(0x00, FCR(dev->base_addr));
> -
> -	/* Flush pending irq */
> -
> -	inb(RBR(dev->base_addr));
> -	inb(MSR(dev->base_addr));
> -
> -	/* Enable rx irq */
> -
> -	outb(ENABLE_RTXINT, IER(dev->base_addr));
> -}
> -
> -
> -/* --------------------------------------------------------------------- */
> -
> -enum uart {
> -	c_uart_unknown, c_uart_8250,
> -	c_uart_16450, c_uart_16550, c_uart_16550A
> -};
> -
> -static const char *uart_str[] =
> -{"unknown", "8250", "16450", "16550", "16550A"};
> -
> -static enum uart yam_check_uart(unsigned int iobase)
> -{
> -	unsigned char b1, b2, b3;
> -	enum uart u;
> -	enum uart uart_tab[] =
> -	{c_uart_16450, c_uart_unknown, c_uart_16550, c_uart_16550A};
> -
> -	b1 = inb(MCR(iobase));
> -	outb(b1 | 0x10, MCR(iobase));	/* loopback mode */
> -	b2 = inb(MSR(iobase));
> -	outb(0x1a, MCR(iobase));
> -	b3 = inb(MSR(iobase)) & 0xf0;
> -	outb(b1, MCR(iobase));		/* restore old values */
> -	outb(b2, MSR(iobase));
> -	if (b3 != 0x90)
> -		return c_uart_unknown;
> -	inb(RBR(iobase));
> -	inb(RBR(iobase));
> -	outb(0x01, FCR(iobase));	/* enable FIFOs */
> -	u = uart_tab[(inb(IIR(iobase)) >> 6) & 3];
> -	if (u == c_uart_16450) {
> -		outb(0x5a, SCR(iobase));
> -		b1 = inb(SCR(iobase));
> -		outb(0xa5, SCR(iobase));
> -		b2 = inb(SCR(iobase));
> -		if ((b1 != 0x5a) || (b2 != 0xa5))
> -			u = c_uart_8250;
> -	}
> -	return u;
> -}
> -
> -/******************************************************************************
> -* Rx Section
> -******************************************************************************/
> -static inline void yam_rx_flag(struct net_device *dev, struct yam_port *yp)
> -{
> -	if (yp->dcd && yp->rx_len >= 3 && yp->rx_len < YAM_MAX_FRAME) {
> -		int pkt_len = yp->rx_len - 2 + 1;	/* -CRC + kiss */
> -		struct sk_buff *skb;
> -
> -		if ((yp->rx_crch & yp->rx_crcl) != 0xFF) {
> -			/* Bad crc */
> -		} else {
> -			if (!(skb = dev_alloc_skb(pkt_len))) {
> -				printk(KERN_WARNING "%s: memory squeeze, dropping packet\n", dev->name);
> -				++dev->stats.rx_dropped;
> -			} else {
> -				unsigned char *cp;
> -				cp = skb_put(skb, pkt_len);
> -				*cp++ = 0;		/* KISS kludge */
> -				memcpy(cp, yp->rx_buf, pkt_len - 1);
> -				skb->protocol = ax25_type_trans(skb, dev);
> -				netif_rx(skb);
> -				++dev->stats.rx_packets;
> -			}
> -		}
> -	}
> -	yp->rx_len = 0;
> -	yp->rx_crcl = 0x21;
> -	yp->rx_crch = 0xf3;
> -}
> -
> -static inline void yam_rx_byte(struct net_device *dev, struct yam_port *yp, unsigned char rxb)
> -{
> -	if (yp->rx_len < YAM_MAX_FRAME) {
> -		unsigned char c = yp->rx_crcl;
> -		yp->rx_crcl = (chktabl[c] ^ yp->rx_crch);
> -		yp->rx_crch = (chktabh[c] ^ rxb);
> -		yp->rx_buf[yp->rx_len++] = rxb;
> -	}
> -}
> -
> -/********************************************************************************
> -* TX Section
> -********************************************************************************/
> -
> -static void ptt_on(struct net_device *dev)
> -{
> -	outb(PTT_ON, MCR(dev->base_addr));
> -}
> -
> -static void ptt_off(struct net_device *dev)
> -{
> -	outb(PTT_OFF, MCR(dev->base_addr));
> -}
> -
> -static netdev_tx_t yam_send_packet(struct sk_buff *skb,
> -					 struct net_device *dev)
> -{
> -	struct yam_port *yp = netdev_priv(dev);
> -
> -	if (skb->protocol == htons(ETH_P_IP))
> -		return ax25_ip_xmit(skb);
> -
> -	skb_queue_tail(&yp->send_queue, skb);
> -	netif_trans_update(dev);
> -	return NETDEV_TX_OK;
> -}
> -
> -static void yam_start_tx(struct net_device *dev, struct yam_port *yp)
> -{
> -	if ((yp->tx_state == TX_TAIL) || (yp->txd == 0))
> -		yp->tx_count = 1;
> -	else
> -		yp->tx_count = (yp->bitrate * yp->txd) / 8000;
> -	yp->tx_state = TX_HEAD;
> -	ptt_on(dev);
> -}
> -
> -static void yam_arbitrate(struct net_device *dev)
> -{
> -	struct yam_port *yp = netdev_priv(dev);
> -
> -	if (yp->magic != YAM_MAGIC || yp->tx_state != TX_OFF ||
> -	    skb_queue_empty(&yp->send_queue))
> -		return;
> -	/* tx_state is TX_OFF and there is data to send */
> -
> -	if (yp->dupmode) {
> -		/* Full duplex mode, don't wait */
> -		yam_start_tx(dev, yp);
> -		return;
> -	}
> -	if (yp->dcd) {
> -		/* DCD on, wait slotime ... */
> -		yp->slotcnt = yp->slot / 10;
> -		return;
> -	}
> -	/* Is slottime passed ? */
> -	if ((--yp->slotcnt) > 0)
> -		return;
> -
> -	yp->slotcnt = yp->slot / 10;
> -
> -	/* is random > persist ? */
> -	if (get_random_u8() > yp->pers)
> -		return;
> -
> -	yam_start_tx(dev, yp);
> -}
> -
> -static void yam_dotimer(struct timer_list *unused)
> -{
> -	int i;
> -
> -	for (i = 0; i < NR_PORTS; i++) {
> -		struct net_device *dev = yam_devs[i];
> -		if (dev && netif_running(dev))
> -			yam_arbitrate(dev);
> -	}
> -	yam_timer.expires = jiffies + HZ / 100;
> -	add_timer(&yam_timer);
> -}
> -
> -static void yam_tx_byte(struct net_device *dev, struct yam_port *yp)
> -{
> -	struct sk_buff *skb;
> -	unsigned char b, temp;
> -
> -	switch (yp->tx_state) {
> -	case TX_OFF:
> -		break;
> -	case TX_HEAD:
> -		if (--yp->tx_count <= 0) {
> -			if (!(skb = skb_dequeue(&yp->send_queue))) {
> -				ptt_off(dev);
> -				yp->tx_state = TX_OFF;
> -				break;
> -			}
> -			yp->tx_state = TX_DATA;
> -			if (skb->data[0] != 0) {
> -/*                              do_kiss_params(s, skb->data, skb->len); */
> -				dev_kfree_skb_any(skb);
> -				break;
> -			}
> -			yp->tx_len = skb->len - 1;	/* strip KISS byte */
> -			if (yp->tx_len >= YAM_MAX_FRAME || yp->tx_len < 2) {
> -				dev_kfree_skb_any(skb);
> -				break;
> -			}
> -			skb_copy_from_linear_data_offset(skb, 1,
> -							 yp->tx_buf,
> -							 yp->tx_len);
> -			dev_kfree_skb_any(skb);
> -			yp->tx_count = 0;
> -			yp->tx_crcl = 0x21;
> -			yp->tx_crch = 0xf3;
> -			yp->tx_state = TX_DATA;
> -		}
> -		break;
> -	case TX_DATA:
> -		b = yp->tx_buf[yp->tx_count++];
> -		outb(b, THR(dev->base_addr));
> -		temp = yp->tx_crcl;
> -		yp->tx_crcl = chktabl[temp] ^ yp->tx_crch;
> -		yp->tx_crch = chktabh[temp] ^ b;
> -		if (yp->tx_count >= yp->tx_len) {
> -			yp->tx_state = TX_CRC1;
> -		}
> -		break;
> -	case TX_CRC1:
> -		yp->tx_crch = chktabl[yp->tx_crcl] ^ yp->tx_crch;
> -		yp->tx_crcl = chktabh[yp->tx_crcl] ^ chktabl[yp->tx_crch] ^ 0xff;
> -		outb(yp->tx_crcl, THR(dev->base_addr));
> -		yp->tx_state = TX_CRC2;
> -		break;
> -	case TX_CRC2:
> -		outb(chktabh[yp->tx_crch] ^ 0xFF, THR(dev->base_addr));
> -		if (skb_queue_empty(&yp->send_queue)) {
> -			yp->tx_count = (yp->bitrate * yp->txtail) / 8000;
> -			if (yp->dupmode == 2)
> -				yp->tx_count += (yp->bitrate * yp->holdd) / 8;
> -			if (yp->tx_count == 0)
> -				yp->tx_count = 1;
> -			yp->tx_state = TX_TAIL;
> -		} else {
> -			yp->tx_count = 1;
> -			yp->tx_state = TX_HEAD;
> -		}
> -		++dev->stats.tx_packets;
> -		break;
> -	case TX_TAIL:
> -		if (--yp->tx_count <= 0) {
> -			yp->tx_state = TX_OFF;
> -			ptt_off(dev);
> -		}
> -		break;
> -	}
> -}
> -
> -/***********************************************************************************
> -* ISR routine
> -************************************************************************************/
> -
> -static irqreturn_t yam_interrupt(int irq, void *dev_id)
> -{
> -	struct net_device *dev;
> -	struct yam_port *yp;
> -	unsigned char iir;
> -	int counter = 100;
> -	int i;
> -	int handled = 0;
> -
> -	for (i = 0; i < NR_PORTS; i++) {
> -		dev = yam_devs[i];
> -		yp = netdev_priv(dev);
> -
> -		if (!netif_running(dev))
> -			continue;
> -
> -		while ((iir = IIR_MASK & inb(IIR(dev->base_addr))) != IIR_NOPEND) {
> -			unsigned char msr = inb(MSR(dev->base_addr));
> -			unsigned char lsr = inb(LSR(dev->base_addr));
> -			unsigned char rxb;
> -
> -			handled = 1;
> -
> -			if (lsr & LSR_OE)
> -				++dev->stats.rx_fifo_errors;
> -
> -			yp->dcd = (msr & RX_DCD) ? 1 : 0;
> -
> -			if (--counter <= 0) {
> -				printk(KERN_ERR "%s: too many irq iir=%d\n",
> -						dev->name, iir);
> -				goto out;
> -			}
> -			if (msr & TX_RDY) {
> -				++yp->nb_mdint;
> -				yam_tx_byte(dev, yp);
> -			}
> -			if (lsr & LSR_RXC) {
> -				++yp->nb_rxint;
> -				rxb = inb(RBR(dev->base_addr));
> -				if (msr & RX_FLAG)
> -					yam_rx_flag(dev, yp);
> -				else
> -					yam_rx_byte(dev, yp, rxb);
> -			}
> -		}
> -	}
> -out:
> -	return IRQ_RETVAL(handled);
> -}
> -
> -#ifdef CONFIG_PROC_FS
> -
> -static void *yam_seq_start(struct seq_file *seq, loff_t *pos)
> -{
> -	return (*pos < NR_PORTS) ? yam_devs[*pos] : NULL;
> -}
> -
> -static void *yam_seq_next(struct seq_file *seq, void *v, loff_t *pos)
> -{
> -	++*pos;
> -	return (*pos < NR_PORTS) ? yam_devs[*pos] : NULL;
> -}
> -
> -static void yam_seq_stop(struct seq_file *seq, void *v)
> -{
> -}
> -
> -static int yam_seq_show(struct seq_file *seq, void *v)
> -{
> -	struct net_device *dev = v;
> -	const struct yam_port *yp = netdev_priv(dev);
> -
> -	seq_printf(seq, "Device %s\n", dev->name);
> -	seq_printf(seq, "  Up       %d\n", netif_running(dev));
> -	seq_printf(seq, "  Speed    %u\n", yp->bitrate);
> -	seq_printf(seq, "  IoBase   0x%x\n", yp->iobase);
> -	seq_printf(seq, "  BaudRate %u\n", yp->baudrate);
> -	seq_printf(seq, "  IRQ      %u\n", yp->irq);
> -	seq_printf(seq, "  TxState  %u\n", yp->tx_state);
> -	seq_printf(seq, "  Duplex   %u\n", yp->dupmode);
> -	seq_printf(seq, "  HoldDly  %u\n", yp->holdd);
> -	seq_printf(seq, "  TxDelay  %u\n", yp->txd);
> -	seq_printf(seq, "  TxTail   %u\n", yp->txtail);
> -	seq_printf(seq, "  SlotTime %u\n", yp->slot);
> -	seq_printf(seq, "  Persist  %u\n", yp->pers);
> -	seq_printf(seq, "  TxFrames %lu\n", dev->stats.tx_packets);
> -	seq_printf(seq, "  RxFrames %lu\n", dev->stats.rx_packets);
> -	seq_printf(seq, "  TxInt    %u\n", yp->nb_mdint);
> -	seq_printf(seq, "  RxInt    %u\n", yp->nb_rxint);
> -	seq_printf(seq, "  RxOver   %lu\n", dev->stats.rx_fifo_errors);
> -	seq_printf(seq, "\n");
> -	return 0;
> -}
> -
> -static const struct seq_operations yam_seqops = {
> -	.start = yam_seq_start,
> -	.next = yam_seq_next,
> -	.stop = yam_seq_stop,
> -	.show = yam_seq_show,
> -};
> -#endif
> -
> -
> -/* --------------------------------------------------------------------- */
> -
> -static int yam_open(struct net_device *dev)
> -{
> -	struct yam_port *yp = netdev_priv(dev);
> -	enum uart u;
> -	int i;
> -	int ret=0;
> -
> -	printk(KERN_INFO "Trying %s at iobase 0x%lx irq %u\n", dev->name, dev->base_addr, dev->irq);
> -
> -	if (!yp->bitrate)
> -		return -ENXIO;
> -	if (!dev->base_addr || dev->base_addr > 0x1000 - YAM_EXTENT ||
> -		dev->irq < 2 || dev->irq > 15) {
> -		return -ENXIO;
> -	}
> -	if (!request_region(dev->base_addr, YAM_EXTENT, dev->name))
> -	{
> -		printk(KERN_ERR "%s: cannot 0x%lx busy\n", dev->name, dev->base_addr);
> -		return -EACCES;
> -	}
> -	if ((u = yam_check_uart(dev->base_addr)) == c_uart_unknown) {
> -		printk(KERN_ERR "%s: cannot find uart type\n", dev->name);
> -		ret = -EIO;
> -		goto out_release_base;
> -	}
> -	if (fpga_download(dev->base_addr, yp->bitrate)) {
> -		printk(KERN_ERR "%s: cannot init FPGA\n", dev->name);
> -		ret = -EIO;
> -		goto out_release_base;
> -	}
> -	outb(0, IER(dev->base_addr));
> -	if (request_irq(dev->irq, yam_interrupt, IRQF_SHARED, dev->name, dev)) {
> -		printk(KERN_ERR "%s: irq %d busy\n", dev->name, dev->irq);
> -		ret = -EBUSY;
> -		goto out_release_base;
> -	}
> -
> -	yam_set_uart(dev);
> -
> -	netif_start_queue(dev);
> -	
> -	yp->slotcnt = yp->slot / 10;
> -
> -	/* Reset overruns for all ports - FPGA programming makes overruns */
> -	for (i = 0; i < NR_PORTS; i++) {
> -		struct net_device *yam_dev = yam_devs[i];
> -
> -		inb(LSR(yam_dev->base_addr));
> -		yam_dev->stats.rx_fifo_errors = 0;
> -	}
> -
> -	printk(KERN_INFO "%s at iobase 0x%lx irq %u uart %s\n", dev->name, dev->base_addr, dev->irq,
> -		   uart_str[u]);
> -	return 0;
> -
> -out_release_base:
> -	release_region(dev->base_addr, YAM_EXTENT);
> -	return ret;
> -}
> -
> -/* --------------------------------------------------------------------- */
> -
> -static int yam_close(struct net_device *dev)
> -{
> -	struct sk_buff *skb;
> -	struct yam_port *yp = netdev_priv(dev);
> -
> -	if (!dev)
> -		return -EINVAL;
> -
> -	/*
> -	 * disable interrupts
> -	 */
> -	outb(0, IER(dev->base_addr));
> -	outb(1, MCR(dev->base_addr));
> -	/* Remove IRQ handler if last */
> -	free_irq(dev->irq,dev);
> -	release_region(dev->base_addr, YAM_EXTENT);
> -	netif_stop_queue(dev);
> -	while ((skb = skb_dequeue(&yp->send_queue)))
> -		dev_kfree_skb(skb);
> -
> -	printk(KERN_INFO "%s: close yam at iobase 0x%lx irq %u\n",
> -		   yam_drvname, dev->base_addr, dev->irq);
> -	return 0;
> -}
> -
> -/* --------------------------------------------------------------------- */
> -
> -static int yam_siocdevprivate(struct net_device *dev, struct ifreq *ifr, void __user *data, int cmd)
> -{
> -	struct yam_port *yp = netdev_priv(dev);
> -	struct yamdrv_ioctl_cfg yi;
> -	struct yamdrv_ioctl_mcs *ym;
> -	int ioctl_cmd;
> -
> -	if (copy_from_user(&ioctl_cmd, data, sizeof(int)))
> -		return -EFAULT;
> -
> -	if (yp->magic != YAM_MAGIC)
> -		return -EINVAL;
> -
> -	if (!capable(CAP_NET_ADMIN))
> -		return -EPERM;
> -
> -	if (cmd != SIOCDEVPRIVATE)
> -		return -EINVAL;
> -
> -	switch (ioctl_cmd) {
> -
> -	case SIOCYAMRESERVED:
> -		return -EINVAL;			/* unused */
> -
> -	case SIOCYAMSMCS:
> -		if (netif_running(dev))
> -			return -EINVAL;		/* Cannot change this parameter when up */
> -		ym = memdup_user(data, sizeof(struct yamdrv_ioctl_mcs));
> -		if (IS_ERR(ym))
> -			return PTR_ERR(ym);
> -		if (ym->cmd != SIOCYAMSMCS || ym->bitrate > YAM_MAXBITRATE) {
> -			kfree(ym);
> -			return -EINVAL;
> -		}
> -		/* setting predef as 0 for loading userdefined mcs data */
> -		add_mcs(ym->bits, ym->bitrate, 0);
> -		kfree(ym);
> -		break;
> -
> -	case SIOCYAMSCFG:
> -		if (!capable(CAP_SYS_RAWIO))
> -			return -EPERM;
> -		if (copy_from_user(&yi, data, sizeof(struct yamdrv_ioctl_cfg)))
> -			return -EFAULT;
> -
> -		if (yi.cmd != SIOCYAMSCFG)
> -			return -EINVAL;
> -		if ((yi.cfg.mask & YAM_IOBASE) && netif_running(dev))
> -			return -EINVAL;		/* Cannot change this parameter when up */
> -		if ((yi.cfg.mask & YAM_IRQ) && netif_running(dev))
> -			return -EINVAL;		/* Cannot change this parameter when up */
> -		if ((yi.cfg.mask & YAM_BITRATE) && netif_running(dev))
> -			return -EINVAL;		/* Cannot change this parameter when up */
> -		if ((yi.cfg.mask & YAM_BAUDRATE) && netif_running(dev))
> -			return -EINVAL;		/* Cannot change this parameter when up */
> -
> -		if (yi.cfg.mask & YAM_IOBASE) {
> -			yp->iobase = yi.cfg.iobase;
> -			dev->base_addr = yi.cfg.iobase;
> -		}
> -		if (yi.cfg.mask & YAM_IRQ) {
> -			if (yi.cfg.irq > 15)
> -				return -EINVAL;
> -			yp->irq = yi.cfg.irq;
> -			dev->irq = yi.cfg.irq;
> -		}
> -		if (yi.cfg.mask & YAM_BITRATE) {
> -			if (yi.cfg.bitrate > YAM_MAXBITRATE)
> -				return -EINVAL;
> -			yp->bitrate = yi.cfg.bitrate;
> -		}
> -		if (yi.cfg.mask & YAM_BAUDRATE) {
> -			if (yi.cfg.baudrate > YAM_MAXBAUDRATE)
> -				return -EINVAL;
> -			yp->baudrate = yi.cfg.baudrate;
> -		}
> -		if (yi.cfg.mask & YAM_MODE) {
> -			if (yi.cfg.mode > YAM_MAXMODE)
> -				return -EINVAL;
> -			yp->dupmode = yi.cfg.mode;
> -		}
> -		if (yi.cfg.mask & YAM_HOLDDLY) {
> -			if (yi.cfg.holddly > YAM_MAXHOLDDLY)
> -				return -EINVAL;
> -			yp->holdd = yi.cfg.holddly;
> -		}
> -		if (yi.cfg.mask & YAM_TXDELAY) {
> -			if (yi.cfg.txdelay > YAM_MAXTXDELAY)
> -				return -EINVAL;
> -			yp->txd = yi.cfg.txdelay;
> -		}
> -		if (yi.cfg.mask & YAM_TXTAIL) {
> -			if (yi.cfg.txtail > YAM_MAXTXTAIL)
> -				return -EINVAL;
> -			yp->txtail = yi.cfg.txtail;
> -		}
> -		if (yi.cfg.mask & YAM_PERSIST) {
> -			if (yi.cfg.persist > YAM_MAXPERSIST)
> -				return -EINVAL;
> -			yp->pers = yi.cfg.persist;
> -		}
> -		if (yi.cfg.mask & YAM_SLOTTIME) {
> -			if (yi.cfg.slottime > YAM_MAXSLOTTIME)
> -				return -EINVAL;
> -			yp->slot = yi.cfg.slottime;
> -			yp->slotcnt = yp->slot / 10;
> -		}
> -		break;
> -
> -	case SIOCYAMGCFG:
> -		memset(&yi, 0, sizeof(yi));
> -		yi.cfg.mask = 0xffffffff;
> -		yi.cfg.iobase = yp->iobase;
> -		yi.cfg.irq = yp->irq;
> -		yi.cfg.bitrate = yp->bitrate;
> -		yi.cfg.baudrate = yp->baudrate;
> -		yi.cfg.mode = yp->dupmode;
> -		yi.cfg.txdelay = yp->txd;
> -		yi.cfg.holddly = yp->holdd;
> -		yi.cfg.txtail = yp->txtail;
> -		yi.cfg.persist = yp->pers;
> -		yi.cfg.slottime = yp->slot;
> -		if (copy_to_user(data, &yi, sizeof(struct yamdrv_ioctl_cfg)))
> -			return -EFAULT;
> -		break;
> -
> -	default:
> -		return -EINVAL;
> -
> -	}
> -
> -	return 0;
> -}
> -
> -/* --------------------------------------------------------------------- */
> -
> -static int yam_set_mac_address(struct net_device *dev, void *addr)
> -{
> -	struct sockaddr *sa = (struct sockaddr *) addr;
> -
> -	/* addr is an AX.25 shifted ASCII mac address */
> -	dev_addr_set(dev, sa->sa_data);
> -	return 0;
> -}
> -
> -/* --------------------------------------------------------------------- */
> -
> -static const struct net_device_ops yam_netdev_ops = {
> -	.ndo_open	     = yam_open,
> -	.ndo_stop	     = yam_close,
> -	.ndo_start_xmit      = yam_send_packet,
> -	.ndo_siocdevprivate  = yam_siocdevprivate,
> -	.ndo_set_mac_address = yam_set_mac_address,
> -};
> -
> -static void yam_setup(struct net_device *dev)
> -{
> -	struct yam_port *yp = netdev_priv(dev);
> -
> -	yp->magic = YAM_MAGIC;
> -	yp->bitrate = DEFAULT_BITRATE;
> -	yp->baudrate = DEFAULT_BITRATE * 2;
> -	yp->iobase = 0;
> -	yp->irq = 0;
> -	yp->dupmode = 0;
> -	yp->holdd = DEFAULT_HOLDD;
> -	yp->txd = DEFAULT_TXD;
> -	yp->txtail = DEFAULT_TXTAIL;
> -	yp->slot = DEFAULT_SLOT;
> -	yp->pers = DEFAULT_PERS;
> -	yp->dev = dev;
> -
> -	dev->base_addr = yp->iobase;
> -	dev->irq = yp->irq;
> -
> -	skb_queue_head_init(&yp->send_queue);
> -
> -	dev->netdev_ops = &yam_netdev_ops;
> -	dev->header_ops = &ax25_header_ops;
> -
> -	dev->type = ARPHRD_AX25;
> -	dev->hard_header_len = AX25_MAX_HEADER_LEN;
> -	dev->mtu = AX25_MTU;
> -	dev->addr_len = AX25_ADDR_LEN;
> -	memcpy(dev->broadcast, &ax25_bcast, AX25_ADDR_LEN);
> -	dev_addr_set(dev, (u8 *)&ax25_defaddr);
> -}
> -
> -static int __init yam_init_driver(void)
> -{
> -	struct net_device *dev;
> -	int i, err;
> -	char name[IFNAMSIZ];
> -
> -	printk(yam_drvinfo);
> -
> -	for (i = 0; i < NR_PORTS; i++) {
> -		sprintf(name, "yam%d", i);
> -		
> -		dev = alloc_netdev(sizeof(struct yam_port), name,
> -				   NET_NAME_UNKNOWN, yam_setup);
> -		if (!dev) {
> -			pr_err("yam: cannot allocate net device\n");
> -			err = -ENOMEM;
> -			goto error;
> -		}
> -		
> -		err = register_netdev(dev);
> -		if (err) {
> -			printk(KERN_WARNING "yam: cannot register net device %s\n", dev->name);
> -			free_netdev(dev);
> -			goto error;
> -		}
> -		yam_devs[i] = dev;
> -
> -	}
> -
> -	timer_setup(&yam_timer, yam_dotimer, 0);
> -	yam_timer.expires = jiffies + HZ / 100;
> -	add_timer(&yam_timer);
> -
> -	proc_create_seq("yam", 0444, init_net.proc_net, &yam_seqops);
> -	return 0;
> - error:
> -	while (--i >= 0) {
> -		unregister_netdev(yam_devs[i]);
> -		free_netdev(yam_devs[i]);
> -	}
> -	return err;
> -}
> -
> -/* --------------------------------------------------------------------- */
> -
> -static void __exit yam_cleanup_driver(void)
> -{
> -	struct yam_mcs *p;
> -	int i;
> -
> -	timer_delete_sync(&yam_timer);
> -	for (i = 0; i < NR_PORTS; i++) {
> -		struct net_device *dev = yam_devs[i];
> -		if (dev) {
> -			unregister_netdev(dev);
> -			free_netdev(dev);
> -		}
> -	}
> -
> -	while (yam_data) {
> -		p = yam_data;
> -		yam_data = yam_data->next;
> -		kfree(p);
> -	}
> -
> -	remove_proc_entry("yam", init_net.proc_net);
> -}
> -
> -/* --------------------------------------------------------------------- */
> -
> -MODULE_AUTHOR("Frederic Rible F1OAT frible@teaser.fr");
> -MODULE_DESCRIPTION("Yam amateur radio modem driver");
> -MODULE_LICENSE("GPL");
> -MODULE_FIRMWARE(FIRMWARE_1200);
> -MODULE_FIRMWARE(FIRMWARE_9600);
> -
> -module_init(yam_init_driver);
> -module_exit(yam_cleanup_driver);
> -
> -/* --------------------------------------------------------------------- */
> -
> diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
> deleted file mode 100644
> index 9d236e64f5f5..000000000000
> --- a/net/ax25/af_ax25.c
> +++ /dev/null
> @@ -1,2089 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-or-later
> -/*
> - *
> - * Copyright (C) Alan Cox GW4PTS (alan@lxorguk.ukuu.org.uk)
> - * Copyright (C) Jonathan Naylor G4KLX (g4klx@g4klx.demon.co.uk)
> - * Copyright (C) Darryl Miles G7LED (dlm@g7led.demon.co.uk)
> - * Copyright (C) Steven Whitehouse GW7RRM (stevew@acm.org)
> - * Copyright (C) Joerg Reuter DL1BKE (jreuter@yaina.de)
> - * Copyright (C) Hans-Joachim Hetscher DD8NE (dd8ne@bnv-bamberg.de)
> - * Copyright (C) Hans Alblas PE1AYX (hans@esrac.ele.tue.nl)
> - * Copyright (C) Frederic Rible F1OAT (frible@teaser.fr)
> - */
> -#include <linux/capability.h>
> -#include <linux/module.h>
> -#include <linux/errno.h>
> -#include <linux/types.h>
> -#include <linux/socket.h>
> -#include <linux/in.h>
> -#include <linux/kernel.h>
> -#include <linux/sched/signal.h>
> -#include <linux/timer.h>
> -#include <linux/string.h>
> -#include <linux/sockios.h>
> -#include <linux/net.h>
> -#include <linux/slab.h>
> -#include <net/ax25.h>
> -#include <linux/inet.h>
> -#include <linux/netdevice.h>
> -#include <linux/if_arp.h>
> -#include <linux/skbuff.h>
> -#include <net/sock.h>
> -#include <linux/uaccess.h>
> -#include <linux/fcntl.h>
> -#include <linux/termios.h>	/* For TIOCINQ/OUTQ */
> -#include <linux/mm.h>
> -#include <linux/interrupt.h>
> -#include <linux/notifier.h>
> -#include <linux/proc_fs.h>
> -#include <linux/stat.h>
> -#include <linux/sysctl.h>
> -#include <linux/init.h>
> -#include <linux/spinlock.h>
> -#include <net/net_namespace.h>
> -#include <net/tcp_states.h>
> -#include <net/ip.h>
> -#include <net/arp.h>
> -
> -
> -
> -HLIST_HEAD(ax25_list);
> -DEFINE_SPINLOCK(ax25_list_lock);
> -
> -static const struct proto_ops ax25_proto_ops;
> -
> -static void ax25_free_sock(struct sock *sk)
> -{
> -	ax25_cb_put(sk_to_ax25(sk));
> -}
> -
> -/*
> - *	Socket removal during an interrupt is now safe.
> - */
> -static void ax25_cb_del(ax25_cb *ax25)
> -{
> -	spin_lock_bh(&ax25_list_lock);
> -	if (!hlist_unhashed(&ax25->ax25_node)) {
> -		hlist_del_init(&ax25->ax25_node);
> -		ax25_cb_put(ax25);
> -	}
> -	spin_unlock_bh(&ax25_list_lock);
> -}
> -
> -/*
> - *	Kill all bound sockets on a dropped device.
> - */
> -static void ax25_kill_by_device(struct net_device *dev)
> -{
> -	ax25_dev *ax25_dev;
> -	ax25_cb *s;
> -	struct sock *sk;
> -
> -	if ((ax25_dev = ax25_dev_ax25dev(dev)) == NULL)
> -		return;
> -	ax25_dev->device_up = false;
> -
> -	spin_lock_bh(&ax25_list_lock);
> -again:
> -	ax25_for_each(s, &ax25_list) {
> -		if (s->ax25_dev == ax25_dev) {
> -			sk = s->sk;
> -			if (!sk) {
> -				spin_unlock_bh(&ax25_list_lock);
> -				ax25_disconnect(s, ENETUNREACH);
> -				s->ax25_dev = NULL;
> -				ax25_cb_del(s);
> -				spin_lock_bh(&ax25_list_lock);
> -				goto again;
> -			}
> -			sock_hold(sk);
> -			spin_unlock_bh(&ax25_list_lock);
> -			lock_sock(sk);
> -			ax25_disconnect(s, ENETUNREACH);
> -			s->ax25_dev = NULL;
> -			if (sk->sk_socket) {
> -				netdev_put(ax25_dev->dev,
> -					   &s->dev_tracker);
> -				ax25_dev_put(ax25_dev);
> -			}
> -			ax25_cb_del(s);
> -			release_sock(sk);
> -			spin_lock_bh(&ax25_list_lock);
> -			sock_put(sk);
> -			/* The entry could have been deleted from the
> -			 * list meanwhile and thus the next pointer is
> -			 * no longer valid.  Play it safe and restart
> -			 * the scan.  Forward progress is ensured
> -			 * because we set s->ax25_dev to NULL and we
> -			 * are never passed a NULL 'dev' argument.
> -			 */
> -			goto again;
> -		}
> -	}
> -	spin_unlock_bh(&ax25_list_lock);
> -}
> -
> -/*
> - *	Handle device status changes.
> - */
> -static int ax25_device_event(struct notifier_block *this, unsigned long event,
> -			     void *ptr)
> -{
> -	struct net_device *dev = netdev_notifier_info_to_dev(ptr);
> -
> -	if (!net_eq(dev_net(dev), &init_net))
> -		return NOTIFY_DONE;
> -
> -	/* Reject non AX.25 devices */
> -	if (dev->type != ARPHRD_AX25)
> -		return NOTIFY_DONE;
> -
> -	switch (event) {
> -	case NETDEV_UP:
> -		ax25_dev_device_up(dev);
> -		break;
> -	case NETDEV_DOWN:
> -		ax25_kill_by_device(dev);
> -		ax25_rt_device_down(dev);
> -		ax25_dev_device_down(dev);
> -		break;
> -	default:
> -		break;
> -	}
> -
> -	return NOTIFY_DONE;
> -}
> -
> -/*
> - *	Add a socket to the bound sockets list.
> - */
> -void ax25_cb_add(ax25_cb *ax25)
> -{
> -	spin_lock_bh(&ax25_list_lock);
> -	ax25_cb_hold(ax25);
> -	hlist_add_head(&ax25->ax25_node, &ax25_list);
> -	spin_unlock_bh(&ax25_list_lock);
> -}
> -
> -/*
> - *	Find a socket that wants to accept the SABM we have just
> - *	received.
> - */
> -struct sock *ax25_find_listener(ax25_address *addr, int digi,
> -	struct net_device *dev, int type)
> -{
> -	ax25_cb *s;
> -
> -	spin_lock(&ax25_list_lock);
> -	ax25_for_each(s, &ax25_list) {
> -		if ((s->iamdigi && !digi) || (!s->iamdigi && digi))
> -			continue;
> -		if (s->sk && !ax25cmp(&s->source_addr, addr) &&
> -		    s->sk->sk_type == type && s->sk->sk_state == TCP_LISTEN) {
> -			/* If device is null we match any device */
> -			if (s->ax25_dev == NULL || s->ax25_dev->dev == dev) {
> -				sock_hold(s->sk);
> -				spin_unlock(&ax25_list_lock);
> -				return s->sk;
> -			}
> -		}
> -	}
> -	spin_unlock(&ax25_list_lock);
> -
> -	return NULL;
> -}
> -
> -/*
> - *	Find an AX.25 socket given both ends.
> - */
> -struct sock *ax25_get_socket(ax25_address *my_addr, ax25_address *dest_addr,
> -	int type)
> -{
> -	struct sock *sk = NULL;
> -	ax25_cb *s;
> -
> -	spin_lock(&ax25_list_lock);
> -	ax25_for_each(s, &ax25_list) {
> -		if (s->sk && !ax25cmp(&s->source_addr, my_addr) &&
> -		    !ax25cmp(&s->dest_addr, dest_addr) &&
> -		    s->sk->sk_type == type) {
> -			sk = s->sk;
> -			sock_hold(sk);
> -			break;
> -		}
> -	}
> -
> -	spin_unlock(&ax25_list_lock);
> -
> -	return sk;
> -}
> -
> -/*
> - *	Find an AX.25 control block given both ends. It will only pick up
> - *	floating AX.25 control blocks or non Raw socket bound control blocks.
> - */
> -ax25_cb *ax25_find_cb(const ax25_address *src_addr, ax25_address *dest_addr,
> -	ax25_digi *digi, struct net_device *dev)
> -{
> -	ax25_cb *s;
> -
> -	spin_lock_bh(&ax25_list_lock);
> -	ax25_for_each(s, &ax25_list) {
> -		if (s->sk && s->sk->sk_type != SOCK_SEQPACKET)
> -			continue;
> -		if (s->ax25_dev == NULL)
> -			continue;
> -		if (ax25cmp(&s->source_addr, src_addr) == 0 && ax25cmp(&s->dest_addr, dest_addr) == 0 && s->ax25_dev->dev == dev) {
> -			if (digi != NULL && digi->ndigi != 0) {
> -				if (s->digipeat == NULL)
> -					continue;
> -				if (ax25digicmp(s->digipeat, digi) != 0)
> -					continue;
> -			} else {
> -				if (s->digipeat != NULL && s->digipeat->ndigi != 0)
> -					continue;
> -			}
> -			ax25_cb_hold(s);
> -			spin_unlock_bh(&ax25_list_lock);
> -
> -			return s;
> -		}
> -	}
> -	spin_unlock_bh(&ax25_list_lock);
> -
> -	return NULL;
> -}
> -
> -EXPORT_SYMBOL(ax25_find_cb);
> -
> -void ax25_send_to_raw(ax25_address *addr, struct sk_buff *skb, int proto)
> -{
> -	ax25_cb *s;
> -	struct sk_buff *copy;
> -
> -	spin_lock(&ax25_list_lock);
> -	ax25_for_each(s, &ax25_list) {
> -		if (s->sk != NULL && ax25cmp(&s->source_addr, addr) == 0 &&
> -		    s->sk->sk_type == SOCK_RAW &&
> -		    s->sk->sk_protocol == proto &&
> -		    s->ax25_dev->dev == skb->dev &&
> -		    atomic_read(&s->sk->sk_rmem_alloc) <= s->sk->sk_rcvbuf) {
> -			if ((copy = skb_clone(skb, GFP_ATOMIC)) == NULL)
> -				continue;
> -			if (sock_queue_rcv_skb(s->sk, copy) != 0)
> -				kfree_skb(copy);
> -		}
> -	}
> -	spin_unlock(&ax25_list_lock);
> -}
> -
> -/*
> - *	Deferred destroy.
> - */
> -void ax25_destroy_socket(ax25_cb *);
> -
> -/*
> - *	Handler for deferred kills.
> - */
> -static void ax25_destroy_timer(struct timer_list *t)
> -{
> -	ax25_cb *ax25 = timer_container_of(ax25, t, dtimer);
> -	struct sock *sk;
> -
> -	sk=ax25->sk;
> -
> -	bh_lock_sock(sk);
> -	sock_hold(sk);
> -	ax25_destroy_socket(ax25);
> -	bh_unlock_sock(sk);
> -	sock_put(sk);
> -}
> -
> -/*
> - *	This is called from user mode and the timers. Thus it protects itself
> - *	against interrupt users but doesn't worry about being called during
> - *	work. Once it is removed from the queue no interrupt or bottom half
> - *	will touch it and we are (fairly 8-) ) safe.
> - */
> -void ax25_destroy_socket(ax25_cb *ax25)
> -{
> -	struct sk_buff *skb;
> -
> -	ax25_cb_del(ax25);
> -
> -	ax25_stop_heartbeat(ax25);
> -	ax25_stop_t1timer(ax25);
> -	ax25_stop_t2timer(ax25);
> -	ax25_stop_t3timer(ax25);
> -	ax25_stop_idletimer(ax25);
> -
> -	ax25_clear_queues(ax25);	/* Flush the queues */
> -
> -	if (ax25->sk != NULL) {
> -		while ((skb = skb_dequeue(&ax25->sk->sk_receive_queue)) != NULL) {
> -			if (skb->sk != ax25->sk) {
> -				/* A pending connection */
> -				ax25_cb *sax25 = sk_to_ax25(skb->sk);
> -
> -				/* Queue the unaccepted socket for death */
> -				sock_orphan(skb->sk);
> -
> -				/* 9A4GL: hack to release unaccepted sockets */
> -				skb->sk->sk_state = TCP_LISTEN;
> -
> -				ax25_start_heartbeat(sax25);
> -				sax25->state = AX25_STATE_0;
> -			}
> -
> -			kfree_skb(skb);
> -		}
> -		skb_queue_purge(&ax25->sk->sk_write_queue);
> -	}
> -
> -	if (ax25->sk != NULL) {
> -		if (sk_has_allocations(ax25->sk)) {
> -			/* Defer: outstanding buffers */
> -			timer_setup(&ax25->dtimer, ax25_destroy_timer, 0);
> -			ax25->dtimer.expires  = jiffies + 2 * HZ;
> -			add_timer(&ax25->dtimer);
> -		} else {
> -			struct sock *sk=ax25->sk;
> -			ax25->sk=NULL;
> -			sock_put(sk);
> -		}
> -	} else {
> -		ax25_cb_put(ax25);
> -	}
> -}
> -
> -/*
> - * dl1bke 960311: set parameters for existing AX.25 connections,
> - *		  includes a KILL command to abort any connection.
> - *		  VERY useful for debugging ;-)
> - */
> -static int ax25_ctl_ioctl(const unsigned int cmd, void __user *arg)
> -{
> -	struct ax25_ctl_struct ax25_ctl;
> -	ax25_digi digi;
> -	ax25_dev *ax25_dev;
> -	ax25_cb *ax25;
> -	unsigned int k;
> -	int ret = 0;
> -
> -	if (copy_from_user(&ax25_ctl, arg, sizeof(ax25_ctl)))
> -		return -EFAULT;
> -
> -	if (ax25_ctl.digi_count > AX25_MAX_DIGIS)
> -		return -EINVAL;
> -
> -	if (ax25_ctl.arg > ULONG_MAX / HZ && ax25_ctl.cmd != AX25_KILL)
> -		return -EINVAL;
> -
> -	ax25_dev = ax25_addr_ax25dev(&ax25_ctl.port_addr);
> -	if (!ax25_dev)
> -		return -ENODEV;
> -
> -	digi.ndigi = ax25_ctl.digi_count;
> -	for (k = 0; k < digi.ndigi; k++)
> -		digi.calls[k] = ax25_ctl.digi_addr[k];
> -
> -	ax25 = ax25_find_cb(&ax25_ctl.source_addr, &ax25_ctl.dest_addr, &digi, ax25_dev->dev);
> -	if (!ax25) {
> -		ax25_dev_put(ax25_dev);
> -		return -ENOTCONN;
> -	}
> -
> -	switch (ax25_ctl.cmd) {
> -	case AX25_KILL:
> -		ax25_send_control(ax25, AX25_DISC, AX25_POLLON, AX25_COMMAND);
> -#ifdef CONFIG_AX25_DAMA_SLAVE
> -		if (ax25_dev->dama.slave && ax25->ax25_dev->values[AX25_VALUES_PROTOCOL] == AX25_PROTO_DAMA_SLAVE)
> -			ax25_dama_off(ax25);
> -#endif
> -		ax25_disconnect(ax25, ENETRESET);
> -		break;
> -
> -	case AX25_WINDOW:
> -		if (ax25->modulus == AX25_MODULUS) {
> -			if (ax25_ctl.arg < 1 || ax25_ctl.arg > 7)
> -				goto einval_put;
> -		} else {
> -			if (ax25_ctl.arg < 1 || ax25_ctl.arg > 63)
> -				goto einval_put;
> -		}
> -		ax25->window = ax25_ctl.arg;
> -		break;
> -
> -	case AX25_T1:
> -		if (ax25_ctl.arg < 1 || ax25_ctl.arg > ULONG_MAX / HZ)
> -			goto einval_put;
> -		ax25->rtt = (ax25_ctl.arg * HZ) / 2;
> -		ax25->t1  = ax25_ctl.arg * HZ;
> -		break;
> -
> -	case AX25_T2:
> -		if (ax25_ctl.arg < 1 || ax25_ctl.arg > ULONG_MAX / HZ)
> -			goto einval_put;
> -		ax25->t2 = ax25_ctl.arg * HZ;
> -		break;
> -
> -	case AX25_N2:
> -		if (ax25_ctl.arg < 1 || ax25_ctl.arg > 31)
> -			goto einval_put;
> -		ax25->n2count = 0;
> -		ax25->n2 = ax25_ctl.arg;
> -		break;
> -
> -	case AX25_T3:
> -		if (ax25_ctl.arg > ULONG_MAX / HZ)
> -			goto einval_put;
> -		ax25->t3 = ax25_ctl.arg * HZ;
> -		break;
> -
> -	case AX25_IDLE:
> -		if (ax25_ctl.arg > ULONG_MAX / (60 * HZ))
> -			goto einval_put;
> -
> -		ax25->idle = ax25_ctl.arg * 60 * HZ;
> -		break;
> -
> -	case AX25_PACLEN:
> -		if (ax25_ctl.arg < 16 || ax25_ctl.arg > 65535)
> -			goto einval_put;
> -		ax25->paclen = ax25_ctl.arg;
> -		break;
> -
> -	default:
> -		goto einval_put;
> -	  }
> -
> -out_put:
> -	ax25_dev_put(ax25_dev);
> -	ax25_cb_put(ax25);
> -	return ret;
> -
> -einval_put:
> -	ret = -EINVAL;
> -	goto out_put;
> -}
> -
> -static void ax25_fillin_cb_from_dev(ax25_cb *ax25, const ax25_dev *ax25_dev)
> -{
> -	ax25->rtt     = msecs_to_jiffies(ax25_dev->values[AX25_VALUES_T1]) / 2;
> -	ax25->t1      = msecs_to_jiffies(ax25_dev->values[AX25_VALUES_T1]);
> -	ax25->t2      = msecs_to_jiffies(ax25_dev->values[AX25_VALUES_T2]);
> -	ax25->t3      = msecs_to_jiffies(ax25_dev->values[AX25_VALUES_T3]);
> -	ax25->n2      = ax25_dev->values[AX25_VALUES_N2];
> -	ax25->paclen  = ax25_dev->values[AX25_VALUES_PACLEN];
> -	ax25->idle    = msecs_to_jiffies(ax25_dev->values[AX25_VALUES_IDLE]);
> -	ax25->backoff = ax25_dev->values[AX25_VALUES_BACKOFF];
> -
> -	if (ax25_dev->values[AX25_VALUES_AXDEFMODE]) {
> -		ax25->modulus = AX25_EMODULUS;
> -		ax25->window  = ax25_dev->values[AX25_VALUES_EWINDOW];
> -	} else {
> -		ax25->modulus = AX25_MODULUS;
> -		ax25->window  = ax25_dev->values[AX25_VALUES_WINDOW];
> -	}
> -}
> -
> -/*
> - *	Fill in a created AX.25 created control block with the default
> - *	values for a particular device.
> - */
> -void ax25_fillin_cb(ax25_cb *ax25, ax25_dev *ax25_dev)
> -{
> -	ax25->ax25_dev = ax25_dev;
> -
> -	if (ax25->ax25_dev != NULL) {
> -		ax25_fillin_cb_from_dev(ax25, ax25_dev);
> -		return;
> -	}
> -
> -	/*
> -	 * No device, use kernel / AX.25 spec default values
> -	 */
> -	ax25->rtt     = msecs_to_jiffies(AX25_DEF_T1) / 2;
> -	ax25->t1      = msecs_to_jiffies(AX25_DEF_T1);
> -	ax25->t2      = msecs_to_jiffies(AX25_DEF_T2);
> -	ax25->t3      = msecs_to_jiffies(AX25_DEF_T3);
> -	ax25->n2      = AX25_DEF_N2;
> -	ax25->paclen  = AX25_DEF_PACLEN;
> -	ax25->idle    = msecs_to_jiffies(AX25_DEF_IDLE);
> -	ax25->backoff = AX25_DEF_BACKOFF;
> -
> -	if (AX25_DEF_AXDEFMODE) {
> -		ax25->modulus = AX25_EMODULUS;
> -		ax25->window  = AX25_DEF_EWINDOW;
> -	} else {
> -		ax25->modulus = AX25_MODULUS;
> -		ax25->window  = AX25_DEF_WINDOW;
> -	}
> -}
> -
> -/*
> - * Create an empty AX.25 control block.
> - */
> -ax25_cb *ax25_create_cb(void)
> -{
> -	ax25_cb *ax25;
> -
> -	if ((ax25 = kzalloc_obj(*ax25, GFP_ATOMIC)) == NULL)
> -		return NULL;
> -
> -	refcount_set(&ax25->refcount, 1);
> -
> -	skb_queue_head_init(&ax25->write_queue);
> -	skb_queue_head_init(&ax25->frag_queue);
> -	skb_queue_head_init(&ax25->ack_queue);
> -	skb_queue_head_init(&ax25->reseq_queue);
> -
> -	ax25_setup_timers(ax25);
> -
> -	ax25_fillin_cb(ax25, NULL);
> -
> -	ax25->state = AX25_STATE_0;
> -
> -	return ax25;
> -}
> -
> -/*
> - *	Handling for system calls applied via the various interfaces to an
> - *	AX25 socket object
> - */
> -
> -static int ax25_setsockopt(struct socket *sock, int level, int optname,
> -		sockptr_t optval, unsigned int optlen)
> -{
> -	struct sock *sk = sock->sk;
> -	ax25_cb *ax25;
> -	struct net_device *dev;
> -	char devname[IFNAMSIZ];
> -	unsigned int opt;
> -	int res = 0;
> -
> -	if (level != SOL_AX25)
> -		return -ENOPROTOOPT;
> -
> -	if (optlen < sizeof(unsigned int))
> -		return -EINVAL;
> -
> -	if (copy_from_sockptr(&opt, optval, sizeof(unsigned int)))
> -		return -EFAULT;
> -
> -	lock_sock(sk);
> -	ax25 = sk_to_ax25(sk);
> -
> -	switch (optname) {
> -	case AX25_WINDOW:
> -		if (ax25->modulus == AX25_MODULUS) {
> -			if (opt < 1 || opt > 7) {
> -				res = -EINVAL;
> -				break;
> -			}
> -		} else {
> -			if (opt < 1 || opt > 63) {
> -				res = -EINVAL;
> -				break;
> -			}
> -		}
> -		ax25->window = opt;
> -		break;
> -
> -	case AX25_T1:
> -		if (opt < 1 || opt > UINT_MAX / HZ) {
> -			res = -EINVAL;
> -			break;
> -		}
> -		ax25->rtt = (opt * HZ) >> 1;
> -		ax25->t1  = opt * HZ;
> -		break;
> -
> -	case AX25_T2:
> -		if (opt < 1 || opt > UINT_MAX / HZ) {
> -			res = -EINVAL;
> -			break;
> -		}
> -		ax25->t2 = opt * HZ;
> -		break;
> -
> -	case AX25_N2:
> -		if (opt < 1 || opt > 31) {
> -			res = -EINVAL;
> -			break;
> -		}
> -		ax25->n2 = opt;
> -		break;
> -
> -	case AX25_T3:
> -		if (opt < 1 || opt > UINT_MAX / HZ) {
> -			res = -EINVAL;
> -			break;
> -		}
> -		ax25->t3 = opt * HZ;
> -		break;
> -
> -	case AX25_IDLE:
> -		if (opt > UINT_MAX / (60 * HZ)) {
> -			res = -EINVAL;
> -			break;
> -		}
> -		ax25->idle = opt * 60 * HZ;
> -		break;
> -
> -	case AX25_BACKOFF:
> -		if (opt > 2) {
> -			res = -EINVAL;
> -			break;
> -		}
> -		ax25->backoff = opt;
> -		break;
> -
> -	case AX25_EXTSEQ:
> -		ax25->modulus = opt ? AX25_EMODULUS : AX25_MODULUS;
> -		break;
> -
> -	case AX25_PIDINCL:
> -		ax25->pidincl = opt ? 1 : 0;
> -		break;
> -
> -	case AX25_IAMDIGI:
> -		ax25->iamdigi = opt ? 1 : 0;
> -		break;
> -
> -	case AX25_PACLEN:
> -		if (opt < 16 || opt > 65535) {
> -			res = -EINVAL;
> -			break;
> -		}
> -		ax25->paclen = opt;
> -		break;
> -
> -	case SO_BINDTODEVICE:
> -		if (optlen > IFNAMSIZ - 1)
> -			optlen = IFNAMSIZ - 1;
> -
> -		memset(devname, 0, sizeof(devname));
> -
> -		if (copy_from_sockptr(devname, optval, optlen)) {
> -			res = -EFAULT;
> -			break;
> -		}
> -
> -		if (sk->sk_type == SOCK_SEQPACKET &&
> -		   (sock->state != SS_UNCONNECTED ||
> -		    sk->sk_state == TCP_LISTEN)) {
> -			res = -EADDRNOTAVAIL;
> -			break;
> -		}
> -
> -		rcu_read_lock();
> -		dev = dev_get_by_name_rcu(&init_net, devname);
> -		if (!dev) {
> -			rcu_read_unlock();
> -			res = -ENODEV;
> -			break;
> -		}
> -
> -		if (ax25->ax25_dev) {
> -			if (dev == ax25->ax25_dev->dev) {
> -				rcu_read_unlock();
> -				break;
> -			}
> -			netdev_put(ax25->ax25_dev->dev, &ax25->dev_tracker);
> -			ax25_dev_put(ax25->ax25_dev);
> -		}
> -
> -		ax25->ax25_dev = ax25_dev_ax25dev(dev);
> -		if (!ax25->ax25_dev) {
> -			rcu_read_unlock();
> -			res = -ENODEV;
> -			break;
> -		}
> -		ax25_fillin_cb(ax25, ax25->ax25_dev);
> -		netdev_hold(dev, &ax25->dev_tracker, GFP_ATOMIC);
> -		ax25_dev_hold(ax25->ax25_dev);
> -		rcu_read_unlock();
> -		break;
> -
> -	default:
> -		res = -ENOPROTOOPT;
> -	}
> -	release_sock(sk);
> -
> -	return res;
> -}
> -
> -static int ax25_getsockopt(struct socket *sock, int level, int optname,
> -	char __user *optval, int __user *optlen)
> -{
> -	struct sock *sk = sock->sk;
> -	ax25_cb *ax25;
> -	struct ax25_dev *ax25_dev;
> -	char devname[IFNAMSIZ];
> -	void *valptr;
> -	int val = 0;
> -	int maxlen, length;
> -
> -	if (level != SOL_AX25)
> -		return -ENOPROTOOPT;
> -
> -	if (get_user(maxlen, optlen))
> -		return -EFAULT;
> -
> -	if (maxlen < 1)
> -		return -EFAULT;
> -
> -	valptr = &val;
> -	length = min_t(unsigned int, maxlen, sizeof(int));
> -
> -	lock_sock(sk);
> -	ax25 = sk_to_ax25(sk);
> -
> -	switch (optname) {
> -	case AX25_WINDOW:
> -		val = ax25->window;
> -		break;
> -
> -	case AX25_T1:
> -		val = ax25->t1 / HZ;
> -		break;
> -
> -	case AX25_T2:
> -		val = ax25->t2 / HZ;
> -		break;
> -
> -	case AX25_N2:
> -		val = ax25->n2;
> -		break;
> -
> -	case AX25_T3:
> -		val = ax25->t3 / HZ;
> -		break;
> -
> -	case AX25_IDLE:
> -		val = ax25->idle / (60 * HZ);
> -		break;
> -
> -	case AX25_BACKOFF:
> -		val = ax25->backoff;
> -		break;
> -
> -	case AX25_EXTSEQ:
> -		val = (ax25->modulus == AX25_EMODULUS);
> -		break;
> -
> -	case AX25_PIDINCL:
> -		val = ax25->pidincl;
> -		break;
> -
> -	case AX25_IAMDIGI:
> -		val = ax25->iamdigi;
> -		break;
> -
> -	case AX25_PACLEN:
> -		val = ax25->paclen;
> -		break;
> -
> -	case SO_BINDTODEVICE:
> -		ax25_dev = ax25->ax25_dev;
> -
> -		if (ax25_dev != NULL && ax25_dev->dev != NULL) {
> -			strscpy(devname, ax25_dev->dev->name, sizeof(devname));
> -			length = strlen(devname) + 1;
> -		} else {
> -			*devname = '\0';
> -			length = 1;
> -		}
> -
> -		valptr = devname;
> -		break;
> -
> -	default:
> -		release_sock(sk);
> -		return -ENOPROTOOPT;
> -	}
> -	release_sock(sk);
> -
> -	if (put_user(length, optlen))
> -		return -EFAULT;
> -
> -	return copy_to_user(optval, valptr, length) ? -EFAULT : 0;
> -}
> -
> -static int ax25_listen(struct socket *sock, int backlog)
> -{
> -	struct sock *sk = sock->sk;
> -	int res = 0;
> -
> -	lock_sock(sk);
> -	if (sk->sk_type == SOCK_SEQPACKET && sk->sk_state != TCP_LISTEN) {
> -		sk->sk_max_ack_backlog = backlog;
> -		sk->sk_state           = TCP_LISTEN;
> -		goto out;
> -	}
> -	res = -EOPNOTSUPP;
> -
> -out:
> -	release_sock(sk);
> -
> -	return res;
> -}
> -
> -/*
> - * XXX: when creating ax25_sock we should update the .obj_size setting
> - * below.
> - */
> -static struct proto ax25_proto = {
> -	.name	  = "AX25",
> -	.owner	  = THIS_MODULE,
> -	.obj_size = sizeof(struct ax25_sock),
> -};
> -
> -static int ax25_create(struct net *net, struct socket *sock, int protocol,
> -		       int kern)
> -{
> -	struct sock *sk;
> -	ax25_cb *ax25;
> -
> -	if (protocol < 0 || protocol > U8_MAX)
> -		return -EINVAL;
> -
> -	if (!net_eq(net, &init_net))
> -		return -EAFNOSUPPORT;
> -
> -	switch (sock->type) {
> -	case SOCK_DGRAM:
> -		if (protocol == 0 || protocol == PF_AX25)
> -			protocol = AX25_P_TEXT;
> -		break;
> -
> -	case SOCK_SEQPACKET:
> -		switch (protocol) {
> -		case 0:
> -		case PF_AX25:	/* For CLX */
> -			protocol = AX25_P_TEXT;
> -			break;
> -		case AX25_P_SEGMENT:
> -#ifdef CONFIG_INET
> -		case AX25_P_ARP:
> -		case AX25_P_IP:
> -#endif
> -#ifdef CONFIG_NETROM
> -		case AX25_P_NETROM:
> -#endif
> -#ifdef CONFIG_ROSE
> -		case AX25_P_ROSE:
> -#endif
> -			return -ESOCKTNOSUPPORT;
> -#ifdef CONFIG_NETROM_MODULE
> -		case AX25_P_NETROM:
> -			if (ax25_protocol_is_registered(AX25_P_NETROM))
> -				return -ESOCKTNOSUPPORT;
> -			break;
> -#endif
> -#ifdef CONFIG_ROSE_MODULE
> -		case AX25_P_ROSE:
> -			if (ax25_protocol_is_registered(AX25_P_ROSE))
> -				return -ESOCKTNOSUPPORT;
> -			break;
> -#endif
> -		default:
> -			break;
> -		}
> -		break;
> -
> -	case SOCK_RAW:
> -		if (!capable(CAP_NET_RAW))
> -			return -EPERM;
> -		break;
> -	default:
> -		return -ESOCKTNOSUPPORT;
> -	}
> -
> -	sk = sk_alloc(net, PF_AX25, GFP_ATOMIC, &ax25_proto, kern);
> -	if (sk == NULL)
> -		return -ENOMEM;
> -
> -	ax25 = ax25_sk(sk)->cb = ax25_create_cb();
> -	if (!ax25) {
> -		sk_free(sk);
> -		return -ENOMEM;
> -	}
> -
> -	sock_init_data(sock, sk);
> -
> -	sk->sk_destruct = ax25_free_sock;
> -	sock->ops    = &ax25_proto_ops;
> -	sk->sk_protocol = protocol;
> -
> -	ax25->sk    = sk;
> -
> -	return 0;
> -}
> -
> -struct sock *ax25_make_new(struct sock *osk, struct ax25_dev *ax25_dev)
> -{
> -	struct sock *sk;
> -	ax25_cb *ax25, *oax25;
> -
> -	sk = sk_alloc(sock_net(osk), PF_AX25, GFP_ATOMIC, osk->sk_prot, 0);
> -	if (sk == NULL)
> -		return NULL;
> -
> -	if ((ax25 = ax25_create_cb()) == NULL) {
> -		sk_free(sk);
> -		return NULL;
> -	}
> -
> -	switch (osk->sk_type) {
> -	case SOCK_DGRAM:
> -		break;
> -	case SOCK_SEQPACKET:
> -		break;
> -	default:
> -		sk_free(sk);
> -		ax25_cb_put(ax25);
> -		return NULL;
> -	}
> -
> -	sock_init_data(NULL, sk);
> -
> -	sk->sk_type     = osk->sk_type;
> -	sk->sk_priority = READ_ONCE(osk->sk_priority);
> -	sk->sk_protocol = osk->sk_protocol;
> -	sk->sk_rcvbuf   = osk->sk_rcvbuf;
> -	sk->sk_sndbuf   = osk->sk_sndbuf;
> -	sk->sk_state    = TCP_ESTABLISHED;
> -	sock_copy_flags(sk, osk);
> -
> -	oax25 = sk_to_ax25(osk);
> -
> -	ax25->modulus = oax25->modulus;
> -	ax25->backoff = oax25->backoff;
> -	ax25->pidincl = oax25->pidincl;
> -	ax25->iamdigi = oax25->iamdigi;
> -	ax25->rtt     = oax25->rtt;
> -	ax25->t1      = oax25->t1;
> -	ax25->t2      = oax25->t2;
> -	ax25->t3      = oax25->t3;
> -	ax25->n2      = oax25->n2;
> -	ax25->idle    = oax25->idle;
> -	ax25->paclen  = oax25->paclen;
> -	ax25->window  = oax25->window;
> -
> -	ax25->ax25_dev    = ax25_dev;
> -	ax25->source_addr = oax25->source_addr;
> -
> -	if (oax25->digipeat != NULL) {
> -		ax25->digipeat = kmemdup(oax25->digipeat, sizeof(ax25_digi),
> -					 GFP_ATOMIC);
> -		if (ax25->digipeat == NULL) {
> -			sk_free(sk);
> -			ax25_cb_put(ax25);
> -			return NULL;
> -		}
> -	}
> -
> -	ax25_sk(sk)->cb = ax25;
> -	sk->sk_destruct = ax25_free_sock;
> -	ax25->sk    = sk;
> -
> -	return sk;
> -}
> -
> -static int ax25_release(struct socket *sock)
> -{
> -	struct sock *sk = sock->sk;
> -	ax25_cb *ax25;
> -	ax25_dev *ax25_dev;
> -
> -	if (sk == NULL)
> -		return 0;
> -
> -	sock_hold(sk);
> -	lock_sock(sk);
> -	sock_orphan(sk);
> -	ax25 = sk_to_ax25(sk);
> -	ax25_dev = ax25->ax25_dev;
> -
> -	if (sk->sk_type == SOCK_SEQPACKET) {
> -		switch (ax25->state) {
> -		case AX25_STATE_0:
> -			if (!sock_flag(ax25->sk, SOCK_DEAD)) {
> -				release_sock(sk);
> -				ax25_disconnect(ax25, 0);
> -				lock_sock(sk);
> -			}
> -			ax25_destroy_socket(ax25);
> -			break;
> -
> -		case AX25_STATE_1:
> -		case AX25_STATE_2:
> -			ax25_send_control(ax25, AX25_DISC, AX25_POLLON, AX25_COMMAND);
> -			release_sock(sk);
> -			ax25_disconnect(ax25, 0);
> -			lock_sock(sk);
> -			if (!sock_flag(ax25->sk, SOCK_DESTROY))
> -				ax25_destroy_socket(ax25);
> -			break;
> -
> -		case AX25_STATE_3:
> -		case AX25_STATE_4:
> -			ax25_clear_queues(ax25);
> -			ax25->n2count = 0;
> -
> -			switch (ax25->ax25_dev->values[AX25_VALUES_PROTOCOL]) {
> -			case AX25_PROTO_STD_SIMPLEX:
> -			case AX25_PROTO_STD_DUPLEX:
> -				ax25_send_control(ax25,
> -						  AX25_DISC,
> -						  AX25_POLLON,
> -						  AX25_COMMAND);
> -				ax25_stop_t2timer(ax25);
> -				ax25_stop_t3timer(ax25);
> -				ax25_stop_idletimer(ax25);
> -				break;
> -#ifdef CONFIG_AX25_DAMA_SLAVE
> -			case AX25_PROTO_DAMA_SLAVE:
> -				ax25_stop_t3timer(ax25);
> -				ax25_stop_idletimer(ax25);
> -				break;
> -#endif
> -			}
> -			ax25_calculate_t1(ax25);
> -			ax25_start_t1timer(ax25);
> -			ax25->state = AX25_STATE_2;
> -			sk->sk_state                = TCP_CLOSE;
> -			sk->sk_shutdown            |= SEND_SHUTDOWN;
> -			sk->sk_state_change(sk);
> -			sock_set_flag(sk, SOCK_DESTROY);
> -			break;
> -
> -		default:
> -			break;
> -		}
> -	} else {
> -		sk->sk_state     = TCP_CLOSE;
> -		sk->sk_shutdown |= SEND_SHUTDOWN;
> -		sk->sk_state_change(sk);
> -		ax25_destroy_socket(ax25);
> -	}
> -	if (ax25_dev) {
> -		if (!ax25_dev->device_up) {
> -			timer_delete_sync(&ax25->timer);
> -			timer_delete_sync(&ax25->t1timer);
> -			timer_delete_sync(&ax25->t2timer);
> -			timer_delete_sync(&ax25->t3timer);
> -			timer_delete_sync(&ax25->idletimer);
> -		}
> -		netdev_put(ax25_dev->dev, &ax25->dev_tracker);
> -		ax25_dev_put(ax25_dev);
> -	}
> -
> -	sock->sk   = NULL;
> -	release_sock(sk);
> -	sock_put(sk);
> -
> -	return 0;
> -}
> -
> -/*
> - *	We support a funny extension here so you can (as root) give any callsign
> - *	digipeated via a local address as source. This hack is obsolete now
> - *	that we've implemented support for SO_BINDTODEVICE. It is however small
> - *	and trivially backward compatible.
> - */
> -static int ax25_bind(struct socket *sock, struct sockaddr_unsized *uaddr, int addr_len)
> -{
> -	struct sock *sk = sock->sk;
> -	struct full_sockaddr_ax25 *addr = (struct full_sockaddr_ax25 *)uaddr;
> -	ax25_dev *ax25_dev = NULL;
> -	ax25_uid_assoc *user;
> -	ax25_address call;
> -	ax25_cb *ax25;
> -	int err = 0;
> -
> -	if (addr_len != sizeof(struct sockaddr_ax25) &&
> -	    addr_len != sizeof(struct full_sockaddr_ax25))
> -		/* support for old structure may go away some time
> -		 * ax25_bind(): uses old (6 digipeater) socket structure.
> -		 */
> -		if ((addr_len < sizeof(struct sockaddr_ax25) + sizeof(ax25_address) * 6) ||
> -		    (addr_len > sizeof(struct full_sockaddr_ax25)))
> -			return -EINVAL;
> -
> -	if (addr->fsa_ax25.sax25_family != AF_AX25)
> -		return -EINVAL;
> -
> -	user = ax25_findbyuid(current_euid());
> -	if (user) {
> -		call = user->call;
> -		ax25_uid_put(user);
> -	} else {
> -		if (ax25_uid_policy && !capable(CAP_NET_ADMIN))
> -			return -EACCES;
> -
> -		call = addr->fsa_ax25.sax25_call;
> -	}
> -
> -	lock_sock(sk);
> -
> -	ax25 = sk_to_ax25(sk);
> -	if (!sock_flag(sk, SOCK_ZAPPED)) {
> -		err = -EINVAL;
> -		goto out;
> -	}
> -
> -	ax25->source_addr = call;
> -
> -	/*
> -	 * User already set interface with SO_BINDTODEVICE
> -	 */
> -	if (ax25->ax25_dev != NULL)
> -		goto done;
> -
> -	if (addr_len > sizeof(struct sockaddr_ax25) && addr->fsa_ax25.sax25_ndigis == 1) {
> -		if (ax25cmp(&addr->fsa_digipeater[0], &null_ax25_address) != 0 &&
> -		    (ax25_dev = ax25_addr_ax25dev(&addr->fsa_digipeater[0])) == NULL) {
> -			err = -EADDRNOTAVAIL;
> -			goto out;
> -		}
> -	} else {
> -		if ((ax25_dev = ax25_addr_ax25dev(&addr->fsa_ax25.sax25_call)) == NULL) {
> -			err = -EADDRNOTAVAIL;
> -			goto out;
> -		}
> -	}
> -
> -	if (ax25_dev) {
> -		ax25_fillin_cb(ax25, ax25_dev);
> -		netdev_hold(ax25_dev->dev, &ax25->dev_tracker, GFP_ATOMIC);
> -	}
> -
> -done:
> -	ax25_cb_add(ax25);
> -	sock_reset_flag(sk, SOCK_ZAPPED);
> -
> -out:
> -	release_sock(sk);
> -
> -	return err;
> -}
> -
> -/*
> - *	FIXME: nonblock behaviour looks like it may have a bug.
> - */
> -static int __must_check ax25_connect(struct socket *sock,
> -	struct sockaddr_unsized *uaddr, int addr_len, int flags)
> -{
> -	struct sock *sk = sock->sk;
> -	ax25_cb *ax25 = sk_to_ax25(sk), *ax25t;
> -	struct full_sockaddr_ax25 *fsa = (struct full_sockaddr_ax25 *)uaddr;
> -	ax25_digi *digi = NULL;
> -	int ct = 0, err = 0;
> -
> -	/*
> -	 * some sanity checks. code further down depends on this
> -	 */
> -
> -	if (addr_len == sizeof(struct sockaddr_ax25))
> -		/* support for this will go away in early 2.5.x
> -		 * ax25_connect(): uses obsolete socket structure
> -		 */
> -		;
> -	else if (addr_len != sizeof(struct full_sockaddr_ax25))
> -		/* support for old structure may go away some time
> -		 * ax25_connect(): uses old (6 digipeater) socket structure.
> -		 */
> -		if ((addr_len < sizeof(struct sockaddr_ax25) + sizeof(ax25_address) * 6) ||
> -		    (addr_len > sizeof(struct full_sockaddr_ax25)))
> -			return -EINVAL;
> -
> -
> -	if (fsa->fsa_ax25.sax25_family != AF_AX25)
> -		return -EINVAL;
> -
> -	lock_sock(sk);
> -
> -	/* deal with restarts */
> -	if (sock->state == SS_CONNECTING) {
> -		switch (sk->sk_state) {
> -		case TCP_SYN_SENT: /* still trying */
> -			err = -EINPROGRESS;
> -			goto out_release;
> -
> -		case TCP_ESTABLISHED: /* connection established */
> -			sock->state = SS_CONNECTED;
> -			goto out_release;
> -
> -		case TCP_CLOSE: /* connection refused */
> -			sock->state = SS_UNCONNECTED;
> -			err = -ECONNREFUSED;
> -			goto out_release;
> -		}
> -	}
> -
> -	if (sk->sk_state == TCP_ESTABLISHED && sk->sk_type == SOCK_SEQPACKET) {
> -		err = -EISCONN;	/* No reconnect on a seqpacket socket */
> -		goto out_release;
> -	}
> -
> -	sk->sk_state   = TCP_CLOSE;
> -	sock->state = SS_UNCONNECTED;
> -
> -	kfree(ax25->digipeat);
> -	ax25->digipeat = NULL;
> -
> -	/*
> -	 *	Handle digi-peaters to be used.
> -	 */
> -	if (addr_len > sizeof(struct sockaddr_ax25) &&
> -	    fsa->fsa_ax25.sax25_ndigis != 0) {
> -		/* Valid number of digipeaters ? */
> -		if (fsa->fsa_ax25.sax25_ndigis < 1 ||
> -		    fsa->fsa_ax25.sax25_ndigis > AX25_MAX_DIGIS ||
> -		    addr_len < sizeof(struct sockaddr_ax25) +
> -		    sizeof(ax25_address) * fsa->fsa_ax25.sax25_ndigis) {
> -			err = -EINVAL;
> -			goto out_release;
> -		}
> -
> -		if ((digi = kmalloc_obj(ax25_digi)) == NULL) {
> -			err = -ENOBUFS;
> -			goto out_release;
> -		}
> -
> -		digi->ndigi      = fsa->fsa_ax25.sax25_ndigis;
> -		digi->lastrepeat = -1;
> -
> -		while (ct < fsa->fsa_ax25.sax25_ndigis) {
> -			if ((fsa->fsa_digipeater[ct].ax25_call[6] &
> -			     AX25_HBIT) && ax25->iamdigi) {
> -				digi->repeated[ct] = 1;
> -				digi->lastrepeat   = ct;
> -			} else {
> -				digi->repeated[ct] = 0;
> -			}
> -			digi->calls[ct] = fsa->fsa_digipeater[ct];
> -			ct++;
> -		}
> -	}
> -
> -	/* Must bind first - autobinding does not work. */
> -	if (sock_flag(sk, SOCK_ZAPPED)) {
> -		kfree(digi);
> -		err = -EINVAL;
> -		goto out_release;
> -	}
> -
> -	/* Check to see if the device has been filled in, error if it hasn't. */
> -	if (ax25->ax25_dev == NULL) {
> -		kfree(digi);
> -		err = -EHOSTUNREACH;
> -		goto out_release;
> -	}
> -
> -	if (sk->sk_type == SOCK_SEQPACKET &&
> -	    (ax25t=ax25_find_cb(&ax25->source_addr, &fsa->fsa_ax25.sax25_call, digi,
> -			 ax25->ax25_dev->dev))) {
> -		kfree(digi);
> -		err = -EADDRINUSE;		/* Already such a connection */
> -		ax25_cb_put(ax25t);
> -		goto out_release;
> -	}
> -
> -	ax25->dest_addr = fsa->fsa_ax25.sax25_call;
> -	ax25->digipeat  = digi;
> -
> -	/* First the easy one */
> -	if (sk->sk_type != SOCK_SEQPACKET) {
> -		sock->state = SS_CONNECTED;
> -		sk->sk_state   = TCP_ESTABLISHED;
> -		goto out_release;
> -	}
> -
> -	/* Move to connecting socket, ax.25 lapb WAIT_UA.. */
> -	sock->state        = SS_CONNECTING;
> -	sk->sk_state          = TCP_SYN_SENT;
> -
> -	switch (ax25->ax25_dev->values[AX25_VALUES_PROTOCOL]) {
> -	case AX25_PROTO_STD_SIMPLEX:
> -	case AX25_PROTO_STD_DUPLEX:
> -		ax25_std_establish_data_link(ax25);
> -		break;
> -
> -#ifdef CONFIG_AX25_DAMA_SLAVE
> -	case AX25_PROTO_DAMA_SLAVE:
> -		ax25->modulus = AX25_MODULUS;
> -		ax25->window  = ax25->ax25_dev->values[AX25_VALUES_WINDOW];
> -		if (ax25->ax25_dev->dama.slave)
> -			ax25_ds_establish_data_link(ax25);
> -		else
> -			ax25_std_establish_data_link(ax25);
> -		break;
> -#endif
> -	}
> -
> -	ax25->state = AX25_STATE_1;
> -
> -	ax25_start_heartbeat(ax25);
> -
> -	/* Now the loop */
> -	if (sk->sk_state != TCP_ESTABLISHED && (flags & O_NONBLOCK)) {
> -		err = -EINPROGRESS;
> -		goto out_release;
> -	}
> -
> -	if (sk->sk_state == TCP_SYN_SENT) {
> -		DEFINE_WAIT(wait);
> -
> -		for (;;) {
> -			prepare_to_wait(sk_sleep(sk), &wait,
> -					TASK_INTERRUPTIBLE);
> -			if (sk->sk_state != TCP_SYN_SENT)
> -				break;
> -			if (!signal_pending(current)) {
> -				release_sock(sk);
> -				schedule();
> -				lock_sock(sk);
> -				continue;
> -			}
> -			err = -ERESTARTSYS;
> -			break;
> -		}
> -		finish_wait(sk_sleep(sk), &wait);
> -
> -		if (err)
> -			goto out_release;
> -	}
> -
> -	if (sk->sk_state != TCP_ESTABLISHED) {
> -		/* Not in ABM, not in WAIT_UA -> failed */
> -		sock->state = SS_UNCONNECTED;
> -		err = sock_error(sk);	/* Always set at this point */
> -		goto out_release;
> -	}
> -
> -	sock->state = SS_CONNECTED;
> -
> -	err = 0;
> -out_release:
> -	release_sock(sk);
> -
> -	return err;
> -}
> -
> -static int ax25_accept(struct socket *sock, struct socket *newsock,
> -		       struct proto_accept_arg *arg)
> -{
> -	struct sk_buff *skb;
> -	struct sock *newsk;
> -	ax25_dev *ax25_dev;
> -	DEFINE_WAIT(wait);
> -	struct sock *sk;
> -	ax25_cb *ax25;
> -	int err = 0;
> -
> -	if (sock->state != SS_UNCONNECTED)
> -		return -EINVAL;
> -
> -	if ((sk = sock->sk) == NULL)
> -		return -EINVAL;
> -
> -	lock_sock(sk);
> -	if (sk->sk_type != SOCK_SEQPACKET) {
> -		err = -EOPNOTSUPP;
> -		goto out;
> -	}
> -
> -	if (sk->sk_state != TCP_LISTEN) {
> -		err = -EINVAL;
> -		goto out;
> -	}
> -
> -	/*
> -	 *	The read queue this time is holding sockets ready to use
> -	 *	hooked into the SABM we saved
> -	 */
> -	for (;;) {
> -		prepare_to_wait(sk_sleep(sk), &wait, TASK_INTERRUPTIBLE);
> -		skb = skb_dequeue(&sk->sk_receive_queue);
> -		if (skb)
> -			break;
> -
> -		if (arg->flags & O_NONBLOCK) {
> -			err = -EWOULDBLOCK;
> -			break;
> -		}
> -		if (!signal_pending(current)) {
> -			release_sock(sk);
> -			schedule();
> -			lock_sock(sk);
> -			continue;
> -		}
> -		err = -ERESTARTSYS;
> -		break;
> -	}
> -	finish_wait(sk_sleep(sk), &wait);
> -
> -	if (err)
> -		goto out;
> -
> -	newsk		 = skb->sk;
> -	sock_graft(newsk, newsock);
> -
> -	/* Now attach up the new socket */
> -	kfree_skb(skb);
> -	sk_acceptq_removed(sk);
> -	newsock->state = SS_CONNECTED;
> -	ax25 = sk_to_ax25(newsk);
> -	ax25_dev = ax25->ax25_dev;
> -	netdev_hold(ax25_dev->dev, &ax25->dev_tracker, GFP_ATOMIC);
> -	ax25_dev_hold(ax25_dev);
> -
> -out:
> -	release_sock(sk);
> -
> -	return err;
> -}
> -
> -static int ax25_getname(struct socket *sock, struct sockaddr *uaddr,
> -	int peer)
> -{
> -	struct full_sockaddr_ax25 *fsa = (struct full_sockaddr_ax25 *)uaddr;
> -	struct sock *sk = sock->sk;
> -	unsigned char ndigi, i;
> -	ax25_cb *ax25;
> -	int err = 0;
> -
> -	memset(fsa, 0, sizeof(*fsa));
> -	lock_sock(sk);
> -	ax25 = sk_to_ax25(sk);
> -
> -	if (peer != 0) {
> -		if (sk->sk_state != TCP_ESTABLISHED) {
> -			err = -ENOTCONN;
> -			goto out;
> -		}
> -
> -		fsa->fsa_ax25.sax25_family = AF_AX25;
> -		fsa->fsa_ax25.sax25_call   = ax25->dest_addr;
> -
> -		if (ax25->digipeat != NULL) {
> -			ndigi = ax25->digipeat->ndigi;
> -			fsa->fsa_ax25.sax25_ndigis = ndigi;
> -			for (i = 0; i < ndigi; i++)
> -				fsa->fsa_digipeater[i] =
> -						ax25->digipeat->calls[i];
> -		}
> -	} else {
> -		fsa->fsa_ax25.sax25_family = AF_AX25;
> -		fsa->fsa_ax25.sax25_call   = ax25->source_addr;
> -		fsa->fsa_ax25.sax25_ndigis = 1;
> -		if (ax25->ax25_dev != NULL) {
> -			memcpy(&fsa->fsa_digipeater[0],
> -			       ax25->ax25_dev->dev->dev_addr, AX25_ADDR_LEN);
> -		} else {
> -			fsa->fsa_digipeater[0] = null_ax25_address;
> -		}
> -	}
> -	err = sizeof (struct full_sockaddr_ax25);
> -
> -out:
> -	release_sock(sk);
> -
> -	return err;
> -}
> -
> -static int ax25_sendmsg(struct socket *sock, struct msghdr *msg, size_t len)
> -{
> -	DECLARE_SOCKADDR(struct sockaddr_ax25 *, usax, msg->msg_name);
> -	struct sock *sk = sock->sk;
> -	struct sockaddr_ax25 sax;
> -	struct sk_buff *skb;
> -	ax25_digi dtmp, *dp;
> -	ax25_cb *ax25;
> -	size_t size;
> -	int lv, err, addr_len = msg->msg_namelen;
> -
> -	if (msg->msg_flags & ~(MSG_DONTWAIT|MSG_EOR|MSG_CMSG_COMPAT))
> -		return -EINVAL;
> -
> -	lock_sock(sk);
> -	ax25 = sk_to_ax25(sk);
> -
> -	if (sock_flag(sk, SOCK_ZAPPED)) {
> -		err = -EADDRNOTAVAIL;
> -		goto out;
> -	}
> -
> -	if (sk->sk_shutdown & SEND_SHUTDOWN) {
> -		send_sig(SIGPIPE, current, 0);
> -		err = -EPIPE;
> -		goto out;
> -	}
> -
> -	if (ax25->ax25_dev == NULL) {
> -		err = -ENETUNREACH;
> -		goto out;
> -	}
> -
> -	if (len > ax25->ax25_dev->dev->mtu) {
> -		err = -EMSGSIZE;
> -		goto out;
> -	}
> -
> -	if (usax != NULL) {
> -		if (usax->sax25_family != AF_AX25) {
> -			err = -EINVAL;
> -			goto out;
> -		}
> -
> -		if (addr_len == sizeof(struct sockaddr_ax25))
> -			/* ax25_sendmsg(): uses obsolete socket structure */
> -			;
> -		else if (addr_len != sizeof(struct full_sockaddr_ax25))
> -			/* support for old structure may go away some time
> -			 * ax25_sendmsg(): uses old (6 digipeater)
> -			 * socket structure.
> -			 */
> -			if ((addr_len < sizeof(struct sockaddr_ax25) + sizeof(ax25_address) * 6) ||
> -			    (addr_len > sizeof(struct full_sockaddr_ax25))) {
> -				err = -EINVAL;
> -				goto out;
> -			}
> -
> -
> -		if (addr_len > sizeof(struct sockaddr_ax25) && usax->sax25_ndigis != 0) {
> -			int ct           = 0;
> -			struct full_sockaddr_ax25 *fsa = (struct full_sockaddr_ax25 *)usax;
> -
> -			/* Valid number of digipeaters ? */
> -			if (usax->sax25_ndigis < 1 ||
> -			    usax->sax25_ndigis > AX25_MAX_DIGIS ||
> -			    addr_len < sizeof(struct sockaddr_ax25) +
> -			    sizeof(ax25_address) * usax->sax25_ndigis) {
> -				err = -EINVAL;
> -				goto out;
> -			}
> -
> -			dtmp.ndigi      = usax->sax25_ndigis;
> -
> -			while (ct < usax->sax25_ndigis) {
> -				dtmp.repeated[ct] = 0;
> -				dtmp.calls[ct]    = fsa->fsa_digipeater[ct];
> -				ct++;
> -			}
> -
> -			dtmp.lastrepeat = 0;
> -		}
> -
> -		sax = *usax;
> -		if (sk->sk_type == SOCK_SEQPACKET &&
> -		    ax25cmp(&ax25->dest_addr, &sax.sax25_call)) {
> -			err = -EISCONN;
> -			goto out;
> -		}
> -		if (usax->sax25_ndigis == 0)
> -			dp = NULL;
> -		else
> -			dp = &dtmp;
> -	} else {
> -		/*
> -		 *	FIXME: 1003.1g - if the socket is like this because
> -		 *	it has become closed (not started closed) and is VC
> -		 *	we ought to SIGPIPE, EPIPE
> -		 */
> -		if (sk->sk_state != TCP_ESTABLISHED) {
> -			err = -ENOTCONN;
> -			goto out;
> -		}
> -		sax.sax25_family = AF_AX25;
> -		sax.sax25_call   = ax25->dest_addr;
> -		dp = ax25->digipeat;
> -	}
> -
> -	/* Build a packet */
> -	/* Assume the worst case */
> -	size = len + ax25->ax25_dev->dev->hard_header_len;
> -
> -	skb = sock_alloc_send_skb(sk, size, msg->msg_flags&MSG_DONTWAIT, &err);
> -	if (skb == NULL)
> -		goto out;
> -
> -	skb_reserve(skb, size - len);
> -
> -	/* User data follows immediately after the AX.25 data */
> -	if (memcpy_from_msg(skb_put(skb, len), msg, len)) {
> -		err = -EFAULT;
> -		kfree_skb(skb);
> -		goto out;
> -	}
> -
> -	skb_reset_network_header(skb);
> -
> -	/* Add the PID if one is not supplied by the user in the skb */
> -	if (!ax25->pidincl)
> -		*(u8 *)skb_push(skb, 1) = sk->sk_protocol;
> -
> -	if (sk->sk_type == SOCK_SEQPACKET) {
> -		/* Connected mode sockets go via the LAPB machine */
> -		if (sk->sk_state != TCP_ESTABLISHED) {
> -			kfree_skb(skb);
> -			err = -ENOTCONN;
> -			goto out;
> -		}
> -
> -		/* Shove it onto the queue and kick */
> -		ax25_output(ax25, ax25->paclen, skb);
> -
> -		err = len;
> -		goto out;
> -	}
> -
> -	skb_push(skb, 1 + ax25_addr_size(dp));
> -
> -	/* Building AX.25 Header */
> -
> -	/* Build an AX.25 header */
> -	lv = ax25_addr_build(skb->data, &ax25->source_addr, &sax.sax25_call,
> -			     dp, AX25_COMMAND, AX25_MODULUS);
> -
> -	skb_set_transport_header(skb, lv);
> -
> -	*skb_transport_header(skb) = AX25_UI;
> -
> -	/* Datagram frames go straight out of the door as UI */
> -	ax25_queue_xmit(skb, ax25->ax25_dev->dev);
> -
> -	err = len;
> -
> -out:
> -	release_sock(sk);
> -
> -	return err;
> -}
> -
> -static int ax25_recvmsg(struct socket *sock, struct msghdr *msg, size_t size,
> -			int flags)
> -{
> -	struct sock *sk = sock->sk;
> -	struct sk_buff *skb, *last;
> -	struct sk_buff_head *sk_queue;
> -	int copied;
> -	int err = 0;
> -	int off = 0;
> -	long timeo;
> -
> -	lock_sock(sk);
> -	/*
> -	 * 	This works for seqpacket too. The receiver has ordered the
> -	 *	queue for us! We do one quick check first though
> -	 */
> -	if (sk->sk_type == SOCK_SEQPACKET && sk->sk_state != TCP_ESTABLISHED) {
> -		err =  -ENOTCONN;
> -		goto out;
> -	}
> -
> -	/*  We need support for non-blocking reads. */
> -	sk_queue = &sk->sk_receive_queue;
> -	skb = __skb_try_recv_datagram(sk, sk_queue, flags, &off, &err, &last);
> -	/* If no packet is available, release_sock(sk) and try again. */
> -	if (!skb) {
> -		if (err != -EAGAIN)
> -			goto out;
> -		release_sock(sk);
> -		timeo = sock_rcvtimeo(sk, flags & MSG_DONTWAIT);
> -		while (timeo && !__skb_wait_for_more_packets(sk, sk_queue, &err,
> -							     &timeo, last)) {
> -			skb = __skb_try_recv_datagram(sk, sk_queue, flags, &off,
> -						      &err, &last);
> -			if (skb)
> -				break;
> -
> -			if (err != -EAGAIN)
> -				goto done;
> -		}
> -		if (!skb)
> -			goto done;
> -		lock_sock(sk);
> -	}
> -
> -	if (!sk_to_ax25(sk)->pidincl)
> -		skb_pull(skb, 1);		/* Remove PID */
> -
> -	skb_reset_transport_header(skb);
> -	copied = skb->len;
> -
> -	if (copied > size) {
> -		copied = size;
> -		msg->msg_flags |= MSG_TRUNC;
> -	}
> -
> -	skb_copy_datagram_msg(skb, 0, msg, copied);
> -
> -	if (msg->msg_name) {
> -		ax25_digi digi;
> -		ax25_address src;
> -		const unsigned char *mac = skb_mac_header(skb);
> -		DECLARE_SOCKADDR(struct sockaddr_ax25 *, sax, msg->msg_name);
> -
> -		memset(sax, 0, sizeof(struct full_sockaddr_ax25));
> -		ax25_addr_parse(mac + 1, skb->data - mac - 1, &src, NULL,
> -				&digi, NULL, NULL);
> -		sax->sax25_family = AF_AX25;
> -		/* We set this correctly, even though we may not let the
> -		   application know the digi calls further down (because it
> -		   did NOT ask to know them).  This could get political... **/
> -		sax->sax25_ndigis = digi.ndigi;
> -		sax->sax25_call   = src;
> -
> -		if (sax->sax25_ndigis != 0) {
> -			int ct;
> -			struct full_sockaddr_ax25 *fsa = (struct full_sockaddr_ax25 *)sax;
> -
> -			for (ct = 0; ct < digi.ndigi; ct++)
> -				fsa->fsa_digipeater[ct] = digi.calls[ct];
> -		}
> -		msg->msg_namelen = sizeof(struct full_sockaddr_ax25);
> -	}
> -
> -	skb_free_datagram(sk, skb);
> -	err = copied;
> -
> -out:
> -	release_sock(sk);
> -
> -done:
> -	return err;
> -}
> -
> -static int ax25_shutdown(struct socket *sk, int how)
> -{
> -	/* FIXME - generate DM and RNR states */
> -	return -EOPNOTSUPP;
> -}
> -
> -static int ax25_ioctl(struct socket *sock, unsigned int cmd, unsigned long arg)
> -{
> -	struct sock *sk = sock->sk;
> -	void __user *argp = (void __user *)arg;
> -	int res = 0;
> -
> -	lock_sock(sk);
> -	switch (cmd) {
> -	case TIOCOUTQ: {
> -		long amount;
> -
> -		amount = sk->sk_sndbuf - sk_wmem_alloc_get(sk);
> -		if (amount < 0)
> -			amount = 0;
> -		res = put_user(amount, (int __user *)argp);
> -		break;
> -	}
> -
> -	case TIOCINQ: {
> -		struct sk_buff *skb;
> -		long amount = 0L;
> -		/* These two are safe on a single CPU system as only user tasks fiddle here */
> -		if ((skb = skb_peek(&sk->sk_receive_queue)) != NULL)
> -			amount = skb->len;
> -		res = put_user(amount, (int __user *) argp);
> -		break;
> -	}
> -
> -	case SIOCAX25ADDUID:	/* Add a uid to the uid/call map table */
> -	case SIOCAX25DELUID:	/* Delete a uid from the uid/call map table */
> -	case SIOCAX25GETUID: {
> -		struct sockaddr_ax25 sax25;
> -		if (copy_from_user(&sax25, argp, sizeof(sax25))) {
> -			res = -EFAULT;
> -			break;
> -		}
> -		res = ax25_uid_ioctl(cmd, &sax25);
> -		break;
> -	}
> -
> -	case SIOCAX25NOUID: {	/* Set the default policy (default/bar) */
> -		long amount;
> -		if (!capable(CAP_NET_ADMIN)) {
> -			res = -EPERM;
> -			break;
> -		}
> -		if (get_user(amount, (long __user *)argp)) {
> -			res = -EFAULT;
> -			break;
> -		}
> -		if (amount < 0 || amount > AX25_NOUID_BLOCK) {
> -			res = -EINVAL;
> -			break;
> -		}
> -		ax25_uid_policy = amount;
> -		res = 0;
> -		break;
> -	}
> -
> -	case SIOCADDRT:
> -	case SIOCDELRT:
> -	case SIOCAX25OPTRT:
> -		if (!capable(CAP_NET_ADMIN)) {
> -			res = -EPERM;
> -			break;
> -		}
> -		res = ax25_rt_ioctl(cmd, argp);
> -		break;
> -
> -	case SIOCAX25CTLCON:
> -		if (!capable(CAP_NET_ADMIN)) {
> -			res = -EPERM;
> -			break;
> -		}
> -		res = ax25_ctl_ioctl(cmd, argp);
> -		break;
> -
> -	case SIOCAX25GETINFO:
> -	case SIOCAX25GETINFOOLD: {
> -		ax25_cb *ax25 = sk_to_ax25(sk);
> -		struct ax25_info_struct ax25_info;
> -
> -		ax25_info.t1        = ax25->t1   / HZ;
> -		ax25_info.t2        = ax25->t2   / HZ;
> -		ax25_info.t3        = ax25->t3   / HZ;
> -		ax25_info.idle      = ax25->idle / (60 * HZ);
> -		ax25_info.n2        = ax25->n2;
> -		ax25_info.t1timer   = ax25_display_timer(&ax25->t1timer)   / HZ;
> -		ax25_info.t2timer   = ax25_display_timer(&ax25->t2timer)   / HZ;
> -		ax25_info.t3timer   = ax25_display_timer(&ax25->t3timer)   / HZ;
> -		ax25_info.idletimer = ax25_display_timer(&ax25->idletimer) / (60 * HZ);
> -		ax25_info.n2count   = ax25->n2count;
> -		ax25_info.state     = ax25->state;
> -		ax25_info.rcv_q     = sk_rmem_alloc_get(sk);
> -		ax25_info.snd_q     = sk_wmem_alloc_get(sk);
> -		ax25_info.vs        = ax25->vs;
> -		ax25_info.vr        = ax25->vr;
> -		ax25_info.va        = ax25->va;
> -		ax25_info.vs_max    = ax25->vs; /* reserved */
> -		ax25_info.paclen    = ax25->paclen;
> -		ax25_info.window    = ax25->window;
> -
> -		/* old structure? */
> -		if (cmd == SIOCAX25GETINFOOLD) {
> -			static int warned = 0;
> -			if (!warned) {
> -				printk(KERN_INFO "%s uses old SIOCAX25GETINFO\n",
> -					current->comm);
> -				warned=1;
> -			}
> -
> -			if (copy_to_user(argp, &ax25_info, sizeof(struct ax25_info_struct_deprecated))) {
> -				res = -EFAULT;
> -				break;
> -			}
> -		} else {
> -			if (copy_to_user(argp, &ax25_info, sizeof(struct ax25_info_struct))) {
> -				res = -EINVAL;
> -				break;
> -			}
> -		}
> -		res = 0;
> -		break;
> -	}
> -
> -	case SIOCAX25ADDFWD:
> -	case SIOCAX25DELFWD: {
> -		struct ax25_fwd_struct ax25_fwd;
> -		if (!capable(CAP_NET_ADMIN)) {
> -			res = -EPERM;
> -			break;
> -		}
> -		if (copy_from_user(&ax25_fwd, argp, sizeof(ax25_fwd))) {
> -			res = -EFAULT;
> -			break;
> -		}
> -		res = ax25_fwd_ioctl(cmd, &ax25_fwd);
> -		break;
> -	}
> -
> -	case SIOCGIFADDR:
> -	case SIOCSIFADDR:
> -	case SIOCGIFDSTADDR:
> -	case SIOCSIFDSTADDR:
> -	case SIOCGIFBRDADDR:
> -	case SIOCSIFBRDADDR:
> -	case SIOCGIFNETMASK:
> -	case SIOCSIFNETMASK:
> -	case SIOCGIFMETRIC:
> -	case SIOCSIFMETRIC:
> -		res = -EINVAL;
> -		break;
> -
> -	default:
> -		res = -ENOIOCTLCMD;
> -		break;
> -	}
> -	release_sock(sk);
> -
> -	return res;
> -}
> -
> -#ifdef CONFIG_PROC_FS
> -
> -static void *ax25_info_start(struct seq_file *seq, loff_t *pos)
> -	__acquires(ax25_list_lock)
> -{
> -	spin_lock_bh(&ax25_list_lock);
> -	return seq_hlist_start(&ax25_list, *pos);
> -}
> -
> -static void *ax25_info_next(struct seq_file *seq, void *v, loff_t *pos)
> -{
> -	return seq_hlist_next(v, &ax25_list, pos);
> -}
> -
> -static void ax25_info_stop(struct seq_file *seq, void *v)
> -	__releases(ax25_list_lock)
> -{
> -	spin_unlock_bh(&ax25_list_lock);
> -}
> -
> -static int ax25_info_show(struct seq_file *seq, void *v)
> -{
> -	ax25_cb *ax25 = hlist_entry(v, struct ax25_cb, ax25_node);
> -	char buf[11];
> -	int k;
> -
> -
> -	/*
> -	 * New format:
> -	 * magic dev src_addr dest_addr,digi1,digi2,.. st vs vr va t1 t1 t2 t2 t3 t3 idle idle n2 n2 rtt window paclen Snd-Q Rcv-Q inode
> -	 */
> -
> -	seq_printf(seq, "%p %s %s%s ",
> -		   ax25,
> -		   ax25->ax25_dev == NULL? "???" : ax25->ax25_dev->dev->name,
> -		   ax2asc(buf, &ax25->source_addr),
> -		   ax25->iamdigi? "*":"");
> -	seq_printf(seq, "%s", ax2asc(buf, &ax25->dest_addr));
> -
> -	for (k=0; (ax25->digipeat != NULL) && (k < ax25->digipeat->ndigi); k++) {
> -		seq_printf(seq, ",%s%s",
> -			   ax2asc(buf, &ax25->digipeat->calls[k]),
> -			   ax25->digipeat->repeated[k]? "*":"");
> -	}
> -
> -	seq_printf(seq, " %d %d %d %d %lu %lu %lu %lu %lu %lu %lu %lu %d %d %lu %d %d",
> -		   ax25->state,
> -		   ax25->vs, ax25->vr, ax25->va,
> -		   ax25_display_timer(&ax25->t1timer) / HZ, ax25->t1 / HZ,
> -		   ax25_display_timer(&ax25->t2timer) / HZ, ax25->t2 / HZ,
> -		   ax25_display_timer(&ax25->t3timer) / HZ, ax25->t3 / HZ,
> -		   ax25_display_timer(&ax25->idletimer) / (60 * HZ),
> -		   ax25->idle / (60 * HZ),
> -		   ax25->n2count, ax25->n2,
> -		   ax25->rtt / HZ,
> -		   ax25->window,
> -		   ax25->paclen);
> -
> -	if (ax25->sk != NULL) {
> -		seq_printf(seq, " %d %d %llu\n",
> -			   sk_wmem_alloc_get(ax25->sk),
> -			   sk_rmem_alloc_get(ax25->sk),
> -			   sock_i_ino(ax25->sk));
> -	} else {
> -		seq_puts(seq, " * * *\n");
> -	}
> -	return 0;
> -}
> -
> -static const struct seq_operations ax25_info_seqops = {
> -	.start = ax25_info_start,
> -	.next = ax25_info_next,
> -	.stop = ax25_info_stop,
> -	.show = ax25_info_show,
> -};
> -#endif
> -
> -static const struct net_proto_family ax25_family_ops = {
> -	.family =	PF_AX25,
> -	.create =	ax25_create,
> -	.owner	=	THIS_MODULE,
> -};
> -
> -static const struct proto_ops ax25_proto_ops = {
> -	.family		= PF_AX25,
> -	.owner		= THIS_MODULE,
> -	.release	= ax25_release,
> -	.bind		= ax25_bind,
> -	.connect	= ax25_connect,
> -	.socketpair	= sock_no_socketpair,
> -	.accept		= ax25_accept,
> -	.getname	= ax25_getname,
> -	.poll		= datagram_poll,
> -	.ioctl		= ax25_ioctl,
> -	.gettstamp	= sock_gettstamp,
> -	.listen		= ax25_listen,
> -	.shutdown	= ax25_shutdown,
> -	.setsockopt	= ax25_setsockopt,
> -	.getsockopt	= ax25_getsockopt,
> -	.sendmsg	= ax25_sendmsg,
> -	.recvmsg	= ax25_recvmsg,
> -	.mmap		= sock_no_mmap,
> -};
> -
> -/*
> - *	Called by socket.c on kernel start up
> - */
> -static struct packet_type ax25_packet_type __read_mostly = {
> -	.type	=	cpu_to_be16(ETH_P_AX25),
> -	.func	=	ax25_kiss_rcv,
> -};
> -
> -static struct notifier_block ax25_dev_notifier = {
> -	.notifier_call = ax25_device_event,
> -};
> -
> -static int __init ax25_init(void)
> -{
> -	int rc = proto_register(&ax25_proto, 0);
> -
> -	if (rc != 0)
> -		goto out;
> -
> -	sock_register(&ax25_family_ops);
> -	dev_add_pack(&ax25_packet_type);
> -	register_netdevice_notifier(&ax25_dev_notifier);
> -
> -	proc_create_seq("ax25_route", 0444, init_net.proc_net, &ax25_rt_seqops);
> -	proc_create_seq("ax25", 0444, init_net.proc_net, &ax25_info_seqops);
> -	proc_create_seq("ax25_calls", 0444, init_net.proc_net,
> -			&ax25_uid_seqops);
> -out:
> -	return rc;
> -}
> -module_init(ax25_init);
> -
> -
> -MODULE_AUTHOR("Jonathan Naylor G4KLX <g4klx@g4klx.demon.co.uk>");
> -MODULE_DESCRIPTION("The amateur radio AX.25 link layer protocol");
> -MODULE_LICENSE("GPL");
> -MODULE_ALIAS_NETPROTO(PF_AX25);
> -
> -static void __exit ax25_exit(void)
> -{
> -	remove_proc_entry("ax25_route", init_net.proc_net);
> -	remove_proc_entry("ax25", init_net.proc_net);
> -	remove_proc_entry("ax25_calls", init_net.proc_net);
> -
> -	unregister_netdevice_notifier(&ax25_dev_notifier);
> -
> -	dev_remove_pack(&ax25_packet_type);
> -
> -	sock_unregister(PF_AX25);
> -	proto_unregister(&ax25_proto);
> -
> -	ax25_rt_free();
> -	ax25_uid_free();
> -	ax25_dev_free();
> -}
> -module_exit(ax25_exit);
> diff --git a/net/ax25/ax25_addr.c b/net/ax25/ax25_addr.c
> deleted file mode 100644
> index f68865a4d0ab..000000000000
> --- a/net/ax25/ax25_addr.c
> +++ /dev/null
> @@ -1,303 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-or-later
> -/*
> - *
> - * Copyright (C) Jonathan Naylor G4KLX (g4klx@g4klx.demon.co.uk)
> - */
> -#include <linux/errno.h>
> -#include <linux/types.h>
> -#include <linux/socket.h>
> -#include <linux/in.h>
> -#include <linux/kernel.h>
> -#include <linux/module.h>
> -#include <linux/timer.h>
> -#include <linux/string.h>
> -#include <linux/sockios.h>
> -#include <linux/net.h>
> -#include <net/ax25.h>
> -#include <linux/inet.h>
> -#include <linux/netdevice.h>
> -#include <linux/skbuff.h>
> -#include <net/sock.h>
> -#include <linux/uaccess.h>
> -#include <linux/fcntl.h>
> -#include <linux/mm.h>
> -#include <linux/interrupt.h>
> -
> -/*
> - * The default broadcast address of an interface is QST-0; the default address
> - * is LINUX-1.  The null address is defined as a callsign of all spaces with
> - * an SSID of zero.
> - */
> -
> -const ax25_address ax25_bcast =
> -	{{'Q' << 1, 'S' << 1, 'T' << 1, ' ' << 1, ' ' << 1, ' ' << 1, 0 << 1}};
> -const ax25_address ax25_defaddr =
> -	{{'L' << 1, 'I' << 1, 'N' << 1, 'U' << 1, 'X' << 1, ' ' << 1, 1 << 1}};
> -const ax25_address null_ax25_address =
> -	{{' ' << 1, ' ' << 1, ' ' << 1, ' ' << 1, ' ' << 1, ' ' << 1, 0 << 1}};
> -
> -EXPORT_SYMBOL_GPL(ax25_bcast);
> -EXPORT_SYMBOL_GPL(ax25_defaddr);
> -EXPORT_SYMBOL(null_ax25_address);
> -
> -/*
> - *	ax25 -> ascii conversion
> - */
> -char *ax2asc(char *buf, const ax25_address *a)
> -{
> -	char c, *s;
> -	int n;
> -
> -	for (n = 0, s = buf; n < 6; n++) {
> -		c = (a->ax25_call[n] >> 1) & 0x7F;
> -
> -		if (c != ' ') *s++ = c;
> -	}
> -
> -	*s++ = '-';
> -
> -	if ((n = ((a->ax25_call[6] >> 1) & 0x0F)) > 9) {
> -		*s++ = '1';
> -		n -= 10;
> -	}
> -
> -	*s++ = n + '0';
> -	*s++ = '\0';
> -
> -	if (*buf == '\0' || *buf == '-')
> -	   return "*";
> -
> -	return buf;
> -
> -}
> -
> -EXPORT_SYMBOL(ax2asc);
> -
> -/*
> - *	ascii -> ax25 conversion
> - */
> -void asc2ax(ax25_address *addr, const char *callsign)
> -{
> -	const char *s;
> -	int n;
> -
> -	for (s = callsign, n = 0; n < 6; n++) {
> -		if (*s != '\0' && *s != '-')
> -			addr->ax25_call[n] = *s++;
> -		else
> -			addr->ax25_call[n] = ' ';
> -		addr->ax25_call[n] <<= 1;
> -		addr->ax25_call[n] &= 0xFE;
> -	}
> -
> -	if (*s++ == '\0') {
> -		addr->ax25_call[6] = 0x00;
> -		return;
> -	}
> -
> -	addr->ax25_call[6] = *s++ - '0';
> -
> -	if (*s != '\0') {
> -		addr->ax25_call[6] *= 10;
> -		addr->ax25_call[6] += *s++ - '0';
> -	}
> -
> -	addr->ax25_call[6] <<= 1;
> -	addr->ax25_call[6] &= 0x1E;
> -}
> -
> -EXPORT_SYMBOL(asc2ax);
> -
> -/*
> - *	Compare two ax.25 addresses
> - */
> -int ax25cmp(const ax25_address *a, const ax25_address *b)
> -{
> -	int ct = 0;
> -
> -	while (ct < 6) {
> -		if ((a->ax25_call[ct] & 0xFE) != (b->ax25_call[ct] & 0xFE))	/* Clean off repeater bits */
> -			return 1;
> -		ct++;
> -	}
> -
> -	if ((a->ax25_call[ct] & 0x1E) == (b->ax25_call[ct] & 0x1E))	/* SSID without control bit */
> -		return 0;
> -
> -	return 2;			/* Partial match */
> -}
> -
> -EXPORT_SYMBOL(ax25cmp);
> -
> -/*
> - *	Compare two AX.25 digipeater paths.
> - */
> -int ax25digicmp(const ax25_digi *digi1, const ax25_digi *digi2)
> -{
> -	int i;
> -
> -	if (digi1->ndigi != digi2->ndigi)
> -		return 1;
> -
> -	if (digi1->lastrepeat != digi2->lastrepeat)
> -		return 1;
> -
> -	for (i = 0; i < digi1->ndigi; i++)
> -		if (ax25cmp(&digi1->calls[i], &digi2->calls[i]) != 0)
> -			return 1;
> -
> -	return 0;
> -}
> -
> -/*
> - *	Given an AX.25 address pull of to, from, digi list, command/response and the start of data
> - *
> - */
> -const unsigned char *ax25_addr_parse(const unsigned char *buf, int len,
> -	ax25_address *src, ax25_address *dest, ax25_digi *digi, int *flags,
> -	int *dama)
> -{
> -	int d = 0;
> -
> -	if (len < 14) return NULL;
> -
> -	if (flags != NULL) {
> -		*flags = 0;
> -
> -		if (buf[6] & AX25_CBIT)
> -			*flags = AX25_COMMAND;
> -		if (buf[13] & AX25_CBIT)
> -			*flags = AX25_RESPONSE;
> -	}
> -
> -	if (dama != NULL)
> -		*dama = ~buf[13] & AX25_DAMA_FLAG;
> -
> -	/* Copy to, from */
> -	if (dest != NULL)
> -		memcpy(dest, buf + 0, AX25_ADDR_LEN);
> -	if (src != NULL)
> -		memcpy(src,  buf + 7, AX25_ADDR_LEN);
> -
> -	buf += 2 * AX25_ADDR_LEN;
> -	len -= 2 * AX25_ADDR_LEN;
> -
> -	digi->lastrepeat = -1;
> -	digi->ndigi      = 0;
> -
> -	while (!(buf[-1] & AX25_EBIT)) {
> -		if (d >= AX25_MAX_DIGIS)
> -			return NULL;
> -		if (len < AX25_ADDR_LEN)
> -			return NULL;
> -
> -		memcpy(&digi->calls[d], buf, AX25_ADDR_LEN);
> -		digi->ndigi = d + 1;
> -
> -		if (buf[6] & AX25_HBIT) {
> -			digi->repeated[d] = 1;
> -			digi->lastrepeat  = d;
> -		} else {
> -			digi->repeated[d] = 0;
> -		}
> -
> -		buf += AX25_ADDR_LEN;
> -		len -= AX25_ADDR_LEN;
> -		d++;
> -	}
> -
> -	return buf;
> -}
> -
> -/*
> - *	Assemble an AX.25 header from the bits
> - */
> -int ax25_addr_build(unsigned char *buf, const ax25_address *src,
> -	const ax25_address *dest, const ax25_digi *d, int flag, int modulus)
> -{
> -	int len = 0;
> -	int ct  = 0;
> -
> -	memcpy(buf, dest, AX25_ADDR_LEN);
> -	buf[6] &= ~(AX25_EBIT | AX25_CBIT);
> -	buf[6] |= AX25_SSSID_SPARE;
> -
> -	if (flag == AX25_COMMAND) buf[6] |= AX25_CBIT;
> -
> -	buf += AX25_ADDR_LEN;
> -	len += AX25_ADDR_LEN;
> -
> -	memcpy(buf, src, AX25_ADDR_LEN);
> -	buf[6] &= ~(AX25_EBIT | AX25_CBIT);
> -	buf[6] &= ~AX25_SSSID_SPARE;
> -
> -	if (modulus == AX25_MODULUS)
> -		buf[6] |= AX25_SSSID_SPARE;
> -	else
> -		buf[6] |= AX25_ESSID_SPARE;
> -
> -	if (flag == AX25_RESPONSE) buf[6] |= AX25_CBIT;
> -
> -	/*
> -	 *	Fast path the normal digiless path
> -	 */
> -	if (d == NULL || d->ndigi == 0) {
> -		buf[6] |= AX25_EBIT;
> -		return 2 * AX25_ADDR_LEN;
> -	}
> -
> -	buf += AX25_ADDR_LEN;
> -	len += AX25_ADDR_LEN;
> -
> -	while (ct < d->ndigi) {
> -		memcpy(buf, &d->calls[ct], AX25_ADDR_LEN);
> -
> -		if (d->repeated[ct])
> -			buf[6] |= AX25_HBIT;
> -		else
> -			buf[6] &= ~AX25_HBIT;
> -
> -		buf[6] &= ~AX25_EBIT;
> -		buf[6] |= AX25_SSSID_SPARE;
> -
> -		buf += AX25_ADDR_LEN;
> -		len += AX25_ADDR_LEN;
> -		ct++;
> -	}
> -
> -	buf[-1] |= AX25_EBIT;
> -
> -	return len;
> -}
> -
> -int ax25_addr_size(const ax25_digi *dp)
> -{
> -	if (dp == NULL)
> -		return 2 * AX25_ADDR_LEN;
> -
> -	return AX25_ADDR_LEN * (2 + dp->ndigi);
> -}
> -
> -/*
> - *	Reverse Digipeat List. May not pass both parameters as same struct
> - */
> -void ax25_digi_invert(const ax25_digi *in, ax25_digi *out)
> -{
> -	int ct;
> -
> -	out->ndigi      = in->ndigi;
> -	out->lastrepeat = in->ndigi - in->lastrepeat - 2;
> -
> -	/* Invert the digipeaters */
> -	for (ct = 0; ct < in->ndigi; ct++) {
> -		out->calls[ct] = in->calls[in->ndigi - ct - 1];
> -
> -		if (ct <= out->lastrepeat) {
> -			out->calls[ct].ax25_call[6] |= AX25_HBIT;
> -			out->repeated[ct]            = 1;
> -		} else {
> -			out->calls[ct].ax25_call[6] &= ~AX25_HBIT;
> -			out->repeated[ct]            = 0;
> -		}
> -	}
> -}
> diff --git a/net/ax25/ax25_dev.c b/net/ax25/ax25_dev.c
> deleted file mode 100644
> index 3c0544fc4ad5..000000000000
> --- a/net/ax25/ax25_dev.c
> +++ /dev/null
> @@ -1,200 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-or-later
> -/*
> - *
> - * Copyright (C) Jonathan Naylor G4KLX (g4klx@g4klx.demon.co.uk)
> - */
> -#include <linux/errno.h>
> -#include <linux/types.h>
> -#include <linux/socket.h>
> -#include <linux/slab.h>
> -#include <linux/in.h>
> -#include <linux/kernel.h>
> -#include <linux/timer.h>
> -#include <linux/string.h>
> -#include <linux/sockios.h>
> -#include <linux/net.h>
> -#include <linux/spinlock.h>
> -#include <net/ax25.h>
> -#include <linux/inet.h>
> -#include <linux/netdevice.h>
> -#include <linux/if_arp.h>
> -#include <linux/skbuff.h>
> -#include <net/sock.h>
> -#include <linux/uaccess.h>
> -#include <linux/fcntl.h>
> -#include <linux/list.h>
> -#include <linux/mm.h>
> -#include <linux/interrupt.h>
> -#include <linux/init.h>
> -
> -static LIST_HEAD(ax25_dev_list);
> -DEFINE_SPINLOCK(ax25_dev_lock);
> -
> -ax25_dev *ax25_addr_ax25dev(ax25_address *addr)
> -{
> -	ax25_dev *ax25_dev, *res = NULL;
> -
> -	spin_lock_bh(&ax25_dev_lock);
> -	list_for_each_entry(ax25_dev, &ax25_dev_list, list)
> -		if (ax25cmp(addr, (const ax25_address *)ax25_dev->dev->dev_addr) == 0) {
> -			res = ax25_dev;
> -			ax25_dev_hold(ax25_dev);
> -			break;
> -		}
> -	spin_unlock_bh(&ax25_dev_lock);
> -
> -	return res;
> -}
> -
> -/*
> - *	This is called when an interface is brought up. These are
> - *	reasonable defaults.
> - */
> -void ax25_dev_device_up(struct net_device *dev)
> -{
> -	ax25_dev *ax25_dev;
> -
> -	ax25_dev = kzalloc_obj(*ax25_dev);
> -	if (!ax25_dev) {
> -		printk(KERN_ERR "AX.25: ax25_dev_device_up - out of memory\n");
> -		return;
> -	}
> -
> -	refcount_set(&ax25_dev->refcount, 1);
> -	ax25_dev->dev     = dev;
> -	netdev_hold(dev, &ax25_dev->dev_tracker, GFP_KERNEL);
> -	ax25_dev->forward = NULL;
> -	ax25_dev->device_up = true;
> -
> -	ax25_dev->values[AX25_VALUES_IPDEFMODE] = AX25_DEF_IPDEFMODE;
> -	ax25_dev->values[AX25_VALUES_AXDEFMODE] = AX25_DEF_AXDEFMODE;
> -	ax25_dev->values[AX25_VALUES_BACKOFF]   = AX25_DEF_BACKOFF;
> -	ax25_dev->values[AX25_VALUES_CONMODE]   = AX25_DEF_CONMODE;
> -	ax25_dev->values[AX25_VALUES_WINDOW]    = AX25_DEF_WINDOW;
> -	ax25_dev->values[AX25_VALUES_EWINDOW]   = AX25_DEF_EWINDOW;
> -	ax25_dev->values[AX25_VALUES_T1]        = AX25_DEF_T1;
> -	ax25_dev->values[AX25_VALUES_T2]        = AX25_DEF_T2;
> -	ax25_dev->values[AX25_VALUES_T3]        = AX25_DEF_T3;
> -	ax25_dev->values[AX25_VALUES_IDLE]	= AX25_DEF_IDLE;
> -	ax25_dev->values[AX25_VALUES_N2]        = AX25_DEF_N2;
> -	ax25_dev->values[AX25_VALUES_PACLEN]	= AX25_DEF_PACLEN;
> -	ax25_dev->values[AX25_VALUES_PROTOCOL]  = AX25_DEF_PROTOCOL;
> -
> -#ifdef CONFIG_AX25_DAMA_SLAVE
> -	ax25_dev->values[AX25_VALUES_DS_TIMEOUT]= AX25_DEF_DS_TIMEOUT;
> -
> -	ax25_ds_setup_timer(ax25_dev);
> -#endif
> -
> -	spin_lock_bh(&ax25_dev_lock);
> -	list_add(&ax25_dev->list, &ax25_dev_list);
> -	rcu_assign_pointer(dev->ax25_ptr, ax25_dev);
> -	spin_unlock_bh(&ax25_dev_lock);
> -
> -	ax25_register_dev_sysctl(ax25_dev);
> -}
> -
> -void ax25_dev_device_down(struct net_device *dev)
> -{
> -	ax25_dev *s, *ax25_dev;
> -
> -	if ((ax25_dev = ax25_dev_ax25dev(dev)) == NULL)
> -		return;
> -
> -	ax25_unregister_dev_sysctl(ax25_dev);
> -
> -	spin_lock_bh(&ax25_dev_lock);
> -
> -#ifdef CONFIG_AX25_DAMA_SLAVE
> -	timer_shutdown_sync(&ax25_dev->dama.slave_timer);
> -#endif
> -
> -	/*
> -	 *	Remove any packet forwarding that points to this device.
> -	 */
> -	list_for_each_entry(s, &ax25_dev_list, list)
> -		if (s->forward == dev)
> -			s->forward = NULL;
> -
> -	list_for_each_entry(s, &ax25_dev_list, list) {
> -		if (s == ax25_dev) {
> -			list_del(&s->list);
> -			break;
> -		}
> -	}
> -
> -	RCU_INIT_POINTER(dev->ax25_ptr, NULL);
> -	spin_unlock_bh(&ax25_dev_lock);
> -	netdev_put(dev, &ax25_dev->dev_tracker);
> -	ax25_dev_put(ax25_dev);
> -}
> -
> -int ax25_fwd_ioctl(unsigned int cmd, struct ax25_fwd_struct *fwd)
> -{
> -	ax25_dev *ax25_dev, *fwd_dev;
> -
> -	if ((ax25_dev = ax25_addr_ax25dev(&fwd->port_from)) == NULL)
> -		return -EINVAL;
> -
> -	switch (cmd) {
> -	case SIOCAX25ADDFWD:
> -		fwd_dev = ax25_addr_ax25dev(&fwd->port_to);
> -		if (!fwd_dev) {
> -			ax25_dev_put(ax25_dev);
> -			return -EINVAL;
> -		}
> -		if (ax25_dev->forward) {
> -			ax25_dev_put(fwd_dev);
> -			ax25_dev_put(ax25_dev);
> -			return -EINVAL;
> -		}
> -		ax25_dev->forward = fwd_dev->dev;
> -		ax25_dev_put(fwd_dev);
> -		ax25_dev_put(ax25_dev);
> -		break;
> -
> -	case SIOCAX25DELFWD:
> -		if (!ax25_dev->forward) {
> -			ax25_dev_put(ax25_dev);
> -			return -EINVAL;
> -		}
> -		ax25_dev->forward = NULL;
> -		ax25_dev_put(ax25_dev);
> -		break;
> -
> -	default:
> -		ax25_dev_put(ax25_dev);
> -		return -EINVAL;
> -	}
> -
> -	return 0;
> -}
> -
> -struct net_device *ax25_fwd_dev(struct net_device *dev)
> -{
> -	ax25_dev *ax25_dev;
> -
> -	if ((ax25_dev = ax25_dev_ax25dev(dev)) == NULL)
> -		return dev;
> -
> -	if (ax25_dev->forward == NULL)
> -		return dev;
> -
> -	return ax25_dev->forward;
> -}
> -
> -/*
> - *	Free all memory associated with device structures.
> - */
> -void __exit ax25_dev_free(void)
> -{
> -	ax25_dev *s, *n;
> -
> -	spin_lock_bh(&ax25_dev_lock);
> -	list_for_each_entry_safe(s, n, &ax25_dev_list, list) {
> -		netdev_put(s->dev, &s->dev_tracker);
> -		list_del(&s->list);
> -		ax25_dev_put(s);
> -	}
> -	spin_unlock_bh(&ax25_dev_lock);
> -}
> diff --git a/net/ax25/ax25_ds_in.c b/net/ax25/ax25_ds_in.c
> deleted file mode 100644
> index c62f8fb06189..000000000000
> --- a/net/ax25/ax25_ds_in.c
> +++ /dev/null
> @@ -1,298 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-or-later
> -/*
> - *
> - * Copyright (C) Jonathan Naylor G4KLX (g4klx@g4klx.demon.co.uk)
> - * Copyright (C) Joerg Reuter DL1BKE (jreuter@yaina.de)
> - */
> -#include <linux/errno.h>
> -#include <linux/types.h>
> -#include <linux/socket.h>
> -#include <linux/in.h>
> -#include <linux/kernel.h>
> -#include <linux/timer.h>
> -#include <linux/string.h>
> -#include <linux/sockios.h>
> -#include <linux/net.h>
> -#include <net/ax25.h>
> -#include <linux/inet.h>
> -#include <linux/netdevice.h>
> -#include <linux/skbuff.h>
> -#include <net/sock.h>
> -#include <net/tcp_states.h>
> -#include <linux/uaccess.h>
> -#include <linux/fcntl.h>
> -#include <linux/mm.h>
> -#include <linux/interrupt.h>
> -
> -/*
> - *	State machine for state 1, Awaiting Connection State.
> - *	The handling of the timer(s) is in file ax25_ds_timer.c.
> - *	Handling of state 0 and connection release is in ax25.c.
> - */
> -static int ax25_ds_state1_machine(ax25_cb *ax25, struct sk_buff *skb, int frametype, int pf, int type)
> -{
> -	switch (frametype) {
> -	case AX25_SABM:
> -		ax25->modulus = AX25_MODULUS;
> -		ax25->window  = ax25->ax25_dev->values[AX25_VALUES_WINDOW];
> -		ax25_send_control(ax25, AX25_UA, pf, AX25_RESPONSE);
> -		break;
> -
> -	case AX25_SABME:
> -		ax25->modulus = AX25_EMODULUS;
> -		ax25->window  =  ax25->ax25_dev->values[AX25_VALUES_EWINDOW];
> -		ax25_send_control(ax25, AX25_UA, pf, AX25_RESPONSE);
> -		break;
> -
> -	case AX25_DISC:
> -		ax25_send_control(ax25, AX25_DM, pf, AX25_RESPONSE);
> -		break;
> -
> -	case AX25_UA:
> -		ax25_calculate_rtt(ax25);
> -		ax25_stop_t1timer(ax25);
> -		ax25_start_t3timer(ax25);
> -		ax25_start_idletimer(ax25);
> -		ax25->vs      = 0;
> -		ax25->va      = 0;
> -		ax25->vr      = 0;
> -		ax25->state   = AX25_STATE_3;
> -		ax25->n2count = 0;
> -		if (ax25->sk != NULL) {
> -			bh_lock_sock(ax25->sk);
> -			ax25->sk->sk_state = TCP_ESTABLISHED;
> -			/*
> -			 * For WAIT_SABM connections we will produce an accept
> -			 * ready socket here
> -			 */
> -			if (!sock_flag(ax25->sk, SOCK_DEAD))
> -				ax25->sk->sk_state_change(ax25->sk);
> -			bh_unlock_sock(ax25->sk);
> -		}
> -		ax25_dama_on(ax25);
> -
> -		/* according to DK4EG's spec we are required to
> -		 * send a RR RESPONSE FINAL NR=0.
> -		 */
> -
> -		ax25_std_enquiry_response(ax25);
> -		break;
> -
> -	case AX25_DM:
> -		if (pf)
> -			ax25_disconnect(ax25, ECONNREFUSED);
> -		break;
> -
> -	default:
> -		if (pf)
> -			ax25_send_control(ax25, AX25_SABM, AX25_POLLON, AX25_COMMAND);
> -		break;
> -	}
> -
> -	return 0;
> -}
> -
> -/*
> - *	State machine for state 2, Awaiting Release State.
> - *	The handling of the timer(s) is in file ax25_ds_timer.c
> - *	Handling of state 0 and connection release is in ax25.c.
> - */
> -static int ax25_ds_state2_machine(ax25_cb *ax25, struct sk_buff *skb, int frametype, int pf, int type)
> -{
> -	switch (frametype) {
> -	case AX25_SABM:
> -	case AX25_SABME:
> -		ax25_send_control(ax25, AX25_DISC, AX25_POLLON, AX25_COMMAND);
> -		ax25_dama_off(ax25);
> -		break;
> -
> -	case AX25_DISC:
> -		ax25_send_control(ax25, AX25_UA, pf, AX25_RESPONSE);
> -		ax25_dama_off(ax25);
> -		ax25_disconnect(ax25, 0);
> -		break;
> -
> -	case AX25_DM:
> -	case AX25_UA:
> -		if (pf) {
> -			ax25_dama_off(ax25);
> -			ax25_disconnect(ax25, 0);
> -		}
> -		break;
> -
> -	case AX25_I:
> -	case AX25_REJ:
> -	case AX25_RNR:
> -	case AX25_RR:
> -		if (pf) {
> -			ax25_send_control(ax25, AX25_DISC, AX25_POLLON, AX25_COMMAND);
> -			ax25_dama_off(ax25);
> -		}
> -		break;
> -
> -	default:
> -		break;
> -	}
> -
> -	return 0;
> -}
> -
> -/*
> - *	State machine for state 3, Connected State.
> - *	The handling of the timer(s) is in file ax25_timer.c
> - *	Handling of state 0 and connection release is in ax25.c.
> - */
> -static int ax25_ds_state3_machine(ax25_cb *ax25, struct sk_buff *skb, int frametype, int ns, int nr, int pf, int type)
> -{
> -	int queued = 0;
> -
> -	switch (frametype) {
> -	case AX25_SABM:
> -	case AX25_SABME:
> -		if (frametype == AX25_SABM) {
> -			ax25->modulus   = AX25_MODULUS;
> -			ax25->window    = ax25->ax25_dev->values[AX25_VALUES_WINDOW];
> -		} else {
> -			ax25->modulus   = AX25_EMODULUS;
> -			ax25->window    = ax25->ax25_dev->values[AX25_VALUES_EWINDOW];
> -		}
> -		ax25_send_control(ax25, AX25_UA, pf, AX25_RESPONSE);
> -		ax25_stop_t1timer(ax25);
> -		ax25_start_t3timer(ax25);
> -		ax25_start_idletimer(ax25);
> -		ax25->condition = 0x00;
> -		ax25->vs        = 0;
> -		ax25->va        = 0;
> -		ax25->vr        = 0;
> -		ax25_requeue_frames(ax25);
> -		ax25_dama_on(ax25);
> -		break;
> -
> -	case AX25_DISC:
> -		ax25_send_control(ax25, AX25_UA, pf, AX25_RESPONSE);
> -		ax25_dama_off(ax25);
> -		ax25_disconnect(ax25, 0);
> -		break;
> -
> -	case AX25_DM:
> -		ax25_dama_off(ax25);
> -		ax25_disconnect(ax25, ECONNRESET);
> -		break;
> -
> -	case AX25_RR:
> -	case AX25_RNR:
> -		if (frametype == AX25_RR)
> -			ax25->condition &= ~AX25_COND_PEER_RX_BUSY;
> -		else
> -			ax25->condition |= AX25_COND_PEER_RX_BUSY;
> -
> -		if (ax25_validate_nr(ax25, nr)) {
> -			if (ax25_check_iframes_acked(ax25, nr))
> -				ax25->n2count=0;
> -			if (type == AX25_COMMAND && pf)
> -				ax25_ds_enquiry_response(ax25);
> -		} else {
> -			ax25_ds_nr_error_recovery(ax25);
> -			ax25->state = AX25_STATE_1;
> -		}
> -		break;
> -
> -	case AX25_REJ:
> -		ax25->condition &= ~AX25_COND_PEER_RX_BUSY;
> -
> -		if (ax25_validate_nr(ax25, nr)) {
> -			if (ax25->va != nr)
> -				ax25->n2count=0;
> -
> -			ax25_frames_acked(ax25, nr);
> -			ax25_calculate_rtt(ax25);
> -			ax25_stop_t1timer(ax25);
> -			ax25_start_t3timer(ax25);
> -			ax25_requeue_frames(ax25);
> -
> -			if (type == AX25_COMMAND && pf)
> -				ax25_ds_enquiry_response(ax25);
> -		} else {
> -			ax25_ds_nr_error_recovery(ax25);
> -			ax25->state = AX25_STATE_1;
> -		}
> -		break;
> -
> -	case AX25_I:
> -		if (!ax25_validate_nr(ax25, nr)) {
> -			ax25_ds_nr_error_recovery(ax25);
> -			ax25->state = AX25_STATE_1;
> -			break;
> -		}
> -		if (ax25->condition & AX25_COND_PEER_RX_BUSY) {
> -			ax25_frames_acked(ax25, nr);
> -			ax25->n2count = 0;
> -		} else {
> -			if (ax25_check_iframes_acked(ax25, nr))
> -				ax25->n2count = 0;
> -		}
> -		if (ax25->condition & AX25_COND_OWN_RX_BUSY) {
> -			if (pf) ax25_ds_enquiry_response(ax25);
> -			break;
> -		}
> -		if (ns == ax25->vr) {
> -			ax25->vr = (ax25->vr + 1) % ax25->modulus;
> -			queued = ax25_rx_iframe(ax25, skb);
> -			if (ax25->condition & AX25_COND_OWN_RX_BUSY)
> -				ax25->vr = ns;	/* ax25->vr - 1 */
> -			ax25->condition &= ~AX25_COND_REJECT;
> -			if (pf) {
> -				ax25_ds_enquiry_response(ax25);
> -			} else {
> -				if (!(ax25->condition & AX25_COND_ACK_PENDING)) {
> -					ax25->condition |= AX25_COND_ACK_PENDING;
> -					ax25_start_t2timer(ax25);
> -				}
> -			}
> -		} else {
> -			if (ax25->condition & AX25_COND_REJECT) {
> -				if (pf) ax25_ds_enquiry_response(ax25);
> -			} else {
> -				ax25->condition |= AX25_COND_REJECT;
> -				ax25_ds_enquiry_response(ax25);
> -				ax25->condition &= ~AX25_COND_ACK_PENDING;
> -			}
> -		}
> -		break;
> -
> -	case AX25_FRMR:
> -	case AX25_ILLEGAL:
> -		ax25_ds_establish_data_link(ax25);
> -		ax25->state = AX25_STATE_1;
> -		break;
> -
> -	default:
> -		break;
> -	}
> -
> -	return queued;
> -}
> -
> -/*
> - *	Higher level upcall for a LAPB frame
> - */
> -int ax25_ds_frame_in(ax25_cb *ax25, struct sk_buff *skb, int type)
> -{
> -	int queued = 0, frametype, ns, nr, pf;
> -
> -	frametype = ax25_decode(ax25, skb, &ns, &nr, &pf);
> -
> -	switch (ax25->state) {
> -	case AX25_STATE_1:
> -		queued = ax25_ds_state1_machine(ax25, skb, frametype, pf, type);
> -		break;
> -	case AX25_STATE_2:
> -		queued = ax25_ds_state2_machine(ax25, skb, frametype, pf, type);
> -		break;
> -	case AX25_STATE_3:
> -		queued = ax25_ds_state3_machine(ax25, skb, frametype, ns, nr, pf, type);
> -		break;
> -	}
> -
> -	return queued;
> -}
> diff --git a/net/ax25/ax25_ds_subr.c b/net/ax25/ax25_ds_subr.c
> deleted file mode 100644
> index f00e27df3c76..000000000000
> --- a/net/ax25/ax25_ds_subr.c
> +++ /dev/null
> @@ -1,204 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-or-later
> -/*
> - *
> - * Copyright (C) Jonathan Naylor G4KLX (g4klx@g4klx.demon.co.uk)
> - * Copyright (C) Joerg Reuter DL1BKE (jreuter@yaina.de)
> - */
> -#include <linux/errno.h>
> -#include <linux/types.h>
> -#include <linux/socket.h>
> -#include <linux/in.h>
> -#include <linux/kernel.h>
> -#include <linux/timer.h>
> -#include <linux/string.h>
> -#include <linux/sockios.h>
> -#include <linux/spinlock.h>
> -#include <linux/net.h>
> -#include <linux/gfp.h>
> -#include <net/ax25.h>
> -#include <linux/inet.h>
> -#include <linux/netdevice.h>
> -#include <linux/skbuff.h>
> -#include <net/sock.h>
> -#include <linux/uaccess.h>
> -#include <linux/fcntl.h>
> -#include <linux/mm.h>
> -#include <linux/interrupt.h>
> -
> -void ax25_ds_nr_error_recovery(ax25_cb *ax25)
> -{
> -	ax25_ds_establish_data_link(ax25);
> -}
> -
> -/*
> - *	dl1bke 960114: transmit I frames on DAMA poll
> - */
> -void ax25_ds_enquiry_response(ax25_cb *ax25)
> -{
> -	ax25_cb *ax25o;
> -
> -	/* Please note that neither DK4EG's nor DG2FEF's
> -	 * DAMA spec mention the following behaviour as seen
> -	 * with TheFirmware:
> -	 *
> -	 * 	DB0ACH->DL1BKE <RR C P R0> [DAMA]
> -	 *	DL1BKE->DB0ACH <I NR=0 NS=0>
> -	 *	DL1BKE-7->DB0PRA-6 DB0ACH <I C S3 R5>
> -	 *	DL1BKE->DB0ACH <RR R F R0>
> -	 *
> -	 * The Flexnet DAMA Master implementation apparently
> -	 * insists on the "proper" AX.25 behaviour:
> -	 *
> -	 * 	DB0ACH->DL1BKE <RR C P R0> [DAMA]
> -	 *	DL1BKE->DB0ACH <RR R F R0>
> -	 *	DL1BKE->DB0ACH <I NR=0 NS=0>
> -	 *	DL1BKE-7->DB0PRA-6 DB0ACH <I C S3 R5>
> -	 *
> -	 * Flexnet refuses to send us *any* I frame if we send
> -	 * a REJ in case AX25_COND_REJECT is set. It is superfluous in
> -	 * this mode anyway (a RR or RNR invokes the retransmission).
> -	 * Is this a Flexnet bug?
> -	 */
> -
> -	ax25_std_enquiry_response(ax25);
> -
> -	if (!(ax25->condition & AX25_COND_PEER_RX_BUSY)) {
> -		ax25_requeue_frames(ax25);
> -		ax25_kick(ax25);
> -	}
> -
> -	if (ax25->state == AX25_STATE_1 || ax25->state == AX25_STATE_2 || skb_peek(&ax25->ack_queue) != NULL)
> -		ax25_ds_t1_timeout(ax25);
> -	else
> -		ax25->n2count = 0;
> -
> -	ax25_start_t3timer(ax25);
> -	ax25_ds_set_timer(ax25->ax25_dev);
> -
> -	spin_lock(&ax25_list_lock);
> -	ax25_for_each(ax25o, &ax25_list) {
> -		if (ax25o == ax25)
> -			continue;
> -
> -		if (ax25o->ax25_dev != ax25->ax25_dev)
> -			continue;
> -
> -		if (ax25o->state == AX25_STATE_1 || ax25o->state == AX25_STATE_2) {
> -			ax25_ds_t1_timeout(ax25o);
> -			continue;
> -		}
> -
> -		if (!(ax25o->condition & AX25_COND_PEER_RX_BUSY) && ax25o->state == AX25_STATE_3) {
> -			ax25_requeue_frames(ax25o);
> -			ax25_kick(ax25o);
> -		}
> -
> -		if (ax25o->state == AX25_STATE_1 || ax25o->state == AX25_STATE_2 || skb_peek(&ax25o->ack_queue) != NULL)
> -			ax25_ds_t1_timeout(ax25o);
> -
> -		/* do not start T3 for listening sockets (tnx DD8NE) */
> -
> -		if (ax25o->state != AX25_STATE_0)
> -			ax25_start_t3timer(ax25o);
> -	}
> -	spin_unlock(&ax25_list_lock);
> -}
> -
> -void ax25_ds_establish_data_link(ax25_cb *ax25)
> -{
> -	ax25->condition &= AX25_COND_DAMA_MODE;
> -	ax25->n2count    = 0;
> -	ax25_calculate_t1(ax25);
> -	ax25_start_t1timer(ax25);
> -	ax25_stop_t2timer(ax25);
> -	ax25_start_t3timer(ax25);
> -}
> -
> -/*
> - *	:::FIXME:::
> - *	This is a kludge. Not all drivers recognize kiss commands.
> - *	We need a driver level  request to switch duplex mode, that does
> - *	either SCC changing, PI config or KISS as required. Currently
> - *	this request isn't reliable.
> - */
> -static void ax25_kiss_cmd(ax25_dev *ax25_dev, unsigned char cmd, unsigned char param)
> -{
> -	struct sk_buff *skb;
> -	unsigned char *p;
> -
> -	if (ax25_dev->dev == NULL)
> -		return;
> -
> -	if ((skb = alloc_skb(2, GFP_ATOMIC)) == NULL)
> -		return;
> -
> -	skb_reset_network_header(skb);
> -	p = skb_put(skb, 2);
> -
> -	*p++ = cmd;
> -	*p++ = param;
> -
> -	skb->protocol = ax25_type_trans(skb, ax25_dev->dev);
> -
> -	dev_queue_xmit(skb);
> -}
> -
> -/*
> - *	A nasty problem arises if we count the number of DAMA connections
> - *	wrong, especially when connections on the device already existed
> - *	and our network node (or the sysop) decides to turn on DAMA Master
> - *	mode. We thus flag the 'real' slave connections with
> - *	ax25->dama_slave=1 and look on every disconnect if still slave
> - *	connections exist.
> - */
> -static int ax25_check_dama_slave(ax25_dev *ax25_dev)
> -{
> -	ax25_cb *ax25;
> -	int res = 0;
> -
> -	spin_lock(&ax25_list_lock);
> -	ax25_for_each(ax25, &ax25_list)
> -		if (ax25->ax25_dev == ax25_dev && (ax25->condition & AX25_COND_DAMA_MODE) && ax25->state > AX25_STATE_1) {
> -			res = 1;
> -			break;
> -		}
> -	spin_unlock(&ax25_list_lock);
> -
> -	return res;
> -}
> -
> -static void ax25_dev_dama_on(ax25_dev *ax25_dev)
> -{
> -	if (ax25_dev == NULL)
> -		return;
> -
> -	if (ax25_dev->dama.slave == 0)
> -		ax25_kiss_cmd(ax25_dev, 5, 1);
> -
> -	ax25_dev->dama.slave = 1;
> -	ax25_ds_set_timer(ax25_dev);
> -}
> -
> -void ax25_dev_dama_off(ax25_dev *ax25_dev)
> -{
> -	if (ax25_dev == NULL)
> -		return;
> -
> -	if (ax25_dev->dama.slave && !ax25_check_dama_slave(ax25_dev)) {
> -		ax25_kiss_cmd(ax25_dev, 5, 0);
> -		ax25_dev->dama.slave = 0;
> -		ax25_ds_del_timer(ax25_dev);
> -	}
> -}
> -
> -void ax25_dama_on(ax25_cb *ax25)
> -{
> -	ax25_dev_dama_on(ax25->ax25_dev);
> -	ax25->condition |= AX25_COND_DAMA_MODE;
> -}
> -
> -void ax25_dama_off(ax25_cb *ax25)
> -{
> -	ax25->condition &= ~AX25_COND_DAMA_MODE;
> -	ax25_dev_dama_off(ax25->ax25_dev);
> -}
> diff --git a/net/ax25/ax25_ds_timer.c b/net/ax25/ax25_ds_timer.c
> deleted file mode 100644
> index 0c9e7775aa54..000000000000
> --- a/net/ax25/ax25_ds_timer.c
> +++ /dev/null
> @@ -1,235 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-or-later
> -/*
> - *
> - * Copyright (C) Jonathan Naylor G4KLX (g4klx@g4klx.demon.co.uk)
> - * Copyright (C) Joerg Reuter DL1BKE (jreuter@yaina.de)
> - */
> -#include <linux/errno.h>
> -#include <linux/types.h>
> -#include <linux/socket.h>
> -#include <linux/spinlock.h>
> -#include <linux/in.h>
> -#include <linux/kernel.h>
> -#include <linux/jiffies.h>
> -#include <linux/timer.h>
> -#include <linux/string.h>
> -#include <linux/sockios.h>
> -#include <linux/net.h>
> -#include <net/tcp_states.h>
> -#include <net/ax25.h>
> -#include <linux/inet.h>
> -#include <linux/netdevice.h>
> -#include <linux/skbuff.h>
> -#include <net/sock.h>
> -#include <linux/uaccess.h>
> -#include <linux/fcntl.h>
> -#include <linux/mm.h>
> -#include <linux/interrupt.h>
> -
> -static void ax25_ds_timeout(struct timer_list *);
> -
> -/*
> - *	Add DAMA slave timeout timer to timer list.
> - *	Unlike the connection based timers the timeout function gets
> - *	triggered every second. Please note that NET_AX25_DAMA_SLAVE_TIMEOUT
> - *	(aka /proc/sys/net/ax25/{dev}/dama_slave_timeout) is still in
> - *	1/10th of a second.
> - */
> -
> -void ax25_ds_setup_timer(ax25_dev *ax25_dev)
> -{
> -	timer_setup(&ax25_dev->dama.slave_timer, ax25_ds_timeout, 0);
> -}
> -
> -void ax25_ds_del_timer(ax25_dev *ax25_dev)
> -{
> -	if (ax25_dev)
> -		timer_delete(&ax25_dev->dama.slave_timer);
> -}
> -
> -void ax25_ds_set_timer(ax25_dev *ax25_dev)
> -{
> -	if (ax25_dev == NULL)		/* paranoia */
> -		return;
> -
> -	ax25_dev->dama.slave_timeout =
> -		msecs_to_jiffies(ax25_dev->values[AX25_VALUES_DS_TIMEOUT]) / 10;
> -	mod_timer(&ax25_dev->dama.slave_timer, jiffies + HZ);
> -}
> -
> -/*
> - *	DAMA Slave Timeout
> - *	Silently discard all (slave) connections in case our master forgot us...
> - */
> -
> -static void ax25_ds_timeout(struct timer_list *t)
> -{
> -	ax25_dev *ax25_dev = timer_container_of(ax25_dev, t, dama.slave_timer);
> -	ax25_cb *ax25;
> -
> -	if (ax25_dev == NULL || !ax25_dev->dama.slave)
> -		return;			/* Yikes! */
> -
> -	if (!ax25_dev->dama.slave_timeout || --ax25_dev->dama.slave_timeout) {
> -		ax25_ds_set_timer(ax25_dev);
> -		return;
> -	}
> -
> -	spin_lock(&ax25_list_lock);
> -	ax25_for_each(ax25, &ax25_list) {
> -		if (ax25->ax25_dev != ax25_dev || !(ax25->condition & AX25_COND_DAMA_MODE))
> -			continue;
> -
> -		ax25_send_control(ax25, AX25_DISC, AX25_POLLON, AX25_COMMAND);
> -		ax25_disconnect(ax25, ETIMEDOUT);
> -	}
> -	spin_unlock(&ax25_list_lock);
> -
> -	ax25_dev_dama_off(ax25_dev);
> -}
> -
> -void ax25_ds_heartbeat_expiry(ax25_cb *ax25)
> -{
> -	struct sock *sk=ax25->sk;
> -
> -	if (sk)
> -		bh_lock_sock(sk);
> -
> -	switch (ax25->state) {
> -
> -	case AX25_STATE_0:
> -	case AX25_STATE_2:
> -		/* Magic here: If we listen() and a new link dies before it
> -		   is accepted() it isn't 'dead' so doesn't get removed. */
> -		if (!sk || sock_flag(sk, SOCK_DESTROY) ||
> -		    (sk->sk_state == TCP_LISTEN &&
> -		     sock_flag(sk, SOCK_DEAD))) {
> -			if (sk) {
> -				sock_hold(sk);
> -				ax25_destroy_socket(ax25);
> -				bh_unlock_sock(sk);
> -				/* Ungrab socket and destroy it */
> -				sock_put(sk);
> -			} else
> -				ax25_destroy_socket(ax25);
> -			return;
> -		}
> -		break;
> -
> -	case AX25_STATE_3:
> -		/*
> -		 * Check the state of the receive buffer.
> -		 */
> -		if (sk != NULL) {
> -			if (atomic_read(&sk->sk_rmem_alloc) <
> -			    (sk->sk_rcvbuf >> 1) &&
> -			    (ax25->condition & AX25_COND_OWN_RX_BUSY)) {
> -				ax25->condition &= ~AX25_COND_OWN_RX_BUSY;
> -				ax25->condition &= ~AX25_COND_ACK_PENDING;
> -				break;
> -			}
> -		}
> -		break;
> -	}
> -
> -	if (sk)
> -		bh_unlock_sock(sk);
> -
> -	ax25_start_heartbeat(ax25);
> -}
> -
> -/* dl1bke 960114: T3 works much like the IDLE timeout, but
> - *                gets reloaded with every frame for this
> - *		  connection.
> - */
> -void ax25_ds_t3timer_expiry(ax25_cb *ax25)
> -{
> -	ax25_send_control(ax25, AX25_DISC, AX25_POLLON, AX25_COMMAND);
> -	ax25_dama_off(ax25);
> -	ax25_disconnect(ax25, ETIMEDOUT);
> -}
> -
> -/* dl1bke 960228: close the connection when IDLE expires.
> - *		  unlike T3 this timer gets reloaded only on
> - *		  I frames.
> - */
> -void ax25_ds_idletimer_expiry(ax25_cb *ax25)
> -{
> -	ax25_clear_queues(ax25);
> -
> -	ax25->n2count = 0;
> -	ax25->state = AX25_STATE_2;
> -
> -	ax25_calculate_t1(ax25);
> -	ax25_start_t1timer(ax25);
> -	ax25_stop_t3timer(ax25);
> -
> -	if (ax25->sk != NULL) {
> -		bh_lock_sock(ax25->sk);
> -		ax25->sk->sk_state     = TCP_CLOSE;
> -		ax25->sk->sk_err       = 0;
> -		ax25->sk->sk_shutdown |= SEND_SHUTDOWN;
> -		if (!sock_flag(ax25->sk, SOCK_DEAD)) {
> -			ax25->sk->sk_state_change(ax25->sk);
> -			sock_set_flag(ax25->sk, SOCK_DEAD);
> -		}
> -		bh_unlock_sock(ax25->sk);
> -	}
> -}
> -
> -/* dl1bke 960114: The DAMA protocol requires to send data and SABM/DISC
> - *                within the poll of any connected channel. Remember
> - *                that we are not allowed to send anything unless we
> - *                get polled by the Master.
> - *
> - *                Thus we'll have to do parts of our T1 handling in
> - *                ax25_enquiry_response().
> - */
> -void ax25_ds_t1_timeout(ax25_cb *ax25)
> -{
> -	switch (ax25->state) {
> -	case AX25_STATE_1:
> -		if (ax25->n2count == ax25->n2) {
> -			if (ax25->modulus == AX25_MODULUS) {
> -				ax25_disconnect(ax25, ETIMEDOUT);
> -				return;
> -			} else {
> -				ax25->modulus = AX25_MODULUS;
> -				ax25->window  = ax25->ax25_dev->values[AX25_VALUES_WINDOW];
> -				ax25->n2count = 0;
> -				ax25_send_control(ax25, AX25_SABM, AX25_POLLOFF, AX25_COMMAND);
> -			}
> -		} else {
> -			ax25->n2count++;
> -			if (ax25->modulus == AX25_MODULUS)
> -				ax25_send_control(ax25, AX25_SABM, AX25_POLLOFF, AX25_COMMAND);
> -			else
> -				ax25_send_control(ax25, AX25_SABME, AX25_POLLOFF, AX25_COMMAND);
> -		}
> -		break;
> -
> -	case AX25_STATE_2:
> -		if (ax25->n2count == ax25->n2) {
> -			ax25_send_control(ax25, AX25_DISC, AX25_POLLON, AX25_COMMAND);
> -			if (!sock_flag(ax25->sk, SOCK_DESTROY))
> -				ax25_disconnect(ax25, ETIMEDOUT);
> -			return;
> -		} else {
> -			ax25->n2count++;
> -		}
> -		break;
> -
> -	case AX25_STATE_3:
> -		if (ax25->n2count == ax25->n2) {
> -			ax25_send_control(ax25, AX25_DM, AX25_POLLON, AX25_RESPONSE);
> -			ax25_disconnect(ax25, ETIMEDOUT);
> -			return;
> -		} else {
> -			ax25->n2count++;
> -		}
> -		break;
> -	}
> -
> -	ax25_calculate_t1(ax25);
> -	ax25_start_t1timer(ax25);
> -}
> diff --git a/net/ax25/ax25_iface.c b/net/ax25/ax25_iface.c
> deleted file mode 100644
> index 3ad454416a5c..000000000000
> --- a/net/ax25/ax25_iface.c
> +++ /dev/null
> @@ -1,214 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-or-later
> -/*
> - *
> - * Copyright (C) Jonathan Naylor G4KLX (g4klx@g4klx.demon.co.uk)
> - */
> -#include <linux/errno.h>
> -#include <linux/types.h>
> -#include <linux/socket.h>
> -#include <linux/in.h>
> -#include <linux/kernel.h>
> -#include <linux/module.h>
> -#include <linux/spinlock.h>
> -#include <linux/timer.h>
> -#include <linux/string.h>
> -#include <linux/sockios.h>
> -#include <linux/net.h>
> -#include <linux/slab.h>
> -#include <net/ax25.h>
> -#include <linux/inet.h>
> -#include <linux/netdevice.h>
> -#include <linux/skbuff.h>
> -#include <net/sock.h>
> -#include <linux/uaccess.h>
> -#include <linux/fcntl.h>
> -#include <linux/mm.h>
> -#include <linux/interrupt.h>
> -
> -static struct ax25_protocol *protocol_list;
> -static DEFINE_RWLOCK(protocol_list_lock);
> -
> -static HLIST_HEAD(ax25_linkfail_list);
> -static DEFINE_SPINLOCK(linkfail_lock);
> -
> -static struct listen_struct {
> -	struct listen_struct *next;
> -	ax25_address  callsign;
> -	struct net_device *dev;
> -} *listen_list = NULL;
> -static DEFINE_SPINLOCK(listen_lock);
> -
> -/*
> - * Do not register the internal protocols AX25_P_TEXT, AX25_P_SEGMENT,
> - * AX25_P_IP or AX25_P_ARP ...
> - */
> -void ax25_register_pid(struct ax25_protocol *ap)
> -{
> -	write_lock_bh(&protocol_list_lock);
> -	ap->next = protocol_list;
> -	protocol_list = ap;
> -	write_unlock_bh(&protocol_list_lock);
> -}
> -
> -EXPORT_SYMBOL_GPL(ax25_register_pid);
> -
> -void ax25_protocol_release(unsigned int pid)
> -{
> -	struct ax25_protocol *protocol;
> -
> -	write_lock_bh(&protocol_list_lock);
> -	protocol = protocol_list;
> -	if (protocol == NULL)
> -		goto out;
> -
> -	if (protocol->pid == pid) {
> -		protocol_list = protocol->next;
> -		goto out;
> -	}
> -
> -	while (protocol != NULL && protocol->next != NULL) {
> -		if (protocol->next->pid == pid) {
> -			protocol->next = protocol->next->next;
> -			goto out;
> -		}
> -
> -		protocol = protocol->next;
> -	}
> -out:
> -	write_unlock_bh(&protocol_list_lock);
> -}
> -
> -EXPORT_SYMBOL(ax25_protocol_release);
> -
> -void ax25_linkfail_register(struct ax25_linkfail *lf)
> -{
> -	spin_lock_bh(&linkfail_lock);
> -	hlist_add_head(&lf->lf_node, &ax25_linkfail_list);
> -	spin_unlock_bh(&linkfail_lock);
> -}
> -
> -EXPORT_SYMBOL(ax25_linkfail_register);
> -
> -void ax25_linkfail_release(struct ax25_linkfail *lf)
> -{
> -	spin_lock_bh(&linkfail_lock);
> -	hlist_del_init(&lf->lf_node);
> -	spin_unlock_bh(&linkfail_lock);
> -}
> -
> -EXPORT_SYMBOL(ax25_linkfail_release);
> -
> -int ax25_listen_register(const ax25_address *callsign, struct net_device *dev)
> -{
> -	struct listen_struct *listen;
> -
> -	if (ax25_listen_mine(callsign, dev))
> -		return 0;
> -
> -	if ((listen = kmalloc_obj(*listen, GFP_ATOMIC)) == NULL)
> -		return -ENOMEM;
> -
> -	listen->callsign = *callsign;
> -	listen->dev      = dev;
> -
> -	spin_lock_bh(&listen_lock);
> -	listen->next = listen_list;
> -	listen_list  = listen;
> -	spin_unlock_bh(&listen_lock);
> -
> -	return 0;
> -}
> -
> -EXPORT_SYMBOL(ax25_listen_register);
> -
> -void ax25_listen_release(const ax25_address *callsign, struct net_device *dev)
> -{
> -	struct listen_struct *s, *listen;
> -
> -	spin_lock_bh(&listen_lock);
> -	listen = listen_list;
> -	if (listen == NULL) {
> -		spin_unlock_bh(&listen_lock);
> -		return;
> -	}
> -
> -	if (ax25cmp(&listen->callsign, callsign) == 0 && listen->dev == dev) {
> -		listen_list = listen->next;
> -		spin_unlock_bh(&listen_lock);
> -		kfree(listen);
> -		return;
> -	}
> -
> -	while (listen != NULL && listen->next != NULL) {
> -		if (ax25cmp(&listen->next->callsign, callsign) == 0 && listen->next->dev == dev) {
> -			s = listen->next;
> -			listen->next = listen->next->next;
> -			spin_unlock_bh(&listen_lock);
> -			kfree(s);
> -			return;
> -		}
> -
> -		listen = listen->next;
> -	}
> -	spin_unlock_bh(&listen_lock);
> -}
> -
> -EXPORT_SYMBOL(ax25_listen_release);
> -
> -int (*ax25_protocol_function(unsigned int pid))(struct sk_buff *, ax25_cb *)
> -{
> -	int (*res)(struct sk_buff *, ax25_cb *) = NULL;
> -	struct ax25_protocol *protocol;
> -
> -	read_lock(&protocol_list_lock);
> -	for (protocol = protocol_list; protocol != NULL; protocol = protocol->next)
> -		if (protocol->pid == pid) {
> -			res = protocol->func;
> -			break;
> -		}
> -	read_unlock(&protocol_list_lock);
> -
> -	return res;
> -}
> -
> -int ax25_listen_mine(const ax25_address *callsign, struct net_device *dev)
> -{
> -	struct listen_struct *listen;
> -
> -	spin_lock_bh(&listen_lock);
> -	for (listen = listen_list; listen != NULL; listen = listen->next)
> -		if (ax25cmp(&listen->callsign, callsign) == 0 &&
> -		    (listen->dev == dev || listen->dev == NULL)) {
> -			spin_unlock_bh(&listen_lock);
> -			return 1;
> -	}
> -	spin_unlock_bh(&listen_lock);
> -
> -	return 0;
> -}
> -
> -void ax25_link_failed(ax25_cb *ax25, int reason)
> -{
> -	struct ax25_linkfail *lf;
> -
> -	spin_lock_bh(&linkfail_lock);
> -	hlist_for_each_entry(lf, &ax25_linkfail_list, lf_node)
> -		lf->func(ax25, reason);
> -	spin_unlock_bh(&linkfail_lock);
> -}
> -
> -int ax25_protocol_is_registered(unsigned int pid)
> -{
> -	struct ax25_protocol *protocol;
> -	int res = 0;
> -
> -	read_lock_bh(&protocol_list_lock);
> -	for (protocol = protocol_list; protocol != NULL; protocol = protocol->next)
> -		if (protocol->pid == pid) {
> -			res = 1;
> -			break;
> -		}
> -	read_unlock_bh(&protocol_list_lock);
> -
> -	return res;
> -}
> diff --git a/net/ax25/ax25_in.c b/net/ax25/ax25_in.c
> deleted file mode 100644
> index d75b3e9ed93d..000000000000
> --- a/net/ax25/ax25_in.c
> +++ /dev/null
> @@ -1,455 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-or-later
> -/*
> - *
> - * Copyright (C) Alan Cox GW4PTS (alan@lxorguk.ukuu.org.uk)
> - * Copyright (C) Jonathan Naylor G4KLX (g4klx@g4klx.demon.co.uk)
> - * Copyright (C) Joerg Reuter DL1BKE (jreuter@yaina.de)
> - * Copyright (C) Hans-Joachim Hetscher DD8NE (dd8ne@bnv-bamberg.de)
> - */
> -#include <linux/errno.h>
> -#include <linux/types.h>
> -#include <linux/socket.h>
> -#include <linux/in.h>
> -#include <linux/kernel.h>
> -#include <linux/timer.h>
> -#include <linux/string.h>
> -#include <linux/sockios.h>
> -#include <linux/net.h>
> -#include <linux/slab.h>
> -#include <net/ax25.h>
> -#include <linux/inet.h>
> -#include <linux/netdevice.h>
> -#include <linux/skbuff.h>
> -#include <net/sock.h>
> -#include <net/tcp_states.h>
> -#include <linux/uaccess.h>
> -#include <linux/fcntl.h>
> -#include <linux/mm.h>
> -#include <linux/interrupt.h>
> -
> -/*
> - *	Given a fragment, queue it on the fragment queue and if the fragment
> - *	is complete, send it back to ax25_rx_iframe.
> - */
> -static int ax25_rx_fragment(ax25_cb *ax25, struct sk_buff *skb)
> -{
> -	struct sk_buff *skbn, *skbo;
> -
> -	if (ax25->fragno != 0) {
> -		if (!(*skb->data & AX25_SEG_FIRST)) {
> -			if ((ax25->fragno - 1) == (*skb->data & AX25_SEG_REM)) {
> -				/* Enqueue fragment */
> -				ax25->fragno = *skb->data & AX25_SEG_REM;
> -				skb_pull(skb, 1);	/* skip fragno */
> -				ax25->fraglen += skb->len;
> -				skb_queue_tail(&ax25->frag_queue, skb);
> -
> -				/* Last fragment received ? */
> -				if (ax25->fragno == 0) {
> -					skbn = alloc_skb(AX25_MAX_HEADER_LEN +
> -							 ax25->fraglen,
> -							 GFP_ATOMIC);
> -					if (!skbn) {
> -						skb_queue_purge(&ax25->frag_queue);
> -						return 1;
> -					}
> -
> -					skb_reserve(skbn, AX25_MAX_HEADER_LEN);
> -
> -					skbn->dev   = ax25->ax25_dev->dev;
> -					skb_reset_network_header(skbn);
> -					skb_reset_transport_header(skbn);
> -
> -					/* Copy data from the fragments */
> -					while ((skbo = skb_dequeue(&ax25->frag_queue)) != NULL) {
> -						skb_copy_from_linear_data(skbo,
> -							  skb_put(skbn, skbo->len),
> -									  skbo->len);
> -						kfree_skb(skbo);
> -					}
> -
> -					ax25->fraglen = 0;
> -
> -					if (ax25_rx_iframe(ax25, skbn) == 0)
> -						kfree_skb(skbn);
> -				}
> -
> -				return 1;
> -			}
> -		}
> -	} else {
> -		/* First fragment received */
> -		if (*skb->data & AX25_SEG_FIRST) {
> -			skb_queue_purge(&ax25->frag_queue);
> -			ax25->fragno = *skb->data & AX25_SEG_REM;
> -			skb_pull(skb, 1);		/* skip fragno */
> -			ax25->fraglen = skb->len;
> -			skb_queue_tail(&ax25->frag_queue, skb);
> -			return 1;
> -		}
> -	}
> -
> -	return 0;
> -}
> -
> -/*
> - *	This is where all valid I frames are sent to, to be dispatched to
> - *	whichever protocol requires them.
> - */
> -int ax25_rx_iframe(ax25_cb *ax25, struct sk_buff *skb)
> -{
> -	int (*func)(struct sk_buff *, ax25_cb *);
> -	unsigned char pid;
> -	int queued = 0;
> -
> -	if (skb == NULL) return 0;
> -
> -	ax25_start_idletimer(ax25);
> -
> -	pid = *skb->data;
> -
> -	if (pid == AX25_P_IP) {
> -		/* working around a TCP bug to keep additional listeners
> -		 * happy. TCP re-uses the buffer and destroys the original
> -		 * content.
> -		 */
> -		struct sk_buff *skbn = skb_copy(skb, GFP_ATOMIC);
> -		if (skbn != NULL) {
> -			kfree_skb(skb);
> -			skb = skbn;
> -		}
> -
> -		skb_pull(skb, 1);	/* Remove PID */
> -		skb->mac_header = skb->network_header;
> -		skb_reset_network_header(skb);
> -		skb->dev      = ax25->ax25_dev->dev;
> -		skb->pkt_type = PACKET_HOST;
> -		skb->protocol = htons(ETH_P_IP);
> -		netif_rx(skb);
> -		return 1;
> -	}
> -	if (pid == AX25_P_SEGMENT) {
> -		skb_pull(skb, 1);	/* Remove PID */
> -		return ax25_rx_fragment(ax25, skb);
> -	}
> -
> -	if ((func = ax25_protocol_function(pid)) != NULL) {
> -		skb_pull(skb, 1);	/* Remove PID */
> -		return (*func)(skb, ax25);
> -	}
> -
> -	if (ax25->sk != NULL && ax25->ax25_dev->values[AX25_VALUES_CONMODE] == 2) {
> -		if ((!ax25->pidincl && ax25->sk->sk_protocol == pid) ||
> -		    ax25->pidincl) {
> -			if (sock_queue_rcv_skb(ax25->sk, skb) == 0)
> -				queued = 1;
> -			else
> -				ax25->condition |= AX25_COND_OWN_RX_BUSY;
> -		}
> -	}
> -
> -	return queued;
> -}
> -
> -/*
> - *	Higher level upcall for a LAPB frame
> - */
> -static int ax25_process_rx_frame(ax25_cb *ax25, struct sk_buff *skb, int type, int dama)
> -{
> -	int queued = 0;
> -
> -	if (ax25->state == AX25_STATE_0)
> -		return 0;
> -
> -	switch (ax25->ax25_dev->values[AX25_VALUES_PROTOCOL]) {
> -	case AX25_PROTO_STD_SIMPLEX:
> -	case AX25_PROTO_STD_DUPLEX:
> -		queued = ax25_std_frame_in(ax25, skb, type);
> -		break;
> -
> -#ifdef CONFIG_AX25_DAMA_SLAVE
> -	case AX25_PROTO_DAMA_SLAVE:
> -		if (dama || ax25->ax25_dev->dama.slave)
> -			queued = ax25_ds_frame_in(ax25, skb, type);
> -		else
> -			queued = ax25_std_frame_in(ax25, skb, type);
> -		break;
> -#endif
> -	}
> -
> -	return queued;
> -}
> -
> -static int ax25_rcv(struct sk_buff *skb, struct net_device *dev,
> -		    const ax25_address *dev_addr, struct packet_type *ptype)
> -{
> -	ax25_address src, dest, *next_digi = NULL;
> -	int type = 0, mine = 0, dama;
> -	struct sock *make, *sk;
> -	ax25_digi dp, reverse_dp;
> -	ax25_cb *ax25;
> -	ax25_dev *ax25_dev;
> -
> -	/*
> -	 *	Process the AX.25/LAPB frame.
> -	 */
> -
> -	skb_reset_transport_header(skb);
> -
> -	if ((ax25_dev = ax25_dev_ax25dev(dev)) == NULL)
> -		goto free;
> -
> -	/*
> -	 *	Parse the address header.
> -	 */
> -
> -	if (ax25_addr_parse(skb->data, skb->len, &src, &dest, &dp, &type, &dama) == NULL)
> -		goto free;
> -
> -	/*
> -	 *	Ours perhaps ?
> -	 */
> -	if (dp.lastrepeat + 1 < dp.ndigi)		/* Not yet digipeated completely */
> -		next_digi = &dp.calls[dp.lastrepeat + 1];
> -
> -	/*
> -	 *	Pull of the AX.25 headers leaving the CTRL/PID bytes
> -	 */
> -	skb_pull(skb, ax25_addr_size(&dp));
> -
> -	/* For our port addresses ? */
> -	if (ax25cmp(&dest, dev_addr) == 0 && dp.lastrepeat + 1 == dp.ndigi)
> -		mine = 1;
> -
> -	/* Also match on any registered callsign from L3/4 */
> -	if (!mine && ax25_listen_mine(&dest, dev) && dp.lastrepeat + 1 == dp.ndigi)
> -		mine = 1;
> -
> -	/* UI frame - bypass LAPB processing */
> -	if ((*skb->data & ~0x10) == AX25_UI && dp.lastrepeat + 1 == dp.ndigi) {
> -		skb_set_transport_header(skb, 2); /* skip control and pid */
> -
> -		ax25_send_to_raw(&dest, skb, skb->data[1]);
> -
> -		if (!mine && ax25cmp(&dest, (ax25_address *)dev->broadcast) != 0)
> -			goto free;
> -
> -		/* Now we are pointing at the pid byte */
> -		switch (skb->data[1]) {
> -		case AX25_P_IP:
> -			skb_pull(skb,2);		/* drop PID/CTRL */
> -			skb_reset_transport_header(skb);
> -			skb_reset_network_header(skb);
> -			skb->dev      = dev;
> -			skb->pkt_type = PACKET_HOST;
> -			skb->protocol = htons(ETH_P_IP);
> -			netif_rx(skb);
> -			break;
> -
> -		case AX25_P_ARP:
> -			skb_pull(skb,2);
> -			skb_reset_transport_header(skb);
> -			skb_reset_network_header(skb);
> -			skb->dev      = dev;
> -			skb->pkt_type = PACKET_HOST;
> -			skb->protocol = htons(ETH_P_ARP);
> -			netif_rx(skb);
> -			break;
> -		case AX25_P_TEXT:
> -			/* Now find a suitable dgram socket */
> -			sk = ax25_get_socket(&dest, &src, SOCK_DGRAM);
> -			if (sk != NULL) {
> -				bh_lock_sock(sk);
> -				if (atomic_read(&sk->sk_rmem_alloc) >=
> -				    sk->sk_rcvbuf) {
> -					kfree_skb(skb);
> -				} else {
> -					/*
> -					 *	Remove the control and PID.
> -					 */
> -					skb_pull(skb, 2);
> -					if (sock_queue_rcv_skb(sk, skb) != 0)
> -						kfree_skb(skb);
> -				}
> -				bh_unlock_sock(sk);
> -				sock_put(sk);
> -			} else {
> -				kfree_skb(skb);
> -			}
> -			break;
> -
> -		default:
> -			kfree_skb(skb);	/* Will scan SOCK_AX25 RAW sockets */
> -			break;
> -		}
> -
> -		return 0;
> -	}
> -
> -	/*
> -	 *	Is connected mode supported on this device ?
> -	 *	If not, should we DM the incoming frame (except DMs) or
> -	 *	silently ignore them. For now we stay quiet.
> -	 */
> -	if (ax25_dev->values[AX25_VALUES_CONMODE] == 0)
> -		goto free;
> -
> -	/* LAPB */
> -
> -	/* AX.25 state 1-4 */
> -
> -	ax25_digi_invert(&dp, &reverse_dp);
> -
> -	if ((ax25 = ax25_find_cb(&dest, &src, &reverse_dp, dev)) != NULL) {
> -		/*
> -		 *	Process the frame. If it is queued up internally it
> -		 *	returns one otherwise we free it immediately. This
> -		 *	routine itself wakes the user context layers so we do
> -		 *	no further work
> -		 */
> -		if (ax25_process_rx_frame(ax25, skb, type, dama) == 0)
> -			kfree_skb(skb);
> -
> -		ax25_cb_put(ax25);
> -		return 0;
> -	}
> -
> -	/* AX.25 state 0 (disconnected) */
> -
> -	/* a) received not a SABM(E) */
> -
> -	if ((*skb->data & ~AX25_PF) != AX25_SABM &&
> -	    (*skb->data & ~AX25_PF) != AX25_SABME) {
> -		/*
> -		 *	Never reply to a DM. Also ignore any connects for
> -		 *	addresses that are not our interfaces and not a socket.
> -		 */
> -		if ((*skb->data & ~AX25_PF) != AX25_DM && mine)
> -			ax25_return_dm(dev, &src, &dest, &dp);
> -
> -		goto free;
> -	}
> -
> -	/* b) received SABM(E) */
> -
> -	if (dp.lastrepeat + 1 == dp.ndigi)
> -		sk = ax25_find_listener(&dest, 0, dev, SOCK_SEQPACKET);
> -	else
> -		sk = ax25_find_listener(next_digi, 1, dev, SOCK_SEQPACKET);
> -
> -	if (sk != NULL) {
> -		bh_lock_sock(sk);
> -		if (sk_acceptq_is_full(sk) ||
> -		    (make = ax25_make_new(sk, ax25_dev)) == NULL) {
> -			if (mine)
> -				ax25_return_dm(dev, &src, &dest, &dp);
> -			kfree_skb(skb);
> -			bh_unlock_sock(sk);
> -			sock_put(sk);
> -
> -			return 0;
> -		}
> -
> -		ax25 = sk_to_ax25(make);
> -		skb_set_owner_r(skb, make);
> -		skb_queue_head(&sk->sk_receive_queue, skb);
> -
> -		make->sk_state = TCP_ESTABLISHED;
> -
> -		sk_acceptq_added(sk);
> -		bh_unlock_sock(sk);
> -	} else {
> -		if (!mine)
> -			goto free;
> -
> -		if ((ax25 = ax25_create_cb()) == NULL) {
> -			ax25_return_dm(dev, &src, &dest, &dp);
> -			goto free;
> -		}
> -
> -		ax25_fillin_cb(ax25, ax25_dev);
> -	}
> -
> -	ax25->source_addr = dest;
> -	ax25->dest_addr   = src;
> -
> -	/*
> -	 *	Sort out any digipeated paths.
> -	 */
> -	if (dp.ndigi && !ax25->digipeat &&
> -	    (ax25->digipeat = kmalloc_obj(ax25_digi, GFP_ATOMIC)) == NULL) {
> -		kfree_skb(skb);
> -		ax25_destroy_socket(ax25);
> -		if (sk)
> -			sock_put(sk);
> -		return 0;
> -	}
> -
> -	if (dp.ndigi == 0) {
> -		kfree(ax25->digipeat);
> -		ax25->digipeat = NULL;
> -	} else {
> -		/* Reverse the source SABM's path */
> -		memcpy(ax25->digipeat, &reverse_dp, sizeof(ax25_digi));
> -	}
> -
> -	if ((*skb->data & ~AX25_PF) == AX25_SABME) {
> -		ax25->modulus = AX25_EMODULUS;
> -		ax25->window  = ax25_dev->values[AX25_VALUES_EWINDOW];
> -	} else {
> -		ax25->modulus = AX25_MODULUS;
> -		ax25->window  = ax25_dev->values[AX25_VALUES_WINDOW];
> -	}
> -
> -	ax25_send_control(ax25, AX25_UA, AX25_POLLON, AX25_RESPONSE);
> -
> -#ifdef CONFIG_AX25_DAMA_SLAVE
> -	if (dama && ax25->ax25_dev->values[AX25_VALUES_PROTOCOL] == AX25_PROTO_DAMA_SLAVE)
> -		ax25_dama_on(ax25);
> -#endif
> -
> -	ax25->state = AX25_STATE_3;
> -
> -	ax25_cb_add(ax25);
> -
> -	ax25_start_heartbeat(ax25);
> -	ax25_start_t3timer(ax25);
> -	ax25_start_idletimer(ax25);
> -
> -	if (sk) {
> -		if (!sock_flag(sk, SOCK_DEAD))
> -			sk->sk_data_ready(sk);
> -		sock_put(sk);
> -	} else {
> -free:
> -		kfree_skb(skb);
> -	}
> -	return 0;
> -}
> -
> -/*
> - *	Receive an AX.25 frame via a SLIP interface.
> - */
> -int ax25_kiss_rcv(struct sk_buff *skb, struct net_device *dev,
> -		  struct packet_type *ptype, struct net_device *orig_dev)
> -{
> -	skb = skb_share_check(skb, GFP_ATOMIC);
> -	if (!skb)
> -		return NET_RX_DROP;
> -
> -	skb_orphan(skb);
> -
> -	if (!net_eq(dev_net(dev), &init_net)) {
> -		kfree_skb(skb);
> -		return 0;
> -	}
> -
> -	if ((*skb->data & 0x0F) != 0) {
> -		kfree_skb(skb);	/* Not a KISS data frame */
> -		return 0;
> -	}
> -
> -	skb_pull(skb, AX25_KISS_HEADER_LEN);	/* Remove the KISS byte */
> -
> -	return ax25_rcv(skb, dev, (const ax25_address *)dev->dev_addr, ptype);
> -}
> diff --git a/net/ax25/ax25_ip.c b/net/ax25/ax25_ip.c
> deleted file mode 100644
> index 215d4ccf12b9..000000000000
> --- a/net/ax25/ax25_ip.c
> +++ /dev/null
> @@ -1,247 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-or-later
> -/*
> - *
> - * Copyright (C) Jonathan Naylor G4KLX (g4klx@g4klx.demon.co.uk)
> - */
> -#include <linux/errno.h>
> -#include <linux/types.h>
> -#include <linux/socket.h>
> -#include <linux/in.h>
> -#include <linux/kernel.h>
> -#include <linux/module.h>
> -#include <linux/timer.h>
> -#include <linux/string.h>
> -#include <linux/sockios.h>
> -#include <linux/net.h>
> -#include <linux/slab.h>
> -#include <net/ax25.h>
> -#include <linux/inet.h>
> -#include <linux/netdevice.h>
> -#include <linux/if_arp.h>
> -#include <linux/skbuff.h>
> -#include <net/sock.h>
> -#include <linux/uaccess.h>
> -#include <linux/fcntl.h>
> -#include <linux/termios.h>	/* For TIOCINQ/OUTQ */
> -#include <linux/mm.h>
> -#include <linux/interrupt.h>
> -#include <linux/notifier.h>
> -#include <linux/proc_fs.h>
> -#include <linux/stat.h>
> -#include <linux/sysctl.h>
> -#include <net/ip.h>
> -#include <net/arp.h>
> -
> -/*
> - *	IP over AX.25 encapsulation.
> - */
> -
> -/*
> - *	Shove an AX.25 UI header on an IP packet and handle ARP
> - */
> -
> -#ifdef CONFIG_INET
> -
> -static int ax25_hard_header(struct sk_buff *skb, struct net_device *dev,
> -			    unsigned short type, const void *daddr,
> -			    const void *saddr, unsigned int len)
> -{
> -	unsigned char *buff;
> -
> -	/* they sometimes come back to us... */
> -	if (type == ETH_P_AX25)
> -		return 0;
> -
> -	/* header is an AX.25 UI frame from us to them */
> -	buff = skb_push(skb, AX25_HEADER_LEN);
> -	*buff++ = 0x00;	/* KISS DATA */
> -
> -	if (daddr != NULL)
> -		memcpy(buff, daddr, dev->addr_len);	/* Address specified */
> -
> -	buff[6] &= ~AX25_CBIT;
> -	buff[6] &= ~AX25_EBIT;
> -	buff[6] |= AX25_SSSID_SPARE;
> -	buff    += AX25_ADDR_LEN;
> -
> -	if (saddr != NULL)
> -		memcpy(buff, saddr, dev->addr_len);
> -	else
> -		memcpy(buff, dev->dev_addr, dev->addr_len);
> -
> -	buff[6] &= ~AX25_CBIT;
> -	buff[6] |= AX25_EBIT;
> -	buff[6] |= AX25_SSSID_SPARE;
> -	buff    += AX25_ADDR_LEN;
> -
> -	*buff++  = AX25_UI;	/* UI */
> -
> -	/* Append a suitable AX.25 PID */
> -	switch (type) {
> -	case ETH_P_IP:
> -		*buff++ = AX25_P_IP;
> -		break;
> -	case ETH_P_ARP:
> -		*buff++ = AX25_P_ARP;
> -		break;
> -	default:
> -		printk(KERN_ERR "AX.25: ax25_hard_header - wrong protocol type 0x%2.2x\n", type);
> -		*buff++ = 0;
> -		break;
> -	}
> -
> -	if (daddr != NULL)
> -		return AX25_HEADER_LEN;
> -
> -	return -AX25_HEADER_LEN;	/* Unfinished header */
> -}
> -
> -netdev_tx_t ax25_ip_xmit(struct sk_buff *skb)
> -{
> -	struct sk_buff *ourskb;
> -	unsigned char *bp  = skb->data;
> -	ax25_route *route;
> -	struct net_device *dev = NULL;
> -	ax25_address *src, *dst;
> -	ax25_digi *digipeat = NULL;
> -	ax25_dev *ax25_dev;
> -	ax25_cb *ax25;
> -	char ip_mode = ' ';
> -
> -	dst = (ax25_address *)(bp + 1);
> -	src = (ax25_address *)(bp + 8);
> -
> -	ax25_route_lock_use();
> -	route = ax25_get_route(dst, NULL);
> -	if (route) {
> -		digipeat = route->digipeat;
> -		dev = route->dev;
> -		ip_mode = route->ip_mode;
> -	}
> -
> -	if (dev == NULL)
> -		dev = skb->dev;
> -
> -	rcu_read_lock();
> -	if ((ax25_dev = ax25_dev_ax25dev(dev)) == NULL) {
> -		kfree_skb(skb);
> -		goto put;
> -	}
> -
> -	if (bp[16] == AX25_P_IP) {
> -		if (ip_mode == 'V' || (ip_mode == ' ' && ax25_dev->values[AX25_VALUES_IPDEFMODE])) {
> -			/*
> -			 *	We copy the buffer and release the original thereby
> -			 *	keeping it straight
> -			 *
> -			 *	Note: we report 1 back so the caller will
> -			 *	not feed the frame direct to the physical device
> -			 *	We don't want that to happen. (It won't be upset
> -			 *	as we have pulled the frame from the queue by
> -			 *	freeing it).
> -			 *
> -			 *	NB: TCP modifies buffers that are still
> -			 *	on a device queue, thus we use skb_copy()
> -			 *      instead of using skb_clone() unless this
> -			 *	gets fixed.
> -			 */
> -
> -			ax25_address src_c;
> -			ax25_address dst_c;
> -
> -			if ((ourskb = skb_copy(skb, GFP_ATOMIC)) == NULL) {
> -				kfree_skb(skb);
> -				goto put;
> -			}
> -
> -			if (skb->sk != NULL)
> -				skb_set_owner_w(ourskb, skb->sk);
> -
> -			kfree_skb(skb);
> -			/* dl9sau: bugfix
> -			 * after kfree_skb(), dst and src which were pointer
> -			 * to bp which is part of skb->data would not be valid
> -			 * anymore hope that after skb_pull(ourskb, ..) our
> -			 * dsc_c and src_c will not become invalid
> -			 */
> -			bp  = ourskb->data;
> -			dst_c = *(ax25_address *)(bp + 1);
> -			src_c = *(ax25_address *)(bp + 8);
> -
> -			skb_pull(ourskb, AX25_HEADER_LEN - 1);	/* Keep PID */
> -			skb_reset_network_header(ourskb);
> -
> -			ax25=ax25_send_frame(
> -			    ourskb,
> -			    ax25_dev->values[AX25_VALUES_PACLEN],
> -			    &src_c,
> -			    &dst_c, digipeat, dev);
> -			if (ax25) {
> -				ax25_cb_put(ax25);
> -			}
> -			goto put;
> -		}
> -	}
> -
> -	bp[7]  &= ~AX25_CBIT;
> -	bp[7]  &= ~AX25_EBIT;
> -	bp[7]  |= AX25_SSSID_SPARE;
> -
> -	bp[14] &= ~AX25_CBIT;
> -	bp[14] |= AX25_EBIT;
> -	bp[14] |= AX25_SSSID_SPARE;
> -
> -	skb_pull(skb, AX25_KISS_HEADER_LEN);
> -
> -	if (digipeat != NULL) {
> -		if ((ourskb = ax25_rt_build_path(skb, src, dst, route->digipeat)) == NULL)
> -			goto put;
> -
> -		skb = ourskb;
> -	}
> -
> -	ax25_queue_xmit(skb, dev);
> -
> -put:
> -	rcu_read_unlock();
> -	ax25_route_lock_unuse();
> -	return NETDEV_TX_OK;
> -}
> -
> -#else	/* INET */
> -
> -static int ax25_hard_header(struct sk_buff *skb, struct net_device *dev,
> -			    unsigned short type, const void *daddr,
> -			    const void *saddr, unsigned int len)
> -{
> -	return -AX25_HEADER_LEN;
> -}
> -
> -netdev_tx_t ax25_ip_xmit(struct sk_buff *skb)
> -{
> -	kfree_skb(skb);
> -	return NETDEV_TX_OK;
> -}
> -#endif
> -
> -static bool ax25_validate_header(const char *header, unsigned int len)
> -{
> -	ax25_digi digi;
> -
> -	if (!len)
> -		return false;
> -
> -	if (header[0])
> -		return true;
> -
> -	return ax25_addr_parse(header + 1, len - 1, NULL, NULL, &digi, NULL,
> -			       NULL);
> -}
> -
> -const struct header_ops ax25_header_ops = {
> -	.create = ax25_hard_header,
> -	.validate = ax25_validate_header,
> -};
> -
> -EXPORT_SYMBOL(ax25_header_ops);
> -EXPORT_SYMBOL(ax25_ip_xmit);
> diff --git a/net/ax25/ax25_out.c b/net/ax25/ax25_out.c
> deleted file mode 100644
> index 8bca2ace98e5..000000000000
> --- a/net/ax25/ax25_out.c
> +++ /dev/null
> @@ -1,398 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-or-later
> -/*
> - *
> - * Copyright (C) Alan Cox GW4PTS (alan@lxorguk.ukuu.org.uk)
> - * Copyright (C) Jonathan Naylor G4KLX (g4klx@g4klx.demon.co.uk)
> - * Copyright (C) Joerg Reuter DL1BKE (jreuter@yaina.de)
> - */
> -#include <linux/errno.h>
> -#include <linux/types.h>
> -#include <linux/socket.h>
> -#include <linux/in.h>
> -#include <linux/kernel.h>
> -#include <linux/module.h>
> -#include <linux/timer.h>
> -#include <linux/string.h>
> -#include <linux/sockios.h>
> -#include <linux/spinlock.h>
> -#include <linux/net.h>
> -#include <linux/slab.h>
> -#include <net/ax25.h>
> -#include <linux/inet.h>
> -#include <linux/netdevice.h>
> -#include <linux/skbuff.h>
> -#include <net/sock.h>
> -#include <linux/uaccess.h>
> -#include <linux/fcntl.h>
> -#include <linux/mm.h>
> -#include <linux/interrupt.h>
> -
> -static DEFINE_SPINLOCK(ax25_frag_lock);
> -
> -ax25_cb *ax25_send_frame(struct sk_buff *skb, int paclen, const ax25_address *src, ax25_address *dest, ax25_digi *digi, struct net_device *dev)
> -{
> -	ax25_dev *ax25_dev;
> -	ax25_cb *ax25;
> -
> -	/*
> -	 * Take the default packet length for the device if zero is
> -	 * specified.
> -	 */
> -	if (paclen == 0) {
> -		rcu_read_lock();
> -		ax25_dev = ax25_dev_ax25dev(dev);
> -		if (!ax25_dev) {
> -			rcu_read_unlock();
> -			return NULL;
> -		}
> -		paclen = ax25_dev->values[AX25_VALUES_PACLEN];
> -		rcu_read_unlock();
> -	}
> -
> -	/*
> -	 * Look for an existing connection.
> -	 */
> -	if ((ax25 = ax25_find_cb(src, dest, digi, dev)) != NULL) {
> -		ax25_output(ax25, paclen, skb);
> -		return ax25;		/* It already existed */
> -	}
> -
> -	rcu_read_lock();
> -	ax25_dev = ax25_dev_ax25dev(dev);
> -	if (!ax25_dev) {
> -		rcu_read_unlock();
> -		return NULL;
> -	}
> -
> -	if ((ax25 = ax25_create_cb()) == NULL) {
> -		rcu_read_unlock();
> -		return NULL;
> -	}
> -	ax25_fillin_cb(ax25, ax25_dev);
> -	rcu_read_unlock();
> -
> -	ax25->source_addr = *src;
> -	ax25->dest_addr   = *dest;
> -
> -	if (digi != NULL) {
> -		ax25->digipeat = kmemdup(digi, sizeof(*digi), GFP_ATOMIC);
> -		if (ax25->digipeat == NULL) {
> -			ax25_cb_put(ax25);
> -			return NULL;
> -		}
> -	}
> -
> -	switch (ax25->ax25_dev->values[AX25_VALUES_PROTOCOL]) {
> -	case AX25_PROTO_STD_SIMPLEX:
> -	case AX25_PROTO_STD_DUPLEX:
> -		ax25_std_establish_data_link(ax25);
> -		break;
> -
> -#ifdef CONFIG_AX25_DAMA_SLAVE
> -	case AX25_PROTO_DAMA_SLAVE:
> -		if (ax25_dev->dama.slave)
> -			ax25_ds_establish_data_link(ax25);
> -		else
> -			ax25_std_establish_data_link(ax25);
> -		break;
> -#endif
> -	}
> -
> -	/*
> -	 * There is one ref for the state machine; a caller needs
> -	 * one more to put it back, just like with the existing one.
> -	 */
> -	ax25_cb_hold(ax25);
> -
> -	ax25_cb_add(ax25);
> -
> -	ax25->state = AX25_STATE_1;
> -
> -	ax25_start_heartbeat(ax25);
> -
> -	ax25_output(ax25, paclen, skb);
> -
> -	return ax25;			/* We had to create it */
> -}
> -
> -EXPORT_SYMBOL(ax25_send_frame);
> -
> -/*
> - *	All outgoing AX.25 I frames pass via this routine. Therefore this is
> - *	where the fragmentation of frames takes place. If fragment is set to
> - *	zero then we are not allowed to do fragmentation, even if the frame
> - *	is too large.
> - */
> -void ax25_output(ax25_cb *ax25, int paclen, struct sk_buff *skb)
> -{
> -	struct sk_buff *skbn;
> -	unsigned char *p;
> -	int frontlen, len, fragno, ka9qfrag, first = 1;
> -
> -	if (paclen < 16) {
> -		WARN_ON_ONCE(1);
> -		kfree_skb(skb);
> -		return;
> -	}
> -
> -	if ((skb->len - 1) > paclen) {
> -		if (*skb->data == AX25_P_TEXT) {
> -			skb_pull(skb, 1); /* skip PID */
> -			ka9qfrag = 0;
> -		} else {
> -			paclen -= 2;	/* Allow for fragment control info */
> -			ka9qfrag = 1;
> -		}
> -
> -		fragno = skb->len / paclen;
> -		if (skb->len % paclen == 0) fragno--;
> -
> -		frontlen = skb_headroom(skb);	/* Address space + CTRL */
> -
> -		while (skb->len > 0) {
> -			spin_lock_bh(&ax25_frag_lock);
> -			if ((skbn = alloc_skb(paclen + 2 + frontlen, GFP_ATOMIC)) == NULL) {
> -				spin_unlock_bh(&ax25_frag_lock);
> -				printk(KERN_CRIT "AX.25: ax25_output - out of memory\n");
> -				return;
> -			}
> -
> -			if (skb->sk != NULL)
> -				skb_set_owner_w(skbn, skb->sk);
> -
> -			spin_unlock_bh(&ax25_frag_lock);
> -
> -			len = (paclen > skb->len) ? skb->len : paclen;
> -
> -			if (ka9qfrag == 1) {
> -				skb_reserve(skbn, frontlen + 2);
> -				skb_set_network_header(skbn,
> -						      skb_network_offset(skb));
> -				skb_copy_from_linear_data(skb, skb_put(skbn, len), len);
> -				p = skb_push(skbn, 2);
> -
> -				*p++ = AX25_P_SEGMENT;
> -
> -				*p = fragno--;
> -				if (first) {
> -					*p |= AX25_SEG_FIRST;
> -					first = 0;
> -				}
> -			} else {
> -				skb_reserve(skbn, frontlen + 1);
> -				skb_set_network_header(skbn,
> -						      skb_network_offset(skb));
> -				skb_copy_from_linear_data(skb, skb_put(skbn, len), len);
> -				p = skb_push(skbn, 1);
> -				*p = AX25_P_TEXT;
> -			}
> -
> -			skb_pull(skb, len);
> -			skb_queue_tail(&ax25->write_queue, skbn); /* Throw it on the queue */
> -		}
> -
> -		kfree_skb(skb);
> -	} else {
> -		skb_queue_tail(&ax25->write_queue, skb);	  /* Throw it on the queue */
> -	}
> -
> -	switch (ax25->ax25_dev->values[AX25_VALUES_PROTOCOL]) {
> -	case AX25_PROTO_STD_SIMPLEX:
> -	case AX25_PROTO_STD_DUPLEX:
> -		ax25_kick(ax25);
> -		break;
> -
> -#ifdef CONFIG_AX25_DAMA_SLAVE
> -	/*
> -	 * A DAMA slave is _required_ to work as normal AX.25L2V2
> -	 * if no DAMA master is available.
> -	 */
> -	case AX25_PROTO_DAMA_SLAVE:
> -		if (!ax25->ax25_dev->dama.slave) ax25_kick(ax25);
> -		break;
> -#endif
> -	}
> -}
> -
> -/*
> - *  This procedure is passed a buffer descriptor for an iframe. It builds
> - *  the rest of the control part of the frame and then writes it out.
> - */
> -static void ax25_send_iframe(ax25_cb *ax25, struct sk_buff *skb, int poll_bit)
> -{
> -	unsigned char *frame;
> -
> -	if (skb == NULL)
> -		return;
> -
> -	skb_reset_network_header(skb);
> -
> -	if (ax25->modulus == AX25_MODULUS) {
> -		frame = skb_push(skb, 1);
> -
> -		*frame = AX25_I;
> -		*frame |= (poll_bit) ? AX25_PF : 0;
> -		*frame |= (ax25->vr << 5);
> -		*frame |= (ax25->vs << 1);
> -	} else {
> -		frame = skb_push(skb, 2);
> -
> -		frame[0] = AX25_I;
> -		frame[0] |= (ax25->vs << 1);
> -		frame[1] = (poll_bit) ? AX25_EPF : 0;
> -		frame[1] |= (ax25->vr << 1);
> -	}
> -
> -	ax25_start_idletimer(ax25);
> -
> -	ax25_transmit_buffer(ax25, skb, AX25_COMMAND);
> -}
> -
> -void ax25_kick(ax25_cb *ax25)
> -{
> -	struct sk_buff *skb, *skbn;
> -	int last = 1;
> -	unsigned short start, end, next;
> -
> -	if (ax25->state != AX25_STATE_3 && ax25->state != AX25_STATE_4)
> -		return;
> -
> -	if (ax25->condition & AX25_COND_PEER_RX_BUSY)
> -		return;
> -
> -	if (skb_peek(&ax25->write_queue) == NULL)
> -		return;
> -
> -	start = (skb_peek(&ax25->ack_queue) == NULL) ? ax25->va : ax25->vs;
> -	end   = (ax25->va + ax25->window) % ax25->modulus;
> -
> -	if (start == end)
> -		return;
> -
> -	/*
> -	 * Transmit data until either we're out of data to send or
> -	 * the window is full. Send a poll on the final I frame if
> -	 * the window is filled.
> -	 */
> -
> -	/*
> -	 * Dequeue the frame and copy it.
> -	 * Check for race with ax25_clear_queues().
> -	 */
> -	skb  = skb_dequeue(&ax25->write_queue);
> -	if (!skb)
> -		return;
> -
> -	ax25->vs = start;
> -
> -	do {
> -		if ((skbn = skb_clone(skb, GFP_ATOMIC)) == NULL) {
> -			skb_queue_head(&ax25->write_queue, skb);
> -			break;
> -		}
> -
> -		if (skb->sk != NULL)
> -			skb_set_owner_w(skbn, skb->sk);
> -
> -		next = (ax25->vs + 1) % ax25->modulus;
> -		last = (next == end);
> -
> -		/*
> -		 * Transmit the frame copy.
> -		 * bke 960114: do not set the Poll bit on the last frame
> -		 * in DAMA mode.
> -		 */
> -		switch (ax25->ax25_dev->values[AX25_VALUES_PROTOCOL]) {
> -		case AX25_PROTO_STD_SIMPLEX:
> -		case AX25_PROTO_STD_DUPLEX:
> -			ax25_send_iframe(ax25, skbn, (last) ? AX25_POLLON : AX25_POLLOFF);
> -			break;
> -
> -#ifdef CONFIG_AX25_DAMA_SLAVE
> -		case AX25_PROTO_DAMA_SLAVE:
> -			ax25_send_iframe(ax25, skbn, AX25_POLLOFF);
> -			break;
> -#endif
> -		}
> -
> -		ax25->vs = next;
> -
> -		/*
> -		 * Requeue the original data frame.
> -		 */
> -		skb_queue_tail(&ax25->ack_queue, skb);
> -
> -	} while (!last && (skb = skb_dequeue(&ax25->write_queue)) != NULL);
> -
> -	ax25->condition &= ~AX25_COND_ACK_PENDING;
> -
> -	if (!ax25_t1timer_running(ax25)) {
> -		ax25_stop_t3timer(ax25);
> -		ax25_calculate_t1(ax25);
> -		ax25_start_t1timer(ax25);
> -	}
> -}
> -
> -void ax25_transmit_buffer(ax25_cb *ax25, struct sk_buff *skb, int type)
> -{
> -	unsigned char *ptr;
> -	int headroom;
> -
> -	if (ax25->ax25_dev == NULL) {
> -		ax25_disconnect(ax25, ENETUNREACH);
> -		return;
> -	}
> -
> -	headroom = ax25_addr_size(ax25->digipeat);
> -
> -	if (unlikely(skb_headroom(skb) < headroom)) {
> -		skb = skb_expand_head(skb, headroom);
> -		if (!skb) {
> -			printk(KERN_CRIT "AX.25: ax25_transmit_buffer - out of memory\n");
> -			return;
> -		}
> -	}
> -
> -	ptr = skb_push(skb, headroom);
> -
> -	ax25_addr_build(ptr, &ax25->source_addr, &ax25->dest_addr, ax25->digipeat, type, ax25->modulus);
> -
> -	ax25_queue_xmit(skb, ax25->ax25_dev->dev);
> -}
> -
> -/*
> - *	A small shim to dev_queue_xmit to add the KISS control byte, and do
> - *	any packet forwarding in operation.
> - */
> -void ax25_queue_xmit(struct sk_buff *skb, struct net_device *dev)
> -{
> -	unsigned char *ptr;
> -
> -	rcu_read_lock();
> -	skb->protocol = ax25_type_trans(skb, ax25_fwd_dev(dev));
> -	rcu_read_unlock();
> -
> -	ptr  = skb_push(skb, 1);
> -	*ptr = 0x00;			/* KISS */
> -
> -	dev_queue_xmit(skb);
> -}
> -
> -int ax25_check_iframes_acked(ax25_cb *ax25, unsigned short nr)
> -{
> -	if (ax25->vs == nr) {
> -		ax25_frames_acked(ax25, nr);
> -		ax25_calculate_rtt(ax25);
> -		ax25_stop_t1timer(ax25);
> -		ax25_start_t3timer(ax25);
> -		return 1;
> -	} else {
> -		if (ax25->va != nr) {
> -			ax25_frames_acked(ax25, nr);
> -			ax25_calculate_t1(ax25);
> -			ax25_start_t1timer(ax25);
> -			return 1;
> -		}
> -	}
> -	return 0;
> -}
> diff --git a/net/ax25/ax25_route.c b/net/ax25/ax25_route.c
> deleted file mode 100644
> index 1d5c59ccf142..000000000000
> --- a/net/ax25/ax25_route.c
> +++ /dev/null
> @@ -1,416 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-or-later
> -/*
> - *
> - * Copyright (C) Alan Cox GW4PTS (alan@lxorguk.ukuu.org.uk)
> - * Copyright (C) Jonathan Naylor G4KLX (g4klx@g4klx.demon.co.uk)
> - * Copyright (C) Steven Whitehouse GW7RRM (stevew@acm.org)
> - * Copyright (C) Joerg Reuter DL1BKE (jreuter@yaina.de)
> - * Copyright (C) Hans-Joachim Hetscher DD8NE (dd8ne@bnv-bamberg.de)
> - * Copyright (C) Frederic Rible F1OAT (frible@teaser.fr)
> - */
> -
> -#include <linux/capability.h>
> -#include <linux/errno.h>
> -#include <linux/types.h>
> -#include <linux/socket.h>
> -#include <linux/timer.h>
> -#include <linux/in.h>
> -#include <linux/kernel.h>
> -#include <linux/sched.h>
> -#include <linux/string.h>
> -#include <linux/sockios.h>
> -#include <linux/net.h>
> -#include <linux/slab.h>
> -#include <net/ax25.h>
> -#include <linux/inet.h>
> -#include <linux/netdevice.h>
> -#include <linux/if_arp.h>
> -#include <linux/skbuff.h>
> -#include <linux/spinlock.h>
> -#include <net/sock.h>
> -#include <linux/uaccess.h>
> -#include <linux/fcntl.h>
> -#include <linux/mm.h>
> -#include <linux/interrupt.h>
> -#include <linux/init.h>
> -#include <linux/seq_file.h>
> -#include <linux/export.h>
> -
> -static ax25_route *ax25_route_list;
> -DEFINE_RWLOCK(ax25_route_lock);
> -
> -void ax25_rt_device_down(struct net_device *dev)
> -{
> -	ax25_route *s, *t, *ax25_rt;
> -
> -	write_lock_bh(&ax25_route_lock);
> -	ax25_rt = ax25_route_list;
> -	while (ax25_rt != NULL) {
> -		s       = ax25_rt;
> -		ax25_rt = ax25_rt->next;
> -
> -		if (s->dev == dev) {
> -			if (ax25_route_list == s) {
> -				ax25_route_list = s->next;
> -				kfree(s->digipeat);
> -				kfree(s);
> -			} else {
> -				for (t = ax25_route_list; t != NULL; t = t->next) {
> -					if (t->next == s) {
> -						t->next = s->next;
> -						kfree(s->digipeat);
> -						kfree(s);
> -						break;
> -					}
> -				}
> -			}
> -		}
> -	}
> -	write_unlock_bh(&ax25_route_lock);
> -}
> -
> -static int __must_check ax25_rt_add(struct ax25_routes_struct *route)
> -{
> -	ax25_route *ax25_rt;
> -	ax25_dev *ax25_dev;
> -	int i;
> -
> -	if (route->digi_count > AX25_MAX_DIGIS)
> -		return -EINVAL;
> -
> -	ax25_dev = ax25_addr_ax25dev(&route->port_addr);
> -	if (!ax25_dev)
> -		return -EINVAL;
> -
> -	write_lock_bh(&ax25_route_lock);
> -
> -	ax25_rt = ax25_route_list;
> -	while (ax25_rt != NULL) {
> -		if (ax25cmp(&ax25_rt->callsign, &route->dest_addr) == 0 &&
> -			    ax25_rt->dev == ax25_dev->dev) {
> -			kfree(ax25_rt->digipeat);
> -			ax25_rt->digipeat = NULL;
> -			if (route->digi_count != 0) {
> -				if ((ax25_rt->digipeat = kmalloc_obj(ax25_digi, GFP_ATOMIC)) == NULL) {
> -					write_unlock_bh(&ax25_route_lock);
> -					ax25_dev_put(ax25_dev);
> -					return -ENOMEM;
> -				}
> -				ax25_rt->digipeat->lastrepeat = -1;
> -				ax25_rt->digipeat->ndigi      = route->digi_count;
> -				for (i = 0; i < route->digi_count; i++) {
> -					ax25_rt->digipeat->repeated[i] = 0;
> -					ax25_rt->digipeat->calls[i]    = route->digi_addr[i];
> -				}
> -			}
> -			write_unlock_bh(&ax25_route_lock);
> -			ax25_dev_put(ax25_dev);
> -			return 0;
> -		}
> -		ax25_rt = ax25_rt->next;
> -	}
> -
> -	if ((ax25_rt = kmalloc_obj(ax25_route, GFP_ATOMIC)) == NULL) {
> -		write_unlock_bh(&ax25_route_lock);
> -		ax25_dev_put(ax25_dev);
> -		return -ENOMEM;
> -	}
> -
> -	ax25_rt->callsign     = route->dest_addr;
> -	ax25_rt->dev          = ax25_dev->dev;
> -	ax25_rt->digipeat     = NULL;
> -	ax25_rt->ip_mode      = ' ';
> -	if (route->digi_count != 0) {
> -		if ((ax25_rt->digipeat = kmalloc_obj(ax25_digi, GFP_ATOMIC)) == NULL) {
> -			write_unlock_bh(&ax25_route_lock);
> -			kfree(ax25_rt);
> -			ax25_dev_put(ax25_dev);
> -			return -ENOMEM;
> -		}
> -		ax25_rt->digipeat->lastrepeat = -1;
> -		ax25_rt->digipeat->ndigi      = route->digi_count;
> -		for (i = 0; i < route->digi_count; i++) {
> -			ax25_rt->digipeat->repeated[i] = 0;
> -			ax25_rt->digipeat->calls[i]    = route->digi_addr[i];
> -		}
> -	}
> -	ax25_rt->next   = ax25_route_list;
> -	ax25_route_list = ax25_rt;
> -	write_unlock_bh(&ax25_route_lock);
> -	ax25_dev_put(ax25_dev);
> -
> -	return 0;
> -}
> -
> -void __ax25_put_route(ax25_route *ax25_rt)
> -{
> -	kfree(ax25_rt->digipeat);
> -	kfree(ax25_rt);
> -}
> -
> -static int ax25_rt_del(struct ax25_routes_struct *route)
> -{
> -	ax25_route *s, *t, *ax25_rt;
> -	ax25_dev *ax25_dev;
> -
> -	if ((ax25_dev = ax25_addr_ax25dev(&route->port_addr)) == NULL)
> -		return -EINVAL;
> -
> -	write_lock_bh(&ax25_route_lock);
> -
> -	ax25_rt = ax25_route_list;
> -	while (ax25_rt != NULL) {
> -		s       = ax25_rt;
> -		ax25_rt = ax25_rt->next;
> -		if (s->dev == ax25_dev->dev &&
> -		    ax25cmp(&route->dest_addr, &s->callsign) == 0) {
> -			if (ax25_route_list == s) {
> -				ax25_route_list = s->next;
> -				__ax25_put_route(s);
> -			} else {
> -				for (t = ax25_route_list; t != NULL; t = t->next) {
> -					if (t->next == s) {
> -						t->next = s->next;
> -						__ax25_put_route(s);
> -						break;
> -					}
> -				}
> -			}
> -		}
> -	}
> -	write_unlock_bh(&ax25_route_lock);
> -	ax25_dev_put(ax25_dev);
> -
> -	return 0;
> -}
> -
> -static int ax25_rt_opt(struct ax25_route_opt_struct *rt_option)
> -{
> -	ax25_route *ax25_rt;
> -	ax25_dev *ax25_dev;
> -	int err = 0;
> -
> -	if ((ax25_dev = ax25_addr_ax25dev(&rt_option->port_addr)) == NULL)
> -		return -EINVAL;
> -
> -	write_lock_bh(&ax25_route_lock);
> -
> -	ax25_rt = ax25_route_list;
> -	while (ax25_rt != NULL) {
> -		if (ax25_rt->dev == ax25_dev->dev &&
> -		    ax25cmp(&rt_option->dest_addr, &ax25_rt->callsign) == 0) {
> -			switch (rt_option->cmd) {
> -			case AX25_SET_RT_IPMODE:
> -				switch (rt_option->arg) {
> -				case ' ':
> -				case 'D':
> -				case 'V':
> -					ax25_rt->ip_mode = rt_option->arg;
> -					break;
> -				default:
> -					err = -EINVAL;
> -					goto out;
> -				}
> -				break;
> -			default:
> -				err = -EINVAL;
> -				goto out;
> -			}
> -		}
> -		ax25_rt = ax25_rt->next;
> -	}
> -
> -out:
> -	write_unlock_bh(&ax25_route_lock);
> -	ax25_dev_put(ax25_dev);
> -	return err;
> -}
> -
> -int ax25_rt_ioctl(unsigned int cmd, void __user *arg)
> -{
> -	struct ax25_route_opt_struct rt_option;
> -	struct ax25_routes_struct route;
> -
> -	switch (cmd) {
> -	case SIOCADDRT:
> -		if (copy_from_user(&route, arg, sizeof(route)))
> -			return -EFAULT;
> -		return ax25_rt_add(&route);
> -
> -	case SIOCDELRT:
> -		if (copy_from_user(&route, arg, sizeof(route)))
> -			return -EFAULT;
> -		return ax25_rt_del(&route);
> -
> -	case SIOCAX25OPTRT:
> -		if (copy_from_user(&rt_option, arg, sizeof(rt_option)))
> -			return -EFAULT;
> -		return ax25_rt_opt(&rt_option);
> -
> -	default:
> -		return -EINVAL;
> -	}
> -}
> -
> -#ifdef CONFIG_PROC_FS
> -
> -static void *ax25_rt_seq_start(struct seq_file *seq, loff_t *pos)
> -	__acquires(ax25_route_lock)
> -{
> -	struct ax25_route *ax25_rt;
> -	int i = 1;
> -
> -	read_lock(&ax25_route_lock);
> -	if (*pos == 0)
> -		return SEQ_START_TOKEN;
> -
> -	for (ax25_rt = ax25_route_list; ax25_rt != NULL; ax25_rt = ax25_rt->next) {
> -		if (i == *pos)
> -			return ax25_rt;
> -		++i;
> -	}
> -
> -	return NULL;
> -}
> -
> -static void *ax25_rt_seq_next(struct seq_file *seq, void *v, loff_t *pos)
> -{
> -	++*pos;
> -	return (v == SEQ_START_TOKEN) ? ax25_route_list :
> -		((struct ax25_route *) v)->next;
> -}
> -
> -static void ax25_rt_seq_stop(struct seq_file *seq, void *v)
> -	__releases(ax25_route_lock)
> -{
> -	read_unlock(&ax25_route_lock);
> -}
> -
> -static int ax25_rt_seq_show(struct seq_file *seq, void *v)
> -{
> -	char buf[11];
> -
> -	if (v == SEQ_START_TOKEN)
> -		seq_puts(seq, "callsign  dev  mode digipeaters\n");
> -	else {
> -		struct ax25_route *ax25_rt = v;
> -		const char *callsign;
> -		int i;
> -
> -		if (ax25cmp(&ax25_rt->callsign, &null_ax25_address) == 0)
> -			callsign = "default";
> -		else
> -			callsign = ax2asc(buf, &ax25_rt->callsign);
> -
> -		seq_printf(seq, "%-9s %-4s",
> -			callsign,
> -			ax25_rt->dev ? ax25_rt->dev->name : "???");
> -
> -		switch (ax25_rt->ip_mode) {
> -		case 'V':
> -			seq_puts(seq, "   vc");
> -			break;
> -		case 'D':
> -			seq_puts(seq, "   dg");
> -			break;
> -		default:
> -			seq_puts(seq, "    *");
> -			break;
> -		}
> -
> -		if (ax25_rt->digipeat != NULL)
> -			for (i = 0; i < ax25_rt->digipeat->ndigi; i++)
> -				seq_printf(seq, " %s",
> -				     ax2asc(buf, &ax25_rt->digipeat->calls[i]));
> -
> -		seq_puts(seq, "\n");
> -	}
> -	return 0;
> -}
> -
> -const struct seq_operations ax25_rt_seqops = {
> -	.start = ax25_rt_seq_start,
> -	.next = ax25_rt_seq_next,
> -	.stop = ax25_rt_seq_stop,
> -	.show = ax25_rt_seq_show,
> -};
> -#endif
> -
> -/*
> - *	Find AX.25 route
> - *
> - *	Only routes with a reference count of zero can be destroyed.
> - *	Must be called with ax25_route_lock read locked.
> - */
> -ax25_route *ax25_get_route(ax25_address *addr, struct net_device *dev)
> -{
> -	ax25_route *ax25_spe_rt = NULL;
> -	ax25_route *ax25_def_rt = NULL;
> -	ax25_route *ax25_rt;
> -
> -	/*
> -	 *	Bind to the physical interface we heard them on, or the default
> -	 *	route if none is found;
> -	 */
> -	for (ax25_rt = ax25_route_list; ax25_rt != NULL; ax25_rt = ax25_rt->next) {
> -		if (dev == NULL) {
> -			if (ax25cmp(&ax25_rt->callsign, addr) == 0 && ax25_rt->dev != NULL)
> -				ax25_spe_rt = ax25_rt;
> -			if (ax25cmp(&ax25_rt->callsign, &null_ax25_address) == 0 && ax25_rt->dev != NULL)
> -				ax25_def_rt = ax25_rt;
> -		} else {
> -			if (ax25cmp(&ax25_rt->callsign, addr) == 0 && ax25_rt->dev == dev)
> -				ax25_spe_rt = ax25_rt;
> -			if (ax25cmp(&ax25_rt->callsign, &null_ax25_address) == 0 && ax25_rt->dev == dev)
> -				ax25_def_rt = ax25_rt;
> -		}
> -	}
> -
> -	ax25_rt = ax25_def_rt;
> -	if (ax25_spe_rt != NULL)
> -		ax25_rt = ax25_spe_rt;
> -
> -	return ax25_rt;
> -}
> -
> -
> -struct sk_buff *ax25_rt_build_path(struct sk_buff *skb, ax25_address *src,
> -	ax25_address *dest, ax25_digi *digi)
> -{
> -	unsigned char *bp;
> -	int len;
> -
> -	len = digi->ndigi * AX25_ADDR_LEN;
> -
> -	if (unlikely(skb_headroom(skb) < len)) {
> -		skb = skb_expand_head(skb, len);
> -		if (!skb) {
> -			printk(KERN_CRIT "AX.25: ax25_dg_build_path - out of memory\n");
> -			return NULL;
> -		}
> -	}
> -
> -	bp = skb_push(skb, len);
> -
> -	ax25_addr_build(bp, src, dest, digi, AX25_COMMAND, AX25_MODULUS);
> -
> -	return skb;
> -}
> -
> -/*
> - *	Free all memory associated with routing structures.
> - */
> -void __exit ax25_rt_free(void)
> -{
> -	ax25_route *s, *ax25_rt = ax25_route_list;
> -
> -	write_lock_bh(&ax25_route_lock);
> -	while (ax25_rt != NULL) {
> -		s       = ax25_rt;
> -		ax25_rt = ax25_rt->next;
> -
> -		kfree(s->digipeat);
> -		kfree(s);
> -	}
> -	write_unlock_bh(&ax25_route_lock);
> -}
> diff --git a/net/ax25/ax25_std_in.c b/net/ax25/ax25_std_in.c
> deleted file mode 100644
> index ba176196ae06..000000000000
> --- a/net/ax25/ax25_std_in.c
> +++ /dev/null
> @@ -1,443 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-or-later
> -/*
> - *
> - * Copyright (C) Alan Cox GW4PTS (alan@lxorguk.ukuu.org.uk)
> - * Copyright (C) Jonathan Naylor G4KLX (g4klx@g4klx.demon.co.uk)
> - * Copyright (C) Joerg Reuter DL1BKE (jreuter@yaina.de)
> - * Copyright (C) Hans-Joachim Hetscher DD8NE (dd8ne@bnv-bamberg.de)
> - *
> - * Most of this code is based on the SDL diagrams published in the 7th ARRL
> - * Computer Networking Conference papers. The diagrams have mistakes in them,
> - * but are mostly correct. Before you modify the code could you read the SDL
> - * diagrams as the code is not obvious and probably very easy to break.
> - */
> -#include <linux/errno.h>
> -#include <linux/types.h>
> -#include <linux/socket.h>
> -#include <linux/in.h>
> -#include <linux/kernel.h>
> -#include <linux/timer.h>
> -#include <linux/string.h>
> -#include <linux/sockios.h>
> -#include <linux/net.h>
> -#include <net/ax25.h>
> -#include <linux/inet.h>
> -#include <linux/netdevice.h>
> -#include <linux/skbuff.h>
> -#include <net/sock.h>
> -#include <net/tcp_states.h>
> -#include <linux/uaccess.h>
> -#include <linux/fcntl.h>
> -#include <linux/mm.h>
> -#include <linux/interrupt.h>
> -
> -/*
> - *	State machine for state 1, Awaiting Connection State.
> - *	The handling of the timer(s) is in file ax25_std_timer.c.
> - *	Handling of state 0 and connection release is in ax25.c.
> - */
> -static int ax25_std_state1_machine(ax25_cb *ax25, struct sk_buff *skb, int frametype, int pf, int type)
> -{
> -	switch (frametype) {
> -	case AX25_SABM:
> -		ax25->modulus = AX25_MODULUS;
> -		ax25->window  = ax25->ax25_dev->values[AX25_VALUES_WINDOW];
> -		ax25_send_control(ax25, AX25_UA, pf, AX25_RESPONSE);
> -		break;
> -
> -	case AX25_SABME:
> -		ax25->modulus = AX25_EMODULUS;
> -		ax25->window  = ax25->ax25_dev->values[AX25_VALUES_EWINDOW];
> -		ax25_send_control(ax25, AX25_UA, pf, AX25_RESPONSE);
> -		break;
> -
> -	case AX25_DISC:
> -		ax25_send_control(ax25, AX25_DM, pf, AX25_RESPONSE);
> -		break;
> -
> -	case AX25_UA:
> -		if (pf) {
> -			ax25_calculate_rtt(ax25);
> -			ax25_stop_t1timer(ax25);
> -			ax25_start_t3timer(ax25);
> -			ax25_start_idletimer(ax25);
> -			ax25->vs      = 0;
> -			ax25->va      = 0;
> -			ax25->vr      = 0;
> -			ax25->state   = AX25_STATE_3;
> -			ax25->n2count = 0;
> -			if (ax25->sk != NULL) {
> -				bh_lock_sock(ax25->sk);
> -				ax25->sk->sk_state = TCP_ESTABLISHED;
> -				/* For WAIT_SABM connections we will produce an accept ready socket here */
> -				if (!sock_flag(ax25->sk, SOCK_DEAD))
> -					ax25->sk->sk_state_change(ax25->sk);
> -				bh_unlock_sock(ax25->sk);
> -			}
> -		}
> -		break;
> -
> -	case AX25_DM:
> -		if (pf) {
> -			if (ax25->modulus == AX25_MODULUS) {
> -				ax25_disconnect(ax25, ECONNREFUSED);
> -			} else {
> -				ax25->modulus = AX25_MODULUS;
> -				ax25->window  = ax25->ax25_dev->values[AX25_VALUES_WINDOW];
> -			}
> -		}
> -		break;
> -
> -	default:
> -		break;
> -	}
> -
> -	return 0;
> -}
> -
> -/*
> - *	State machine for state 2, Awaiting Release State.
> - *	The handling of the timer(s) is in file ax25_std_timer.c
> - *	Handling of state 0 and connection release is in ax25.c.
> - */
> -static int ax25_std_state2_machine(ax25_cb *ax25, struct sk_buff *skb, int frametype, int pf, int type)
> -{
> -	switch (frametype) {
> -	case AX25_SABM:
> -	case AX25_SABME:
> -		ax25_send_control(ax25, AX25_DM, pf, AX25_RESPONSE);
> -		break;
> -
> -	case AX25_DISC:
> -		ax25_send_control(ax25, AX25_UA, pf, AX25_RESPONSE);
> -		ax25_disconnect(ax25, 0);
> -		break;
> -
> -	case AX25_DM:
> -	case AX25_UA:
> -		if (pf)
> -			ax25_disconnect(ax25, 0);
> -		break;
> -
> -	case AX25_I:
> -	case AX25_REJ:
> -	case AX25_RNR:
> -	case AX25_RR:
> -		if (pf) ax25_send_control(ax25, AX25_DM, AX25_POLLON, AX25_RESPONSE);
> -		break;
> -
> -	default:
> -		break;
> -	}
> -
> -	return 0;
> -}
> -
> -/*
> - *	State machine for state 3, Connected State.
> - *	The handling of the timer(s) is in file ax25_std_timer.c
> - *	Handling of state 0 and connection release is in ax25.c.
> - */
> -static int ax25_std_state3_machine(ax25_cb *ax25, struct sk_buff *skb, int frametype, int ns, int nr, int pf, int type)
> -{
> -	int queued = 0;
> -
> -	switch (frametype) {
> -	case AX25_SABM:
> -	case AX25_SABME:
> -		if (frametype == AX25_SABM) {
> -			ax25->modulus = AX25_MODULUS;
> -			ax25->window  = ax25->ax25_dev->values[AX25_VALUES_WINDOW];
> -		} else {
> -			ax25->modulus = AX25_EMODULUS;
> -			ax25->window  = ax25->ax25_dev->values[AX25_VALUES_EWINDOW];
> -		}
> -		ax25_send_control(ax25, AX25_UA, pf, AX25_RESPONSE);
> -		ax25_stop_t1timer(ax25);
> -		ax25_stop_t2timer(ax25);
> -		ax25_start_t3timer(ax25);
> -		ax25_start_idletimer(ax25);
> -		ax25->condition = 0x00;
> -		ax25->vs        = 0;
> -		ax25->va        = 0;
> -		ax25->vr        = 0;
> -		ax25_requeue_frames(ax25);
> -		break;
> -
> -	case AX25_DISC:
> -		ax25_send_control(ax25, AX25_UA, pf, AX25_RESPONSE);
> -		ax25_disconnect(ax25, 0);
> -		break;
> -
> -	case AX25_DM:
> -		ax25_disconnect(ax25, ECONNRESET);
> -		break;
> -
> -	case AX25_RR:
> -	case AX25_RNR:
> -		if (frametype == AX25_RR)
> -			ax25->condition &= ~AX25_COND_PEER_RX_BUSY;
> -		else
> -			ax25->condition |= AX25_COND_PEER_RX_BUSY;
> -		if (type == AX25_COMMAND && pf)
> -			ax25_std_enquiry_response(ax25);
> -		if (ax25_validate_nr(ax25, nr)) {
> -			ax25_check_iframes_acked(ax25, nr);
> -		} else {
> -			ax25_std_nr_error_recovery(ax25);
> -			ax25->state = AX25_STATE_1;
> -		}
> -		break;
> -
> -	case AX25_REJ:
> -		ax25->condition &= ~AX25_COND_PEER_RX_BUSY;
> -		if (type == AX25_COMMAND && pf)
> -			ax25_std_enquiry_response(ax25);
> -		if (ax25_validate_nr(ax25, nr)) {
> -			ax25_frames_acked(ax25, nr);
> -			ax25_calculate_rtt(ax25);
> -			ax25_stop_t1timer(ax25);
> -			ax25_start_t3timer(ax25);
> -			ax25_requeue_frames(ax25);
> -		} else {
> -			ax25_std_nr_error_recovery(ax25);
> -			ax25->state = AX25_STATE_1;
> -		}
> -		break;
> -
> -	case AX25_I:
> -		if (!ax25_validate_nr(ax25, nr)) {
> -			ax25_std_nr_error_recovery(ax25);
> -			ax25->state = AX25_STATE_1;
> -			break;
> -		}
> -		if (ax25->condition & AX25_COND_PEER_RX_BUSY) {
> -			ax25_frames_acked(ax25, nr);
> -		} else {
> -			ax25_check_iframes_acked(ax25, nr);
> -		}
> -		if (ax25->condition & AX25_COND_OWN_RX_BUSY) {
> -			if (pf) ax25_std_enquiry_response(ax25);
> -			break;
> -		}
> -		if (ns == ax25->vr) {
> -			ax25->vr = (ax25->vr + 1) % ax25->modulus;
> -			queued = ax25_rx_iframe(ax25, skb);
> -			if (ax25->condition & AX25_COND_OWN_RX_BUSY)
> -				ax25->vr = ns;	/* ax25->vr - 1 */
> -			ax25->condition &= ~AX25_COND_REJECT;
> -			if (pf) {
> -				ax25_std_enquiry_response(ax25);
> -			} else {
> -				if (!(ax25->condition & AX25_COND_ACK_PENDING)) {
> -					ax25->condition |= AX25_COND_ACK_PENDING;
> -					ax25_start_t2timer(ax25);
> -				}
> -			}
> -		} else {
> -			if (ax25->condition & AX25_COND_REJECT) {
> -				if (pf) ax25_std_enquiry_response(ax25);
> -			} else {
> -				ax25->condition |= AX25_COND_REJECT;
> -				ax25_send_control(ax25, AX25_REJ, pf, AX25_RESPONSE);
> -				ax25->condition &= ~AX25_COND_ACK_PENDING;
> -			}
> -		}
> -		break;
> -
> -	case AX25_FRMR:
> -	case AX25_ILLEGAL:
> -		ax25_std_establish_data_link(ax25);
> -		ax25->state = AX25_STATE_1;
> -		break;
> -
> -	default:
> -		break;
> -	}
> -
> -	return queued;
> -}
> -
> -/*
> - *	State machine for state 4, Timer Recovery State.
> - *	The handling of the timer(s) is in file ax25_std_timer.c
> - *	Handling of state 0 and connection release is in ax25.c.
> - */
> -static int ax25_std_state4_machine(ax25_cb *ax25, struct sk_buff *skb, int frametype, int ns, int nr, int pf, int type)
> -{
> -	int queued = 0;
> -
> -	switch (frametype) {
> -	case AX25_SABM:
> -	case AX25_SABME:
> -		if (frametype == AX25_SABM) {
> -			ax25->modulus = AX25_MODULUS;
> -			ax25->window  = ax25->ax25_dev->values[AX25_VALUES_WINDOW];
> -		} else {
> -			ax25->modulus = AX25_EMODULUS;
> -			ax25->window  = ax25->ax25_dev->values[AX25_VALUES_EWINDOW];
> -		}
> -		ax25_send_control(ax25, AX25_UA, pf, AX25_RESPONSE);
> -		ax25_stop_t1timer(ax25);
> -		ax25_stop_t2timer(ax25);
> -		ax25_start_t3timer(ax25);
> -		ax25_start_idletimer(ax25);
> -		ax25->condition = 0x00;
> -		ax25->vs        = 0;
> -		ax25->va        = 0;
> -		ax25->vr        = 0;
> -		ax25->state     = AX25_STATE_3;
> -		ax25->n2count   = 0;
> -		ax25_requeue_frames(ax25);
> -		break;
> -
> -	case AX25_DISC:
> -		ax25_send_control(ax25, AX25_UA, pf, AX25_RESPONSE);
> -		ax25_disconnect(ax25, 0);
> -		break;
> -
> -	case AX25_DM:
> -		ax25_disconnect(ax25, ECONNRESET);
> -		break;
> -
> -	case AX25_RR:
> -	case AX25_RNR:
> -		if (frametype == AX25_RR)
> -			ax25->condition &= ~AX25_COND_PEER_RX_BUSY;
> -		else
> -			ax25->condition |= AX25_COND_PEER_RX_BUSY;
> -		if (type == AX25_RESPONSE && pf) {
> -			ax25_stop_t1timer(ax25);
> -			ax25->n2count = 0;
> -			if (ax25_validate_nr(ax25, nr)) {
> -				ax25_frames_acked(ax25, nr);
> -				if (ax25->vs == ax25->va) {
> -					ax25_start_t3timer(ax25);
> -					ax25->state   = AX25_STATE_3;
> -				} else {
> -					ax25_requeue_frames(ax25);
> -				}
> -			} else {
> -				ax25_std_nr_error_recovery(ax25);
> -				ax25->state = AX25_STATE_1;
> -			}
> -			break;
> -		}
> -		if (type == AX25_COMMAND && pf)
> -			ax25_std_enquiry_response(ax25);
> -		if (ax25_validate_nr(ax25, nr)) {
> -			ax25_frames_acked(ax25, nr);
> -		} else {
> -			ax25_std_nr_error_recovery(ax25);
> -			ax25->state = AX25_STATE_1;
> -		}
> -		break;
> -
> -	case AX25_REJ:
> -		ax25->condition &= ~AX25_COND_PEER_RX_BUSY;
> -		if (pf && type == AX25_RESPONSE) {
> -			ax25_stop_t1timer(ax25);
> -			ax25->n2count = 0;
> -			if (ax25_validate_nr(ax25, nr)) {
> -				ax25_frames_acked(ax25, nr);
> -				if (ax25->vs == ax25->va) {
> -					ax25_start_t3timer(ax25);
> -					ax25->state   = AX25_STATE_3;
> -				} else {
> -					ax25_requeue_frames(ax25);
> -				}
> -			} else {
> -				ax25_std_nr_error_recovery(ax25);
> -				ax25->state = AX25_STATE_1;
> -			}
> -			break;
> -		}
> -		if (type == AX25_COMMAND && pf)
> -			ax25_std_enquiry_response(ax25);
> -		if (ax25_validate_nr(ax25, nr)) {
> -			ax25_frames_acked(ax25, nr);
> -			ax25_requeue_frames(ax25);
> -		} else {
> -			ax25_std_nr_error_recovery(ax25);
> -			ax25->state = AX25_STATE_1;
> -		}
> -		break;
> -
> -	case AX25_I:
> -		if (!ax25_validate_nr(ax25, nr)) {
> -			ax25_std_nr_error_recovery(ax25);
> -			ax25->state = AX25_STATE_1;
> -			break;
> -		}
> -		ax25_frames_acked(ax25, nr);
> -		if (ax25->condition & AX25_COND_OWN_RX_BUSY) {
> -			if (pf)
> -				ax25_std_enquiry_response(ax25);
> -			break;
> -		}
> -		if (ns == ax25->vr) {
> -			ax25->vr = (ax25->vr + 1) % ax25->modulus;
> -			queued = ax25_rx_iframe(ax25, skb);
> -			if (ax25->condition & AX25_COND_OWN_RX_BUSY)
> -				ax25->vr = ns;	/* ax25->vr - 1 */
> -			ax25->condition &= ~AX25_COND_REJECT;
> -			if (pf) {
> -				ax25_std_enquiry_response(ax25);
> -			} else {
> -				if (!(ax25->condition & AX25_COND_ACK_PENDING)) {
> -					ax25->condition |= AX25_COND_ACK_PENDING;
> -					ax25_start_t2timer(ax25);
> -				}
> -			}
> -		} else {
> -			if (ax25->condition & AX25_COND_REJECT) {
> -				if (pf) ax25_std_enquiry_response(ax25);
> -			} else {
> -				ax25->condition |= AX25_COND_REJECT;
> -				ax25_send_control(ax25, AX25_REJ, pf, AX25_RESPONSE);
> -				ax25->condition &= ~AX25_COND_ACK_PENDING;
> -			}
> -		}
> -		break;
> -
> -	case AX25_FRMR:
> -	case AX25_ILLEGAL:
> -		ax25_std_establish_data_link(ax25);
> -		ax25->state = AX25_STATE_1;
> -		break;
> -
> -	default:
> -		break;
> -	}
> -
> -	return queued;
> -}
> -
> -/*
> - *	Higher level upcall for a LAPB frame
> - */
> -int ax25_std_frame_in(ax25_cb *ax25, struct sk_buff *skb, int type)
> -{
> -	int queued = 0, frametype, ns, nr, pf;
> -
> -	frametype = ax25_decode(ax25, skb, &ns, &nr, &pf);
> -
> -	switch (ax25->state) {
> -	case AX25_STATE_1:
> -		queued = ax25_std_state1_machine(ax25, skb, frametype, pf, type);
> -		break;
> -	case AX25_STATE_2:
> -		queued = ax25_std_state2_machine(ax25, skb, frametype, pf, type);
> -		break;
> -	case AX25_STATE_3:
> -		queued = ax25_std_state3_machine(ax25, skb, frametype, ns, nr, pf, type);
> -		break;
> -	case AX25_STATE_4:
> -		queued = ax25_std_state4_machine(ax25, skb, frametype, ns, nr, pf, type);
> -		break;
> -	}
> -
> -	ax25_kick(ax25);
> -
> -	return queued;
> -}
> diff --git a/net/ax25/ax25_std_subr.c b/net/ax25/ax25_std_subr.c
> deleted file mode 100644
> index 4c36f1342558..000000000000
> --- a/net/ax25/ax25_std_subr.c
> +++ /dev/null
> @@ -1,83 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-or-later
> -/*
> - *
> - * Copyright (C) Jonathan Naylor G4KLX (g4klx@g4klx.demon.co.uk)
> - */
> -#include <linux/errno.h>
> -#include <linux/types.h>
> -#include <linux/socket.h>
> -#include <linux/in.h>
> -#include <linux/kernel.h>
> -#include <linux/timer.h>
> -#include <linux/string.h>
> -#include <linux/sockios.h>
> -#include <linux/net.h>
> -#include <net/ax25.h>
> -#include <linux/inet.h>
> -#include <linux/netdevice.h>
> -#include <linux/skbuff.h>
> -#include <net/sock.h>
> -#include <linux/uaccess.h>
> -#include <linux/fcntl.h>
> -#include <linux/mm.h>
> -#include <linux/interrupt.h>
> -
> -/*
> - * The following routines are taken from page 170 of the 7th ARRL Computer
> - * Networking Conference paper, as is the whole state machine.
> - */
> -
> -void ax25_std_nr_error_recovery(ax25_cb *ax25)
> -{
> -	ax25_std_establish_data_link(ax25);
> -}
> -
> -void ax25_std_establish_data_link(ax25_cb *ax25)
> -{
> -	ax25->condition = 0x00;
> -	ax25->n2count   = 0;
> -
> -	if (ax25->modulus == AX25_MODULUS)
> -		ax25_send_control(ax25, AX25_SABM, AX25_POLLON, AX25_COMMAND);
> -	else
> -		ax25_send_control(ax25, AX25_SABME, AX25_POLLON, AX25_COMMAND);
> -
> -	ax25_calculate_t1(ax25);
> -	ax25_stop_idletimer(ax25);
> -	ax25_stop_t3timer(ax25);
> -	ax25_stop_t2timer(ax25);
> -	ax25_start_t1timer(ax25);
> -}
> -
> -void ax25_std_transmit_enquiry(ax25_cb *ax25)
> -{
> -	if (ax25->condition & AX25_COND_OWN_RX_BUSY)
> -		ax25_send_control(ax25, AX25_RNR, AX25_POLLON, AX25_COMMAND);
> -	else
> -		ax25_send_control(ax25, AX25_RR, AX25_POLLON, AX25_COMMAND);
> -
> -	ax25->condition &= ~AX25_COND_ACK_PENDING;
> -
> -	ax25_calculate_t1(ax25);
> -	ax25_start_t1timer(ax25);
> -}
> -
> -void ax25_std_enquiry_response(ax25_cb *ax25)
> -{
> -	if (ax25->condition & AX25_COND_OWN_RX_BUSY)
> -		ax25_send_control(ax25, AX25_RNR, AX25_POLLON, AX25_RESPONSE);
> -	else
> -		ax25_send_control(ax25, AX25_RR, AX25_POLLON, AX25_RESPONSE);
> -
> -	ax25->condition &= ~AX25_COND_ACK_PENDING;
> -}
> -
> -void ax25_std_timeout_response(ax25_cb *ax25)
> -{
> -	if (ax25->condition & AX25_COND_OWN_RX_BUSY)
> -		ax25_send_control(ax25, AX25_RNR, AX25_POLLOFF, AX25_RESPONSE);
> -	else
> -		ax25_send_control(ax25, AX25_RR, AX25_POLLOFF, AX25_RESPONSE);
> -
> -	ax25->condition &= ~AX25_COND_ACK_PENDING;
> -}
> diff --git a/net/ax25/ax25_std_timer.c b/net/ax25/ax25_std_timer.c
> deleted file mode 100644
> index b17da41210cb..000000000000
> --- a/net/ax25/ax25_std_timer.c
> +++ /dev/null
> @@ -1,175 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-or-later
> -/*
> - *
> - * Copyright (C) Alan Cox GW4PTS (alan@lxorguk.ukuu.org.uk)
> - * Copyright (C) Jonathan Naylor G4KLX (g4klx@g4klx.demon.co.uk)
> - * Copyright (C) Joerg Reuter DL1BKE (jreuter@yaina.de)
> - * Copyright (C) Frederic Rible F1OAT (frible@teaser.fr)
> - */
> -#include <linux/errno.h>
> -#include <linux/types.h>
> -#include <linux/socket.h>
> -#include <linux/in.h>
> -#include <linux/kernel.h>
> -#include <linux/timer.h>
> -#include <linux/string.h>
> -#include <linux/sockios.h>
> -#include <linux/net.h>
> -#include <net/ax25.h>
> -#include <linux/inet.h>
> -#include <linux/netdevice.h>
> -#include <linux/skbuff.h>
> -#include <net/sock.h>
> -#include <net/tcp_states.h>
> -#include <linux/uaccess.h>
> -#include <linux/fcntl.h>
> -#include <linux/mm.h>
> -#include <linux/interrupt.h>
> -
> -void ax25_std_heartbeat_expiry(ax25_cb *ax25)
> -{
> -	struct sock *sk = ax25->sk;
> -
> -	if (sk)
> -		bh_lock_sock(sk);
> -
> -	switch (ax25->state) {
> -	case AX25_STATE_0:
> -	case AX25_STATE_2:
> -		/* Magic here: If we listen() and a new link dies before it
> -		   is accepted() it isn't 'dead' so doesn't get removed. */
> -		if (!sk || sock_flag(sk, SOCK_DESTROY) ||
> -		    (sk->sk_state == TCP_LISTEN &&
> -		     sock_flag(sk, SOCK_DEAD))) {
> -			if (sk) {
> -				sock_hold(sk);
> -				ax25_destroy_socket(ax25);
> -				bh_unlock_sock(sk);
> -				/* Ungrab socket and destroy it */
> -				sock_put(sk);
> -			} else
> -				ax25_destroy_socket(ax25);
> -			return;
> -		}
> -		break;
> -
> -	case AX25_STATE_3:
> -	case AX25_STATE_4:
> -		/*
> -		 * Check the state of the receive buffer.
> -		 */
> -		if (sk != NULL) {
> -			if (atomic_read(&sk->sk_rmem_alloc) <
> -			    (sk->sk_rcvbuf >> 1) &&
> -			    (ax25->condition & AX25_COND_OWN_RX_BUSY)) {
> -				ax25->condition &= ~AX25_COND_OWN_RX_BUSY;
> -				ax25->condition &= ~AX25_COND_ACK_PENDING;
> -				ax25_send_control(ax25, AX25_RR, AX25_POLLOFF, AX25_RESPONSE);
> -				break;
> -			}
> -		}
> -	}
> -
> -	if (sk)
> -		bh_unlock_sock(sk);
> -
> -	ax25_start_heartbeat(ax25);
> -}
> -
> -void ax25_std_t2timer_expiry(ax25_cb *ax25)
> -{
> -	if (ax25->condition & AX25_COND_ACK_PENDING) {
> -		ax25->condition &= ~AX25_COND_ACK_PENDING;
> -		ax25_std_timeout_response(ax25);
> -	}
> -}
> -
> -void ax25_std_t3timer_expiry(ax25_cb *ax25)
> -{
> -	ax25->n2count = 0;
> -	ax25_std_transmit_enquiry(ax25);
> -	ax25->state   = AX25_STATE_4;
> -}
> -
> -void ax25_std_idletimer_expiry(ax25_cb *ax25)
> -{
> -	ax25_clear_queues(ax25);
> -
> -	ax25->n2count = 0;
> -	ax25_send_control(ax25, AX25_DISC, AX25_POLLON, AX25_COMMAND);
> -	ax25->state   = AX25_STATE_2;
> -
> -	ax25_calculate_t1(ax25);
> -	ax25_start_t1timer(ax25);
> -	ax25_stop_t2timer(ax25);
> -	ax25_stop_t3timer(ax25);
> -
> -	if (ax25->sk != NULL) {
> -		bh_lock_sock(ax25->sk);
> -		ax25->sk->sk_state     = TCP_CLOSE;
> -		ax25->sk->sk_err       = 0;
> -		ax25->sk->sk_shutdown |= SEND_SHUTDOWN;
> -		if (!sock_flag(ax25->sk, SOCK_DEAD)) {
> -			ax25->sk->sk_state_change(ax25->sk);
> -			sock_set_flag(ax25->sk, SOCK_DEAD);
> -		}
> -		bh_unlock_sock(ax25->sk);
> -	}
> -}
> -
> -void ax25_std_t1timer_expiry(ax25_cb *ax25)
> -{
> -	switch (ax25->state) {
> -	case AX25_STATE_1:
> -		if (ax25->n2count == ax25->n2) {
> -			if (ax25->modulus == AX25_MODULUS) {
> -				ax25_disconnect(ax25, ETIMEDOUT);
> -				return;
> -			} else {
> -				ax25->modulus = AX25_MODULUS;
> -				ax25->window  = ax25->ax25_dev->values[AX25_VALUES_WINDOW];
> -				ax25->n2count = 0;
> -				ax25_send_control(ax25, AX25_SABM, AX25_POLLON, AX25_COMMAND);
> -			}
> -		} else {
> -			ax25->n2count++;
> -			if (ax25->modulus == AX25_MODULUS)
> -				ax25_send_control(ax25, AX25_SABM, AX25_POLLON, AX25_COMMAND);
> -			else
> -				ax25_send_control(ax25, AX25_SABME, AX25_POLLON, AX25_COMMAND);
> -		}
> -		break;
> -
> -	case AX25_STATE_2:
> -		if (ax25->n2count == ax25->n2) {
> -			ax25_send_control(ax25, AX25_DISC, AX25_POLLON, AX25_COMMAND);
> -			if (!sock_flag(ax25->sk, SOCK_DESTROY))
> -				ax25_disconnect(ax25, ETIMEDOUT);
> -			return;
> -		} else {
> -			ax25->n2count++;
> -			ax25_send_control(ax25, AX25_DISC, AX25_POLLON, AX25_COMMAND);
> -		}
> -		break;
> -
> -	case AX25_STATE_3:
> -		ax25->n2count = 1;
> -		ax25_std_transmit_enquiry(ax25);
> -		ax25->state   = AX25_STATE_4;
> -		break;
> -
> -	case AX25_STATE_4:
> -		if (ax25->n2count == ax25->n2) {
> -			ax25_send_control(ax25, AX25_DM, AX25_POLLON, AX25_RESPONSE);
> -			ax25_disconnect(ax25, ETIMEDOUT);
> -			return;
> -		} else {
> -			ax25->n2count++;
> -			ax25_std_transmit_enquiry(ax25);
> -		}
> -		break;
> -	}
> -
> -	ax25_calculate_t1(ax25);
> -	ax25_start_t1timer(ax25);
> -}
> diff --git a/net/ax25/ax25_subr.c b/net/ax25/ax25_subr.c
> deleted file mode 100644
> index bff4b203a893..000000000000
> --- a/net/ax25/ax25_subr.c
> +++ /dev/null
> @@ -1,296 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-or-later
> -/*
> - *
> - * Copyright (C) Alan Cox GW4PTS (alan@lxorguk.ukuu.org.uk)
> - * Copyright (C) Jonathan Naylor G4KLX (g4klx@g4klx.demon.co.uk)
> - * Copyright (C) Joerg Reuter DL1BKE (jreuter@yaina.de)
> - * Copyright (C) Frederic Rible F1OAT (frible@teaser.fr)
> - */
> -#include <linux/errno.h>
> -#include <linux/types.h>
> -#include <linux/socket.h>
> -#include <linux/in.h>
> -#include <linux/kernel.h>
> -#include <linux/timer.h>
> -#include <linux/string.h>
> -#include <linux/sockios.h>
> -#include <linux/net.h>
> -#include <linux/slab.h>
> -#include <net/ax25.h>
> -#include <linux/inet.h>
> -#include <linux/netdevice.h>
> -#include <linux/skbuff.h>
> -#include <net/sock.h>
> -#include <net/tcp_states.h>
> -#include <linux/uaccess.h>
> -#include <linux/fcntl.h>
> -#include <linux/mm.h>
> -#include <linux/interrupt.h>
> -
> -/*
> - *	This routine purges all the queues of frames.
> - */
> -void ax25_clear_queues(ax25_cb *ax25)
> -{
> -	skb_queue_purge(&ax25->write_queue);
> -	skb_queue_purge(&ax25->ack_queue);
> -	skb_queue_purge(&ax25->reseq_queue);
> -	skb_queue_purge(&ax25->frag_queue);
> -}
> -
> -/*
> - * This routine purges the input queue of those frames that have been
> - * acknowledged. This replaces the boxes labelled "V(a) <- N(r)" on the
> - * SDL diagram.
> - */
> -void ax25_frames_acked(ax25_cb *ax25, unsigned short nr)
> -{
> -	struct sk_buff *skb;
> -
> -	/*
> -	 * Remove all the ack-ed frames from the ack queue.
> -	 */
> -	if (ax25->va != nr) {
> -		while (skb_peek(&ax25->ack_queue) != NULL && ax25->va != nr) {
> -			skb = skb_dequeue(&ax25->ack_queue);
> -			kfree_skb(skb);
> -			ax25->va = (ax25->va + 1) % ax25->modulus;
> -		}
> -	}
> -}
> -
> -void ax25_requeue_frames(ax25_cb *ax25)
> -{
> -	struct sk_buff *skb;
> -
> -	/*
> -	 * Requeue all the un-ack-ed frames on the output queue to be picked
> -	 * up by ax25_kick called from the timer. This arrangement handles the
> -	 * possibility of an empty output queue.
> -	 */
> -	while ((skb = skb_dequeue_tail(&ax25->ack_queue)) != NULL)
> -		skb_queue_head(&ax25->write_queue, skb);
> -}
> -
> -/*
> - *	Validate that the value of nr is between va and vs. Return true or
> - *	false for testing.
> - */
> -int ax25_validate_nr(ax25_cb *ax25, unsigned short nr)
> -{
> -	unsigned short vc = ax25->va;
> -
> -	while (vc != ax25->vs) {
> -		if (nr == vc) return 1;
> -		vc = (vc + 1) % ax25->modulus;
> -	}
> -
> -	if (nr == ax25->vs) return 1;
> -
> -	return 0;
> -}
> -
> -/*
> - *	This routine is the centralised routine for parsing the control
> - *	information for the different frame formats.
> - */
> -int ax25_decode(ax25_cb *ax25, struct sk_buff *skb, int *ns, int *nr, int *pf)
> -{
> -	unsigned char *frame;
> -	int frametype = AX25_ILLEGAL;
> -
> -	frame = skb->data;
> -	*ns = *nr = *pf = 0;
> -
> -	if (ax25->modulus == AX25_MODULUS) {
> -		if ((frame[0] & AX25_S) == 0) {
> -			frametype = AX25_I;			/* I frame - carries NR/NS/PF */
> -			*ns = (frame[0] >> 1) & 0x07;
> -			*nr = (frame[0] >> 5) & 0x07;
> -			*pf = frame[0] & AX25_PF;
> -		} else if ((frame[0] & AX25_U) == 1) { 	/* S frame - take out PF/NR */
> -			frametype = frame[0] & 0x0F;
> -			*nr = (frame[0] >> 5) & 0x07;
> -			*pf = frame[0] & AX25_PF;
> -		} else if ((frame[0] & AX25_U) == 3) { 	/* U frame - take out PF */
> -			frametype = frame[0] & ~AX25_PF;
> -			*pf = frame[0] & AX25_PF;
> -		}
> -		skb_pull(skb, 1);
> -	} else {
> -		if ((frame[0] & AX25_S) == 0) {
> -			frametype = AX25_I;			/* I frame - carries NR/NS/PF */
> -			*ns = (frame[0] >> 1) & 0x7F;
> -			*nr = (frame[1] >> 1) & 0x7F;
> -			*pf = frame[1] & AX25_EPF;
> -			skb_pull(skb, 2);
> -		} else if ((frame[0] & AX25_U) == 1) { 	/* S frame - take out PF/NR */
> -			frametype = frame[0] & 0x0F;
> -			*nr = (frame[1] >> 1) & 0x7F;
> -			*pf = frame[1] & AX25_EPF;
> -			skb_pull(skb, 2);
> -		} else if ((frame[0] & AX25_U) == 3) { 	/* U frame - take out PF */
> -			frametype = frame[0] & ~AX25_PF;
> -			*pf = frame[0] & AX25_PF;
> -			skb_pull(skb, 1);
> -		}
> -	}
> -
> -	return frametype;
> -}
> -
> -/*
> - *	This routine is called when the HDLC layer internally  generates a
> - *	command or  response  for  the remote machine ( eg. RR, UA etc. ).
> - *	Only supervisory or unnumbered frames are processed.
> - */
> -void ax25_send_control(ax25_cb *ax25, int frametype, int poll_bit, int type)
> -{
> -	struct sk_buff *skb;
> -	unsigned char  *dptr;
> -
> -	if ((skb = alloc_skb(ax25->ax25_dev->dev->hard_header_len + 2, GFP_ATOMIC)) == NULL)
> -		return;
> -
> -	skb_reserve(skb, ax25->ax25_dev->dev->hard_header_len);
> -
> -	skb_reset_network_header(skb);
> -
> -	/* Assume a response - address structure for DTE */
> -	if (ax25->modulus == AX25_MODULUS) {
> -		dptr = skb_put(skb, 1);
> -		*dptr = frametype;
> -		*dptr |= (poll_bit) ? AX25_PF : 0;
> -		if ((frametype & AX25_U) == AX25_S)		/* S frames carry NR */
> -			*dptr |= (ax25->vr << 5);
> -	} else {
> -		if ((frametype & AX25_U) == AX25_U) {
> -			dptr = skb_put(skb, 1);
> -			*dptr = frametype;
> -			*dptr |= (poll_bit) ? AX25_PF : 0;
> -		} else {
> -			dptr = skb_put(skb, 2);
> -			dptr[0] = frametype;
> -			dptr[1] = (ax25->vr << 1);
> -			dptr[1] |= (poll_bit) ? AX25_EPF : 0;
> -		}
> -	}
> -
> -	ax25_transmit_buffer(ax25, skb, type);
> -}
> -
> -/*
> - *	Send a 'DM' to an unknown connection attempt, or an invalid caller.
> - *
> - *	Note: src here is the sender, thus it's the target of the DM
> - */
> -void ax25_return_dm(struct net_device *dev, ax25_address *src, ax25_address *dest, ax25_digi *digi)
> -{
> -	struct sk_buff *skb;
> -	char *dptr;
> -	ax25_digi retdigi;
> -
> -	if (dev == NULL)
> -		return;
> -
> -	if ((skb = alloc_skb(dev->hard_header_len + 1, GFP_ATOMIC)) == NULL)
> -		return;	/* Next SABM will get DM'd */
> -
> -	skb_reserve(skb, dev->hard_header_len);
> -	skb_reset_network_header(skb);
> -
> -	ax25_digi_invert(digi, &retdigi);
> -
> -	dptr = skb_put(skb, 1);
> -
> -	*dptr = AX25_DM | AX25_PF;
> -
> -	/*
> -	 *	Do the address ourselves
> -	 */
> -	dptr  = skb_push(skb, ax25_addr_size(digi));
> -	dptr += ax25_addr_build(dptr, dest, src, &retdigi, AX25_RESPONSE, AX25_MODULUS);
> -
> -	ax25_queue_xmit(skb, dev);
> -}
> -
> -/*
> - *	Exponential backoff for AX.25
> - */
> -void ax25_calculate_t1(ax25_cb *ax25)
> -{
> -	int n, t = 2;
> -
> -	switch (ax25->backoff) {
> -	case 0:
> -		break;
> -
> -	case 1:
> -		t += 2 * ax25->n2count;
> -		break;
> -
> -	case 2:
> -		for (n = 0; n < ax25->n2count; n++)
> -			t *= 2;
> -		if (t > 8) t = 8;
> -		break;
> -	}
> -
> -	ax25->t1 = t * ax25->rtt;
> -}
> -
> -/*
> - *	Calculate the Round Trip Time
> - */
> -void ax25_calculate_rtt(ax25_cb *ax25)
> -{
> -	if (ax25->backoff == 0)
> -		return;
> -
> -	if (ax25_t1timer_running(ax25) && ax25->n2count == 0)
> -		ax25->rtt = (9 * ax25->rtt + ax25->t1 - ax25_display_timer(&ax25->t1timer)) / 10;
> -
> -	if (ax25->rtt < AX25_T1CLAMPLO)
> -		ax25->rtt = AX25_T1CLAMPLO;
> -
> -	if (ax25->rtt > AX25_T1CLAMPHI)
> -		ax25->rtt = AX25_T1CLAMPHI;
> -}
> -
> -void ax25_disconnect(ax25_cb *ax25, int reason)
> -{
> -	ax25_clear_queues(ax25);
> -
> -	if (reason == ENETUNREACH) {
> -		timer_delete_sync(&ax25->timer);
> -		timer_delete_sync(&ax25->t1timer);
> -		timer_delete_sync(&ax25->t2timer);
> -		timer_delete_sync(&ax25->t3timer);
> -		timer_delete_sync(&ax25->idletimer);
> -	} else {
> -		if (ax25->sk && !sock_flag(ax25->sk, SOCK_DESTROY))
> -			ax25_stop_heartbeat(ax25);
> -		ax25_stop_t1timer(ax25);
> -		ax25_stop_t2timer(ax25);
> -		ax25_stop_t3timer(ax25);
> -		ax25_stop_idletimer(ax25);
> -	}
> -
> -	ax25->state = AX25_STATE_0;
> -
> -	ax25_link_failed(ax25, reason);
> -
> -	if (ax25->sk != NULL) {
> -		local_bh_disable();
> -		bh_lock_sock(ax25->sk);
> -		ax25->sk->sk_state     = TCP_CLOSE;
> -		ax25->sk->sk_err       = reason;
> -		ax25->sk->sk_shutdown |= SEND_SHUTDOWN;
> -		if (!sock_flag(ax25->sk, SOCK_DEAD)) {
> -			ax25->sk->sk_state_change(ax25->sk);
> -			sock_set_flag(ax25->sk, SOCK_DEAD);
> -		}
> -		bh_unlock_sock(ax25->sk);
> -		local_bh_enable();
> -	}
> -}
> diff --git a/net/ax25/ax25_timer.c b/net/ax25/ax25_timer.c
> deleted file mode 100644
> index a69bfbc8b679..000000000000
> --- a/net/ax25/ax25_timer.c
> +++ /dev/null
> @@ -1,224 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-or-later
> -/*
> - *
> - * Copyright (C) Alan Cox GW4PTS (alan@lxorguk.ukuu.org.uk)
> - * Copyright (C) Jonathan Naylor G4KLX (g4klx@g4klx.demon.co.uk)
> - * Copyright (C) Tomi Manninen OH2BNS (oh2bns@sral.fi)
> - * Copyright (C) Darryl Miles G7LED (dlm@g7led.demon.co.uk)
> - * Copyright (C) Joerg Reuter DL1BKE (jreuter@yaina.de)
> - * Copyright (C) Frederic Rible F1OAT (frible@teaser.fr)
> - * Copyright (C) 2002 Ralf Baechle DO1GRB (ralf@gnu.org)
> - */
> -#include <linux/errno.h>
> -#include <linux/types.h>
> -#include <linux/socket.h>
> -#include <linux/in.h>
> -#include <linux/kernel.h>
> -#include <linux/module.h>
> -#include <linux/jiffies.h>
> -#include <linux/timer.h>
> -#include <linux/string.h>
> -#include <linux/sockios.h>
> -#include <linux/net.h>
> -#include <net/ax25.h>
> -#include <linux/inet.h>
> -#include <linux/netdevice.h>
> -#include <linux/skbuff.h>
> -#include <net/sock.h>
> -#include <linux/uaccess.h>
> -#include <linux/fcntl.h>
> -#include <linux/mm.h>
> -#include <linux/interrupt.h>
> -
> -static void ax25_heartbeat_expiry(struct timer_list *);
> -static void ax25_t1timer_expiry(struct timer_list *);
> -static void ax25_t2timer_expiry(struct timer_list *);
> -static void ax25_t3timer_expiry(struct timer_list *);
> -static void ax25_idletimer_expiry(struct timer_list *);
> -
> -void ax25_setup_timers(ax25_cb *ax25)
> -{
> -	timer_setup(&ax25->timer, ax25_heartbeat_expiry, 0);
> -	timer_setup(&ax25->t1timer, ax25_t1timer_expiry, 0);
> -	timer_setup(&ax25->t2timer, ax25_t2timer_expiry, 0);
> -	timer_setup(&ax25->t3timer, ax25_t3timer_expiry, 0);
> -	timer_setup(&ax25->idletimer, ax25_idletimer_expiry, 0);
> -}
> -
> -void ax25_start_heartbeat(ax25_cb *ax25)
> -{
> -	mod_timer(&ax25->timer, jiffies + 5 * HZ);
> -}
> -
> -void ax25_start_t1timer(ax25_cb *ax25)
> -{
> -	mod_timer(&ax25->t1timer, jiffies + ax25->t1);
> -}
> -
> -void ax25_start_t2timer(ax25_cb *ax25)
> -{
> -	mod_timer(&ax25->t2timer, jiffies + ax25->t2);
> -}
> -
> -void ax25_start_t3timer(ax25_cb *ax25)
> -{
> -	if (ax25->t3 > 0)
> -		mod_timer(&ax25->t3timer, jiffies + ax25->t3);
> -	else
> -		timer_delete(&ax25->t3timer);
> -}
> -
> -void ax25_start_idletimer(ax25_cb *ax25)
> -{
> -	if (ax25->idle > 0)
> -		mod_timer(&ax25->idletimer, jiffies + ax25->idle);
> -	else
> -		timer_delete(&ax25->idletimer);
> -}
> -
> -void ax25_stop_heartbeat(ax25_cb *ax25)
> -{
> -	timer_delete(&ax25->timer);
> -}
> -
> -void ax25_stop_t1timer(ax25_cb *ax25)
> -{
> -	timer_delete(&ax25->t1timer);
> -}
> -
> -void ax25_stop_t2timer(ax25_cb *ax25)
> -{
> -	timer_delete(&ax25->t2timer);
> -}
> -
> -void ax25_stop_t3timer(ax25_cb *ax25)
> -{
> -	timer_delete(&ax25->t3timer);
> -}
> -
> -void ax25_stop_idletimer(ax25_cb *ax25)
> -{
> -	timer_delete(&ax25->idletimer);
> -}
> -
> -int ax25_t1timer_running(ax25_cb *ax25)
> -{
> -	return timer_pending(&ax25->t1timer);
> -}
> -
> -unsigned long ax25_display_timer(struct timer_list *timer)
> -{
> -	long delta = timer->expires - jiffies;
> -
> -	if (!timer_pending(timer))
> -		return 0;
> -
> -	return max(0L, delta);
> -}
> -
> -EXPORT_SYMBOL(ax25_display_timer);
> -
> -static void ax25_heartbeat_expiry(struct timer_list *t)
> -{
> -	int proto = AX25_PROTO_STD_SIMPLEX;
> -	ax25_cb *ax25 = timer_container_of(ax25, t, timer);
> -
> -	if (ax25->ax25_dev)
> -		proto = ax25->ax25_dev->values[AX25_VALUES_PROTOCOL];
> -
> -	switch (proto) {
> -	case AX25_PROTO_STD_SIMPLEX:
> -	case AX25_PROTO_STD_DUPLEX:
> -		ax25_std_heartbeat_expiry(ax25);
> -		break;
> -
> -#ifdef CONFIG_AX25_DAMA_SLAVE
> -	case AX25_PROTO_DAMA_SLAVE:
> -		if (ax25->ax25_dev->dama.slave)
> -			ax25_ds_heartbeat_expiry(ax25);
> -		else
> -			ax25_std_heartbeat_expiry(ax25);
> -		break;
> -#endif
> -	}
> -}
> -
> -static void ax25_t1timer_expiry(struct timer_list *t)
> -{
> -	ax25_cb *ax25 = timer_container_of(ax25, t, t1timer);
> -
> -	switch (ax25->ax25_dev->values[AX25_VALUES_PROTOCOL]) {
> -	case AX25_PROTO_STD_SIMPLEX:
> -	case AX25_PROTO_STD_DUPLEX:
> -		ax25_std_t1timer_expiry(ax25);
> -		break;
> -
> -#ifdef CONFIG_AX25_DAMA_SLAVE
> -	case AX25_PROTO_DAMA_SLAVE:
> -		if (!ax25->ax25_dev->dama.slave)
> -			ax25_std_t1timer_expiry(ax25);
> -		break;
> -#endif
> -	}
> -}
> -
> -static void ax25_t2timer_expiry(struct timer_list *t)
> -{
> -	ax25_cb *ax25 = timer_container_of(ax25, t, t2timer);
> -
> -	switch (ax25->ax25_dev->values[AX25_VALUES_PROTOCOL]) {
> -	case AX25_PROTO_STD_SIMPLEX:
> -	case AX25_PROTO_STD_DUPLEX:
> -		ax25_std_t2timer_expiry(ax25);
> -		break;
> -
> -#ifdef CONFIG_AX25_DAMA_SLAVE
> -	case AX25_PROTO_DAMA_SLAVE:
> -		if (!ax25->ax25_dev->dama.slave)
> -			ax25_std_t2timer_expiry(ax25);
> -		break;
> -#endif
> -	}
> -}
> -
> -static void ax25_t3timer_expiry(struct timer_list *t)
> -{
> -	ax25_cb *ax25 = timer_container_of(ax25, t, t3timer);
> -
> -	switch (ax25->ax25_dev->values[AX25_VALUES_PROTOCOL]) {
> -	case AX25_PROTO_STD_SIMPLEX:
> -	case AX25_PROTO_STD_DUPLEX:
> -		ax25_std_t3timer_expiry(ax25);
> -		break;
> -
> -#ifdef CONFIG_AX25_DAMA_SLAVE
> -	case AX25_PROTO_DAMA_SLAVE:
> -		if (ax25->ax25_dev->dama.slave)
> -			ax25_ds_t3timer_expiry(ax25);
> -		else
> -			ax25_std_t3timer_expiry(ax25);
> -		break;
> -#endif
> -	}
> -}
> -
> -static void ax25_idletimer_expiry(struct timer_list *t)
> -{
> -	ax25_cb *ax25 = timer_container_of(ax25, t, idletimer);
> -
> -	switch (ax25->ax25_dev->values[AX25_VALUES_PROTOCOL]) {
> -	case AX25_PROTO_STD_SIMPLEX:
> -	case AX25_PROTO_STD_DUPLEX:
> -		ax25_std_idletimer_expiry(ax25);
> -		break;
> -
> -#ifdef CONFIG_AX25_DAMA_SLAVE
> -	case AX25_PROTO_DAMA_SLAVE:
> -		if (ax25->ax25_dev->dama.slave)
> -			ax25_ds_idletimer_expiry(ax25);
> -		else
> -			ax25_std_idletimer_expiry(ax25);
> -		break;
> -#endif
> -	}
> -}
> diff --git a/net/ax25/ax25_uid.c b/net/ax25/ax25_uid.c
> deleted file mode 100644
> index 159ce74273f0..000000000000
> --- a/net/ax25/ax25_uid.c
> +++ /dev/null
> @@ -1,204 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-or-later
> -/*
> - *
> - * Copyright (C) Jonathan Naylor G4KLX (g4klx@g4klx.demon.co.uk)
> - */
> -
> -#include <linux/capability.h>
> -#include <linux/errno.h>
> -#include <linux/types.h>
> -#include <linux/socket.h>
> -#include <linux/in.h>
> -#include <linux/kernel.h>
> -#include <linux/timer.h>
> -#include <linux/string.h>
> -#include <linux/sockios.h>
> -#include <linux/net.h>
> -#include <linux/spinlock.h>
> -#include <linux/slab.h>
> -#include <net/ax25.h>
> -#include <linux/inet.h>
> -#include <linux/netdevice.h>
> -#include <linux/if_arp.h>
> -#include <linux/skbuff.h>
> -#include <net/sock.h>
> -#include <linux/uaccess.h>
> -#include <linux/fcntl.h>
> -#include <linux/mm.h>
> -#include <linux/interrupt.h>
> -#include <linux/list.h>
> -#include <linux/notifier.h>
> -#include <linux/proc_fs.h>
> -#include <linux/seq_file.h>
> -#include <linux/stat.h>
> -#include <linux/sysctl.h>
> -#include <linux/export.h>
> -#include <net/ip.h>
> -#include <net/arp.h>
> -
> -/*
> - *	Callsign/UID mapper. This is in kernel space for security on multi-amateur machines.
> - */
> -
> -static HLIST_HEAD(ax25_uid_list);
> -static DEFINE_RWLOCK(ax25_uid_lock);
> -
> -int ax25_uid_policy;
> -
> -EXPORT_SYMBOL(ax25_uid_policy);
> -
> -ax25_uid_assoc *ax25_findbyuid(kuid_t uid)
> -{
> -	ax25_uid_assoc *ax25_uid, *res = NULL;
> -
> -	read_lock(&ax25_uid_lock);
> -	ax25_uid_for_each(ax25_uid, &ax25_uid_list) {
> -		if (uid_eq(ax25_uid->uid, uid)) {
> -			ax25_uid_hold(ax25_uid);
> -			res = ax25_uid;
> -			break;
> -		}
> -	}
> -	read_unlock(&ax25_uid_lock);
> -
> -	return res;
> -}
> -
> -EXPORT_SYMBOL(ax25_findbyuid);
> -
> -int ax25_uid_ioctl(int cmd, struct sockaddr_ax25 *sax)
> -{
> -	ax25_uid_assoc *ax25_uid;
> -	ax25_uid_assoc *user;
> -	unsigned long res;
> -
> -	switch (cmd) {
> -	case SIOCAX25GETUID:
> -		res = -ENOENT;
> -		read_lock(&ax25_uid_lock);
> -		ax25_uid_for_each(ax25_uid, &ax25_uid_list) {
> -			if (ax25cmp(&sax->sax25_call, &ax25_uid->call) == 0) {
> -				res = from_kuid_munged(current_user_ns(), ax25_uid->uid);
> -				break;
> -			}
> -		}
> -		read_unlock(&ax25_uid_lock);
> -
> -		return res;
> -
> -	case SIOCAX25ADDUID:
> -	{
> -		kuid_t sax25_kuid;
> -		if (!capable(CAP_NET_ADMIN))
> -			return -EPERM;
> -		sax25_kuid = make_kuid(current_user_ns(), sax->sax25_uid);
> -		if (!uid_valid(sax25_kuid))
> -			return -EINVAL;
> -		user = ax25_findbyuid(sax25_kuid);
> -		if (user) {
> -			ax25_uid_put(user);
> -			return -EEXIST;
> -		}
> -		if (sax->sax25_uid == 0)
> -			return -EINVAL;
> -		if ((ax25_uid = kmalloc_obj(*ax25_uid)) == NULL)
> -			return -ENOMEM;
> -
> -		refcount_set(&ax25_uid->refcount, 1);
> -		ax25_uid->uid  = sax25_kuid;
> -		ax25_uid->call = sax->sax25_call;
> -
> -		write_lock(&ax25_uid_lock);
> -		hlist_add_head(&ax25_uid->uid_node, &ax25_uid_list);
> -		write_unlock(&ax25_uid_lock);
> -
> -		return 0;
> -	}
> -	case SIOCAX25DELUID:
> -		if (!capable(CAP_NET_ADMIN))
> -			return -EPERM;
> -
> -		ax25_uid = NULL;
> -		write_lock(&ax25_uid_lock);
> -		ax25_uid_for_each(ax25_uid, &ax25_uid_list) {
> -			if (ax25cmp(&sax->sax25_call, &ax25_uid->call) == 0)
> -				break;
> -		}
> -		if (ax25_uid == NULL) {
> -			write_unlock(&ax25_uid_lock);
> -			return -ENOENT;
> -		}
> -		hlist_del_init(&ax25_uid->uid_node);
> -		ax25_uid_put(ax25_uid);
> -		write_unlock(&ax25_uid_lock);
> -
> -		return 0;
> -
> -	default:
> -		return -EINVAL;
> -	}
> -
> -	return -EINVAL;	/*NOTREACHED */
> -}
> -
> -#ifdef CONFIG_PROC_FS
> -
> -static void *ax25_uid_seq_start(struct seq_file *seq, loff_t *pos)
> -	__acquires(ax25_uid_lock)
> -{
> -	read_lock(&ax25_uid_lock);
> -	return seq_hlist_start_head(&ax25_uid_list, *pos);
> -}
> -
> -static void *ax25_uid_seq_next(struct seq_file *seq, void *v, loff_t *pos)
> -{
> -	return seq_hlist_next(v, &ax25_uid_list, pos);
> -}
> -
> -static void ax25_uid_seq_stop(struct seq_file *seq, void *v)
> -	__releases(ax25_uid_lock)
> -{
> -	read_unlock(&ax25_uid_lock);
> -}
> -
> -static int ax25_uid_seq_show(struct seq_file *seq, void *v)
> -{
> -	char buf[11];
> -
> -	if (v == SEQ_START_TOKEN)
> -		seq_printf(seq, "Policy: %d\n", ax25_uid_policy);
> -	else {
> -		struct ax25_uid_assoc *pt;
> -
> -		pt = hlist_entry(v, struct ax25_uid_assoc, uid_node);
> -		seq_printf(seq, "%6d %s\n",
> -			from_kuid_munged(seq_user_ns(seq), pt->uid),
> -			ax2asc(buf, &pt->call));
> -	}
> -	return 0;
> -}
> -
> -const struct seq_operations ax25_uid_seqops = {
> -	.start = ax25_uid_seq_start,
> -	.next = ax25_uid_seq_next,
> -	.stop = ax25_uid_seq_stop,
> -	.show = ax25_uid_seq_show,
> -};
> -#endif
> -
> -/*
> - *	Free all memory associated with UID/Callsign structures.
> - */
> -void __exit ax25_uid_free(void)
> -{
> -	ax25_uid_assoc *ax25_uid;
> -
> -	write_lock(&ax25_uid_lock);
> -again:
> -	ax25_uid_for_each(ax25_uid, &ax25_uid_list) {
> -		hlist_del_init(&ax25_uid->uid_node);
> -		ax25_uid_put(ax25_uid);
> -		goto again;
> -	}
> -	write_unlock(&ax25_uid_lock);
> -}
> diff --git a/net/ax25/sysctl_net_ax25.c b/net/ax25/sysctl_net_ax25.c
> deleted file mode 100644
> index 68753aa30334..000000000000
> --- a/net/ax25/sysctl_net_ax25.c
> +++ /dev/null
> @@ -1,181 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-or-later
> -/*
> - *
> - * Copyright (C) 1996 Mike Shaver (shaver@zeroknowledge.com)
> - */
> -#include <linux/mm.h>
> -#include <linux/slab.h>
> -#include <linux/sysctl.h>
> -#include <linux/spinlock.h>
> -#include <net/ax25.h>
> -
> -static int min_ipdefmode[1],    	max_ipdefmode[] = {1};
> -static int min_axdefmode[1],            max_axdefmode[] = {1};
> -static int min_backoff[1],		max_backoff[] = {2};
> -static int min_conmode[1],		max_conmode[] = {2};
> -static int min_window[] = {1},		max_window[] = {7};
> -static int min_ewindow[] = {1},		max_ewindow[] = {63};
> -static int min_t1[] = {1},		max_t1[] = {30000};
> -static int min_t2[] = {1},		max_t2[] = {20000};
> -static int min_t3[1],			max_t3[] = {3600000};
> -static int min_idle[1],			max_idle[] = {65535000};
> -static int min_n2[] = {1},		max_n2[] = {31};
> -static int min_paclen[] = {1},		max_paclen[] = {512};
> -static int min_proto[1],		max_proto[] = { AX25_PROTO_MAX };
> -#ifdef CONFIG_AX25_DAMA_SLAVE
> -static int min_ds_timeout[1],		max_ds_timeout[] = {65535000};
> -#endif
> -
> -static const struct ctl_table ax25_param_table[] = {
> -	{
> -		.procname	= "ip_default_mode",
> -		.maxlen		= sizeof(int),
> -		.mode		= 0644,
> -		.proc_handler	= proc_dointvec_minmax,
> -		.extra1		= &min_ipdefmode,
> -		.extra2		= &max_ipdefmode
> -	},
> -	{
> -		.procname	= "ax25_default_mode",
> -		.maxlen		= sizeof(int),
> -		.mode		= 0644,
> -		.proc_handler	= proc_dointvec_minmax,
> -		.extra1		= &min_axdefmode,
> -		.extra2		= &max_axdefmode
> -	},
> -	{
> -		.procname	= "backoff_type",
> -		.maxlen		= sizeof(int),
> -		.mode		= 0644,
> -		.proc_handler	= proc_dointvec_minmax,
> -		.extra1		= &min_backoff,
> -		.extra2		= &max_backoff
> -	},
> -	{
> -		.procname	= "connect_mode",
> -		.maxlen		= sizeof(int),
> -		.mode		= 0644,
> -		.proc_handler	= proc_dointvec_minmax,
> -		.extra1		= &min_conmode,
> -		.extra2		= &max_conmode
> -	},
> -	{
> -		.procname	= "standard_window_size",
> -		.maxlen		= sizeof(int),
> -		.mode		= 0644,
> -		.proc_handler	= proc_dointvec_minmax,
> -		.extra1		= &min_window,
> -		.extra2		= &max_window
> -	},
> -	{
> -		.procname	= "extended_window_size",
> -		.maxlen		= sizeof(int),
> -		.mode		= 0644,
> -		.proc_handler	= proc_dointvec_minmax,
> -		.extra1		= &min_ewindow,
> -		.extra2		= &max_ewindow
> -	},
> -	{
> -		.procname	= "t1_timeout",
> -		.maxlen		= sizeof(int),
> -		.mode		= 0644,
> -		.proc_handler	= proc_dointvec_minmax,
> -		.extra1		= &min_t1,
> -		.extra2		= &max_t1
> -	},
> -	{
> -		.procname	= "t2_timeout",
> -		.maxlen		= sizeof(int),
> -		.mode		= 0644,
> -		.proc_handler	= proc_dointvec_minmax,
> -		.extra1		= &min_t2,
> -		.extra2		= &max_t2
> -	},
> -	{
> -		.procname	= "t3_timeout",
> -		.maxlen		= sizeof(int),
> -		.mode		= 0644,
> -		.proc_handler	= proc_dointvec_minmax,
> -		.extra1		= &min_t3,
> -		.extra2		= &max_t3
> -	},
> -	{
> -		.procname	= "idle_timeout",
> -		.maxlen		= sizeof(int),
> -		.mode		= 0644,
> -		.proc_handler	= proc_dointvec_minmax,
> -		.extra1		= &min_idle,
> -		.extra2		= &max_idle
> -	},
> -	{
> -		.procname	= "maximum_retry_count",
> -		.maxlen		= sizeof(int),
> -		.mode		= 0644,
> -		.proc_handler	= proc_dointvec_minmax,
> -		.extra1		= &min_n2,
> -		.extra2		= &max_n2
> -	},
> -	{
> -		.procname	= "maximum_packet_length",
> -		.maxlen		= sizeof(int),
> -		.mode		= 0644,
> -		.proc_handler	= proc_dointvec_minmax,
> -		.extra1		= &min_paclen,
> -		.extra2		= &max_paclen
> -	},
> -	{
> -		.procname	= "protocol",
> -		.maxlen		= sizeof(int),
> -		.mode		= 0644,
> -		.proc_handler	= proc_dointvec_minmax,
> -		.extra1		= &min_proto,
> -		.extra2		= &max_proto
> -	},
> -#ifdef CONFIG_AX25_DAMA_SLAVE
> -	{
> -		.procname	= "dama_slave_timeout",
> -		.maxlen		= sizeof(int),
> -		.mode		= 0644,
> -		.proc_handler	= proc_dointvec_minmax,
> -		.extra1		= &min_ds_timeout,
> -		.extra2		= &max_ds_timeout
> -	},
> -#endif
> -};
> -
> -int ax25_register_dev_sysctl(ax25_dev *ax25_dev)
> -{
> -	char path[sizeof("net/ax25/") + IFNAMSIZ];
> -	int k;
> -	struct ctl_table *table;
> -
> -	table = kmemdup(ax25_param_table, sizeof(ax25_param_table), GFP_KERNEL);
> -	if (!table)
> -		return -ENOMEM;
> -
> -	BUILD_BUG_ON(ARRAY_SIZE(ax25_param_table) != AX25_MAX_VALUES);
> -	for (k = 0; k < AX25_MAX_VALUES; k++)
> -		table[k].data = &ax25_dev->values[k];
> -
> -	snprintf(path, sizeof(path), "net/ax25/%s", ax25_dev->dev->name);
> -	ax25_dev->sysheader = register_net_sysctl_sz(&init_net, path, table,
> -						     ARRAY_SIZE(ax25_param_table));
> -	if (!ax25_dev->sysheader) {
> -		kfree(table);
> -		return -ENOMEM;
> -	}
> -	return 0;
> -}
> -
> -void ax25_unregister_dev_sysctl(ax25_dev *ax25_dev)
> -{
> -	struct ctl_table_header *header = ax25_dev->sysheader;
> -	const struct ctl_table *table;
> -
> -	if (header) {
> -		ax25_dev->sysheader = NULL;
> -		table = header->ctl_table_arg;
> -		unregister_net_sysctl_table(header);
> -		kfree(table);
> -	}
> -}
> diff --git a/net/ipv4/arp.c b/net/ipv4/arp.c
> index 51d70180e1cc..d409f606aec0 100644
> --- a/net/ipv4/arp.c
> +++ b/net/ipv4/arp.c
> @@ -109,7 +109,6 @@
>   #include <net/sock.h>
>   #include <net/arp.h>
>   #include <net/ax25.h>
> -#include <net/netrom.h>
>   #include <net/dst_metadata.h>
>   #include <net/ip_tunnels.h>
>   
> diff --git a/net/netrom/af_netrom.c b/net/netrom/af_netrom.c
> deleted file mode 100644
> index 5fc54836dfa8..000000000000
> --- a/net/netrom/af_netrom.c
> +++ /dev/null
> @@ -1,1536 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-or-later
> -/*
> - *
> - * Copyright Jonathan Naylor G4KLX (g4klx@g4klx.demon.co.uk)
> - * Copyright Alan Cox GW4PTS (alan@lxorguk.ukuu.org.uk)
> - * Copyright Darryl Miles G7LED (dlm@g7led.demon.co.uk)
> - */
> -#include <linux/module.h>
> -#include <linux/moduleparam.h>
> -#include <linux/capability.h>
> -#include <linux/errno.h>
> -#include <linux/types.h>
> -#include <linux/socket.h>
> -#include <linux/in.h>
> -#include <linux/slab.h>
> -#include <linux/kernel.h>
> -#include <linux/sched/signal.h>
> -#include <linux/timer.h>
> -#include <linux/string.h>
> -#include <linux/sockios.h>
> -#include <linux/net.h>
> -#include <linux/stat.h>
> -#include <net/ax25.h>
> -#include <linux/inet.h>
> -#include <linux/netdevice.h>
> -#include <linux/if_arp.h>
> -#include <linux/skbuff.h>
> -#include <net/net_namespace.h>
> -#include <net/sock.h>
> -#include <linux/uaccess.h>
> -#include <linux/fcntl.h>
> -#include <linux/termios.h>	/* For TIOCINQ/OUTQ */
> -#include <linux/mm.h>
> -#include <linux/interrupt.h>
> -#include <linux/notifier.h>
> -#include <net/netrom.h>
> -#include <linux/proc_fs.h>
> -#include <linux/seq_file.h>
> -#include <net/ip.h>
> -#include <net/tcp_states.h>
> -#include <net/arp.h>
> -#include <linux/init.h>
> -
> -static int nr_ndevs = 4;
> -
> -int sysctl_netrom_default_path_quality            = NR_DEFAULT_QUAL;
> -int sysctl_netrom_obsolescence_count_initialiser  = NR_DEFAULT_OBS;
> -int sysctl_netrom_network_ttl_initialiser         = NR_DEFAULT_TTL;
> -int sysctl_netrom_transport_timeout               = NR_DEFAULT_T1;
> -int sysctl_netrom_transport_maximum_tries         = NR_DEFAULT_N2;
> -int sysctl_netrom_transport_acknowledge_delay     = NR_DEFAULT_T2;
> -int sysctl_netrom_transport_busy_delay            = NR_DEFAULT_T4;
> -int sysctl_netrom_transport_requested_window_size = NR_DEFAULT_WINDOW;
> -int sysctl_netrom_transport_no_activity_timeout   = NR_DEFAULT_IDLE;
> -int sysctl_netrom_routing_control                 = NR_DEFAULT_ROUTING;
> -int sysctl_netrom_link_fails_count                = NR_DEFAULT_FAILS;
> -int sysctl_netrom_reset_circuit                   = NR_DEFAULT_RESET;
> -
> -static unsigned short circuit = 0x101;
> -
> -static HLIST_HEAD(nr_list);
> -static DEFINE_SPINLOCK(nr_list_lock);
> -
> -static const struct proto_ops nr_proto_ops;
> -
> -/*
> - * NETROM network devices are virtual network devices encapsulating NETROM
> - * frames into AX.25 which will be sent through an AX.25 device, so form a
> - * special "super class" of normal net devices; split their locks off into a
> - * separate class since they always nest.
> - */
> -static struct lock_class_key nr_netdev_xmit_lock_key;
> -static struct lock_class_key nr_netdev_addr_lock_key;
> -
> -static void nr_set_lockdep_one(struct net_device *dev,
> -			       struct netdev_queue *txq,
> -			       void *_unused)
> -{
> -	lockdep_set_class(&txq->_xmit_lock, &nr_netdev_xmit_lock_key);
> -}
> -
> -static void nr_set_lockdep_key(struct net_device *dev)
> -{
> -	lockdep_set_class(&dev->addr_list_lock, &nr_netdev_addr_lock_key);
> -	netdev_for_each_tx_queue(dev, nr_set_lockdep_one, NULL);
> -}
> -
> -/*
> - *	Socket removal during an interrupt is now safe.
> - */
> -static void nr_remove_socket(struct sock *sk)
> -{
> -	spin_lock_bh(&nr_list_lock);
> -	sk_del_node_init(sk);
> -	spin_unlock_bh(&nr_list_lock);
> -}
> -
> -/*
> - *	Kill all bound sockets on a dropped device.
> - */
> -static void nr_kill_by_device(struct net_device *dev)
> -{
> -	struct sock *s;
> -
> -	spin_lock_bh(&nr_list_lock);
> -	sk_for_each(s, &nr_list)
> -		if (nr_sk(s)->device == dev)
> -			nr_disconnect(s, ENETUNREACH);
> -	spin_unlock_bh(&nr_list_lock);
> -}
> -
> -/*
> - *	Handle device status changes.
> - */
> -static int nr_device_event(struct notifier_block *this, unsigned long event, void *ptr)
> -{
> -	struct net_device *dev = netdev_notifier_info_to_dev(ptr);
> -
> -	if (!net_eq(dev_net(dev), &init_net))
> -		return NOTIFY_DONE;
> -
> -	if (event != NETDEV_DOWN)
> -		return NOTIFY_DONE;
> -
> -	nr_kill_by_device(dev);
> -	nr_rt_device_down(dev);
> -
> -	return NOTIFY_DONE;
> -}
> -
> -/*
> - *	Add a socket to the bound sockets list.
> - */
> -static void nr_insert_socket(struct sock *sk)
> -{
> -	spin_lock_bh(&nr_list_lock);
> -	sk_add_node(sk, &nr_list);
> -	spin_unlock_bh(&nr_list_lock);
> -}
> -
> -/*
> - *	Find a socket that wants to accept the Connect Request we just
> - *	received.
> - */
> -static struct sock *nr_find_listener(ax25_address *addr)
> -{
> -	struct sock *s;
> -
> -	spin_lock_bh(&nr_list_lock);
> -	sk_for_each(s, &nr_list)
> -		if (!ax25cmp(&nr_sk(s)->source_addr, addr) &&
> -		    s->sk_state == TCP_LISTEN) {
> -			sock_hold(s);
> -			goto found;
> -		}
> -	s = NULL;
> -found:
> -	spin_unlock_bh(&nr_list_lock);
> -	return s;
> -}
> -
> -/*
> - *	Find a connected NET/ROM socket given my circuit IDs.
> - */
> -static struct sock *nr_find_socket(unsigned char index, unsigned char id)
> -{
> -	struct sock *s;
> -
> -	spin_lock_bh(&nr_list_lock);
> -	sk_for_each(s, &nr_list) {
> -		struct nr_sock *nr = nr_sk(s);
> -
> -		if (nr->my_index == index && nr->my_id == id) {
> -			sock_hold(s);
> -			goto found;
> -		}
> -	}
> -	s = NULL;
> -found:
> -	spin_unlock_bh(&nr_list_lock);
> -	return s;
> -}
> -
> -/*
> - *	Find a connected NET/ROM socket given their circuit IDs.
> - */
> -static struct sock *nr_find_peer(unsigned char index, unsigned char id,
> -	ax25_address *dest)
> -{
> -	struct sock *s;
> -
> -	spin_lock_bh(&nr_list_lock);
> -	sk_for_each(s, &nr_list) {
> -		struct nr_sock *nr = nr_sk(s);
> -
> -		if (nr->your_index == index && nr->your_id == id &&
> -		    !ax25cmp(&nr->dest_addr, dest)) {
> -			sock_hold(s);
> -			goto found;
> -		}
> -	}
> -	s = NULL;
> -found:
> -	spin_unlock_bh(&nr_list_lock);
> -	return s;
> -}
> -
> -/*
> - *	Find next free circuit ID.
> - */
> -static unsigned short nr_find_next_circuit(void)
> -{
> -	unsigned short id = circuit;
> -	unsigned char i, j;
> -	struct sock *sk;
> -
> -	for (;;) {
> -		i = id / 256;
> -		j = id % 256;
> -
> -		if (i != 0 && j != 0) {
> -			if ((sk=nr_find_socket(i, j)) == NULL)
> -				break;
> -			sock_put(sk);
> -		}
> -
> -		id++;
> -	}
> -
> -	return id;
> -}
> -
> -/*
> - *	Deferred destroy.
> - */
> -void nr_destroy_socket(struct sock *);
> -
> -/*
> - *	Handler for deferred kills.
> - */
> -static void nr_destroy_timer(struct timer_list *t)
> -{
> -	struct sock *sk = timer_container_of(sk, t, sk_timer);
> -	bh_lock_sock(sk);
> -	sock_hold(sk);
> -	nr_destroy_socket(sk);
> -	bh_unlock_sock(sk);
> -	sock_put(sk);
> -}
> -
> -/*
> - *	This is called from user mode and the timers. Thus it protects itself
> - *	against interrupt users but doesn't worry about being called during
> - *	work. Once it is removed from the queue no interrupt or bottom half
> - *	will touch it and we are (fairly 8-) ) safe.
> - */
> -void nr_destroy_socket(struct sock *sk)
> -{
> -	struct sk_buff *skb;
> -
> -	nr_remove_socket(sk);
> -
> -	nr_stop_heartbeat(sk);
> -	nr_stop_t1timer(sk);
> -	nr_stop_t2timer(sk);
> -	nr_stop_t4timer(sk);
> -	nr_stop_idletimer(sk);
> -
> -	nr_clear_queues(sk);		/* Flush the queues */
> -
> -	while ((skb = skb_dequeue(&sk->sk_receive_queue)) != NULL) {
> -		if (skb->sk != sk) { /* A pending connection */
> -			/* Queue the unaccepted socket for death */
> -			sock_set_flag(skb->sk, SOCK_DEAD);
> -			nr_start_heartbeat(skb->sk);
> -			nr_sk(skb->sk)->state = NR_STATE_0;
> -		}
> -
> -		kfree_skb(skb);
> -	}
> -
> -	if (sk_has_allocations(sk)) {
> -		/* Defer: outstanding buffers */
> -		sk->sk_timer.function = nr_destroy_timer;
> -		sk->sk_timer.expires  = jiffies + 2 * HZ;
> -		add_timer(&sk->sk_timer);
> -	} else
> -		sock_put(sk);
> -}
> -
> -/*
> - *	Handling for system calls applied via the various interfaces to a
> - *	NET/ROM socket object.
> - */
> -
> -static int nr_setsockopt(struct socket *sock, int level, int optname,
> -		sockptr_t optval, unsigned int optlen)
> -{
> -	struct sock *sk = sock->sk;
> -	struct nr_sock *nr = nr_sk(sk);
> -	unsigned int opt;
> -
> -	if (level != SOL_NETROM)
> -		return -ENOPROTOOPT;
> -
> -	if (optlen < sizeof(unsigned int))
> -		return -EINVAL;
> -
> -	if (copy_from_sockptr(&opt, optval, sizeof(opt)))
> -		return -EFAULT;
> -
> -	switch (optname) {
> -	case NETROM_T1:
> -		if (opt < 1 || opt > UINT_MAX / HZ)
> -			return -EINVAL;
> -		nr->t1 = opt * HZ;
> -		return 0;
> -
> -	case NETROM_T2:
> -		if (opt < 1 || opt > UINT_MAX / HZ)
> -			return -EINVAL;
> -		nr->t2 = opt * HZ;
> -		return 0;
> -
> -	case NETROM_N2:
> -		if (opt < 1 || opt > 31)
> -			return -EINVAL;
> -		nr->n2 = opt;
> -		return 0;
> -
> -	case NETROM_T4:
> -		if (opt < 1 || opt > UINT_MAX / HZ)
> -			return -EINVAL;
> -		nr->t4 = opt * HZ;
> -		return 0;
> -
> -	case NETROM_IDLE:
> -		if (opt > UINT_MAX / (60 * HZ))
> -			return -EINVAL;
> -		nr->idle = opt * 60 * HZ;
> -		return 0;
> -
> -	default:
> -		return -ENOPROTOOPT;
> -	}
> -}
> -
> -static int nr_getsockopt(struct socket *sock, int level, int optname,
> -	char __user *optval, int __user *optlen)
> -{
> -	struct sock *sk = sock->sk;
> -	struct nr_sock *nr = nr_sk(sk);
> -	int val = 0;
> -	int len;
> -
> -	if (level != SOL_NETROM)
> -		return -ENOPROTOOPT;
> -
> -	if (get_user(len, optlen))
> -		return -EFAULT;
> -
> -	if (len < 0)
> -		return -EINVAL;
> -
> -	switch (optname) {
> -	case NETROM_T1:
> -		val = nr->t1 / HZ;
> -		break;
> -
> -	case NETROM_T2:
> -		val = nr->t2 / HZ;
> -		break;
> -
> -	case NETROM_N2:
> -		val = nr->n2;
> -		break;
> -
> -	case NETROM_T4:
> -		val = nr->t4 / HZ;
> -		break;
> -
> -	case NETROM_IDLE:
> -		val = nr->idle / (60 * HZ);
> -		break;
> -
> -	default:
> -		return -ENOPROTOOPT;
> -	}
> -
> -	len = min_t(unsigned int, len, sizeof(int));
> -
> -	if (put_user(len, optlen))
> -		return -EFAULT;
> -
> -	return copy_to_user(optval, &val, len) ? -EFAULT : 0;
> -}
> -
> -static int nr_listen(struct socket *sock, int backlog)
> -{
> -	struct sock *sk = sock->sk;
> -
> -	lock_sock(sk);
> -	if (sock->state != SS_UNCONNECTED) {
> -		release_sock(sk);
> -		return -EINVAL;
> -	}
> -
> -	if (sk->sk_state != TCP_LISTEN) {
> -		memset(&nr_sk(sk)->user_addr, 0, AX25_ADDR_LEN);
> -		sk->sk_max_ack_backlog = backlog;
> -		sk->sk_state           = TCP_LISTEN;
> -		release_sock(sk);
> -		return 0;
> -	}
> -	release_sock(sk);
> -
> -	return -EOPNOTSUPP;
> -}
> -
> -static struct proto nr_proto = {
> -	.name	  = "NETROM",
> -	.owner	  = THIS_MODULE,
> -	.obj_size = sizeof(struct nr_sock),
> -};
> -
> -static int nr_create(struct net *net, struct socket *sock, int protocol,
> -		     int kern)
> -{
> -	struct sock *sk;
> -	struct nr_sock *nr;
> -
> -	if (!net_eq(net, &init_net))
> -		return -EAFNOSUPPORT;
> -
> -	if (sock->type != SOCK_SEQPACKET || protocol != 0)
> -		return -ESOCKTNOSUPPORT;
> -
> -	sk = sk_alloc(net, PF_NETROM, GFP_ATOMIC, &nr_proto, kern);
> -	if (sk  == NULL)
> -		return -ENOMEM;
> -
> -	nr = nr_sk(sk);
> -
> -	sock_init_data(sock, sk);
> -
> -	sock->ops    = &nr_proto_ops;
> -	sk->sk_protocol = protocol;
> -
> -	skb_queue_head_init(&nr->ack_queue);
> -	skb_queue_head_init(&nr->reseq_queue);
> -	skb_queue_head_init(&nr->frag_queue);
> -
> -	nr_init_timers(sk);
> -
> -	nr->t1     =
> -		msecs_to_jiffies(READ_ONCE(sysctl_netrom_transport_timeout));
> -	nr->t2     =
> -		msecs_to_jiffies(READ_ONCE(sysctl_netrom_transport_acknowledge_delay));
> -	nr->n2     =
> -		msecs_to_jiffies(READ_ONCE(sysctl_netrom_transport_maximum_tries));
> -	nr->t4     =
> -		msecs_to_jiffies(READ_ONCE(sysctl_netrom_transport_busy_delay));
> -	nr->idle   =
> -		msecs_to_jiffies(READ_ONCE(sysctl_netrom_transport_no_activity_timeout));
> -	nr->window = READ_ONCE(sysctl_netrom_transport_requested_window_size);
> -
> -	nr->bpqext = 1;
> -	nr->state  = NR_STATE_0;
> -
> -	return 0;
> -}
> -
> -static struct sock *nr_make_new(struct sock *osk)
> -{
> -	struct sock *sk;
> -	struct nr_sock *nr, *onr;
> -
> -	if (osk->sk_type != SOCK_SEQPACKET)
> -		return NULL;
> -
> -	sk = sk_alloc(sock_net(osk), PF_NETROM, GFP_ATOMIC, osk->sk_prot, 0);
> -	if (sk == NULL)
> -		return NULL;
> -
> -	nr = nr_sk(sk);
> -
> -	sock_init_data(NULL, sk);
> -
> -	sk->sk_type     = osk->sk_type;
> -	sk->sk_priority = READ_ONCE(osk->sk_priority);
> -	sk->sk_protocol = osk->sk_protocol;
> -	sk->sk_rcvbuf   = osk->sk_rcvbuf;
> -	sk->sk_sndbuf   = osk->sk_sndbuf;
> -	sk->sk_state    = TCP_ESTABLISHED;
> -	sock_copy_flags(sk, osk);
> -
> -	skb_queue_head_init(&nr->ack_queue);
> -	skb_queue_head_init(&nr->reseq_queue);
> -	skb_queue_head_init(&nr->frag_queue);
> -
> -	nr_init_timers(sk);
> -
> -	onr = nr_sk(osk);
> -
> -	nr->t1      = onr->t1;
> -	nr->t2      = onr->t2;
> -	nr->n2      = onr->n2;
> -	nr->t4      = onr->t4;
> -	nr->idle    = onr->idle;
> -	nr->window  = onr->window;
> -
> -	nr->device  = onr->device;
> -	nr->bpqext  = onr->bpqext;
> -
> -	return sk;
> -}
> -
> -static int nr_release(struct socket *sock)
> -{
> -	struct sock *sk = sock->sk;
> -	struct nr_sock *nr;
> -
> -	if (sk == NULL) return 0;
> -
> -	sock_hold(sk);
> -	sock_orphan(sk);
> -	lock_sock(sk);
> -	nr = nr_sk(sk);
> -
> -	switch (nr->state) {
> -	case NR_STATE_0:
> -	case NR_STATE_1:
> -	case NR_STATE_2:
> -		nr_disconnect(sk, 0);
> -		nr_destroy_socket(sk);
> -		break;
> -
> -	case NR_STATE_3:
> -		nr_clear_queues(sk);
> -		nr->n2count = 0;
> -		nr_write_internal(sk, NR_DISCREQ);
> -		nr_start_t1timer(sk);
> -		nr_stop_t2timer(sk);
> -		nr_stop_t4timer(sk);
> -		nr_stop_idletimer(sk);
> -		nr->state    = NR_STATE_2;
> -		sk->sk_state    = TCP_CLOSE;
> -		sk->sk_shutdown |= SEND_SHUTDOWN;
> -		sk->sk_state_change(sk);
> -		sock_set_flag(sk, SOCK_DESTROY);
> -		break;
> -
> -	default:
> -		break;
> -	}
> -
> -	sock->sk   = NULL;
> -	release_sock(sk);
> -	sock_put(sk);
> -
> -	return 0;
> -}
> -
> -static int nr_bind(struct socket *sock, struct sockaddr_unsized *uaddr, int addr_len)
> -{
> -	struct sock *sk = sock->sk;
> -	struct nr_sock *nr = nr_sk(sk);
> -	struct full_sockaddr_ax25 *addr = (struct full_sockaddr_ax25 *)uaddr;
> -	struct net_device *dev;
> -	ax25_uid_assoc *user;
> -	ax25_address *source;
> -
> -	lock_sock(sk);
> -	if (!sock_flag(sk, SOCK_ZAPPED)) {
> -		release_sock(sk);
> -		return -EINVAL;
> -	}
> -	if (addr_len < sizeof(struct sockaddr_ax25) || addr_len > sizeof(struct full_sockaddr_ax25)) {
> -		release_sock(sk);
> -		return -EINVAL;
> -	}
> -	if (addr_len < (addr->fsa_ax25.sax25_ndigis * sizeof(ax25_address) + sizeof(struct sockaddr_ax25))) {
> -		release_sock(sk);
> -		return -EINVAL;
> -	}
> -	if (addr->fsa_ax25.sax25_family != AF_NETROM) {
> -		release_sock(sk);
> -		return -EINVAL;
> -	}
> -	if ((dev = nr_dev_get(&addr->fsa_ax25.sax25_call)) == NULL) {
> -		release_sock(sk);
> -		return -EADDRNOTAVAIL;
> -	}
> -
> -	/*
> -	 * Only the super user can set an arbitrary user callsign.
> -	 */
> -	if (addr->fsa_ax25.sax25_ndigis == 1) {
> -		if (!capable(CAP_NET_BIND_SERVICE)) {
> -			dev_put(dev);
> -			release_sock(sk);
> -			return -EPERM;
> -		}
> -		nr->user_addr   = addr->fsa_digipeater[0];
> -		nr->source_addr = addr->fsa_ax25.sax25_call;
> -	} else {
> -		source = &addr->fsa_ax25.sax25_call;
> -
> -		user = ax25_findbyuid(current_euid());
> -		if (user) {
> -			nr->user_addr   = user->call;
> -			ax25_uid_put(user);
> -		} else {
> -			if (ax25_uid_policy && !capable(CAP_NET_BIND_SERVICE)) {
> -				release_sock(sk);
> -				dev_put(dev);
> -				return -EPERM;
> -			}
> -			nr->user_addr   = *source;
> -		}
> -
> -		nr->source_addr = *source;
> -	}
> -
> -	nr->device = dev;
> -	nr_insert_socket(sk);
> -
> -	sock_reset_flag(sk, SOCK_ZAPPED);
> -	dev_put(dev);
> -	release_sock(sk);
> -
> -	return 0;
> -}
> -
> -static int nr_connect(struct socket *sock, struct sockaddr_unsized *uaddr,
> -		      int addr_len, int flags)
> -{
> -	struct sock *sk = sock->sk;
> -	struct nr_sock *nr = nr_sk(sk);
> -	struct sockaddr_ax25 *addr = (struct sockaddr_ax25 *)uaddr;
> -	const ax25_address *source = NULL;
> -	ax25_uid_assoc *user;
> -	struct net_device *dev;
> -	int err = 0;
> -
> -	lock_sock(sk);
> -	if (sk->sk_state == TCP_ESTABLISHED && sock->state == SS_CONNECTING) {
> -		sock->state = SS_CONNECTED;
> -		goto out_release;	/* Connect completed during a ERESTARTSYS event */
> -	}
> -
> -	if (sk->sk_state == TCP_CLOSE && sock->state == SS_CONNECTING) {
> -		sock->state = SS_UNCONNECTED;
> -		err = -ECONNREFUSED;
> -		goto out_release;
> -	}
> -
> -	if (sk->sk_state == TCP_ESTABLISHED) {
> -		err = -EISCONN;	/* No reconnect on a seqpacket socket */
> -		goto out_release;
> -	}
> -
> -	if (sock->state == SS_CONNECTING) {
> -		err = -EALREADY;
> -		goto out_release;
> -	}
> -
> -	sk->sk_state   = TCP_CLOSE;
> -	sock->state = SS_UNCONNECTED;
> -
> -	if (addr_len != sizeof(struct sockaddr_ax25) && addr_len != sizeof(struct full_sockaddr_ax25)) {
> -		err = -EINVAL;
> -		goto out_release;
> -	}
> -	if (addr->sax25_family != AF_NETROM) {
> -		err = -EINVAL;
> -		goto out_release;
> -	}
> -	if (sock_flag(sk, SOCK_ZAPPED)) {	/* Must bind first - autobinding in this may or may not work */
> -		sock_reset_flag(sk, SOCK_ZAPPED);
> -
> -		if ((dev = nr_dev_first()) == NULL) {
> -			err = -ENETUNREACH;
> -			goto out_release;
> -		}
> -		source = (const ax25_address *)dev->dev_addr;
> -
> -		user = ax25_findbyuid(current_euid());
> -		if (user) {
> -			nr->user_addr   = user->call;
> -			ax25_uid_put(user);
> -		} else {
> -			if (ax25_uid_policy && !capable(CAP_NET_ADMIN)) {
> -				dev_put(dev);
> -				err = -EPERM;
> -				goto out_release;
> -			}
> -			nr->user_addr   = *source;
> -		}
> -
> -		nr->source_addr = *source;
> -		nr->device      = dev;
> -
> -		dev_put(dev);
> -		nr_insert_socket(sk);		/* Finish the bind */
> -	}
> -
> -	nr->dest_addr = addr->sax25_call;
> -
> -	release_sock(sk);
> -	circuit = nr_find_next_circuit();
> -	lock_sock(sk);
> -
> -	nr->my_index = circuit / 256;
> -	nr->my_id    = circuit % 256;
> -
> -	circuit++;
> -
> -	/* Move to connecting socket, start sending Connect Requests */
> -	sock->state  = SS_CONNECTING;
> -	sk->sk_state = TCP_SYN_SENT;
> -
> -	nr_establish_data_link(sk);
> -
> -	nr->state = NR_STATE_1;
> -
> -	nr_start_heartbeat(sk);
> -
> -	/* Now the loop */
> -	if (sk->sk_state != TCP_ESTABLISHED && (flags & O_NONBLOCK)) {
> -		err = -EINPROGRESS;
> -		goto out_release;
> -	}
> -
> -	/*
> -	 * A Connect Ack with Choke or timeout or failed routing will go to
> -	 * closed.
> -	 */
> -	if (sk->sk_state == TCP_SYN_SENT) {
> -		DEFINE_WAIT(wait);
> -
> -		for (;;) {
> -			prepare_to_wait(sk_sleep(sk), &wait,
> -					TASK_INTERRUPTIBLE);
> -			if (sk->sk_state != TCP_SYN_SENT)
> -				break;
> -			if (!signal_pending(current)) {
> -				release_sock(sk);
> -				schedule();
> -				lock_sock(sk);
> -				continue;
> -			}
> -			err = -ERESTARTSYS;
> -			break;
> -		}
> -		finish_wait(sk_sleep(sk), &wait);
> -		if (err)
> -			goto out_release;
> -	}
> -
> -	if (sk->sk_state != TCP_ESTABLISHED) {
> -		sock->state = SS_UNCONNECTED;
> -		err = sock_error(sk);	/* Always set at this point */
> -		goto out_release;
> -	}
> -
> -	sock->state = SS_CONNECTED;
> -
> -out_release:
> -	release_sock(sk);
> -
> -	return err;
> -}
> -
> -static int nr_accept(struct socket *sock, struct socket *newsock,
> -		     struct proto_accept_arg *arg)
> -{
> -	struct sk_buff *skb;
> -	struct sock *newsk;
> -	DEFINE_WAIT(wait);
> -	struct sock *sk;
> -	int err = 0;
> -
> -	if ((sk = sock->sk) == NULL)
> -		return -EINVAL;
> -
> -	lock_sock(sk);
> -	if (sk->sk_type != SOCK_SEQPACKET) {
> -		err = -EOPNOTSUPP;
> -		goto out_release;
> -	}
> -
> -	if (sk->sk_state != TCP_LISTEN) {
> -		err = -EINVAL;
> -		goto out_release;
> -	}
> -
> -	/*
> -	 *	The write queue this time is holding sockets ready to use
> -	 *	hooked into the SABM we saved
> -	 */
> -	for (;;) {
> -		prepare_to_wait(sk_sleep(sk), &wait, TASK_INTERRUPTIBLE);
> -		skb = skb_dequeue(&sk->sk_receive_queue);
> -		if (skb)
> -			break;
> -
> -		if (arg->flags & O_NONBLOCK) {
> -			err = -EWOULDBLOCK;
> -			break;
> -		}
> -		if (!signal_pending(current)) {
> -			release_sock(sk);
> -			schedule();
> -			lock_sock(sk);
> -			continue;
> -		}
> -		err = -ERESTARTSYS;
> -		break;
> -	}
> -	finish_wait(sk_sleep(sk), &wait);
> -	if (err)
> -		goto out_release;
> -
> -	newsk = skb->sk;
> -	sock_graft(newsk, newsock);
> -
> -	/* Now attach up the new socket */
> -	kfree_skb(skb);
> -	sk_acceptq_removed(sk);
> -
> -out_release:
> -	release_sock(sk);
> -
> -	return err;
> -}
> -
> -static int nr_getname(struct socket *sock, struct sockaddr *uaddr,
> -	int peer)
> -{
> -	struct full_sockaddr_ax25 *sax = (struct full_sockaddr_ax25 *)uaddr;
> -	struct sock *sk = sock->sk;
> -	struct nr_sock *nr = nr_sk(sk);
> -	int uaddr_len;
> -
> -	memset(&sax->fsa_ax25, 0, sizeof(struct sockaddr_ax25));
> -
> -	lock_sock(sk);
> -	if (peer != 0) {
> -		if (sk->sk_state != TCP_ESTABLISHED) {
> -			release_sock(sk);
> -			return -ENOTCONN;
> -		}
> -		sax->fsa_ax25.sax25_family = AF_NETROM;
> -		sax->fsa_ax25.sax25_ndigis = 1;
> -		sax->fsa_ax25.sax25_call   = nr->user_addr;
> -		memset(sax->fsa_digipeater, 0, sizeof(sax->fsa_digipeater));
> -		sax->fsa_digipeater[0]     = nr->dest_addr;
> -		uaddr_len = sizeof(struct full_sockaddr_ax25);
> -	} else {
> -		sax->fsa_ax25.sax25_family = AF_NETROM;
> -		sax->fsa_ax25.sax25_ndigis = 0;
> -		sax->fsa_ax25.sax25_call   = nr->source_addr;
> -		uaddr_len = sizeof(struct sockaddr_ax25);
> -	}
> -	release_sock(sk);
> -
> -	return uaddr_len;
> -}
> -
> -int nr_rx_frame(struct sk_buff *skb, struct net_device *dev)
> -{
> -	struct sock *sk;
> -	struct sock *make;
> -	struct nr_sock *nr_make;
> -	ax25_address *src, *dest, *user;
> -	unsigned short circuit_index, circuit_id;
> -	unsigned short peer_circuit_index, peer_circuit_id;
> -	unsigned short frametype, flags, window, timeout;
> -	int ret;
> -
> -	skb_orphan(skb);
> -
> -	/*
> -	 *	skb->data points to the netrom frame start
> -	 */
> -
> -	src  = (ax25_address *)(skb->data + 0);
> -	dest = (ax25_address *)(skb->data + 7);
> -
> -	circuit_index      = skb->data[15];
> -	circuit_id         = skb->data[16];
> -	peer_circuit_index = skb->data[17];
> -	peer_circuit_id    = skb->data[18];
> -	frametype          = skb->data[19] & 0x0F;
> -	flags              = skb->data[19] & 0xF0;
> -
> -	/*
> -	 * Check for an incoming IP over NET/ROM frame.
> -	 */
> -	if (frametype == NR_PROTOEXT &&
> -	    circuit_index == NR_PROTO_IP && circuit_id == NR_PROTO_IP) {
> -		skb_pull(skb, NR_NETWORK_LEN + NR_TRANSPORT_LEN);
> -		skb_reset_transport_header(skb);
> -
> -		return nr_rx_ip(skb, dev);
> -	}
> -
> -	/*
> -	 * Find an existing socket connection, based on circuit ID, if it's
> -	 * a Connect Request base it on their circuit ID.
> -	 *
> -	 * Circuit ID 0/0 is not valid but it could still be a "reset" for a
> -	 * circuit that no longer exists at the other end ...
> -	 */
> -
> -	sk = NULL;
> -
> -	if (circuit_index == 0 && circuit_id == 0) {
> -		if (frametype == NR_CONNACK && flags == NR_CHOKE_FLAG)
> -			sk = nr_find_peer(peer_circuit_index, peer_circuit_id, src);
> -	} else {
> -		if (frametype == NR_CONNREQ)
> -			sk = nr_find_peer(circuit_index, circuit_id, src);
> -		else
> -			sk = nr_find_socket(circuit_index, circuit_id);
> -	}
> -
> -	if (sk != NULL) {
> -		bh_lock_sock(sk);
> -		skb_reset_transport_header(skb);
> -
> -		if (frametype == NR_CONNACK && skb->len == 22)
> -			nr_sk(sk)->bpqext = 1;
> -		else
> -			nr_sk(sk)->bpqext = 0;
> -
> -		ret = nr_process_rx_frame(sk, skb);
> -		bh_unlock_sock(sk);
> -		sock_put(sk);
> -		return ret;
> -	}
> -
> -	/*
> -	 * Now it should be a CONNREQ.
> -	 */
> -	if (frametype != NR_CONNREQ) {
> -		/*
> -		 * Here it would be nice to be able to send a reset but
> -		 * NET/ROM doesn't have one.  We've tried to extend the protocol
> -		 * by sending NR_CONNACK | NR_CHOKE_FLAGS replies but that
> -		 * apparently kills BPQ boxes... :-(
> -		 * So now we try to follow the established behaviour of
> -		 * G8PZT's Xrouter which is sending packets with command type 7
> -		 * as an extension of the protocol.
> -		 */
> -		if (READ_ONCE(sysctl_netrom_reset_circuit) &&
> -		    (frametype != NR_RESET || flags != 0))
> -			nr_transmit_reset(skb, 1);
> -
> -		return 0;
> -	}
> -
> -	sk = nr_find_listener(dest);
> -
> -	user = (ax25_address *)(skb->data + 21);
> -
> -	if (sk == NULL || sk_acceptq_is_full(sk) ||
> -	    (make = nr_make_new(sk)) == NULL) {
> -		nr_transmit_refusal(skb, 0);
> -		if (sk)
> -			sock_put(sk);
> -		return 0;
> -	}
> -
> -	bh_lock_sock(sk);
> -
> -	window = skb->data[20];
> -
> -	sock_hold(make);
> -	skb->sk             = make;
> -	skb->destructor     = sock_efree;
> -	make->sk_state	    = TCP_ESTABLISHED;
> -
> -	/* Fill in his circuit details */
> -	nr_make = nr_sk(make);
> -	nr_make->source_addr = *dest;
> -	nr_make->dest_addr   = *src;
> -	nr_make->user_addr   = *user;
> -
> -	nr_make->your_index  = circuit_index;
> -	nr_make->your_id     = circuit_id;
> -
> -	bh_unlock_sock(sk);
> -	circuit = nr_find_next_circuit();
> -	bh_lock_sock(sk);
> -
> -	nr_make->my_index    = circuit / 256;
> -	nr_make->my_id       = circuit % 256;
> -
> -	circuit++;
> -
> -	/* Window negotiation */
> -	if (window < nr_make->window)
> -		nr_make->window = window;
> -
> -	/* L4 timeout negotiation */
> -	if (skb->len == 37) {
> -		timeout = skb->data[36] * 256 + skb->data[35];
> -		if (timeout * HZ < nr_make->t1)
> -			nr_make->t1 = timeout * HZ;
> -		nr_make->bpqext = 1;
> -	} else {
> -		nr_make->bpqext = 0;
> -	}
> -
> -	nr_write_internal(make, NR_CONNACK);
> -
> -	nr_make->condition = 0x00;
> -	nr_make->vs        = 0;
> -	nr_make->va        = 0;
> -	nr_make->vr        = 0;
> -	nr_make->vl        = 0;
> -	nr_make->state     = NR_STATE_3;
> -	sk_acceptq_added(sk);
> -	skb_queue_head(&sk->sk_receive_queue, skb);
> -
> -	if (!sock_flag(sk, SOCK_DEAD))
> -		sk->sk_data_ready(sk);
> -
> -	bh_unlock_sock(sk);
> -	sock_put(sk);
> -
> -	nr_insert_socket(make);
> -
> -	nr_start_heartbeat(make);
> -	nr_start_idletimer(make);
> -
> -	return 1;
> -}
> -
> -static int nr_sendmsg(struct socket *sock, struct msghdr *msg, size_t len)
> -{
> -	struct sock *sk = sock->sk;
> -	struct nr_sock *nr = nr_sk(sk);
> -	DECLARE_SOCKADDR(struct sockaddr_ax25 *, usax, msg->msg_name);
> -	int err;
> -	struct sockaddr_ax25 sax;
> -	struct sk_buff *skb;
> -	unsigned char *asmptr;
> -	int size;
> -
> -	if (msg->msg_flags & ~(MSG_DONTWAIT|MSG_EOR|MSG_CMSG_COMPAT))
> -		return -EINVAL;
> -
> -	lock_sock(sk);
> -	if (sock_flag(sk, SOCK_ZAPPED)) {
> -		err = -EADDRNOTAVAIL;
> -		goto out;
> -	}
> -
> -	if (sk->sk_shutdown & SEND_SHUTDOWN) {
> -		send_sig(SIGPIPE, current, 0);
> -		err = -EPIPE;
> -		goto out;
> -	}
> -
> -	if (nr->device == NULL) {
> -		err = -ENETUNREACH;
> -		goto out;
> -	}
> -
> -	if (usax) {
> -		if (msg->msg_namelen < sizeof(sax)) {
> -			err = -EINVAL;
> -			goto out;
> -		}
> -		sax = *usax;
> -		if (ax25cmp(&nr->dest_addr, &sax.sax25_call) != 0) {
> -			err = -EISCONN;
> -			goto out;
> -		}
> -		if (sax.sax25_family != AF_NETROM) {
> -			err = -EINVAL;
> -			goto out;
> -		}
> -	} else {
> -		if (sk->sk_state != TCP_ESTABLISHED) {
> -			err = -ENOTCONN;
> -			goto out;
> -		}
> -		sax.sax25_family = AF_NETROM;
> -		sax.sax25_call   = nr->dest_addr;
> -	}
> -
> -	/* Build a packet - the conventional user limit is 236 bytes. We can
> -	   do ludicrously large NetROM frames but must not overflow */
> -	if (len > 65536) {
> -		err = -EMSGSIZE;
> -		goto out;
> -	}
> -
> -	size = len + NR_NETWORK_LEN + NR_TRANSPORT_LEN;
> -
> -	if ((skb = sock_alloc_send_skb(sk, size, msg->msg_flags & MSG_DONTWAIT, &err)) == NULL)
> -		goto out;
> -
> -	skb_reserve(skb, size - len);
> -	skb_reset_transport_header(skb);
> -
> -	/*
> -	 *	Push down the NET/ROM header
> -	 */
> -
> -	asmptr = skb_push(skb, NR_TRANSPORT_LEN);
> -
> -	/* Build a NET/ROM Transport header */
> -
> -	*asmptr++ = nr->your_index;
> -	*asmptr++ = nr->your_id;
> -	*asmptr++ = 0;		/* To be filled in later */
> -	*asmptr++ = 0;		/*      Ditto            */
> -	*asmptr++ = NR_INFO;
> -
> -	/*
> -	 *	Put the data on the end
> -	 */
> -	skb_put(skb, len);
> -
> -	/* User data follows immediately after the NET/ROM transport header */
> -	if (memcpy_from_msg(skb_transport_header(skb), msg, len)) {
> -		kfree_skb(skb);
> -		err = -EFAULT;
> -		goto out;
> -	}
> -
> -	if (sk->sk_state != TCP_ESTABLISHED) {
> -		kfree_skb(skb);
> -		err = -ENOTCONN;
> -		goto out;
> -	}
> -
> -	nr_output(sk, skb);	/* Shove it onto the queue */
> -
> -	err = len;
> -out:
> -	release_sock(sk);
> -	return err;
> -}
> -
> -static int nr_recvmsg(struct socket *sock, struct msghdr *msg, size_t size,
> -		      int flags)
> -{
> -	struct sock *sk = sock->sk;
> -	DECLARE_SOCKADDR(struct sockaddr_ax25 *, sax, msg->msg_name);
> -	size_t copied;
> -	struct sk_buff *skb;
> -	int er;
> -
> -	/*
> -	 * This works for seqpacket too. The receiver has ordered the queue for
> -	 * us! We do one quick check first though
> -	 */
> -
> -	lock_sock(sk);
> -	if (sk->sk_state != TCP_ESTABLISHED) {
> -		release_sock(sk);
> -		return -ENOTCONN;
> -	}
> -
> -	/* Now we can treat all alike */
> -	skb = skb_recv_datagram(sk, flags, &er);
> -	if (!skb) {
> -		release_sock(sk);
> -		return er;
> -	}
> -
> -	skb_reset_transport_header(skb);
> -	copied     = skb->len;
> -
> -	if (copied > size) {
> -		copied = size;
> -		msg->msg_flags |= MSG_TRUNC;
> -	}
> -
> -	er = skb_copy_datagram_msg(skb, 0, msg, copied);
> -	if (er < 0) {
> -		skb_free_datagram(sk, skb);
> -		release_sock(sk);
> -		return er;
> -	}
> -
> -	if (sax != NULL) {
> -		memset(sax, 0, sizeof(*sax));
> -		sax->sax25_family = AF_NETROM;
> -		skb_copy_from_linear_data_offset(skb, 7, sax->sax25_call.ax25_call,
> -			      AX25_ADDR_LEN);
> -		msg->msg_namelen = sizeof(*sax);
> -	}
> -
> -	skb_free_datagram(sk, skb);
> -
> -	release_sock(sk);
> -	return copied;
> -}
> -
> -
> -static int nr_ioctl(struct socket *sock, unsigned int cmd, unsigned long arg)
> -{
> -	struct sock *sk = sock->sk;
> -	void __user *argp = (void __user *)arg;
> -
> -	switch (cmd) {
> -	case TIOCOUTQ: {
> -		long amount;
> -
> -		lock_sock(sk);
> -		amount = sk->sk_sndbuf - sk_wmem_alloc_get(sk);
> -		if (amount < 0)
> -			amount = 0;
> -		release_sock(sk);
> -		return put_user(amount, (int __user *)argp);
> -	}
> -
> -	case TIOCINQ: {
> -		struct sk_buff *skb;
> -		long amount = 0L;
> -
> -		lock_sock(sk);
> -		/* These two are safe on a single CPU system as only user tasks fiddle here */
> -		if ((skb = skb_peek(&sk->sk_receive_queue)) != NULL)
> -			amount = skb->len;
> -		release_sock(sk);
> -		return put_user(amount, (int __user *)argp);
> -	}
> -
> -	case SIOCGIFADDR:
> -	case SIOCSIFADDR:
> -	case SIOCGIFDSTADDR:
> -	case SIOCSIFDSTADDR:
> -	case SIOCGIFBRDADDR:
> -	case SIOCSIFBRDADDR:
> -	case SIOCGIFNETMASK:
> -	case SIOCSIFNETMASK:
> -	case SIOCGIFMETRIC:
> -	case SIOCSIFMETRIC:
> -		return -EINVAL;
> -
> -	case SIOCADDRT:
> -	case SIOCDELRT:
> -	case SIOCNRDECOBS:
> -		if (!capable(CAP_NET_ADMIN))
> -			return -EPERM;
> -		return nr_rt_ioctl(cmd, argp);
> -
> -	default:
> -		return -ENOIOCTLCMD;
> -	}
> -
> -	return 0;
> -}
> -
> -#ifdef CONFIG_PROC_FS
> -
> -static void *nr_info_start(struct seq_file *seq, loff_t *pos)
> -	__acquires(&nr_list_lock)
> -{
> -	spin_lock_bh(&nr_list_lock);
> -	return seq_hlist_start_head(&nr_list, *pos);
> -}
> -
> -static void *nr_info_next(struct seq_file *seq, void *v, loff_t *pos)
> -{
> -	return seq_hlist_next(v, &nr_list, pos);
> -}
> -
> -static void nr_info_stop(struct seq_file *seq, void *v)
> -	__releases(&nr_list_lock)
> -{
> -	spin_unlock_bh(&nr_list_lock);
> -}
> -
> -static int nr_info_show(struct seq_file *seq, void *v)
> -{
> -	struct sock *s = sk_entry(v);
> -	struct net_device *dev;
> -	struct nr_sock *nr;
> -	const char *devname;
> -	char buf[11];
> -
> -	if (v == SEQ_START_TOKEN)
> -		seq_puts(seq,
> -"user_addr dest_node src_node  dev    my  your  st  vs  vr  va    t1     t2     t4      idle   n2  wnd Snd-Q Rcv-Q inode\n");
> -
> -	else {
> -
> -		bh_lock_sock(s);
> -		nr = nr_sk(s);
> -
> -		if ((dev = nr->device) == NULL)
> -			devname = "???";
> -		else
> -			devname = dev->name;
> -
> -		seq_printf(seq, "%-9s ", ax2asc(buf, &nr->user_addr));
> -		seq_printf(seq, "%-9s ", ax2asc(buf, &nr->dest_addr));
> -		seq_printf(seq,
> -"%-9s %-3s  %02X/%02X %02X/%02X %2d %3d %3d %3d %3lu/%03lu %2lu/%02lu %3lu/%03lu %3lu/%03lu %2d/%02d %3d %5d %5d %llu\n",
> -			ax2asc(buf, &nr->source_addr),
> -			devname,
> -			nr->my_index,
> -			nr->my_id,
> -			nr->your_index,
> -			nr->your_id,
> -			nr->state,
> -			nr->vs,
> -			nr->vr,
> -			nr->va,
> -			ax25_display_timer(&nr->t1timer) / HZ,
> -			nr->t1 / HZ,
> -			ax25_display_timer(&nr->t2timer) / HZ,
> -			nr->t2 / HZ,
> -			ax25_display_timer(&nr->t4timer) / HZ,
> -			nr->t4 / HZ,
> -			ax25_display_timer(&nr->idletimer) / (60 * HZ),
> -			nr->idle / (60 * HZ),
> -			nr->n2count,
> -			nr->n2,
> -			nr->window,
> -			sk_wmem_alloc_get(s),
> -			sk_rmem_alloc_get(s),
> -			s->sk_socket ? SOCK_INODE(s->sk_socket)->i_ino : (u64)0);
> -
> -		bh_unlock_sock(s);
> -	}
> -	return 0;
> -}
> -
> -static const struct seq_operations nr_info_seqops = {
> -	.start = nr_info_start,
> -	.next = nr_info_next,
> -	.stop = nr_info_stop,
> -	.show = nr_info_show,
> -};
> -#endif	/* CONFIG_PROC_FS */
> -
> -static const struct net_proto_family nr_family_ops = {
> -	.family		=	PF_NETROM,
> -	.create		=	nr_create,
> -	.owner		=	THIS_MODULE,
> -};
> -
> -static const struct proto_ops nr_proto_ops = {
> -	.family		=	PF_NETROM,
> -	.owner		=	THIS_MODULE,
> -	.release	=	nr_release,
> -	.bind		=	nr_bind,
> -	.connect	=	nr_connect,
> -	.socketpair	=	sock_no_socketpair,
> -	.accept		=	nr_accept,
> -	.getname	=	nr_getname,
> -	.poll		=	datagram_poll,
> -	.ioctl		=	nr_ioctl,
> -	.gettstamp	=	sock_gettstamp,
> -	.listen		=	nr_listen,
> -	.shutdown	=	sock_no_shutdown,
> -	.setsockopt	=	nr_setsockopt,
> -	.getsockopt	=	nr_getsockopt,
> -	.sendmsg	=	nr_sendmsg,
> -	.recvmsg	=	nr_recvmsg,
> -	.mmap		=	sock_no_mmap,
> -};
> -
> -static struct notifier_block nr_dev_notifier = {
> -	.notifier_call	=	nr_device_event,
> -};
> -
> -static struct net_device **dev_nr;
> -
> -static struct ax25_protocol nr_pid = {
> -	.pid	= AX25_P_NETROM,
> -	.func	= nr_route_frame
> -};
> -
> -static struct ax25_linkfail nr_linkfail_notifier = {
> -	.func	= nr_link_failed,
> -};
> -
> -static int __init nr_proto_init(void)
> -{
> -	int i;
> -	int rc = proto_register(&nr_proto, 0);
> -
> -	if (rc)
> -		return rc;
> -
> -	if (nr_ndevs > 0x7fffffff/sizeof(struct net_device *)) {
> -		pr_err("NET/ROM: %s - nr_ndevs parameter too large\n",
> -		       __func__);
> -		rc = -EINVAL;
> -		goto unregister_proto;
> -	}
> -
> -	dev_nr = kzalloc_objs(struct net_device *, nr_ndevs);
> -	if (!dev_nr) {
> -		pr_err("NET/ROM: %s - unable to allocate device array\n",
> -		       __func__);
> -		rc = -ENOMEM;
> -		goto unregister_proto;
> -	}
> -
> -	for (i = 0; i < nr_ndevs; i++) {
> -		char name[IFNAMSIZ];
> -		struct net_device *dev;
> -
> -		sprintf(name, "nr%d", i);
> -		dev = alloc_netdev(0, name, NET_NAME_UNKNOWN, nr_setup);
> -		if (!dev) {
> -			rc = -ENOMEM;
> -			goto fail;
> -		}
> -
> -		dev->base_addr = i;
> -		rc = register_netdev(dev);
> -		if (rc) {
> -			free_netdev(dev);
> -			goto fail;
> -		}
> -		nr_set_lockdep_key(dev);
> -		dev_nr[i] = dev;
> -	}
> -
> -	rc = sock_register(&nr_family_ops);
> -	if (rc)
> -		goto fail;
> -
> -	rc = register_netdevice_notifier(&nr_dev_notifier);
> -	if (rc)
> -		goto out_sock;
> -
> -	ax25_register_pid(&nr_pid);
> -	ax25_linkfail_register(&nr_linkfail_notifier);
> -
> -#ifdef CONFIG_SYSCTL
> -	rc = nr_register_sysctl();
> -	if (rc)
> -		goto out_sysctl;
> -#endif
> -
> -	nr_loopback_init();
> -
> -	rc = -ENOMEM;
> -	if (!proc_create_seq("nr", 0444, init_net.proc_net, &nr_info_seqops))
> -		goto proc_remove1;
> -	if (!proc_create_seq("nr_neigh", 0444, init_net.proc_net,
> -			     &nr_neigh_seqops))
> -		goto proc_remove2;
> -	if (!proc_create_seq("nr_nodes", 0444, init_net.proc_net,
> -			     &nr_node_seqops))
> -		goto proc_remove3;
> -
> -	return 0;
> -
> -proc_remove3:
> -	remove_proc_entry("nr_neigh", init_net.proc_net);
> -proc_remove2:
> -	remove_proc_entry("nr", init_net.proc_net);
> -proc_remove1:
> -
> -	nr_loopback_clear();
> -	nr_rt_free();
> -
> -#ifdef CONFIG_SYSCTL
> -	nr_unregister_sysctl();
> -out_sysctl:
> -#endif
> -	ax25_linkfail_release(&nr_linkfail_notifier);
> -	ax25_protocol_release(AX25_P_NETROM);
> -	unregister_netdevice_notifier(&nr_dev_notifier);
> -out_sock:
> -	sock_unregister(PF_NETROM);
> -fail:
> -	while (--i >= 0) {
> -		unregister_netdev(dev_nr[i]);
> -		free_netdev(dev_nr[i]);
> -	}
> -	kfree(dev_nr);
> -unregister_proto:
> -	proto_unregister(&nr_proto);
> -	return rc;
> -}
> -
> -module_init(nr_proto_init);
> -
> -module_param(nr_ndevs, int, 0);
> -MODULE_PARM_DESC(nr_ndevs, "number of NET/ROM devices");
> -
> -MODULE_AUTHOR("Jonathan Naylor G4KLX <g4klx@g4klx.demon.co.uk>");
> -MODULE_DESCRIPTION("The amateur radio NET/ROM network and transport layer protocol");
> -MODULE_LICENSE("GPL");
> -MODULE_ALIAS_NETPROTO(PF_NETROM);
> -
> -static void __exit nr_exit(void)
> -{
> -	int i;
> -
> -	remove_proc_entry("nr", init_net.proc_net);
> -	remove_proc_entry("nr_neigh", init_net.proc_net);
> -	remove_proc_entry("nr_nodes", init_net.proc_net);
> -	nr_loopback_clear();
> -
> -	nr_rt_free();
> -
> -#ifdef CONFIG_SYSCTL
> -	nr_unregister_sysctl();
> -#endif
> -
> -	ax25_linkfail_release(&nr_linkfail_notifier);
> -	ax25_protocol_release(AX25_P_NETROM);
> -
> -	unregister_netdevice_notifier(&nr_dev_notifier);
> -
> -	sock_unregister(PF_NETROM);
> -
> -	for (i = 0; i < nr_ndevs; i++) {
> -		struct net_device *dev = dev_nr[i];
> -		if (dev) {
> -			unregister_netdev(dev);
> -			free_netdev(dev);
> -		}
> -	}
> -
> -	kfree(dev_nr);
> -	proto_unregister(&nr_proto);
> -}
> -module_exit(nr_exit);
> diff --git a/net/netrom/nr_dev.c b/net/netrom/nr_dev.c
> deleted file mode 100644
> index 2c34389c3ce6..000000000000
> --- a/net/netrom/nr_dev.c
> +++ /dev/null
> @@ -1,178 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-or-later
> -/*
> - *
> - * Copyright Jonathan Naylor G4KLX (g4klx@g4klx.demon.co.uk)
> - */
> -#include <linux/module.h>
> -#include <linux/proc_fs.h>
> -#include <linux/kernel.h>
> -#include <linux/interrupt.h>
> -#include <linux/fs.h>
> -#include <linux/types.h>
> -#include <linux/sysctl.h>
> -#include <linux/string.h>
> -#include <linux/socket.h>
> -#include <linux/errno.h>
> -#include <linux/fcntl.h>
> -#include <linux/in.h>
> -#include <linux/if_ether.h>	/* For the statistics structure. */
> -#include <linux/slab.h>
> -#include <linux/uaccess.h>
> -
> -#include <asm/io.h>
> -
> -#include <linux/inet.h>
> -#include <linux/netdevice.h>
> -#include <linux/etherdevice.h>
> -#include <linux/if_arp.h>
> -#include <linux/skbuff.h>
> -
> -#include <net/ip.h>
> -#include <net/arp.h>
> -
> -#include <net/ax25.h>
> -#include <net/netrom.h>
> -
> -/*
> - *	Only allow IP over NET/ROM frames through if the netrom device is up.
> - */
> -
> -int nr_rx_ip(struct sk_buff *skb, struct net_device *dev)
> -{
> -	struct net_device_stats *stats = &dev->stats;
> -
> -	if (!netif_running(dev)) {
> -		stats->rx_dropped++;
> -		return 0;
> -	}
> -
> -	stats->rx_packets++;
> -	stats->rx_bytes += skb->len;
> -
> -	skb->protocol = htons(ETH_P_IP);
> -
> -	/* Spoof incoming device */
> -	skb->dev      = dev;
> -	skb->mac_header = skb->network_header;
> -	skb_reset_network_header(skb);
> -	skb->pkt_type = PACKET_HOST;
> -
> -	netif_rx(skb);
> -
> -	return 1;
> -}
> -
> -static int nr_header(struct sk_buff *skb, struct net_device *dev,
> -		     unsigned short type,
> -		     const void *daddr, const void *saddr, unsigned int len)
> -{
> -	unsigned char *buff = skb_push(skb, NR_NETWORK_LEN + NR_TRANSPORT_LEN);
> -
> -	memcpy(buff, (saddr != NULL) ? saddr : dev->dev_addr, dev->addr_len);
> -	buff[6] &= ~AX25_CBIT;
> -	buff[6] &= ~AX25_EBIT;
> -	buff[6] |= AX25_SSSID_SPARE;
> -	buff    += AX25_ADDR_LEN;
> -
> -	if (daddr != NULL)
> -		memcpy(buff, daddr, dev->addr_len);
> -	buff[6] &= ~AX25_CBIT;
> -	buff[6] |= AX25_EBIT;
> -	buff[6] |= AX25_SSSID_SPARE;
> -	buff    += AX25_ADDR_LEN;
> -
> -	*buff++ = READ_ONCE(sysctl_netrom_network_ttl_initialiser);
> -
> -	*buff++ = NR_PROTO_IP;
> -	*buff++ = NR_PROTO_IP;
> -	*buff++ = 0;
> -	*buff++ = 0;
> -	*buff++ = NR_PROTOEXT;
> -
> -	if (daddr != NULL)
> -		return 37;
> -
> -	return -37;
> -}
> -
> -static int __must_check nr_set_mac_address(struct net_device *dev, void *addr)
> -{
> -	struct sockaddr *sa = addr;
> -	int err;
> -
> -	if (!memcmp(dev->dev_addr, sa->sa_data, dev->addr_len))
> -		return 0;
> -
> -	if (dev->flags & IFF_UP) {
> -		err = ax25_listen_register((ax25_address *)sa->sa_data, NULL);
> -		if (err)
> -			return err;
> -
> -		ax25_listen_release((const ax25_address *)dev->dev_addr, NULL);
> -	}
> -
> -	dev_addr_set(dev, sa->sa_data);
> -
> -	return 0;
> -}
> -
> -static int nr_open(struct net_device *dev)
> -{
> -	int err;
> -
> -	err = ax25_listen_register((const ax25_address *)dev->dev_addr, NULL);
> -	if (err)
> -		return err;
> -
> -	netif_start_queue(dev);
> -
> -	return 0;
> -}
> -
> -static int nr_close(struct net_device *dev)
> -{
> -	ax25_listen_release((const ax25_address *)dev->dev_addr, NULL);
> -	netif_stop_queue(dev);
> -	return 0;
> -}
> -
> -static netdev_tx_t nr_xmit(struct sk_buff *skb, struct net_device *dev)
> -{
> -	struct net_device_stats *stats = &dev->stats;
> -	unsigned int len = skb->len;
> -
> -	if (!nr_route_frame(skb, NULL)) {
> -		kfree_skb(skb);
> -		stats->tx_errors++;
> -		return NETDEV_TX_OK;
> -	}
> -
> -	stats->tx_packets++;
> -	stats->tx_bytes += len;
> -
> -	return NETDEV_TX_OK;
> -}
> -
> -static const struct header_ops nr_header_ops = {
> -	.create	= nr_header,
> -};
> -
> -static const struct net_device_ops nr_netdev_ops = {
> -	.ndo_open		= nr_open,
> -	.ndo_stop		= nr_close,
> -	.ndo_start_xmit		= nr_xmit,
> -	.ndo_set_mac_address    = nr_set_mac_address,
> -};
> -
> -void nr_setup(struct net_device *dev)
> -{
> -	dev->mtu		= NR_MAX_PACKET_SIZE;
> -	dev->netdev_ops		= &nr_netdev_ops;
> -	dev->header_ops		= &nr_header_ops;
> -	dev->hard_header_len	= NR_NETWORK_LEN + NR_TRANSPORT_LEN;
> -	dev->addr_len		= AX25_ADDR_LEN;
> -	dev->type		= ARPHRD_NETROM;
> -
> -	/* New-style flags. */
> -	dev->flags		= IFF_NOARP;
> -}
> diff --git a/net/netrom/nr_in.c b/net/netrom/nr_in.c
> deleted file mode 100644
> index 97944db6b5ac..000000000000
> --- a/net/netrom/nr_in.c
> +++ /dev/null
> @@ -1,301 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-or-later
> -/*
> - *
> - * Copyright Jonathan Naylor G4KLX (g4klx@g4klx.demon.co.uk)
> - * Copyright Darryl Miles G7LED (dlm@g7led.demon.co.uk)
> - */
> -#include <linux/errno.h>
> -#include <linux/types.h>
> -#include <linux/socket.h>
> -#include <linux/in.h>
> -#include <linux/kernel.h>
> -#include <linux/timer.h>
> -#include <linux/string.h>
> -#include <linux/sockios.h>
> -#include <linux/net.h>
> -#include <linux/slab.h>
> -#include <net/ax25.h>
> -#include <linux/inet.h>
> -#include <linux/netdevice.h>
> -#include <linux/skbuff.h>
> -#include <net/sock.h>
> -#include <net/tcp_states.h>
> -#include <linux/uaccess.h>
> -#include <linux/fcntl.h>
> -#include <linux/mm.h>
> -#include <linux/interrupt.h>
> -#include <net/netrom.h>
> -
> -static int nr_queue_rx_frame(struct sock *sk, struct sk_buff *skb, int more)
> -{
> -	struct sk_buff *skbo, *skbn = skb;
> -	struct nr_sock *nr = nr_sk(sk);
> -
> -	skb_pull(skb, NR_NETWORK_LEN + NR_TRANSPORT_LEN);
> -
> -	nr_start_idletimer(sk);
> -
> -	if (more) {
> -		nr->fraglen += skb->len;
> -		skb_queue_tail(&nr->frag_queue, skb);
> -		return 0;
> -	}
> -
> -	if (!more && nr->fraglen > 0) {	/* End of fragment */
> -		nr->fraglen += skb->len;
> -		skb_queue_tail(&nr->frag_queue, skb);
> -
> -		if ((skbn = alloc_skb(nr->fraglen, GFP_ATOMIC)) == NULL)
> -			return 1;
> -
> -		skb_reset_transport_header(skbn);
> -
> -		while ((skbo = skb_dequeue(&nr->frag_queue)) != NULL) {
> -			skb_copy_from_linear_data(skbo,
> -						  skb_put(skbn, skbo->len),
> -						  skbo->len);
> -			kfree_skb(skbo);
> -		}
> -
> -		nr->fraglen = 0;
> -	}
> -
> -	return sock_queue_rcv_skb(sk, skbn);
> -}
> -
> -/*
> - * State machine for state 1, Awaiting Connection State.
> - * The handling of the timer(s) is in file nr_timer.c.
> - * Handling of state 0 and connection release is in netrom.c.
> - */
> -static int nr_state1_machine(struct sock *sk, struct sk_buff *skb,
> -	int frametype)
> -{
> -	switch (frametype) {
> -	case NR_CONNACK: {
> -		struct nr_sock *nr = nr_sk(sk);
> -
> -		nr_stop_t1timer(sk);
> -		nr_start_idletimer(sk);
> -		nr->your_index = skb->data[17];
> -		nr->your_id    = skb->data[18];
> -		nr->vs	       = 0;
> -		nr->va	       = 0;
> -		nr->vr	       = 0;
> -		nr->vl	       = 0;
> -		nr->state      = NR_STATE_3;
> -		nr->n2count    = 0;
> -		nr->window     = skb->data[20];
> -		sk->sk_state   = TCP_ESTABLISHED;
> -		if (!sock_flag(sk, SOCK_DEAD))
> -			sk->sk_state_change(sk);
> -		break;
> -	}
> -
> -	case NR_CONNACK | NR_CHOKE_FLAG:
> -		nr_disconnect(sk, ECONNREFUSED);
> -		break;
> -
> -	case NR_RESET:
> -		if (READ_ONCE(sysctl_netrom_reset_circuit))
> -			nr_disconnect(sk, ECONNRESET);
> -		break;
> -
> -	default:
> -		break;
> -	}
> -	return 0;
> -}
> -
> -/*
> - * State machine for state 2, Awaiting Release State.
> - * The handling of the timer(s) is in file nr_timer.c
> - * Handling of state 0 and connection release is in netrom.c.
> - */
> -static int nr_state2_machine(struct sock *sk, struct sk_buff *skb,
> -	int frametype)
> -{
> -	switch (frametype) {
> -	case NR_CONNACK | NR_CHOKE_FLAG:
> -		nr_disconnect(sk, ECONNRESET);
> -		break;
> -
> -	case NR_DISCREQ:
> -		nr_write_internal(sk, NR_DISCACK);
> -		fallthrough;
> -	case NR_DISCACK:
> -		nr_disconnect(sk, 0);
> -		break;
> -
> -	case NR_RESET:
> -		if (READ_ONCE(sysctl_netrom_reset_circuit))
> -			nr_disconnect(sk, ECONNRESET);
> -		break;
> -
> -	default:
> -		break;
> -	}
> -	return 0;
> -}
> -
> -/*
> - * State machine for state 3, Connected State.
> - * The handling of the timer(s) is in file nr_timer.c
> - * Handling of state 0 and connection release is in netrom.c.
> - */
> -static int nr_state3_machine(struct sock *sk, struct sk_buff *skb, int frametype)
> -{
> -	struct nr_sock *nrom = nr_sk(sk);
> -	struct sk_buff_head temp_queue;
> -	struct sk_buff *skbn;
> -	unsigned short save_vr;
> -	unsigned short nr, ns;
> -	int queued = 0;
> -
> -	nr = skb->data[18];
> -
> -	switch (frametype) {
> -	case NR_CONNREQ:
> -		nr_write_internal(sk, NR_CONNACK);
> -		break;
> -
> -	case NR_DISCREQ:
> -		nr_write_internal(sk, NR_DISCACK);
> -		nr_disconnect(sk, 0);
> -		break;
> -
> -	case NR_CONNACK | NR_CHOKE_FLAG:
> -	case NR_DISCACK:
> -		nr_disconnect(sk, ECONNRESET);
> -		break;
> -
> -	case NR_INFOACK:
> -	case NR_INFOACK | NR_CHOKE_FLAG:
> -	case NR_INFOACK | NR_NAK_FLAG:
> -	case NR_INFOACK | NR_NAK_FLAG | NR_CHOKE_FLAG:
> -		if (frametype & NR_CHOKE_FLAG) {
> -			nrom->condition |= NR_COND_PEER_RX_BUSY;
> -			nr_start_t4timer(sk);
> -		} else {
> -			nrom->condition &= ~NR_COND_PEER_RX_BUSY;
> -			nr_stop_t4timer(sk);
> -		}
> -		if (!nr_validate_nr(sk, nr)) {
> -			break;
> -		}
> -		if (frametype & NR_NAK_FLAG) {
> -			nr_frames_acked(sk, nr);
> -			nr_send_nak_frame(sk);
> -		} else {
> -			if (nrom->condition & NR_COND_PEER_RX_BUSY) {
> -				nr_frames_acked(sk, nr);
> -			} else {
> -				nr_check_iframes_acked(sk, nr);
> -			}
> -		}
> -		break;
> -
> -	case NR_INFO:
> -	case NR_INFO | NR_NAK_FLAG:
> -	case NR_INFO | NR_CHOKE_FLAG:
> -	case NR_INFO | NR_MORE_FLAG:
> -	case NR_INFO | NR_NAK_FLAG | NR_CHOKE_FLAG:
> -	case NR_INFO | NR_CHOKE_FLAG | NR_MORE_FLAG:
> -	case NR_INFO | NR_NAK_FLAG | NR_MORE_FLAG:
> -	case NR_INFO | NR_NAK_FLAG | NR_CHOKE_FLAG | NR_MORE_FLAG:
> -		if (frametype & NR_CHOKE_FLAG) {
> -			nrom->condition |= NR_COND_PEER_RX_BUSY;
> -			nr_start_t4timer(sk);
> -		} else {
> -			nrom->condition &= ~NR_COND_PEER_RX_BUSY;
> -			nr_stop_t4timer(sk);
> -		}
> -		if (nr_validate_nr(sk, nr)) {
> -			if (frametype & NR_NAK_FLAG) {
> -				nr_frames_acked(sk, nr);
> -				nr_send_nak_frame(sk);
> -			} else {
> -				if (nrom->condition & NR_COND_PEER_RX_BUSY) {
> -					nr_frames_acked(sk, nr);
> -				} else {
> -					nr_check_iframes_acked(sk, nr);
> -				}
> -			}
> -		}
> -		queued = 1;
> -		skb_queue_head(&nrom->reseq_queue, skb);
> -		if (nrom->condition & NR_COND_OWN_RX_BUSY)
> -			break;
> -		skb_queue_head_init(&temp_queue);
> -		do {
> -			save_vr = nrom->vr;
> -			while ((skbn = skb_dequeue(&nrom->reseq_queue)) != NULL) {
> -				ns = skbn->data[17];
> -				if (ns == nrom->vr) {
> -					if (nr_queue_rx_frame(sk, skbn, frametype & NR_MORE_FLAG) == 0) {
> -						nrom->vr = (nrom->vr + 1) % NR_MODULUS;
> -					} else {
> -						nrom->condition |= NR_COND_OWN_RX_BUSY;
> -						skb_queue_tail(&temp_queue, skbn);
> -					}
> -				} else if (nr_in_rx_window(sk, ns)) {
> -					skb_queue_tail(&temp_queue, skbn);
> -				} else {
> -					kfree_skb(skbn);
> -				}
> -			}
> -			while ((skbn = skb_dequeue(&temp_queue)) != NULL) {
> -				skb_queue_tail(&nrom->reseq_queue, skbn);
> -			}
> -		} while (save_vr != nrom->vr);
> -		/*
> -		 * Window is full, ack it immediately.
> -		 */
> -		if (((nrom->vl + nrom->window) % NR_MODULUS) == nrom->vr) {
> -			nr_enquiry_response(sk);
> -		} else {
> -			if (!(nrom->condition & NR_COND_ACK_PENDING)) {
> -				nrom->condition |= NR_COND_ACK_PENDING;
> -				nr_start_t2timer(sk);
> -			}
> -		}
> -		break;
> -
> -	case NR_RESET:
> -		if (READ_ONCE(sysctl_netrom_reset_circuit))
> -			nr_disconnect(sk, ECONNRESET);
> -		break;
> -
> -	default:
> -		break;
> -	}
> -	return queued;
> -}
> -
> -/* Higher level upcall for a LAPB frame - called with sk locked */
> -int nr_process_rx_frame(struct sock *sk, struct sk_buff *skb)
> -{
> -	struct nr_sock *nr = nr_sk(sk);
> -	int queued = 0, frametype;
> -
> -	if (nr->state == NR_STATE_0)
> -		return 0;
> -
> -	frametype = skb->data[19];
> -
> -	switch (nr->state) {
> -	case NR_STATE_1:
> -		queued = nr_state1_machine(sk, skb, frametype);
> -		break;
> -	case NR_STATE_2:
> -		queued = nr_state2_machine(sk, skb, frametype);
> -		break;
> -	case NR_STATE_3:
> -		queued = nr_state3_machine(sk, skb, frametype);
> -		break;
> -	}
> -
> -	nr_kick(sk);
> -
> -	return queued;
> -}
> diff --git a/net/netrom/nr_loopback.c b/net/netrom/nr_loopback.c
> deleted file mode 100644
> index 7a9d765b30c0..000000000000
> --- a/net/netrom/nr_loopback.c
> +++ /dev/null
> @@ -1,73 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-or-later
> -/*
> - *
> - * Copyright Tomi Manninen OH2BNS (oh2bns@sral.fi)
> - */
> -#include <linux/types.h>
> -#include <linux/slab.h>
> -#include <linux/socket.h>
> -#include <linux/timer.h>
> -#include <net/ax25.h>
> -#include <linux/skbuff.h>
> -#include <net/netrom.h>
> -#include <linux/init.h>
> -
> -static void nr_loopback_timer(struct timer_list *);
> -
> -static struct sk_buff_head loopback_queue;
> -static DEFINE_TIMER(loopback_timer, nr_loopback_timer);
> -
> -void __init nr_loopback_init(void)
> -{
> -	skb_queue_head_init(&loopback_queue);
> -}
> -
> -static inline int nr_loopback_running(void)
> -{
> -	return timer_pending(&loopback_timer);
> -}
> -
> -int nr_loopback_queue(struct sk_buff *skb)
> -{
> -	struct sk_buff *skbn;
> -
> -	if ((skbn = alloc_skb(skb->len, GFP_ATOMIC)) != NULL) {
> -		skb_copy_from_linear_data(skb, skb_put(skbn, skb->len), skb->len);
> -		skb_reset_transport_header(skbn);
> -
> -		skb_queue_tail(&loopback_queue, skbn);
> -
> -		if (!nr_loopback_running())
> -			mod_timer(&loopback_timer, jiffies + 10);
> -	}
> -
> -	kfree_skb(skb);
> -	return 1;
> -}
> -
> -static void nr_loopback_timer(struct timer_list *unused)
> -{
> -	struct sk_buff *skb;
> -	ax25_address *nr_dest;
> -	struct net_device *dev;
> -
> -	if ((skb = skb_dequeue(&loopback_queue)) != NULL) {
> -		nr_dest = (ax25_address *)(skb->data + 7);
> -
> -		dev = nr_dev_get(nr_dest);
> -
> -		if (dev == NULL || nr_rx_frame(skb, dev) == 0)
> -			kfree_skb(skb);
> -
> -		dev_put(dev);
> -
> -		if (!skb_queue_empty(&loopback_queue) && !nr_loopback_running())
> -			mod_timer(&loopback_timer, jiffies + 10);
> -	}
> -}
> -
> -void nr_loopback_clear(void)
> -{
> -	timer_delete_sync(&loopback_timer);
> -	skb_queue_purge(&loopback_queue);
> -}
> diff --git a/net/netrom/nr_out.c b/net/netrom/nr_out.c
> deleted file mode 100644
> index 2b3cbceb0b52..000000000000
> --- a/net/netrom/nr_out.c
> +++ /dev/null
> @@ -1,272 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-or-later
> -/*
> - *
> - * Copyright Jonathan Naylor G4KLX (g4klx@g4klx.demon.co.uk)
> - * Copyright Darryl Miles G7LED (dlm@g7led.demon.co.uk)
> - */
> -#include <linux/errno.h>
> -#include <linux/types.h>
> -#include <linux/socket.h>
> -#include <linux/in.h>
> -#include <linux/kernel.h>
> -#include <linux/timer.h>
> -#include <linux/string.h>
> -#include <linux/sockios.h>
> -#include <linux/net.h>
> -#include <linux/slab.h>
> -#include <net/ax25.h>
> -#include <linux/inet.h>
> -#include <linux/netdevice.h>
> -#include <linux/skbuff.h>
> -#include <net/sock.h>
> -#include <linux/uaccess.h>
> -#include <linux/fcntl.h>
> -#include <linux/mm.h>
> -#include <linux/interrupt.h>
> -#include <net/netrom.h>
> -
> -/*
> - *	This is where all NET/ROM frames pass, except for IP-over-NET/ROM which
> - *	cannot be fragmented in this manner.
> - */
> -void nr_output(struct sock *sk, struct sk_buff *skb)
> -{
> -	struct sk_buff *skbn;
> -	unsigned char transport[NR_TRANSPORT_LEN];
> -	int err, frontlen, len;
> -
> -	if (skb->len - NR_TRANSPORT_LEN > NR_MAX_PACKET_SIZE) {
> -		/* Save a copy of the Transport Header */
> -		skb_copy_from_linear_data(skb, transport, NR_TRANSPORT_LEN);
> -		skb_pull(skb, NR_TRANSPORT_LEN);
> -
> -		frontlen = skb_headroom(skb);
> -
> -		while (skb->len > 0) {
> -			if ((skbn = sock_alloc_send_skb(sk, frontlen + NR_MAX_PACKET_SIZE, 0, &err)) == NULL) {
> -				kfree_skb(skb);
> -				return;
> -			}
> -
> -			skb_reserve(skbn, frontlen);
> -
> -			len = (NR_MAX_PACKET_SIZE > skb->len) ? skb->len : NR_MAX_PACKET_SIZE;
> -
> -			/* Copy the user data */
> -			skb_copy_from_linear_data(skb, skb_put(skbn, len), len);
> -			skb_pull(skb, len);
> -
> -			/* Duplicate the Transport Header */
> -			skb_push(skbn, NR_TRANSPORT_LEN);
> -			skb_copy_to_linear_data(skbn, transport,
> -						NR_TRANSPORT_LEN);
> -			if (skb->len > 0)
> -				skbn->data[4] |= NR_MORE_FLAG;
> -
> -			skb_queue_tail(&sk->sk_write_queue, skbn); /* Throw it on the queue */
> -		}
> -
> -		kfree_skb(skb);
> -	} else {
> -		skb_queue_tail(&sk->sk_write_queue, skb);		/* Throw it on the queue */
> -	}
> -
> -	nr_kick(sk);
> -}
> -
> -/*
> - *	This procedure is passed a buffer descriptor for an iframe. It builds
> - *	the rest of the control part of the frame and then writes it out.
> - */
> -static void nr_send_iframe(struct sock *sk, struct sk_buff *skb)
> -{
> -	struct nr_sock *nr = nr_sk(sk);
> -
> -	if (skb == NULL)
> -		return;
> -
> -	skb->data[2] = nr->vs;
> -	skb->data[3] = nr->vr;
> -
> -	if (nr->condition & NR_COND_OWN_RX_BUSY)
> -		skb->data[4] |= NR_CHOKE_FLAG;
> -
> -	nr_start_idletimer(sk);
> -
> -	nr_transmit_buffer(sk, skb);
> -}
> -
> -void nr_send_nak_frame(struct sock *sk)
> -{
> -	struct sk_buff *skb, *skbn;
> -	struct nr_sock *nr = nr_sk(sk);
> -
> -	if ((skb = skb_peek(&nr->ack_queue)) == NULL)
> -		return;
> -
> -	if ((skbn = skb_clone(skb, GFP_ATOMIC)) == NULL)
> -		return;
> -
> -	skbn->data[2] = nr->va;
> -	skbn->data[3] = nr->vr;
> -
> -	if (nr->condition & NR_COND_OWN_RX_BUSY)
> -		skbn->data[4] |= NR_CHOKE_FLAG;
> -
> -	nr_transmit_buffer(sk, skbn);
> -
> -	nr->condition &= ~NR_COND_ACK_PENDING;
> -	nr->vl         = nr->vr;
> -
> -	nr_stop_t1timer(sk);
> -}
> -
> -void nr_kick(struct sock *sk)
> -{
> -	struct nr_sock *nr = nr_sk(sk);
> -	struct sk_buff *skb, *skbn;
> -	unsigned short start, end;
> -
> -	if (nr->state != NR_STATE_3)
> -		return;
> -
> -	if (nr->condition & NR_COND_PEER_RX_BUSY)
> -		return;
> -
> -	if (!skb_peek(&sk->sk_write_queue))
> -		return;
> -
> -	start = (skb_peek(&nr->ack_queue) == NULL) ? nr->va : nr->vs;
> -	end   = (nr->va + nr->window) % NR_MODULUS;
> -
> -	if (start == end)
> -		return;
> -
> -	nr->vs = start;
> -
> -	/*
> -	 * Transmit data until either we're out of data to send or
> -	 * the window is full.
> -	 */
> -
> -	/*
> -	 * Dequeue the frame and copy it.
> -	 */
> -	skb = skb_dequeue(&sk->sk_write_queue);
> -
> -	do {
> -		if ((skbn = skb_clone(skb, GFP_ATOMIC)) == NULL) {
> -			skb_queue_head(&sk->sk_write_queue, skb);
> -			break;
> -		}
> -
> -		skb_set_owner_w(skbn, sk);
> -
> -		/*
> -		 * Transmit the frame copy.
> -		 */
> -		nr_send_iframe(sk, skbn);
> -
> -		nr->vs = (nr->vs + 1) % NR_MODULUS;
> -
> -		/*
> -		 * Requeue the original data frame.
> -		 */
> -		skb_queue_tail(&nr->ack_queue, skb);
> -
> -	} while (nr->vs != end &&
> -		 (skb = skb_dequeue(&sk->sk_write_queue)) != NULL);
> -
> -	nr->vl         = nr->vr;
> -	nr->condition &= ~NR_COND_ACK_PENDING;
> -
> -	if (!nr_t1timer_running(sk))
> -		nr_start_t1timer(sk);
> -}
> -
> -void nr_transmit_buffer(struct sock *sk, struct sk_buff *skb)
> -{
> -	struct nr_sock *nr = nr_sk(sk);
> -	unsigned char *dptr;
> -
> -	/*
> -	 *	Add the protocol byte and network header.
> -	 */
> -	dptr = skb_push(skb, NR_NETWORK_LEN);
> -
> -	memcpy(dptr, &nr->source_addr, AX25_ADDR_LEN);
> -	dptr[6] &= ~AX25_CBIT;
> -	dptr[6] &= ~AX25_EBIT;
> -	dptr[6] |= AX25_SSSID_SPARE;
> -	dptr += AX25_ADDR_LEN;
> -
> -	memcpy(dptr, &nr->dest_addr, AX25_ADDR_LEN);
> -	dptr[6] &= ~AX25_CBIT;
> -	dptr[6] |= AX25_EBIT;
> -	dptr[6] |= AX25_SSSID_SPARE;
> -	dptr += AX25_ADDR_LEN;
> -
> -	*dptr++ = READ_ONCE(sysctl_netrom_network_ttl_initialiser);
> -
> -	if (!nr_route_frame(skb, NULL)) {
> -		kfree_skb(skb);
> -		nr_disconnect(sk, ENETUNREACH);
> -	}
> -}
> -
> -/*
> - * The following routines are taken from page 170 of the 7th ARRL Computer
> - * Networking Conference paper, as is the whole state machine.
> - */
> -
> -void nr_establish_data_link(struct sock *sk)
> -{
> -	struct nr_sock *nr = nr_sk(sk);
> -
> -	nr->condition = 0x00;
> -	nr->n2count   = 0;
> -
> -	nr_write_internal(sk, NR_CONNREQ);
> -
> -	nr_stop_t2timer(sk);
> -	nr_stop_t4timer(sk);
> -	nr_stop_idletimer(sk);
> -	nr_start_t1timer(sk);
> -}
> -
> -/*
> - * Never send a NAK when we are CHOKEd.
> - */
> -void nr_enquiry_response(struct sock *sk)
> -{
> -	struct nr_sock *nr = nr_sk(sk);
> -	int frametype = NR_INFOACK;
> -
> -	if (nr->condition & NR_COND_OWN_RX_BUSY) {
> -		frametype |= NR_CHOKE_FLAG;
> -	} else {
> -		if (skb_peek(&nr->reseq_queue) != NULL)
> -			frametype |= NR_NAK_FLAG;
> -	}
> -
> -	nr_write_internal(sk, frametype);
> -
> -	nr->vl         = nr->vr;
> -	nr->condition &= ~NR_COND_ACK_PENDING;
> -}
> -
> -void nr_check_iframes_acked(struct sock *sk, unsigned short nr)
> -{
> -	struct nr_sock *nrom = nr_sk(sk);
> -
> -	if (nrom->vs == nr) {
> -		nr_frames_acked(sk, nr);
> -		nr_stop_t1timer(sk);
> -		nrom->n2count = 0;
> -	} else {
> -		if (nrom->va != nr) {
> -			nr_frames_acked(sk, nr);
> -			nr_start_t1timer(sk);
> -		}
> -	}
> -}
> diff --git a/net/netrom/nr_route.c b/net/netrom/nr_route.c
> deleted file mode 100644
> index 9cc29ae85b06..000000000000
> --- a/net/netrom/nr_route.c
> +++ /dev/null
> @@ -1,989 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-or-later
> -/*
> - *
> - * Copyright Jonathan Naylor G4KLX (g4klx@g4klx.demon.co.uk)
> - * Copyright Alan Cox GW4PTS (alan@lxorguk.ukuu.org.uk)
> - * Copyright Tomi Manninen OH2BNS (oh2bns@sral.fi)
> - */
> -#include <linux/errno.h>
> -#include <linux/types.h>
> -#include <linux/socket.h>
> -#include <linux/in.h>
> -#include <linux/kernel.h>
> -#include <linux/timer.h>
> -#include <linux/string.h>
> -#include <linux/sockios.h>
> -#include <linux/net.h>
> -#include <linux/slab.h>
> -#include <net/ax25.h>
> -#include <linux/inet.h>
> -#include <linux/netdevice.h>
> -#include <net/arp.h>
> -#include <linux/if_arp.h>
> -#include <linux/skbuff.h>
> -#include <net/sock.h>
> -#include <linux/uaccess.h>
> -#include <linux/fcntl.h>
> -#include <linux/termios.h>	/* For TIOCINQ/OUTQ */
> -#include <linux/mm.h>
> -#include <linux/interrupt.h>
> -#include <linux/notifier.h>
> -#include <linux/init.h>
> -#include <linux/spinlock.h>
> -#include <net/netrom.h>
> -#include <linux/seq_file.h>
> -#include <linux/export.h>
> -
> -static unsigned int nr_neigh_no = 1;
> -
> -static HLIST_HEAD(nr_node_list);
> -static DEFINE_SPINLOCK(nr_node_list_lock);
> -static HLIST_HEAD(nr_neigh_list);
> -static DEFINE_SPINLOCK(nr_neigh_list_lock);
> -
> -static struct nr_node *nr_node_get(ax25_address *callsign)
> -{
> -	struct nr_node *found = NULL;
> -	struct nr_node *nr_node;
> -
> -	spin_lock_bh(&nr_node_list_lock);
> -	nr_node_for_each(nr_node, &nr_node_list)
> -		if (ax25cmp(callsign, &nr_node->callsign) == 0) {
> -			nr_node_hold(nr_node);
> -			found = nr_node;
> -			break;
> -		}
> -	spin_unlock_bh(&nr_node_list_lock);
> -	return found;
> -}
> -
> -static struct nr_neigh *nr_neigh_get_dev(ax25_address *callsign,
> -					 struct net_device *dev)
> -{
> -	struct nr_neigh *found = NULL;
> -	struct nr_neigh *nr_neigh;
> -
> -	spin_lock_bh(&nr_neigh_list_lock);
> -	nr_neigh_for_each(nr_neigh, &nr_neigh_list)
> -		if (ax25cmp(callsign, &nr_neigh->callsign) == 0 &&
> -		    nr_neigh->dev == dev) {
> -			nr_neigh_hold(nr_neigh);
> -			found = nr_neigh;
> -			break;
> -		}
> -	spin_unlock_bh(&nr_neigh_list_lock);
> -	return found;
> -}
> -
> -static void nr_remove_neigh(struct nr_neigh *);
> -
> -/*      re-sort the routes in quality order.    */
> -static void re_sort_routes(struct nr_node *nr_node, int x, int y)
> -{
> -	if (nr_node->routes[y].quality > nr_node->routes[x].quality) {
> -		if (nr_node->which == x)
> -			nr_node->which = y;
> -		else if (nr_node->which == y)
> -			nr_node->which = x;
> -
> -		swap(nr_node->routes[x], nr_node->routes[y]);
> -	}
> -}
> -
> -/*
> - *	Add a new route to a node, and in the process add the node and the
> - *	neighbour if it is new.
> - */
> -static int __must_check nr_add_node(ax25_address *nr, const char *mnemonic,
> -	ax25_address *ax25, ax25_digi *ax25_digi, struct net_device *dev,
> -	int quality, int obs_count)
> -{
> -	struct nr_node  *nr_node;
> -	struct nr_neigh *nr_neigh;
> -	int i, found;
> -	struct net_device *odev;
> -
> -	if ((odev=nr_dev_get(nr)) != NULL) {	/* Can't add routes to ourself */
> -		dev_put(odev);
> -		return -EINVAL;
> -	}
> -
> -	nr_node = nr_node_get(nr);
> -
> -	nr_neigh = nr_neigh_get_dev(ax25, dev);
> -
> -	/*
> -	 * The L2 link to a neighbour has failed in the past
> -	 * and now a frame comes from this neighbour. We assume
> -	 * it was a temporary trouble with the link and reset the
> -	 * routes now (and not wait for a node broadcast).
> -	 */
> -	if (nr_neigh != NULL && nr_neigh->failed != 0 && quality == 0) {
> -		struct nr_node *nr_nodet;
> -
> -		spin_lock_bh(&nr_node_list_lock);
> -		nr_node_for_each(nr_nodet, &nr_node_list) {
> -			nr_node_lock(nr_nodet);
> -			for (i = 0; i < nr_nodet->count; i++)
> -				if (nr_nodet->routes[i].neighbour == nr_neigh)
> -					if (i < nr_nodet->which)
> -						nr_nodet->which = i;
> -			nr_node_unlock(nr_nodet);
> -		}
> -		spin_unlock_bh(&nr_node_list_lock);
> -	}
> -
> -	if (nr_neigh != NULL)
> -		nr_neigh->failed = 0;
> -
> -	if (quality == 0 && nr_neigh != NULL && nr_node != NULL) {
> -		nr_neigh_put(nr_neigh);
> -		nr_node_put(nr_node);
> -		return 0;
> -	}
> -
> -	if (nr_neigh == NULL) {
> -		if ((nr_neigh = kmalloc(sizeof(*nr_neigh), GFP_ATOMIC)) == NULL) {
> -			if (nr_node)
> -				nr_node_put(nr_node);
> -			return -ENOMEM;
> -		}
> -
> -		nr_neigh->callsign = *ax25;
> -		nr_neigh->digipeat = NULL;
> -		nr_neigh->ax25     = NULL;
> -		nr_neigh->dev      = dev;
> -		nr_neigh->quality  = READ_ONCE(sysctl_netrom_default_path_quality);
> -		nr_neigh->locked   = 0;
> -		nr_neigh->count    = 0;
> -		nr_neigh->number   = nr_neigh_no++;
> -		nr_neigh->failed   = 0;
> -		refcount_set(&nr_neigh->refcount, 1);
> -
> -		if (ax25_digi != NULL && ax25_digi->ndigi > 0) {
> -			nr_neigh->digipeat = kmemdup(ax25_digi,
> -						     sizeof(*ax25_digi),
> -						     GFP_KERNEL);
> -			if (nr_neigh->digipeat == NULL) {
> -				kfree(nr_neigh);
> -				if (nr_node)
> -					nr_node_put(nr_node);
> -				return -ENOMEM;
> -			}
> -		}
> -
> -		spin_lock_bh(&nr_neigh_list_lock);
> -		hlist_add_head(&nr_neigh->neigh_node, &nr_neigh_list);
> -		nr_neigh_hold(nr_neigh);
> -		spin_unlock_bh(&nr_neigh_list_lock);
> -	}
> -
> -	if (quality != 0 && ax25cmp(nr, ax25) == 0 && !nr_neigh->locked)
> -		nr_neigh->quality = quality;
> -
> -	if (nr_node == NULL) {
> -		if ((nr_node = kmalloc(sizeof(*nr_node), GFP_ATOMIC)) == NULL) {
> -			if (nr_neigh)
> -				nr_neigh_put(nr_neigh);
> -			return -ENOMEM;
> -		}
> -
> -		nr_node->callsign = *nr;
> -		strscpy(nr_node->mnemonic, mnemonic);
> -
> -		nr_node->which = 0;
> -		nr_node->count = 1;
> -		refcount_set(&nr_node->refcount, 1);
> -		spin_lock_init(&nr_node->node_lock);
> -
> -		nr_node->routes[0].quality   = quality;
> -		nr_node->routes[0].obs_count = obs_count;
> -		nr_node->routes[0].neighbour = nr_neigh;
> -
> -		nr_neigh_hold(nr_neigh);
> -		nr_neigh->count++;
> -
> -		spin_lock_bh(&nr_node_list_lock);
> -		hlist_add_head(&nr_node->node_node, &nr_node_list);
> -		/* refcount initialized at 1 */
> -		spin_unlock_bh(&nr_node_list_lock);
> -
> -		nr_neigh_put(nr_neigh);
> -		return 0;
> -	}
> -	nr_node_lock(nr_node);
> -
> -	if (quality != 0)
> -		strscpy(nr_node->mnemonic, mnemonic);
> -
> -	for (found = 0, i = 0; i < nr_node->count; i++) {
> -		if (nr_node->routes[i].neighbour == nr_neigh) {
> -			nr_node->routes[i].quality   = quality;
> -			nr_node->routes[i].obs_count = obs_count;
> -			found = 1;
> -			break;
> -		}
> -	}
> -
> -	if (!found) {
> -		/* We have space at the bottom, slot it in */
> -		if (nr_node->count < 3) {
> -			nr_node->routes[2] = nr_node->routes[1];
> -			nr_node->routes[1] = nr_node->routes[0];
> -
> -			nr_node->routes[0].quality   = quality;
> -			nr_node->routes[0].obs_count = obs_count;
> -			nr_node->routes[0].neighbour = nr_neigh;
> -
> -			nr_node->which++;
> -			nr_node->count++;
> -			nr_neigh_hold(nr_neigh);
> -			nr_neigh->count++;
> -		} else {
> -			/* It must be better than the worst */
> -			if (quality > nr_node->routes[2].quality) {
> -				nr_node->routes[2].neighbour->count--;
> -				nr_neigh_put(nr_node->routes[2].neighbour);
> -
> -				if (nr_node->routes[2].neighbour->count == 0 && !nr_node->routes[2].neighbour->locked)
> -					nr_remove_neigh(nr_node->routes[2].neighbour);
> -
> -				nr_node->routes[2].quality   = quality;
> -				nr_node->routes[2].obs_count = obs_count;
> -				nr_node->routes[2].neighbour = nr_neigh;
> -
> -				nr_neigh_hold(nr_neigh);
> -				nr_neigh->count++;
> -			}
> -		}
> -	}
> -
> -	/* Now re-sort the routes in quality order */
> -	switch (nr_node->count) {
> -	case 3:
> -		re_sort_routes(nr_node, 0, 1);
> -		re_sort_routes(nr_node, 1, 2);
> -		fallthrough;
> -	case 2:
> -		re_sort_routes(nr_node, 0, 1);
> -		break;
> -	case 1:
> -		break;
> -	}
> -
> -	for (i = 0; i < nr_node->count; i++) {
> -		if (nr_node->routes[i].neighbour == nr_neigh) {
> -			if (i < nr_node->which)
> -				nr_node->which = i;
> -			break;
> -		}
> -	}
> -
> -	nr_neigh_put(nr_neigh);
> -	nr_node_unlock(nr_node);
> -	nr_node_put(nr_node);
> -	return 0;
> -}
> -
> -static void nr_remove_node_locked(struct nr_node *nr_node)
> -{
> -	lockdep_assert_held(&nr_node_list_lock);
> -
> -	hlist_del_init(&nr_node->node_node);
> -	nr_node_put(nr_node);
> -}
> -
> -static inline void __nr_remove_neigh(struct nr_neigh *nr_neigh)
> -{
> -	hlist_del_init(&nr_neigh->neigh_node);
> -	nr_neigh_put(nr_neigh);
> -}
> -
> -#define nr_remove_neigh_locked(__neigh) \
> -	__nr_remove_neigh(__neigh)
> -
> -static void nr_remove_neigh(struct nr_neigh *nr_neigh)
> -{
> -	spin_lock_bh(&nr_neigh_list_lock);
> -	__nr_remove_neigh(nr_neigh);
> -	spin_unlock_bh(&nr_neigh_list_lock);
> -}
> -
> -/*
> - *	"Delete" a node. Strictly speaking remove a route to a node. The node
> - *	is only deleted if no routes are left to it.
> - */
> -static int nr_del_node(ax25_address *callsign, ax25_address *neighbour, struct net_device *dev)
> -{
> -	struct nr_node  *nr_node;
> -	struct nr_neigh *nr_neigh;
> -	int i;
> -
> -	nr_node = nr_node_get(callsign);
> -
> -	if (nr_node == NULL)
> -		return -EINVAL;
> -
> -	nr_neigh = nr_neigh_get_dev(neighbour, dev);
> -
> -	if (nr_neigh == NULL) {
> -		nr_node_put(nr_node);
> -		return -EINVAL;
> -	}
> -
> -	spin_lock_bh(&nr_node_list_lock);
> -	nr_node_lock(nr_node);
> -	for (i = 0; i < nr_node->count; i++) {
> -		if (nr_node->routes[i].neighbour == nr_neigh) {
> -			nr_neigh->count--;
> -			nr_neigh_put(nr_neigh);
> -
> -			if (nr_neigh->count == 0 && !nr_neigh->locked)
> -				nr_remove_neigh(nr_neigh);
> -			nr_neigh_put(nr_neigh);
> -
> -			nr_node->count--;
> -
> -			if (nr_node->count == 0) {
> -				nr_remove_node_locked(nr_node);
> -			} else {
> -				switch (i) {
> -				case 0:
> -					nr_node->routes[0] = nr_node->routes[1];
> -					fallthrough;
> -				case 1:
> -					nr_node->routes[1] = nr_node->routes[2];
> -					fallthrough;
> -				case 2:
> -					break;
> -				}
> -				nr_node_put(nr_node);
> -			}
> -			nr_node_unlock(nr_node);
> -			spin_unlock_bh(&nr_node_list_lock);
> -
> -			return 0;
> -		}
> -	}
> -	nr_neigh_put(nr_neigh);
> -	nr_node_unlock(nr_node);
> -	spin_unlock_bh(&nr_node_list_lock);
> -	nr_node_put(nr_node);
> -
> -	return -EINVAL;
> -}
> -
> -/*
> - *	Lock a neighbour with a quality.
> - */
> -static int __must_check nr_add_neigh(ax25_address *callsign,
> -	ax25_digi *ax25_digi, struct net_device *dev, unsigned int quality)
> -{
> -	struct nr_neigh *nr_neigh;
> -
> -	nr_neigh = nr_neigh_get_dev(callsign, dev);
> -	if (nr_neigh) {
> -		nr_neigh->quality = quality;
> -		nr_neigh->locked  = 1;
> -		nr_neigh_put(nr_neigh);
> -		return 0;
> -	}
> -
> -	if ((nr_neigh = kmalloc(sizeof(*nr_neigh), GFP_ATOMIC)) == NULL)
> -		return -ENOMEM;
> -
> -	nr_neigh->callsign = *callsign;
> -	nr_neigh->digipeat = NULL;
> -	nr_neigh->ax25     = NULL;
> -	nr_neigh->dev      = dev;
> -	nr_neigh->quality  = quality;
> -	nr_neigh->locked   = 1;
> -	nr_neigh->count    = 0;
> -	nr_neigh->number   = nr_neigh_no++;
> -	nr_neigh->failed   = 0;
> -	refcount_set(&nr_neigh->refcount, 1);
> -
> -	if (ax25_digi != NULL && ax25_digi->ndigi > 0) {
> -		nr_neigh->digipeat = kmemdup(ax25_digi, sizeof(*ax25_digi),
> -					     GFP_KERNEL);
> -		if (nr_neigh->digipeat == NULL) {
> -			kfree(nr_neigh);
> -			return -ENOMEM;
> -		}
> -	}
> -
> -	spin_lock_bh(&nr_neigh_list_lock);
> -	hlist_add_head(&nr_neigh->neigh_node, &nr_neigh_list);
> -	/* refcount is initialized at 1 */
> -	spin_unlock_bh(&nr_neigh_list_lock);
> -
> -	return 0;
> -}
> -
> -/*
> - *	"Delete" a neighbour. The neighbour is only removed if the number
> - *	of nodes that may use it is zero.
> - */
> -static int nr_del_neigh(ax25_address *callsign, struct net_device *dev, unsigned int quality)
> -{
> -	struct nr_neigh *nr_neigh;
> -
> -	nr_neigh = nr_neigh_get_dev(callsign, dev);
> -
> -	if (nr_neigh == NULL) return -EINVAL;
> -
> -	nr_neigh->quality = quality;
> -	nr_neigh->locked  = 0;
> -
> -	if (nr_neigh->count == 0)
> -		nr_remove_neigh(nr_neigh);
> -	nr_neigh_put(nr_neigh);
> -
> -	return 0;
> -}
> -
> -/*
> - *	Decrement the obsolescence count by one. If a route is reduced to a
> - *	count of zero, remove it. Also remove any unlocked neighbours with
> - *	zero nodes routing via it.
> - */
> -static int nr_dec_obs(void)
> -{
> -	struct nr_neigh *nr_neigh;
> -	struct nr_node  *s;
> -	struct hlist_node *nodet;
> -	int i;
> -
> -	spin_lock_bh(&nr_node_list_lock);
> -	nr_node_for_each_safe(s, nodet, &nr_node_list) {
> -		nr_node_lock(s);
> -		for (i = 0; i < s->count; i++) {
> -			switch (s->routes[i].obs_count) {
> -			case 0:		/* A locked entry */
> -				break;
> -
> -			case 1:		/* From 1 -> 0 */
> -				nr_neigh = s->routes[i].neighbour;
> -
> -				nr_neigh->count--;
> -				nr_neigh_put(nr_neigh);
> -
> -				if (nr_neigh->count == 0 && !nr_neigh->locked)
> -					nr_remove_neigh(nr_neigh);
> -
> -				s->count--;
> -
> -				switch (i) {
> -				case 0:
> -					s->routes[0] = s->routes[1];
> -					fallthrough;
> -				case 1:
> -					s->routes[1] = s->routes[2];
> -					break;
> -				case 2:
> -					break;
> -				}
> -				break;
> -
> -			default:
> -				s->routes[i].obs_count--;
> -				break;
> -
> -			}
> -		}
> -
> -		if (s->count <= 0)
> -			nr_remove_node_locked(s);
> -		nr_node_unlock(s);
> -	}
> -	spin_unlock_bh(&nr_node_list_lock);
> -
> -	return 0;
> -}
> -
> -/*
> - *	A device has been removed. Remove its routes and neighbours.
> - */
> -void nr_rt_device_down(struct net_device *dev)
> -{
> -	struct nr_neigh *s;
> -	struct hlist_node *nodet, *node2t;
> -	struct nr_node  *t;
> -	int i;
> -
> -	spin_lock_bh(&nr_neigh_list_lock);
> -	nr_neigh_for_each_safe(s, nodet, &nr_neigh_list) {
> -		if (s->dev == dev) {
> -			spin_lock_bh(&nr_node_list_lock);
> -			nr_node_for_each_safe(t, node2t, &nr_node_list) {
> -				nr_node_lock(t);
> -				for (i = 0; i < t->count; i++) {
> -					if (t->routes[i].neighbour == s) {
> -						t->count--;
> -
> -						switch (i) {
> -						case 0:
> -							t->routes[0] = t->routes[1];
> -							fallthrough;
> -						case 1:
> -							t->routes[1] = t->routes[2];
> -							break;
> -						case 2:
> -							break;
> -						}
> -					}
> -				}
> -
> -				if (t->count <= 0)
> -					nr_remove_node_locked(t);
> -				nr_node_unlock(t);
> -			}
> -			spin_unlock_bh(&nr_node_list_lock);
> -
> -			nr_remove_neigh_locked(s);
> -		}
> -	}
> -	spin_unlock_bh(&nr_neigh_list_lock);
> -}
> -
> -/*
> - *	Check that the device given is a valid AX.25 interface that is "up".
> - *	Or a valid ethernet interface with an AX.25 callsign binding.
> - */
> -static struct net_device *nr_ax25_dev_get(char *devname)
> -{
> -	struct net_device *dev;
> -
> -	if ((dev = dev_get_by_name(&init_net, devname)) == NULL)
> -		return NULL;
> -
> -	if ((dev->flags & IFF_UP) && dev->type == ARPHRD_AX25)
> -		return dev;
> -
> -	dev_put(dev);
> -	return NULL;
> -}
> -
> -/*
> - *	Find the first active NET/ROM device, usually "nr0".
> - */
> -struct net_device *nr_dev_first(void)
> -{
> -	struct net_device *dev, *first = NULL;
> -
> -	rcu_read_lock();
> -	for_each_netdev_rcu(&init_net, dev) {
> -		if ((dev->flags & IFF_UP) && dev->type == ARPHRD_NETROM)
> -			if (first == NULL || strncmp(dev->name, first->name, 3) < 0)
> -				first = dev;
> -	}
> -	dev_hold(first);
> -	rcu_read_unlock();
> -
> -	return first;
> -}
> -
> -/*
> - *	Find the NET/ROM device for the given callsign.
> - */
> -struct net_device *nr_dev_get(ax25_address *addr)
> -{
> -	struct net_device *dev;
> -
> -	rcu_read_lock();
> -	for_each_netdev_rcu(&init_net, dev) {
> -		if ((dev->flags & IFF_UP) && dev->type == ARPHRD_NETROM &&
> -		    ax25cmp(addr, (const ax25_address *)dev->dev_addr) == 0) {
> -			dev_hold(dev);
> -			goto out;
> -		}
> -	}
> -	dev = NULL;
> -out:
> -	rcu_read_unlock();
> -	return dev;
> -}
> -
> -static ax25_digi *nr_call_to_digi(ax25_digi *digi, int ndigis,
> -	ax25_address *digipeaters)
> -{
> -	int i;
> -
> -	if (ndigis == 0)
> -		return NULL;
> -
> -	for (i = 0; i < ndigis; i++) {
> -		digi->calls[i]    = digipeaters[i];
> -		digi->repeated[i] = 0;
> -	}
> -
> -	digi->ndigi      = ndigis;
> -	digi->lastrepeat = -1;
> -
> -	return digi;
> -}
> -
> -/*
> - *	Handle the ioctls that control the routing functions.
> - */
> -int nr_rt_ioctl(unsigned int cmd, void __user *arg)
> -{
> -	struct nr_route_struct nr_route;
> -	struct net_device *dev;
> -	ax25_digi digi;
> -	int ret;
> -
> -	switch (cmd) {
> -	case SIOCADDRT:
> -		if (copy_from_user(&nr_route, arg, sizeof(struct nr_route_struct)))
> -			return -EFAULT;
> -		if (nr_route.ndigis > AX25_MAX_DIGIS)
> -			return -EINVAL;
> -		if ((dev = nr_ax25_dev_get(nr_route.device)) == NULL)
> -			return -EINVAL;
> -		switch (nr_route.type) {
> -		case NETROM_NODE:
> -			if (strnlen(nr_route.mnemonic, 7) == 7) {
> -				ret = -EINVAL;
> -				break;
> -			}
> -
> -			ret = nr_add_node(&nr_route.callsign,
> -				nr_route.mnemonic,
> -				&nr_route.neighbour,
> -				nr_call_to_digi(&digi, nr_route.ndigis,
> -						nr_route.digipeaters),
> -				dev, nr_route.quality,
> -				nr_route.obs_count);
> -			break;
> -		case NETROM_NEIGH:
> -			ret = nr_add_neigh(&nr_route.callsign,
> -				nr_call_to_digi(&digi, nr_route.ndigis,
> -						nr_route.digipeaters),
> -				dev, nr_route.quality);
> -			break;
> -		default:
> -			ret = -EINVAL;
> -		}
> -		dev_put(dev);
> -		return ret;
> -
> -	case SIOCDELRT:
> -		if (copy_from_user(&nr_route, arg, sizeof(struct nr_route_struct)))
> -			return -EFAULT;
> -		if ((dev = nr_ax25_dev_get(nr_route.device)) == NULL)
> -			return -EINVAL;
> -		switch (nr_route.type) {
> -		case NETROM_NODE:
> -			ret = nr_del_node(&nr_route.callsign,
> -				&nr_route.neighbour, dev);
> -			break;
> -		case NETROM_NEIGH:
> -			ret = nr_del_neigh(&nr_route.callsign,
> -				dev, nr_route.quality);
> -			break;
> -		default:
> -			ret = -EINVAL;
> -		}
> -		dev_put(dev);
> -		return ret;
> -
> -	case SIOCNRDECOBS:
> -		return nr_dec_obs();
> -
> -	default:
> -		return -EINVAL;
> -	}
> -
> -	return 0;
> -}
> -
> -/*
> - * 	A level 2 link has timed out, therefore it appears to be a poor link,
> - *	then don't use that neighbour until it is reset.
> - */
> -void nr_link_failed(ax25_cb *ax25, int reason)
> -{
> -	struct nr_neigh *s, *nr_neigh = NULL;
> -	struct nr_node  *nr_node = NULL;
> -
> -	spin_lock_bh(&nr_neigh_list_lock);
> -	nr_neigh_for_each(s, &nr_neigh_list) {
> -		if (s->ax25 == ax25) {
> -			nr_neigh_hold(s);
> -			nr_neigh = s;
> -			break;
> -		}
> -	}
> -	spin_unlock_bh(&nr_neigh_list_lock);
> -
> -	if (nr_neigh == NULL)
> -		return;
> -
> -	nr_neigh->ax25 = NULL;
> -	ax25_cb_put(ax25);
> -
> -	if (++nr_neigh->failed < READ_ONCE(sysctl_netrom_link_fails_count)) {
> -		nr_neigh_put(nr_neigh);
> -		return;
> -	}
> -	spin_lock_bh(&nr_node_list_lock);
> -	nr_node_for_each(nr_node, &nr_node_list) {
> -		nr_node_lock(nr_node);
> -		if (nr_node->which < nr_node->count &&
> -		    nr_node->routes[nr_node->which].neighbour == nr_neigh)
> -			nr_node->which++;
> -		nr_node_unlock(nr_node);
> -	}
> -	spin_unlock_bh(&nr_node_list_lock);
> -	nr_neigh_put(nr_neigh);
> -}
> -
> -/*
> - *	Route a frame to an appropriate AX.25 connection. A NULL ax25_cb
> - *	indicates an internally generated frame.
> - */
> -int nr_route_frame(struct sk_buff *skb, ax25_cb *ax25)
> -{
> -	ax25_address *nr_src, *nr_dest;
> -	struct nr_neigh *nr_neigh;
> -	struct nr_node  *nr_node;
> -	struct net_device *dev;
> -	unsigned char *dptr;
> -	ax25_cb *ax25s;
> -	int ret;
> -	struct sk_buff *nskb, *oskb;
> -
> -	/*
> -	 * Reject malformed packets early. Check that it contains at least 2
> -	 * addresses and 1 byte more for Time-To-Live
> -	 */
> -	if (skb->len < 2 * sizeof(ax25_address) + 1)
> -		return 0;
> -
> -	nr_src  = (ax25_address *)(skb->data + 0);
> -	nr_dest = (ax25_address *)(skb->data + 7);
> -
> -	if (ax25 != NULL) {
> -		ret = nr_add_node(nr_src, "", &ax25->dest_addr, ax25->digipeat,
> -				  ax25->ax25_dev->dev, 0,
> -				  READ_ONCE(sysctl_netrom_obsolescence_count_initialiser));
> -		if (ret)
> -			return ret;
> -	}
> -
> -	if ((dev = nr_dev_get(nr_dest)) != NULL) {	/* Its for me */
> -		if (ax25 == NULL)			/* Its from me */
> -			ret = nr_loopback_queue(skb);
> -		else
> -			ret = nr_rx_frame(skb, dev);
> -		dev_put(dev);
> -		return ret;
> -	}
> -
> -	if (!READ_ONCE(sysctl_netrom_routing_control) && ax25 != NULL)
> -		return 0;
> -
> -	/* Its Time-To-Live has expired */
> -	if (skb->data[14] == 1) {
> -		return 0;
> -	}
> -
> -	nr_node = nr_node_get(nr_dest);
> -	if (nr_node == NULL)
> -		return 0;
> -	nr_node_lock(nr_node);
> -
> -	if (nr_node->which >= nr_node->count) {
> -		nr_node_unlock(nr_node);
> -		nr_node_put(nr_node);
> -		return 0;
> -	}
> -
> -	nr_neigh = nr_node->routes[nr_node->which].neighbour;
> -
> -	if ((dev = nr_dev_first()) == NULL) {
> -		nr_node_unlock(nr_node);
> -		nr_node_put(nr_node);
> -		return 0;
> -	}
> -
> -	/* We are going to change the netrom headers so we should get our
> -	   own skb, we also did not know until now how much header space
> -	   we had to reserve... - RXQ */
> -	nskb = skb_copy_expand(skb, dev->hard_header_len, 0, GFP_ATOMIC);
> -
> -	if (!nskb) {
> -		nr_node_unlock(nr_node);
> -		nr_node_put(nr_node);
> -		dev_put(dev);
> -		return 0;
> -	}
> -	oskb = skb;
> -	skb = nskb;
> -	skb->data[14]--;
> -
> -	dptr  = skb_push(skb, 1);
> -	*dptr = AX25_P_NETROM;
> -
> -	ax25s = nr_neigh->ax25;
> -	nr_neigh->ax25 = ax25_send_frame(skb, 256,
> -					 (const ax25_address *)dev->dev_addr,
> -					 &nr_neigh->callsign,
> -					 nr_neigh->digipeat, nr_neigh->dev);
> -	if (ax25s)
> -		ax25_cb_put(ax25s);
> -
> -	dev_put(dev);
> -	ret = (nr_neigh->ax25 != NULL);
> -	nr_node_unlock(nr_node);
> -	nr_node_put(nr_node);
> -
> -	if (ret)
> -		kfree_skb(oskb);
> -
> -	return ret;
> -}
> -
> -#ifdef CONFIG_PROC_FS
> -
> -static void *nr_node_start(struct seq_file *seq, loff_t *pos)
> -	__acquires(&nr_node_list_lock)
> -{
> -	spin_lock_bh(&nr_node_list_lock);
> -	return seq_hlist_start_head(&nr_node_list, *pos);
> -}
> -
> -static void *nr_node_next(struct seq_file *seq, void *v, loff_t *pos)
> -{
> -	return seq_hlist_next(v, &nr_node_list, pos);
> -}
> -
> -static void nr_node_stop(struct seq_file *seq, void *v)
> -	__releases(&nr_node_list_lock)
> -{
> -	spin_unlock_bh(&nr_node_list_lock);
> -}
> -
> -static int nr_node_show(struct seq_file *seq, void *v)
> -{
> -	char buf[11];
> -	int i;
> -
> -	if (v == SEQ_START_TOKEN)
> -		seq_puts(seq,
> -			 "callsign  mnemonic w n qual obs neigh qual obs neigh qual obs neigh\n");
> -	else {
> -		struct nr_node *nr_node = hlist_entry(v, struct nr_node,
> -						      node_node);
> -
> -		nr_node_lock(nr_node);
> -		seq_printf(seq, "%-9s %-7s  %d %d",
> -			ax2asc(buf, &nr_node->callsign),
> -			(nr_node->mnemonic[0] == '\0') ? "*" : nr_node->mnemonic,
> -			nr_node->which + 1,
> -			nr_node->count);
> -
> -		for (i = 0; i < nr_node->count; i++) {
> -			seq_printf(seq, "  %3d   %d %05d",
> -				nr_node->routes[i].quality,
> -				nr_node->routes[i].obs_count,
> -				nr_node->routes[i].neighbour->number);
> -		}
> -		nr_node_unlock(nr_node);
> -
> -		seq_puts(seq, "\n");
> -	}
> -	return 0;
> -}
> -
> -const struct seq_operations nr_node_seqops = {
> -	.start = nr_node_start,
> -	.next = nr_node_next,
> -	.stop = nr_node_stop,
> -	.show = nr_node_show,
> -};
> -
> -static void *nr_neigh_start(struct seq_file *seq, loff_t *pos)
> -	__acquires(&nr_neigh_list_lock)
> -{
> -	spin_lock_bh(&nr_neigh_list_lock);
> -	return seq_hlist_start_head(&nr_neigh_list, *pos);
> -}
> -
> -static void *nr_neigh_next(struct seq_file *seq, void *v, loff_t *pos)
> -{
> -	return seq_hlist_next(v, &nr_neigh_list, pos);
> -}
> -
> -static void nr_neigh_stop(struct seq_file *seq, void *v)
> -	__releases(&nr_neigh_list_lock)
> -{
> -	spin_unlock_bh(&nr_neigh_list_lock);
> -}
> -
> -static int nr_neigh_show(struct seq_file *seq, void *v)
> -{
> -	char buf[11];
> -	int i;
> -
> -	if (v == SEQ_START_TOKEN)
> -		seq_puts(seq, "addr  callsign  dev  qual lock count failed digipeaters\n");
> -	else {
> -		struct nr_neigh *nr_neigh;
> -
> -		nr_neigh = hlist_entry(v, struct nr_neigh, neigh_node);
> -		seq_printf(seq, "%05d %-9s %-4s  %3d    %d   %3d    %3d",
> -			nr_neigh->number,
> -			ax2asc(buf, &nr_neigh->callsign),
> -			nr_neigh->dev ? nr_neigh->dev->name : "???",
> -			nr_neigh->quality,
> -			nr_neigh->locked,
> -			nr_neigh->count,
> -			nr_neigh->failed);
> -
> -		if (nr_neigh->digipeat != NULL) {
> -			for (i = 0; i < nr_neigh->digipeat->ndigi; i++)
> -				seq_printf(seq, " %s",
> -					   ax2asc(buf, &nr_neigh->digipeat->calls[i]));
> -		}
> -
> -		seq_puts(seq, "\n");
> -	}
> -	return 0;
> -}
> -
> -const struct seq_operations nr_neigh_seqops = {
> -	.start = nr_neigh_start,
> -	.next = nr_neigh_next,
> -	.stop = nr_neigh_stop,
> -	.show = nr_neigh_show,
> -};
> -#endif
> -
> -/*
> - *	Free all memory associated with the nodes and routes lists.
> - */
> -void nr_rt_free(void)
> -{
> -	struct nr_neigh *s = NULL;
> -	struct nr_node  *t = NULL;
> -	struct hlist_node *nodet;
> -
> -	spin_lock_bh(&nr_neigh_list_lock);
> -	spin_lock_bh(&nr_node_list_lock);
> -	nr_node_for_each_safe(t, nodet, &nr_node_list) {
> -		nr_node_lock(t);
> -		nr_remove_node_locked(t);
> -		nr_node_unlock(t);
> -	}
> -	nr_neigh_for_each_safe(s, nodet, &nr_neigh_list) {
> -		while(s->count) {
> -			s->count--;
> -			nr_neigh_put(s);
> -		}
> -		nr_remove_neigh_locked(s);
> -	}
> -	spin_unlock_bh(&nr_node_list_lock);
> -	spin_unlock_bh(&nr_neigh_list_lock);
> -}
> diff --git a/net/netrom/nr_subr.c b/net/netrom/nr_subr.c
> deleted file mode 100644
> index c3bbd5880850..000000000000
> --- a/net/netrom/nr_subr.c
> +++ /dev/null
> @@ -1,280 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-or-later
> -/*
> - *
> - * Copyright Jonathan Naylor G4KLX (g4klx@g4klx.demon.co.uk)
> - */
> -#include <linux/errno.h>
> -#include <linux/types.h>
> -#include <linux/socket.h>
> -#include <linux/in.h>
> -#include <linux/kernel.h>
> -#include <linux/timer.h>
> -#include <linux/string.h>
> -#include <linux/sockios.h>
> -#include <linux/net.h>
> -#include <linux/slab.h>
> -#include <net/ax25.h>
> -#include <linux/inet.h>
> -#include <linux/netdevice.h>
> -#include <linux/skbuff.h>
> -#include <net/sock.h>
> -#include <net/tcp_states.h>
> -#include <linux/uaccess.h>
> -#include <linux/fcntl.h>
> -#include <linux/mm.h>
> -#include <linux/interrupt.h>
> -#include <net/netrom.h>
> -
> -/*
> - *	This routine purges all of the queues of frames.
> - */
> -void nr_clear_queues(struct sock *sk)
> -{
> -	struct nr_sock *nr = nr_sk(sk);
> -
> -	skb_queue_purge(&sk->sk_write_queue);
> -	skb_queue_purge(&nr->ack_queue);
> -	skb_queue_purge(&nr->reseq_queue);
> -	skb_queue_purge(&nr->frag_queue);
> -}
> -
> -/*
> - * This routine purges the input queue of those frames that have been
> - * acknowledged. This replaces the boxes labelled "V(a) <- N(r)" on the
> - * SDL diagram.
> - */
> -void nr_frames_acked(struct sock *sk, unsigned short nr)
> -{
> -	struct nr_sock *nrom = nr_sk(sk);
> -	struct sk_buff *skb;
> -
> -	/*
> -	 * Remove all the ack-ed frames from the ack queue.
> -	 */
> -	if (nrom->va != nr) {
> -		while (skb_peek(&nrom->ack_queue) != NULL && nrom->va != nr) {
> -			skb = skb_dequeue(&nrom->ack_queue);
> -			kfree_skb(skb);
> -			nrom->va = (nrom->va + 1) % NR_MODULUS;
> -		}
> -	}
> -}
> -
> -/*
> - * Requeue all the un-ack-ed frames on the output queue to be picked
> - * up by nr_kick called from the timer. This arrangement handles the
> - * possibility of an empty output queue.
> - */
> -void nr_requeue_frames(struct sock *sk)
> -{
> -	struct sk_buff *skb, *skb_prev = NULL;
> -
> -	while ((skb = skb_dequeue(&nr_sk(sk)->ack_queue)) != NULL) {
> -		if (skb_prev == NULL)
> -			skb_queue_head(&sk->sk_write_queue, skb);
> -		else
> -			skb_append(skb_prev, skb, &sk->sk_write_queue);
> -		skb_prev = skb;
> -	}
> -}
> -
> -/*
> - *	Validate that the value of nr is between va and vs. Return true or
> - *	false for testing.
> - */
> -int nr_validate_nr(struct sock *sk, unsigned short nr)
> -{
> -	struct nr_sock *nrom = nr_sk(sk);
> -	unsigned short vc = nrom->va;
> -
> -	while (vc != nrom->vs) {
> -		if (nr == vc) return 1;
> -		vc = (vc + 1) % NR_MODULUS;
> -	}
> -
> -	return nr == nrom->vs;
> -}
> -
> -/*
> - *	Check that ns is within the receive window.
> - */
> -int nr_in_rx_window(struct sock *sk, unsigned short ns)
> -{
> -	struct nr_sock *nr = nr_sk(sk);
> -	unsigned short vc = nr->vr;
> -	unsigned short vt = (nr->vl + nr->window) % NR_MODULUS;
> -
> -	while (vc != vt) {
> -		if (ns == vc) return 1;
> -		vc = (vc + 1) % NR_MODULUS;
> -	}
> -
> -	return 0;
> -}
> -
> -/*
> - *  This routine is called when the HDLC layer internally generates a
> - *  control frame.
> - */
> -void nr_write_internal(struct sock *sk, int frametype)
> -{
> -	struct nr_sock *nr = nr_sk(sk);
> -	struct sk_buff *skb;
> -	unsigned char  *dptr;
> -	int len, timeout;
> -
> -	len = NR_TRANSPORT_LEN;
> -
> -	switch (frametype & 0x0F) {
> -	case NR_CONNREQ:
> -		len += 17;
> -		break;
> -	case NR_CONNACK:
> -		len += (nr->bpqext) ? 2 : 1;
> -		break;
> -	case NR_DISCREQ:
> -	case NR_DISCACK:
> -	case NR_INFOACK:
> -		break;
> -	default:
> -		printk(KERN_ERR "NET/ROM: nr_write_internal - invalid frame type %d\n", frametype);
> -		return;
> -	}
> -
> -	skb = alloc_skb(NR_NETWORK_LEN + len, GFP_ATOMIC);
> -	if (!skb)
> -		return;
> -
> -	/*
> -	 *	Space for AX.25 and NET/ROM network header
> -	 */
> -	skb_reserve(skb, NR_NETWORK_LEN);
> -
> -	dptr = skb_put(skb, len);
> -
> -	switch (frametype & 0x0F) {
> -	case NR_CONNREQ:
> -		timeout  = nr->t1 / HZ;
> -		*dptr++  = nr->my_index;
> -		*dptr++  = nr->my_id;
> -		*dptr++  = 0;
> -		*dptr++  = 0;
> -		*dptr++  = frametype;
> -		*dptr++  = nr->window;
> -		memcpy(dptr, &nr->user_addr, AX25_ADDR_LEN);
> -		dptr[6] &= ~AX25_CBIT;
> -		dptr[6] &= ~AX25_EBIT;
> -		dptr[6] |= AX25_SSSID_SPARE;
> -		dptr    += AX25_ADDR_LEN;
> -		memcpy(dptr, &nr->source_addr, AX25_ADDR_LEN);
> -		dptr[6] &= ~AX25_CBIT;
> -		dptr[6] &= ~AX25_EBIT;
> -		dptr[6] |= AX25_SSSID_SPARE;
> -		dptr    += AX25_ADDR_LEN;
> -		*dptr++  = timeout % 256;
> -		*dptr++  = timeout / 256;
> -		break;
> -
> -	case NR_CONNACK:
> -		*dptr++ = nr->your_index;
> -		*dptr++ = nr->your_id;
> -		*dptr++ = nr->my_index;
> -		*dptr++ = nr->my_id;
> -		*dptr++ = frametype;
> -		*dptr++ = nr->window;
> -		if (nr->bpqext)
> -			*dptr++ = READ_ONCE(sysctl_netrom_network_ttl_initialiser);
> -		break;
> -
> -	case NR_DISCREQ:
> -	case NR_DISCACK:
> -		*dptr++ = nr->your_index;
> -		*dptr++ = nr->your_id;
> -		*dptr++ = 0;
> -		*dptr++ = 0;
> -		*dptr++ = frametype;
> -		break;
> -
> -	case NR_INFOACK:
> -		*dptr++ = nr->your_index;
> -		*dptr++ = nr->your_id;
> -		*dptr++ = 0;
> -		*dptr++ = nr->vr;
> -		*dptr++ = frametype;
> -		break;
> -	}
> -
> -	nr_transmit_buffer(sk, skb);
> -}
> -
> -/*
> - * This routine is called to send an error reply.
> - */
> -void __nr_transmit_reply(struct sk_buff *skb, int mine, unsigned char cmdflags)
> -{
> -	struct sk_buff *skbn;
> -	unsigned char *dptr;
> -	int len;
> -
> -	len = NR_NETWORK_LEN + NR_TRANSPORT_LEN + 1;
> -
> -	if ((skbn = alloc_skb(len, GFP_ATOMIC)) == NULL)
> -		return;
> -
> -	skb_reserve(skbn, 0);
> -
> -	dptr = skb_put(skbn, NR_NETWORK_LEN + NR_TRANSPORT_LEN);
> -
> -	skb_copy_from_linear_data_offset(skb, 7, dptr, AX25_ADDR_LEN);
> -	dptr[6] &= ~AX25_CBIT;
> -	dptr[6] &= ~AX25_EBIT;
> -	dptr[6] |= AX25_SSSID_SPARE;
> -	dptr += AX25_ADDR_LEN;
> -
> -	skb_copy_from_linear_data(skb, dptr, AX25_ADDR_LEN);
> -	dptr[6] &= ~AX25_CBIT;
> -	dptr[6] |= AX25_EBIT;
> -	dptr[6] |= AX25_SSSID_SPARE;
> -	dptr += AX25_ADDR_LEN;
> -
> -	*dptr++ = READ_ONCE(sysctl_netrom_network_ttl_initialiser);
> -
> -	if (mine) {
> -		*dptr++ = 0;
> -		*dptr++ = 0;
> -		*dptr++ = skb->data[15];
> -		*dptr++ = skb->data[16];
> -	} else {
> -		*dptr++ = skb->data[15];
> -		*dptr++ = skb->data[16];
> -		*dptr++ = 0;
> -		*dptr++ = 0;
> -	}
> -
> -	*dptr++ = cmdflags;
> -	*dptr++ = 0;
> -
> -	if (!nr_route_frame(skbn, NULL))
> -		kfree_skb(skbn);
> -}
> -
> -void nr_disconnect(struct sock *sk, int reason)
> -{
> -	nr_stop_t1timer(sk);
> -	nr_stop_t2timer(sk);
> -	nr_stop_t4timer(sk);
> -	nr_stop_idletimer(sk);
> -
> -	nr_clear_queues(sk);
> -
> -	nr_sk(sk)->state = NR_STATE_0;
> -
> -	sk->sk_state     = TCP_CLOSE;
> -	sk->sk_err       = reason;
> -	sk->sk_shutdown |= SEND_SHUTDOWN;
> -
> -	if (!sock_flag(sk, SOCK_DEAD)) {
> -		sk->sk_state_change(sk);
> -		sock_set_flag(sk, SOCK_DEAD);
> -	}
> -}
> diff --git a/net/netrom/nr_timer.c b/net/netrom/nr_timer.c
> deleted file mode 100644
> index b3a62b1f3a09..000000000000
> --- a/net/netrom/nr_timer.c
> +++ /dev/null
> @@ -1,249 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-or-later
> -/*
> - *
> - * Copyright (C) Jonathan Naylor G4KLX (g4klx@g4klx.demon.co.uk)
> - * Copyright (C) 2002 Ralf Baechle DO1GRB (ralf@gnu.org)
> - */
> -#include <linux/errno.h>
> -#include <linux/types.h>
> -#include <linux/socket.h>
> -#include <linux/in.h>
> -#include <linux/kernel.h>
> -#include <linux/jiffies.h>
> -#include <linux/timer.h>
> -#include <linux/string.h>
> -#include <linux/sockios.h>
> -#include <linux/net.h>
> -#include <net/ax25.h>
> -#include <linux/inet.h>
> -#include <linux/netdevice.h>
> -#include <linux/skbuff.h>
> -#include <net/sock.h>
> -#include <net/tcp_states.h>
> -#include <linux/uaccess.h>
> -#include <linux/fcntl.h>
> -#include <linux/mm.h>
> -#include <linux/interrupt.h>
> -#include <net/netrom.h>
> -
> -static void nr_heartbeat_expiry(struct timer_list *);
> -static void nr_t1timer_expiry(struct timer_list *);
> -static void nr_t2timer_expiry(struct timer_list *);
> -static void nr_t4timer_expiry(struct timer_list *);
> -static void nr_idletimer_expiry(struct timer_list *);
> -
> -void nr_init_timers(struct sock *sk)
> -{
> -	struct nr_sock *nr = nr_sk(sk);
> -
> -	timer_setup(&nr->t1timer, nr_t1timer_expiry, 0);
> -	timer_setup(&nr->t2timer, nr_t2timer_expiry, 0);
> -	timer_setup(&nr->t4timer, nr_t4timer_expiry, 0);
> -	timer_setup(&nr->idletimer, nr_idletimer_expiry, 0);
> -
> -	/* initialized by sock_init_data */
> -	sk->sk_timer.function = nr_heartbeat_expiry;
> -}
> -
> -void nr_start_t1timer(struct sock *sk)
> -{
> -	struct nr_sock *nr = nr_sk(sk);
> -
> -	sk_reset_timer(sk, &nr->t1timer, jiffies + nr->t1);
> -}
> -
> -void nr_start_t2timer(struct sock *sk)
> -{
> -	struct nr_sock *nr = nr_sk(sk);
> -
> -	sk_reset_timer(sk, &nr->t2timer, jiffies + nr->t2);
> -}
> -
> -void nr_start_t4timer(struct sock *sk)
> -{
> -	struct nr_sock *nr = nr_sk(sk);
> -
> -	sk_reset_timer(sk, &nr->t4timer, jiffies + nr->t4);
> -}
> -
> -void nr_start_idletimer(struct sock *sk)
> -{
> -	struct nr_sock *nr = nr_sk(sk);
> -
> -	if (nr->idle > 0)
> -		sk_reset_timer(sk, &nr->idletimer, jiffies + nr->idle);
> -}
> -
> -void nr_start_heartbeat(struct sock *sk)
> -{
> -	sk_reset_timer(sk, &sk->sk_timer, jiffies + 5 * HZ);
> -}
> -
> -void nr_stop_t1timer(struct sock *sk)
> -{
> -	sk_stop_timer(sk, &nr_sk(sk)->t1timer);
> -}
> -
> -void nr_stop_t2timer(struct sock *sk)
> -{
> -	sk_stop_timer(sk, &nr_sk(sk)->t2timer);
> -}
> -
> -void nr_stop_t4timer(struct sock *sk)
> -{
> -	sk_stop_timer(sk, &nr_sk(sk)->t4timer);
> -}
> -
> -void nr_stop_idletimer(struct sock *sk)
> -{
> -	sk_stop_timer(sk, &nr_sk(sk)->idletimer);
> -}
> -
> -void nr_stop_heartbeat(struct sock *sk)
> -{
> -	sk_stop_timer(sk, &sk->sk_timer);
> -}
> -
> -int nr_t1timer_running(struct sock *sk)
> -{
> -	return timer_pending(&nr_sk(sk)->t1timer);
> -}
> -
> -static void nr_heartbeat_expiry(struct timer_list *t)
> -{
> -	struct sock *sk = timer_container_of(sk, t, sk_timer);
> -	struct nr_sock *nr = nr_sk(sk);
> -
> -	bh_lock_sock(sk);
> -	switch (nr->state) {
> -	case NR_STATE_0:
> -		/* Magic here: If we listen() and a new link dies before it
> -		   is accepted() it isn't 'dead' so doesn't get removed. */
> -		if (sock_flag(sk, SOCK_DESTROY) ||
> -		    (sk->sk_state == TCP_LISTEN && sock_flag(sk, SOCK_DEAD))) {
> -			if (sk->sk_state == TCP_LISTEN)
> -				sock_hold(sk);
> -			bh_unlock_sock(sk);
> -			nr_destroy_socket(sk);
> -			goto out;
> -		}
> -		break;
> -
> -	case NR_STATE_3:
> -		/*
> -		 * Check for the state of the receive buffer.
> -		 */
> -		if (atomic_read(&sk->sk_rmem_alloc) < (sk->sk_rcvbuf / 2) &&
> -		    (nr->condition & NR_COND_OWN_RX_BUSY)) {
> -			nr->condition &= ~NR_COND_OWN_RX_BUSY;
> -			nr->condition &= ~NR_COND_ACK_PENDING;
> -			nr->vl         = nr->vr;
> -			nr_write_internal(sk, NR_INFOACK);
> -			break;
> -		}
> -		break;
> -	}
> -
> -	nr_start_heartbeat(sk);
> -	bh_unlock_sock(sk);
> -out:
> -	sock_put(sk);
> -}
> -
> -static void nr_t2timer_expiry(struct timer_list *t)
> -{
> -	struct nr_sock *nr = timer_container_of(nr, t, t2timer);
> -	struct sock *sk = &nr->sock;
> -
> -	bh_lock_sock(sk);
> -	if (nr->condition & NR_COND_ACK_PENDING) {
> -		nr->condition &= ~NR_COND_ACK_PENDING;
> -		nr_enquiry_response(sk);
> -	}
> -	bh_unlock_sock(sk);
> -	sock_put(sk);
> -}
> -
> -static void nr_t4timer_expiry(struct timer_list *t)
> -{
> -	struct nr_sock *nr = timer_container_of(nr, t, t4timer);
> -	struct sock *sk = &nr->sock;
> -
> -	bh_lock_sock(sk);
> -	nr_sk(sk)->condition &= ~NR_COND_PEER_RX_BUSY;
> -	bh_unlock_sock(sk);
> -	sock_put(sk);
> -}
> -
> -static void nr_idletimer_expiry(struct timer_list *t)
> -{
> -	struct nr_sock *nr = timer_container_of(nr, t, idletimer);
> -	struct sock *sk = &nr->sock;
> -
> -	bh_lock_sock(sk);
> -
> -	nr_clear_queues(sk);
> -
> -	nr->n2count = 0;
> -	nr_write_internal(sk, NR_DISCREQ);
> -	nr->state = NR_STATE_2;
> -
> -	nr_start_t1timer(sk);
> -	nr_stop_t2timer(sk);
> -	nr_stop_t4timer(sk);
> -
> -	sk->sk_state     = TCP_CLOSE;
> -	sk->sk_err       = 0;
> -	sk->sk_shutdown |= SEND_SHUTDOWN;
> -
> -	if (!sock_flag(sk, SOCK_DEAD)) {
> -		sk->sk_state_change(sk);
> -		sock_set_flag(sk, SOCK_DEAD);
> -	}
> -	bh_unlock_sock(sk);
> -	sock_put(sk);
> -}
> -
> -static void nr_t1timer_expiry(struct timer_list *t)
> -{
> -	struct nr_sock *nr = timer_container_of(nr, t, t1timer);
> -	struct sock *sk = &nr->sock;
> -
> -	bh_lock_sock(sk);
> -	switch (nr->state) {
> -	case NR_STATE_1:
> -		if (nr->n2count == nr->n2) {
> -			nr_disconnect(sk, ETIMEDOUT);
> -			goto out;
> -		} else {
> -			nr->n2count++;
> -			nr_write_internal(sk, NR_CONNREQ);
> -		}
> -		break;
> -
> -	case NR_STATE_2:
> -		if (nr->n2count == nr->n2) {
> -			nr_disconnect(sk, ETIMEDOUT);
> -			goto out;
> -		} else {
> -			nr->n2count++;
> -			nr_write_internal(sk, NR_DISCREQ);
> -		}
> -		break;
> -
> -	case NR_STATE_3:
> -		if (nr->n2count == nr->n2) {
> -			nr_disconnect(sk, ETIMEDOUT);
> -			goto out;
> -		} else {
> -			nr->n2count++;
> -			nr_requeue_frames(sk);
> -		}
> -		break;
> -	}
> -
> -	nr_start_t1timer(sk);
> -out:
> -	bh_unlock_sock(sk);
> -	sock_put(sk);
> -}
> diff --git a/net/netrom/sysctl_net_netrom.c b/net/netrom/sysctl_net_netrom.c
> deleted file mode 100644
> index 7dc0fa628f2e..000000000000
> --- a/net/netrom/sysctl_net_netrom.c
> +++ /dev/null
> @@ -1,156 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-or-later
> -/*
> - *
> - * Copyright (C) 1996 Mike Shaver (shaver@zeroknowledge.com)
> - */
> -#include <linux/mm.h>
> -#include <linux/sysctl.h>
> -#include <linux/init.h>
> -#include <net/ax25.h>
> -#include <net/netrom.h>
> -
> -/*
> - *	Values taken from NET/ROM documentation.
> - */
> -static int min_quality[] = {0}, max_quality[] = {255};
> -static int min_obs[]     = {0}, max_obs[]     = {255};
> -static int min_ttl[]     = {0}, max_ttl[]     = {255};
> -static int min_t1[]      = {5 * HZ};
> -static int max_t1[]      = {600 * HZ};
> -static int min_n2[]      = {2}, max_n2[]      = {127};
> -static int min_t2[]      = {1 * HZ};
> -static int max_t2[]      = {60 * HZ};
> -static int min_t4[]      = {1 * HZ};
> -static int max_t4[]      = {1000 * HZ};
> -static int min_window[]  = {1}, max_window[]  = {127};
> -static int min_idle[]    = {0 * HZ};
> -static int max_idle[]    = {65535 * HZ};
> -static int min_route[]   = {0}, max_route[]   = {1};
> -static int min_fails[]   = {1}, max_fails[]   = {10};
> -static int min_reset[]   = {0}, max_reset[]   = {1};
> -
> -static struct ctl_table_header *nr_table_header;
> -
> -static struct ctl_table nr_table[] = {
> -	{
> -		.procname	= "default_path_quality",
> -		.data		= &sysctl_netrom_default_path_quality,
> -		.maxlen		= sizeof(int),
> -		.mode		= 0644,
> -		.proc_handler	= proc_dointvec_minmax,
> -		.extra1		= &min_quality,
> -		.extra2		= &max_quality
> -	},
> -	{
> -		.procname	= "obsolescence_count_initialiser",
> -		.data		= &sysctl_netrom_obsolescence_count_initialiser,
> -		.maxlen		= sizeof(int),
> -		.mode		= 0644,
> -		.proc_handler	= proc_dointvec_minmax,
> -		.extra1		= &min_obs,
> -		.extra2		= &max_obs
> -	},
> -	{
> -		.procname	= "network_ttl_initialiser",
> -		.data		= &sysctl_netrom_network_ttl_initialiser,
> -		.maxlen		= sizeof(int),
> -		.mode		= 0644,
> -		.proc_handler	= proc_dointvec_minmax,
> -		.extra1		= &min_ttl,
> -		.extra2		= &max_ttl
> -	},
> -	{
> -		.procname	= "transport_timeout",
> -		.data		= &sysctl_netrom_transport_timeout,
> -		.maxlen		= sizeof(int),
> -		.mode		= 0644,
> -		.proc_handler	= proc_dointvec_minmax,
> -		.extra1		= &min_t1,
> -		.extra2		= &max_t1
> -	},
> -	{
> -		.procname	= "transport_maximum_tries",
> -		.data		= &sysctl_netrom_transport_maximum_tries,
> -		.maxlen		= sizeof(int),
> -		.mode		= 0644,
> -		.proc_handler	= proc_dointvec_minmax,
> -		.extra1		= &min_n2,
> -		.extra2		= &max_n2
> -	},
> -	{
> -		.procname	= "transport_acknowledge_delay",
> -		.data		= &sysctl_netrom_transport_acknowledge_delay,
> -		.maxlen		= sizeof(int),
> -		.mode		= 0644,
> -		.proc_handler	= proc_dointvec_minmax,
> -		.extra1		= &min_t2,
> -		.extra2		= &max_t2
> -	},
> -	{
> -		.procname	= "transport_busy_delay",
> -		.data		= &sysctl_netrom_transport_busy_delay,
> -		.maxlen		= sizeof(int),
> -		.mode		= 0644,
> -		.proc_handler	= proc_dointvec_minmax,
> -		.extra1		= &min_t4,
> -		.extra2		= &max_t4
> -	},
> -	{
> -		.procname	= "transport_requested_window_size",
> -		.data		= &sysctl_netrom_transport_requested_window_size,
> -		.maxlen		= sizeof(int),
> -		.mode		= 0644,
> -		.proc_handler	= proc_dointvec_minmax,
> -		.extra1		= &min_window,
> -		.extra2		= &max_window
> -	},
> -	{
> -		.procname	= "transport_no_activity_timeout",
> -		.data		= &sysctl_netrom_transport_no_activity_timeout,
> -		.maxlen		= sizeof(int),
> -		.mode		= 0644,
> -		.proc_handler	= proc_dointvec_minmax,
> -		.extra1		= &min_idle,
> -		.extra2		= &max_idle
> -	},
> -	{
> -		.procname	= "routing_control",
> -		.data		= &sysctl_netrom_routing_control,
> -		.maxlen		= sizeof(int),
> -		.mode		= 0644,
> -		.proc_handler	= proc_dointvec_minmax,
> -		.extra1		= &min_route,
> -		.extra2		= &max_route
> -	},
> -	{
> -		.procname	= "link_fails_count",
> -		.data		= &sysctl_netrom_link_fails_count,
> -		.maxlen		= sizeof(int),
> -		.mode		= 0644,
> -		.proc_handler	= proc_dointvec_minmax,
> -		.extra1		= &min_fails,
> -		.extra2		= &max_fails
> -	},
> -	{
> -		.procname	= "reset",
> -		.data		= &sysctl_netrom_reset_circuit,
> -		.maxlen		= sizeof(int),
> -		.mode		= 0644,
> -		.proc_handler	= proc_dointvec_minmax,
> -		.extra1		= &min_reset,
> -		.extra2		= &max_reset
> -	},
> -};
> -
> -int __init nr_register_sysctl(void)
> -{
> -	nr_table_header = register_net_sysctl(&init_net, "net/netrom", nr_table);
> -	if (!nr_table_header)
> -		return -ENOMEM;
> -	return 0;
> -}
> -
> -void nr_unregister_sysctl(void)
> -{
> -	unregister_net_sysctl_table(nr_table_header);
> -}
> diff --git a/net/rose/af_rose.c b/net/rose/af_rose.c
> deleted file mode 100644
> index d5032840ee48..000000000000
> --- a/net/rose/af_rose.c
> +++ /dev/null
> @@ -1,1687 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-or-later
> -/*
> - *
> - * Copyright (C) Jonathan Naylor G4KLX (g4klx@g4klx.demon.co.uk)
> - * Copyright (C) Alan Cox GW4PTS (alan@lxorguk.ukuu.org.uk)
> - * Copyright (C) Terry Dawson VK2KTJ (terry@animats.net)
> - * Copyright (C) Tomi Manninen OH2BNS (oh2bns@sral.fi)
> - */
> -
> -#include <linux/capability.h>
> -#include <linux/module.h>
> -#include <linux/moduleparam.h>
> -#include <linux/init.h>
> -#include <linux/errno.h>
> -#include <linux/types.h>
> -#include <linux/socket.h>
> -#include <linux/in.h>
> -#include <linux/slab.h>
> -#include <linux/kernel.h>
> -#include <linux/sched/signal.h>
> -#include <linux/spinlock.h>
> -#include <linux/timer.h>
> -#include <linux/string.h>
> -#include <linux/sockios.h>
> -#include <linux/net.h>
> -#include <linux/stat.h>
> -#include <net/net_namespace.h>
> -#include <net/ax25.h>
> -#include <linux/inet.h>
> -#include <linux/netdevice.h>
> -#include <linux/if_arp.h>
> -#include <linux/skbuff.h>
> -#include <net/sock.h>
> -#include <linux/uaccess.h>
> -#include <linux/fcntl.h>
> -#include <linux/termios.h>
> -#include <linux/mm.h>
> -#include <linux/interrupt.h>
> -#include <linux/notifier.h>
> -#include <net/rose.h>
> -#include <linux/proc_fs.h>
> -#include <linux/seq_file.h>
> -#include <net/tcp_states.h>
> -#include <net/ip.h>
> -#include <net/arp.h>
> -
> -static int rose_ndevs = 10;
> -
> -int sysctl_rose_restart_request_timeout = ROSE_DEFAULT_T0;
> -int sysctl_rose_call_request_timeout    = ROSE_DEFAULT_T1;
> -int sysctl_rose_reset_request_timeout   = ROSE_DEFAULT_T2;
> -int sysctl_rose_clear_request_timeout   = ROSE_DEFAULT_T3;
> -int sysctl_rose_no_activity_timeout     = ROSE_DEFAULT_IDLE;
> -int sysctl_rose_ack_hold_back_timeout   = ROSE_DEFAULT_HB;
> -int sysctl_rose_routing_control         = ROSE_DEFAULT_ROUTING;
> -int sysctl_rose_link_fail_timeout       = ROSE_DEFAULT_FAIL_TIMEOUT;
> -int sysctl_rose_maximum_vcs             = ROSE_DEFAULT_MAXVC;
> -int sysctl_rose_window_size             = ROSE_DEFAULT_WINDOW_SIZE;
> -
> -static HLIST_HEAD(rose_list);
> -static DEFINE_SPINLOCK(rose_list_lock);
> -
> -static const struct proto_ops rose_proto_ops;
> -
> -ax25_address rose_callsign;
> -
> -/*
> - * ROSE network devices are virtual network devices encapsulating ROSE
> - * frames into AX.25 which will be sent through an AX.25 device, so form a
> - * special "super class" of normal net devices; split their locks off into a
> - * separate class since they always nest.
> - */
> -static struct lock_class_key rose_netdev_xmit_lock_key;
> -static struct lock_class_key rose_netdev_addr_lock_key;
> -
> -static void rose_set_lockdep_one(struct net_device *dev,
> -				 struct netdev_queue *txq,
> -				 void *_unused)
> -{
> -	lockdep_set_class(&txq->_xmit_lock, &rose_netdev_xmit_lock_key);
> -}
> -
> -static void rose_set_lockdep_key(struct net_device *dev)
> -{
> -	lockdep_set_class(&dev->addr_list_lock, &rose_netdev_addr_lock_key);
> -	netdev_for_each_tx_queue(dev, rose_set_lockdep_one, NULL);
> -}
> -
> -/*
> - *	Convert a ROSE address into text.
> - */
> -char *rose2asc(char *buf, const rose_address *addr)
> -{
> -	if (addr->rose_addr[0] == 0x00 && addr->rose_addr[1] == 0x00 &&
> -	    addr->rose_addr[2] == 0x00 && addr->rose_addr[3] == 0x00 &&
> -	    addr->rose_addr[4] == 0x00) {
> -		strcpy(buf, "*");
> -	} else {
> -		sprintf(buf, "%02X%02X%02X%02X%02X", addr->rose_addr[0] & 0xFF,
> -						addr->rose_addr[1] & 0xFF,
> -						addr->rose_addr[2] & 0xFF,
> -						addr->rose_addr[3] & 0xFF,
> -						addr->rose_addr[4] & 0xFF);
> -	}
> -
> -	return buf;
> -}
> -
> -/*
> - *	Compare two ROSE addresses, 0 == equal.
> - */
> -int rosecmp(const rose_address *addr1, const rose_address *addr2)
> -{
> -	int i;
> -
> -	for (i = 0; i < 5; i++)
> -		if (addr1->rose_addr[i] != addr2->rose_addr[i])
> -			return 1;
> -
> -	return 0;
> -}
> -
> -/*
> - *	Compare two ROSE addresses for only mask digits, 0 == equal.
> - */
> -int rosecmpm(const rose_address *addr1, const rose_address *addr2,
> -	     unsigned short mask)
> -{
> -	unsigned int i, j;
> -
> -	if (mask > 10)
> -		return 1;
> -
> -	for (i = 0; i < mask; i++) {
> -		j = i / 2;
> -
> -		if ((i % 2) != 0) {
> -			if ((addr1->rose_addr[j] & 0x0F) != (addr2->rose_addr[j] & 0x0F))
> -				return 1;
> -		} else {
> -			if ((addr1->rose_addr[j] & 0xF0) != (addr2->rose_addr[j] & 0xF0))
> -				return 1;
> -		}
> -	}
> -
> -	return 0;
> -}
> -
> -/*
> - *	Socket removal during an interrupt is now safe.
> - */
> -static void rose_remove_socket(struct sock *sk)
> -{
> -	spin_lock_bh(&rose_list_lock);
> -	sk_del_node_init(sk);
> -	spin_unlock_bh(&rose_list_lock);
> -}
> -
> -/*
> - *	Kill all bound sockets on a broken link layer connection to a
> - *	particular neighbour.
> - */
> -void rose_kill_by_neigh(struct rose_neigh *neigh)
> -{
> -	struct sock *s;
> -
> -	spin_lock_bh(&rose_list_lock);
> -	sk_for_each(s, &rose_list) {
> -		struct rose_sock *rose = rose_sk(s);
> -
> -		if (rose->neighbour == neigh) {
> -			rose_disconnect(s, ENETUNREACH, ROSE_OUT_OF_ORDER, 0);
> -			rose_neigh_put(rose->neighbour);
> -			rose->neighbour = NULL;
> -		}
> -	}
> -	spin_unlock_bh(&rose_list_lock);
> -}
> -
> -/*
> - *	Kill all bound sockets on a dropped device.
> - */
> -static void rose_kill_by_device(struct net_device *dev)
> -{
> -	struct sock *sk, *array[16];
> -	struct rose_sock *rose;
> -	bool rescan;
> -	int i, cnt;
> -
> -start:
> -	rescan = false;
> -	cnt = 0;
> -	spin_lock_bh(&rose_list_lock);
> -	sk_for_each(sk, &rose_list) {
> -		rose = rose_sk(sk);
> -		if (rose->device == dev) {
> -			if (cnt == ARRAY_SIZE(array)) {
> -				rescan = true;
> -				break;
> -			}
> -			sock_hold(sk);
> -			array[cnt++] = sk;
> -		}
> -	}
> -	spin_unlock_bh(&rose_list_lock);
> -
> -	for (i = 0; i < cnt; i++) {
> -		sk = array[i];
> -		rose = rose_sk(sk);
> -		lock_sock(sk);
> -		spin_lock_bh(&rose_list_lock);
> -		if (rose->device == dev) {
> -			rose_disconnect(sk, ENETUNREACH, ROSE_OUT_OF_ORDER, 0);
> -			if (rose->neighbour)
> -				rose_neigh_put(rose->neighbour);
> -			netdev_put(rose->device, &rose->dev_tracker);
> -			rose->device = NULL;
> -		}
> -		spin_unlock_bh(&rose_list_lock);
> -		release_sock(sk);
> -		sock_put(sk);
> -		cond_resched();
> -	}
> -	if (rescan)
> -		goto start;
> -}
> -
> -/*
> - *	Handle device status changes.
> - */
> -static int rose_device_event(struct notifier_block *this,
> -			     unsigned long event, void *ptr)
> -{
> -	struct net_device *dev = netdev_notifier_info_to_dev(ptr);
> -
> -	if (!net_eq(dev_net(dev), &init_net))
> -		return NOTIFY_DONE;
> -
> -	if (event != NETDEV_DOWN)
> -		return NOTIFY_DONE;
> -
> -	switch (dev->type) {
> -	case ARPHRD_ROSE:
> -		rose_kill_by_device(dev);
> -		break;
> -	case ARPHRD_AX25:
> -		rose_link_device_down(dev);
> -		rose_rt_device_down(dev);
> -		break;
> -	}
> -
> -	return NOTIFY_DONE;
> -}
> -
> -/*
> - *	Add a socket to the bound sockets list.
> - */
> -static void rose_insert_socket(struct sock *sk)
> -{
> -
> -	spin_lock_bh(&rose_list_lock);
> -	sk_add_node(sk, &rose_list);
> -	spin_unlock_bh(&rose_list_lock);
> -}
> -
> -/*
> - *	Find a socket that wants to accept the Call Request we just
> - *	received.
> - */
> -static struct sock *rose_find_listener(rose_address *addr, ax25_address *call)
> -{
> -	struct sock *s;
> -
> -	spin_lock_bh(&rose_list_lock);
> -	sk_for_each(s, &rose_list) {
> -		struct rose_sock *rose = rose_sk(s);
> -
> -		if (!rosecmp(&rose->source_addr, addr) &&
> -		    !ax25cmp(&rose->source_call, call) &&
> -		    !rose->source_ndigis && s->sk_state == TCP_LISTEN)
> -			goto found;
> -	}
> -
> -	sk_for_each(s, &rose_list) {
> -		struct rose_sock *rose = rose_sk(s);
> -
> -		if (!rosecmp(&rose->source_addr, addr) &&
> -		    !ax25cmp(&rose->source_call, &null_ax25_address) &&
> -		    s->sk_state == TCP_LISTEN)
> -			goto found;
> -	}
> -	s = NULL;
> -found:
> -	spin_unlock_bh(&rose_list_lock);
> -	return s;
> -}
> -
> -/*
> - *	Find a connected ROSE socket given my LCI and device.
> - */
> -struct sock *rose_find_socket(unsigned int lci, struct rose_neigh *neigh)
> -{
> -	struct sock *s;
> -
> -	spin_lock_bh(&rose_list_lock);
> -	sk_for_each(s, &rose_list) {
> -		struct rose_sock *rose = rose_sk(s);
> -
> -		if (rose->lci == lci && rose->neighbour == neigh)
> -			goto found;
> -	}
> -	s = NULL;
> -found:
> -	spin_unlock_bh(&rose_list_lock);
> -	return s;
> -}
> -
> -/*
> - *	Find a unique LCI for a given device.
> - */
> -unsigned int rose_new_lci(struct rose_neigh *neigh)
> -{
> -	int lci;
> -
> -	if (neigh->dce_mode) {
> -		for (lci = 1; lci <= sysctl_rose_maximum_vcs; lci++)
> -			if (rose_find_socket(lci, neigh) == NULL && rose_route_free_lci(lci, neigh) == NULL)
> -				return lci;
> -	} else {
> -		for (lci = sysctl_rose_maximum_vcs; lci > 0; lci--)
> -			if (rose_find_socket(lci, neigh) == NULL && rose_route_free_lci(lci, neigh) == NULL)
> -				return lci;
> -	}
> -
> -	return 0;
> -}
> -
> -/*
> - *	Deferred destroy.
> - */
> -void rose_destroy_socket(struct sock *);
> -
> -/*
> - *	Handler for deferred kills.
> - */
> -static void rose_destroy_timer(struct timer_list *t)
> -{
> -	struct sock *sk = timer_container_of(sk, t, sk_timer);
> -
> -	rose_destroy_socket(sk);
> -}
> -
> -/*
> - *	This is called from user mode and the timers. Thus it protects itself
> - *	against interrupt users but doesn't worry about being called during
> - *	work.  Once it is removed from the queue no interrupt or bottom half
> - *	will touch it and we are (fairly 8-) ) safe.
> - */
> -void rose_destroy_socket(struct sock *sk)
> -{
> -	struct sk_buff *skb;
> -
> -	rose_remove_socket(sk);
> -	rose_stop_heartbeat(sk);
> -	rose_stop_idletimer(sk);
> -	rose_stop_timer(sk);
> -
> -	rose_clear_queues(sk);		/* Flush the queues */
> -
> -	while ((skb = skb_dequeue(&sk->sk_receive_queue)) != NULL) {
> -		if (skb->sk != sk) {	/* A pending connection */
> -			/* Queue the unaccepted socket for death */
> -			sock_set_flag(skb->sk, SOCK_DEAD);
> -			rose_start_heartbeat(skb->sk);
> -			rose_sk(skb->sk)->state = ROSE_STATE_0;
> -		}
> -
> -		kfree_skb(skb);
> -	}
> -
> -	if (sk_has_allocations(sk)) {
> -		/* Defer: outstanding buffers */
> -		timer_setup(&sk->sk_timer, rose_destroy_timer, 0);
> -		sk->sk_timer.expires  = jiffies + 10 * HZ;
> -		add_timer(&sk->sk_timer);
> -	} else
> -		sock_put(sk);
> -}
> -
> -/*
> - *	Handling for system calls applied via the various interfaces to a
> - *	ROSE socket object.
> - */
> -
> -static int rose_setsockopt(struct socket *sock, int level, int optname,
> -		sockptr_t optval, unsigned int optlen)
> -{
> -	struct sock *sk = sock->sk;
> -	struct rose_sock *rose = rose_sk(sk);
> -	unsigned int opt;
> -
> -	if (level != SOL_ROSE)
> -		return -ENOPROTOOPT;
> -
> -	if (optlen < sizeof(unsigned int))
> -		return -EINVAL;
> -
> -	if (copy_from_sockptr(&opt, optval, sizeof(unsigned int)))
> -		return -EFAULT;
> -
> -	switch (optname) {
> -	case ROSE_DEFER:
> -		rose->defer = opt ? 1 : 0;
> -		return 0;
> -
> -	case ROSE_T1:
> -		if (opt < 1 || opt > UINT_MAX / HZ)
> -			return -EINVAL;
> -		rose->t1 = opt * HZ;
> -		return 0;
> -
> -	case ROSE_T2:
> -		if (opt < 1 || opt > UINT_MAX / HZ)
> -			return -EINVAL;
> -		rose->t2 = opt * HZ;
> -		return 0;
> -
> -	case ROSE_T3:
> -		if (opt < 1 || opt > UINT_MAX / HZ)
> -			return -EINVAL;
> -		rose->t3 = opt * HZ;
> -		return 0;
> -
> -	case ROSE_HOLDBACK:
> -		if (opt < 1 || opt > UINT_MAX / HZ)
> -			return -EINVAL;
> -		rose->hb = opt * HZ;
> -		return 0;
> -
> -	case ROSE_IDLE:
> -		if (opt > UINT_MAX / (60 * HZ))
> -			return -EINVAL;
> -		rose->idle = opt * 60 * HZ;
> -		return 0;
> -
> -	case ROSE_QBITINCL:
> -		rose->qbitincl = opt ? 1 : 0;
> -		return 0;
> -
> -	default:
> -		return -ENOPROTOOPT;
> -	}
> -}
> -
> -static int rose_getsockopt(struct socket *sock, int level, int optname,
> -	char __user *optval, int __user *optlen)
> -{
> -	struct sock *sk = sock->sk;
> -	struct rose_sock *rose = rose_sk(sk);
> -	int val = 0;
> -	int len;
> -
> -	if (level != SOL_ROSE)
> -		return -ENOPROTOOPT;
> -
> -	if (get_user(len, optlen))
> -		return -EFAULT;
> -
> -	if (len < 0)
> -		return -EINVAL;
> -
> -	switch (optname) {
> -	case ROSE_DEFER:
> -		val = rose->defer;
> -		break;
> -
> -	case ROSE_T1:
> -		val = rose->t1 / HZ;
> -		break;
> -
> -	case ROSE_T2:
> -		val = rose->t2 / HZ;
> -		break;
> -
> -	case ROSE_T3:
> -		val = rose->t3 / HZ;
> -		break;
> -
> -	case ROSE_HOLDBACK:
> -		val = rose->hb / HZ;
> -		break;
> -
> -	case ROSE_IDLE:
> -		val = rose->idle / (60 * HZ);
> -		break;
> -
> -	case ROSE_QBITINCL:
> -		val = rose->qbitincl;
> -		break;
> -
> -	default:
> -		return -ENOPROTOOPT;
> -	}
> -
> -	len = min_t(unsigned int, len, sizeof(int));
> -
> -	if (put_user(len, optlen))
> -		return -EFAULT;
> -
> -	return copy_to_user(optval, &val, len) ? -EFAULT : 0;
> -}
> -
> -static int rose_listen(struct socket *sock, int backlog)
> -{
> -	struct sock *sk = sock->sk;
> -
> -	lock_sock(sk);
> -	if (sock->state != SS_UNCONNECTED) {
> -		release_sock(sk);
> -		return -EINVAL;
> -	}
> -
> -	if (sk->sk_state != TCP_LISTEN) {
> -		struct rose_sock *rose = rose_sk(sk);
> -
> -		rose->dest_ndigis = 0;
> -		memset(&rose->dest_addr, 0, ROSE_ADDR_LEN);
> -		memset(&rose->dest_call, 0, AX25_ADDR_LEN);
> -		memset(rose->dest_digis, 0, AX25_ADDR_LEN * ROSE_MAX_DIGIS);
> -		sk->sk_max_ack_backlog = backlog;
> -		sk->sk_state           = TCP_LISTEN;
> -		release_sock(sk);
> -		return 0;
> -	}
> -	release_sock(sk);
> -
> -	return -EOPNOTSUPP;
> -}
> -
> -static struct proto rose_proto = {
> -	.name	  = "ROSE",
> -	.owner	  = THIS_MODULE,
> -	.obj_size = sizeof(struct rose_sock),
> -};
> -
> -static int rose_create(struct net *net, struct socket *sock, int protocol,
> -		       int kern)
> -{
> -	struct sock *sk;
> -	struct rose_sock *rose;
> -
> -	if (!net_eq(net, &init_net))
> -		return -EAFNOSUPPORT;
> -
> -	if (sock->type != SOCK_SEQPACKET || protocol != 0)
> -		return -ESOCKTNOSUPPORT;
> -
> -	sk = sk_alloc(net, PF_ROSE, GFP_ATOMIC, &rose_proto, kern);
> -	if (sk == NULL)
> -		return -ENOMEM;
> -
> -	rose = rose_sk(sk);
> -
> -	sock_init_data(sock, sk);
> -
> -	skb_queue_head_init(&rose->ack_queue);
> -#ifdef M_BIT
> -	skb_queue_head_init(&rose->frag_queue);
> -	rose->fraglen    = 0;
> -#endif
> -
> -	sock->ops    = &rose_proto_ops;
> -	sk->sk_protocol = protocol;
> -
> -	timer_setup(&rose->timer, NULL, 0);
> -	timer_setup(&rose->idletimer, NULL, 0);
> -
> -	rose->t1   = msecs_to_jiffies(sysctl_rose_call_request_timeout);
> -	rose->t2   = msecs_to_jiffies(sysctl_rose_reset_request_timeout);
> -	rose->t3   = msecs_to_jiffies(sysctl_rose_clear_request_timeout);
> -	rose->hb   = msecs_to_jiffies(sysctl_rose_ack_hold_back_timeout);
> -	rose->idle = msecs_to_jiffies(sysctl_rose_no_activity_timeout);
> -
> -	rose->state = ROSE_STATE_0;
> -
> -	return 0;
> -}
> -
> -static struct sock *rose_make_new(struct sock *osk)
> -{
> -	struct sock *sk;
> -	struct rose_sock *rose, *orose;
> -
> -	if (osk->sk_type != SOCK_SEQPACKET)
> -		return NULL;
> -
> -	sk = sk_alloc(sock_net(osk), PF_ROSE, GFP_ATOMIC, &rose_proto, 0);
> -	if (sk == NULL)
> -		return NULL;
> -
> -	rose = rose_sk(sk);
> -
> -	sock_init_data(NULL, sk);
> -
> -	skb_queue_head_init(&rose->ack_queue);
> -#ifdef M_BIT
> -	skb_queue_head_init(&rose->frag_queue);
> -	rose->fraglen  = 0;
> -#endif
> -
> -	sk->sk_type     = osk->sk_type;
> -	sk->sk_priority = READ_ONCE(osk->sk_priority);
> -	sk->sk_protocol = osk->sk_protocol;
> -	sk->sk_rcvbuf   = osk->sk_rcvbuf;
> -	sk->sk_sndbuf   = osk->sk_sndbuf;
> -	sk->sk_state    = TCP_ESTABLISHED;
> -	sock_copy_flags(sk, osk);
> -
> -	timer_setup(&rose->timer, NULL, 0);
> -	timer_setup(&rose->idletimer, NULL, 0);
> -
> -	orose		= rose_sk(osk);
> -	rose->t1	= orose->t1;
> -	rose->t2	= orose->t2;
> -	rose->t3	= orose->t3;
> -	rose->hb	= orose->hb;
> -	rose->idle	= orose->idle;
> -	rose->defer	= orose->defer;
> -	rose->device	= orose->device;
> -	if (rose->device)
> -		netdev_hold(rose->device, &rose->dev_tracker, GFP_ATOMIC);
> -	rose->qbitincl	= orose->qbitincl;
> -
> -	return sk;
> -}
> -
> -static int rose_release(struct socket *sock)
> -{
> -	struct sock *sk = sock->sk;
> -	struct rose_sock *rose;
> -
> -	if (sk == NULL) return 0;
> -
> -	sock_hold(sk);
> -	sock_orphan(sk);
> -	lock_sock(sk);
> -	rose = rose_sk(sk);
> -
> -	switch (rose->state) {
> -	case ROSE_STATE_0:
> -		release_sock(sk);
> -		rose_disconnect(sk, 0, -1, -1);
> -		lock_sock(sk);
> -		rose_destroy_socket(sk);
> -		break;
> -
> -	case ROSE_STATE_2:
> -		rose_neigh_put(rose->neighbour);
> -		release_sock(sk);
> -		rose_disconnect(sk, 0, -1, -1);
> -		lock_sock(sk);
> -		rose_destroy_socket(sk);
> -		break;
> -
> -	case ROSE_STATE_1:
> -	case ROSE_STATE_3:
> -	case ROSE_STATE_4:
> -	case ROSE_STATE_5:
> -		rose_clear_queues(sk);
> -		rose_stop_idletimer(sk);
> -		rose_write_internal(sk, ROSE_CLEAR_REQUEST);
> -		rose_start_t3timer(sk);
> -		rose->state  = ROSE_STATE_2;
> -		sk->sk_state    = TCP_CLOSE;
> -		sk->sk_shutdown |= SEND_SHUTDOWN;
> -		sk->sk_state_change(sk);
> -		sock_set_flag(sk, SOCK_DEAD);
> -		sock_set_flag(sk, SOCK_DESTROY);
> -		break;
> -
> -	default:
> -		break;
> -	}
> -
> -	spin_lock_bh(&rose_list_lock);
> -	netdev_put(rose->device, &rose->dev_tracker);
> -	rose->device = NULL;
> -	spin_unlock_bh(&rose_list_lock);
> -	sock->sk = NULL;
> -	release_sock(sk);
> -	sock_put(sk);
> -
> -	return 0;
> -}
> -
> -static int rose_bind(struct socket *sock, struct sockaddr_unsized *uaddr, int addr_len)
> -{
> -	struct sock *sk = sock->sk;
> -	struct rose_sock *rose = rose_sk(sk);
> -	struct sockaddr_rose *addr = (struct sockaddr_rose *)uaddr;
> -	struct net_device *dev;
> -	ax25_address *source;
> -	ax25_uid_assoc *user;
> -	int err = -EINVAL;
> -	int n;
> -
> -	if (addr_len != sizeof(struct sockaddr_rose) && addr_len != sizeof(struct full_sockaddr_rose))
> -		return -EINVAL;
> -
> -	if (addr->srose_family != AF_ROSE)
> -		return -EINVAL;
> -
> -	if (addr_len == sizeof(struct sockaddr_rose) && addr->srose_ndigis > 1)
> -		return -EINVAL;
> -
> -	if ((unsigned int) addr->srose_ndigis > ROSE_MAX_DIGIS)
> -		return -EINVAL;
> -
> -	lock_sock(sk);
> -
> -	if (!sock_flag(sk, SOCK_ZAPPED))
> -		goto out_release;
> -
> -	err = -EADDRNOTAVAIL;
> -	dev = rose_dev_get(&addr->srose_addr);
> -	if (!dev)
> -		goto out_release;
> -
> -	source = &addr->srose_call;
> -
> -	user = ax25_findbyuid(current_euid());
> -	if (user) {
> -		rose->source_call = user->call;
> -		ax25_uid_put(user);
> -	} else {
> -		if (ax25_uid_policy && !capable(CAP_NET_BIND_SERVICE)) {
> -			dev_put(dev);
> -			err = -EACCES;
> -			goto out_release;
> -		}
> -		rose->source_call   = *source;
> -	}
> -
> -	rose->source_addr   = addr->srose_addr;
> -	rose->device        = dev;
> -	netdev_tracker_alloc(rose->device, &rose->dev_tracker, GFP_KERNEL);
> -	rose->source_ndigis = addr->srose_ndigis;
> -
> -	if (addr_len == sizeof(struct full_sockaddr_rose)) {
> -		struct full_sockaddr_rose *full_addr = (struct full_sockaddr_rose *)uaddr;
> -		for (n = 0 ; n < addr->srose_ndigis ; n++)
> -			rose->source_digis[n] = full_addr->srose_digis[n];
> -	} else {
> -		if (rose->source_ndigis == 1) {
> -			rose->source_digis[0] = addr->srose_digi;
> -		}
> -	}
> -
> -	rose_insert_socket(sk);
> -
> -	sock_reset_flag(sk, SOCK_ZAPPED);
> -	err = 0;
> -out_release:
> -	release_sock(sk);
> -	return err;
> -}
> -
> -static int rose_connect(struct socket *sock, struct sockaddr_unsized *uaddr, int addr_len,
> -			int flags)
> -{
> -	struct sock *sk = sock->sk;
> -	struct rose_sock *rose = rose_sk(sk);
> -	struct sockaddr_rose *addr = (struct sockaddr_rose *)uaddr;
> -	unsigned char cause, diagnostic;
> -	ax25_uid_assoc *user;
> -	int n, err = 0;
> -
> -	if (addr_len != sizeof(struct sockaddr_rose) && addr_len != sizeof(struct full_sockaddr_rose))
> -		return -EINVAL;
> -
> -	if (addr->srose_family != AF_ROSE)
> -		return -EINVAL;
> -
> -	if (addr_len == sizeof(struct sockaddr_rose) && addr->srose_ndigis > 1)
> -		return -EINVAL;
> -
> -	if ((unsigned int) addr->srose_ndigis > ROSE_MAX_DIGIS)
> -		return -EINVAL;
> -
> -	/* Source + Destination digis should not exceed ROSE_MAX_DIGIS */
> -	if ((rose->source_ndigis + addr->srose_ndigis) > ROSE_MAX_DIGIS)
> -		return -EINVAL;
> -
> -	lock_sock(sk);
> -
> -	if (sk->sk_state == TCP_ESTABLISHED && sock->state == SS_CONNECTING) {
> -		/* Connect completed during a ERESTARTSYS event */
> -		sock->state = SS_CONNECTED;
> -		goto out_release;
> -	}
> -
> -	if (sk->sk_state == TCP_CLOSE && sock->state == SS_CONNECTING) {
> -		sock->state = SS_UNCONNECTED;
> -		err = -ECONNREFUSED;
> -		goto out_release;
> -	}
> -
> -	if (sk->sk_state == TCP_ESTABLISHED) {
> -		/* No reconnect on a seqpacket socket */
> -		err = -EISCONN;
> -		goto out_release;
> -	}
> -
> -	if (sk->sk_state == TCP_SYN_SENT) {
> -		err = -EALREADY;
> -		goto out_release;
> -	}
> -
> -	sk->sk_state   = TCP_CLOSE;
> -	sock->state = SS_UNCONNECTED;
> -
> -	rose->neighbour = rose_get_neigh(&addr->srose_addr, &cause,
> -					 &diagnostic, 0);
> -	if (!rose->neighbour) {
> -		err = -ENETUNREACH;
> -		goto out_release;
> -	}
> -
> -	rose->lci = rose_new_lci(rose->neighbour);
> -	if (!rose->lci) {
> -		err = -ENETUNREACH;
> -		rose_neigh_put(rose->neighbour);
> -		goto out_release;
> -	}
> -
> -	if (sock_flag(sk, SOCK_ZAPPED)) {	/* Must bind first - autobinding in this may or may not work */
> -		struct net_device *dev;
> -
> -		sock_reset_flag(sk, SOCK_ZAPPED);
> -
> -		dev = rose_dev_first();
> -		if (!dev) {
> -			err = -ENETUNREACH;
> -			rose_neigh_put(rose->neighbour);
> -			goto out_release;
> -		}
> -
> -		user = ax25_findbyuid(current_euid());
> -		if (!user) {
> -			err = -EINVAL;
> -			rose_neigh_put(rose->neighbour);
> -			dev_put(dev);
> -			goto out_release;
> -		}
> -
> -		memcpy(&rose->source_addr, dev->dev_addr, ROSE_ADDR_LEN);
> -		rose->source_call = user->call;
> -		rose->device      = dev;
> -		netdev_tracker_alloc(rose->device, &rose->dev_tracker,
> -				     GFP_KERNEL);
> -		ax25_uid_put(user);
> -
> -		rose_insert_socket(sk);		/* Finish the bind */
> -	}
> -	rose->dest_addr   = addr->srose_addr;
> -	rose->dest_call   = addr->srose_call;
> -	rose->rand        = ((long)rose & 0xFFFF) + rose->lci;
> -	rose->dest_ndigis = addr->srose_ndigis;
> -
> -	if (addr_len == sizeof(struct full_sockaddr_rose)) {
> -		struct full_sockaddr_rose *full_addr = (struct full_sockaddr_rose *)uaddr;
> -		for (n = 0 ; n < addr->srose_ndigis ; n++)
> -			rose->dest_digis[n] = full_addr->srose_digis[n];
> -	} else {
> -		if (rose->dest_ndigis == 1) {
> -			rose->dest_digis[0] = addr->srose_digi;
> -		}
> -	}
> -
> -	/* Move to connecting socket, start sending Connect Requests */
> -	sock->state   = SS_CONNECTING;
> -	sk->sk_state     = TCP_SYN_SENT;
> -
> -	rose->state = ROSE_STATE_1;
> -
> -	rose_write_internal(sk, ROSE_CALL_REQUEST);
> -	rose_start_heartbeat(sk);
> -	rose_start_t1timer(sk);
> -
> -	/* Now the loop */
> -	if (sk->sk_state != TCP_ESTABLISHED && (flags & O_NONBLOCK)) {
> -		err = -EINPROGRESS;
> -		goto out_release;
> -	}
> -
> -	/*
> -	 * A Connect Ack with Choke or timeout or failed routing will go to
> -	 * closed.
> -	 */
> -	if (sk->sk_state == TCP_SYN_SENT) {
> -		DEFINE_WAIT(wait);
> -
> -		for (;;) {
> -			prepare_to_wait(sk_sleep(sk), &wait,
> -					TASK_INTERRUPTIBLE);
> -			if (sk->sk_state != TCP_SYN_SENT)
> -				break;
> -			if (!signal_pending(current)) {
> -				release_sock(sk);
> -				schedule();
> -				lock_sock(sk);
> -				continue;
> -			}
> -			err = -ERESTARTSYS;
> -			break;
> -		}
> -		finish_wait(sk_sleep(sk), &wait);
> -
> -		if (err)
> -			goto out_release;
> -	}
> -
> -	if (sk->sk_state != TCP_ESTABLISHED) {
> -		sock->state = SS_UNCONNECTED;
> -		err = sock_error(sk);	/* Always set at this point */
> -		goto out_release;
> -	}
> -
> -	sock->state = SS_CONNECTED;
> -
> -out_release:
> -	release_sock(sk);
> -
> -	return err;
> -}
> -
> -static int rose_accept(struct socket *sock, struct socket *newsock,
> -		       struct proto_accept_arg *arg)
> -{
> -	struct sk_buff *skb;
> -	struct sock *newsk;
> -	DEFINE_WAIT(wait);
> -	struct sock *sk;
> -	int err = 0;
> -
> -	if ((sk = sock->sk) == NULL)
> -		return -EINVAL;
> -
> -	lock_sock(sk);
> -	if (sk->sk_type != SOCK_SEQPACKET) {
> -		err = -EOPNOTSUPP;
> -		goto out_release;
> -	}
> -
> -	if (sk->sk_state != TCP_LISTEN) {
> -		err = -EINVAL;
> -		goto out_release;
> -	}
> -
> -	/*
> -	 *	The write queue this time is holding sockets ready to use
> -	 *	hooked into the SABM we saved
> -	 */
> -	for (;;) {
> -		prepare_to_wait(sk_sleep(sk), &wait, TASK_INTERRUPTIBLE);
> -
> -		skb = skb_dequeue(&sk->sk_receive_queue);
> -		if (skb)
> -			break;
> -
> -		if (arg->flags & O_NONBLOCK) {
> -			err = -EWOULDBLOCK;
> -			break;
> -		}
> -		if (!signal_pending(current)) {
> -			release_sock(sk);
> -			schedule();
> -			lock_sock(sk);
> -			continue;
> -		}
> -		err = -ERESTARTSYS;
> -		break;
> -	}
> -	finish_wait(sk_sleep(sk), &wait);
> -	if (err)
> -		goto out_release;
> -
> -	newsk = skb->sk;
> -	sock_graft(newsk, newsock);
> -
> -	/* Now attach up the new socket */
> -	skb->sk = NULL;
> -	kfree_skb(skb);
> -	sk_acceptq_removed(sk);
> -
> -out_release:
> -	release_sock(sk);
> -
> -	return err;
> -}
> -
> -static int rose_getname(struct socket *sock, struct sockaddr *uaddr,
> -	int peer)
> -{
> -	struct full_sockaddr_rose *srose = (struct full_sockaddr_rose *)uaddr;
> -	struct sock *sk = sock->sk;
> -	struct rose_sock *rose = rose_sk(sk);
> -	int n;
> -
> -	memset(srose, 0, sizeof(*srose));
> -	if (peer != 0) {
> -		if (sk->sk_state != TCP_ESTABLISHED)
> -			return -ENOTCONN;
> -		srose->srose_family = AF_ROSE;
> -		srose->srose_addr   = rose->dest_addr;
> -		srose->srose_call   = rose->dest_call;
> -		srose->srose_ndigis = rose->dest_ndigis;
> -		for (n = 0; n < rose->dest_ndigis; n++)
> -			srose->srose_digis[n] = rose->dest_digis[n];
> -	} else {
> -		srose->srose_family = AF_ROSE;
> -		srose->srose_addr   = rose->source_addr;
> -		srose->srose_call   = rose->source_call;
> -		srose->srose_ndigis = rose->source_ndigis;
> -		for (n = 0; n < rose->source_ndigis; n++)
> -			srose->srose_digis[n] = rose->source_digis[n];
> -	}
> -
> -	return sizeof(struct full_sockaddr_rose);
> -}
> -
> -int rose_rx_call_request(struct sk_buff *skb, struct net_device *dev, struct rose_neigh *neigh, unsigned int lci)
> -{
> -	struct sock *sk;
> -	struct sock *make;
> -	struct rose_sock *make_rose;
> -	struct rose_facilities_struct facilities;
> -	int n;
> -
> -	skb->sk = NULL;		/* Initially we don't know who it's for */
> -
> -	/*
> -	 *	skb->data points to the rose frame start
> -	 */
> -	memset(&facilities, 0x00, sizeof(struct rose_facilities_struct));
> -
> -	if (!rose_parse_facilities(skb->data + ROSE_CALL_REQ_FACILITIES_OFF,
> -				   skb->len - ROSE_CALL_REQ_FACILITIES_OFF,
> -				   &facilities)) {
> -		rose_transmit_clear_request(neigh, lci, ROSE_INVALID_FACILITY, 76);
> -		return 0;
> -	}
> -
> -	sk = rose_find_listener(&facilities.source_addr, &facilities.source_call);
> -
> -	/*
> -	 * We can't accept the Call Request.
> -	 */
> -	if (sk == NULL || sk_acceptq_is_full(sk) ||
> -	    (make = rose_make_new(sk)) == NULL) {
> -		rose_transmit_clear_request(neigh, lci, ROSE_NETWORK_CONGESTION, 120);
> -		return 0;
> -	}
> -
> -	skb->sk     = make;
> -	make->sk_state = TCP_ESTABLISHED;
> -	make_rose = rose_sk(make);
> -
> -	make_rose->lci           = lci;
> -	make_rose->dest_addr     = facilities.dest_addr;
> -	make_rose->dest_call     = facilities.dest_call;
> -	make_rose->dest_ndigis   = facilities.dest_ndigis;
> -	for (n = 0 ; n < facilities.dest_ndigis ; n++)
> -		make_rose->dest_digis[n] = facilities.dest_digis[n];
> -	make_rose->source_addr   = facilities.source_addr;
> -	make_rose->source_call   = facilities.source_call;
> -	make_rose->source_ndigis = facilities.source_ndigis;
> -	for (n = 0 ; n < facilities.source_ndigis ; n++)
> -		make_rose->source_digis[n] = facilities.source_digis[n];
> -	make_rose->neighbour     = neigh;
> -	make_rose->device        = dev;
> -	/* Caller got a reference for us. */
> -	netdev_tracker_alloc(make_rose->device, &make_rose->dev_tracker,
> -			     GFP_ATOMIC);
> -	make_rose->facilities    = facilities;
> -
> -	rose_neigh_hold(make_rose->neighbour);
> -
> -	if (rose_sk(sk)->defer) {
> -		make_rose->state = ROSE_STATE_5;
> -	} else {
> -		rose_write_internal(make, ROSE_CALL_ACCEPTED);
> -		make_rose->state = ROSE_STATE_3;
> -		rose_start_idletimer(make);
> -	}
> -
> -	make_rose->condition = 0x00;
> -	make_rose->vs        = 0;
> -	make_rose->va        = 0;
> -	make_rose->vr        = 0;
> -	make_rose->vl        = 0;
> -	sk_acceptq_added(sk);
> -
> -	rose_insert_socket(make);
> -
> -	skb_queue_head(&sk->sk_receive_queue, skb);
> -
> -	rose_start_heartbeat(make);
> -
> -	if (!sock_flag(sk, SOCK_DEAD))
> -		sk->sk_data_ready(sk);
> -
> -	return 1;
> -}
> -
> -static int rose_sendmsg(struct socket *sock, struct msghdr *msg, size_t len)
> -{
> -	struct sock *sk = sock->sk;
> -	struct rose_sock *rose = rose_sk(sk);
> -	DECLARE_SOCKADDR(struct sockaddr_rose *, usrose, msg->msg_name);
> -	int err;
> -	struct full_sockaddr_rose srose;
> -	struct sk_buff *skb;
> -	unsigned char *asmptr;
> -	int n, size, qbit = 0;
> -
> -	if (msg->msg_flags & ~(MSG_DONTWAIT|MSG_EOR|MSG_CMSG_COMPAT))
> -		return -EINVAL;
> -
> -	if (sock_flag(sk, SOCK_ZAPPED))
> -		return -EADDRNOTAVAIL;
> -
> -	if (sk->sk_shutdown & SEND_SHUTDOWN) {
> -		send_sig(SIGPIPE, current, 0);
> -		return -EPIPE;
> -	}
> -
> -	if (rose->neighbour == NULL || rose->device == NULL)
> -		return -ENETUNREACH;
> -
> -	if (usrose != NULL) {
> -		if (msg->msg_namelen != sizeof(struct sockaddr_rose) && msg->msg_namelen != sizeof(struct full_sockaddr_rose))
> -			return -EINVAL;
> -		memset(&srose, 0, sizeof(struct full_sockaddr_rose));
> -		memcpy(&srose, usrose, msg->msg_namelen);
> -		if (rosecmp(&rose->dest_addr, &srose.srose_addr) != 0 ||
> -		    ax25cmp(&rose->dest_call, &srose.srose_call) != 0)
> -			return -EISCONN;
> -		if (srose.srose_ndigis != rose->dest_ndigis)
> -			return -EISCONN;
> -		if (srose.srose_ndigis == rose->dest_ndigis) {
> -			for (n = 0 ; n < srose.srose_ndigis ; n++)
> -				if (ax25cmp(&rose->dest_digis[n],
> -					    &srose.srose_digis[n]))
> -					return -EISCONN;
> -		}
> -		if (srose.srose_family != AF_ROSE)
> -			return -EINVAL;
> -	} else {
> -		if (sk->sk_state != TCP_ESTABLISHED)
> -			return -ENOTCONN;
> -
> -		srose.srose_family = AF_ROSE;
> -		srose.srose_addr   = rose->dest_addr;
> -		srose.srose_call   = rose->dest_call;
> -		srose.srose_ndigis = rose->dest_ndigis;
> -		for (n = 0 ; n < rose->dest_ndigis ; n++)
> -			srose.srose_digis[n] = rose->dest_digis[n];
> -	}
> -
> -	/* Build a packet */
> -	/* Sanity check the packet size */
> -	if (len > 65535)
> -		return -EMSGSIZE;
> -
> -	size = len + AX25_BPQ_HEADER_LEN + AX25_MAX_HEADER_LEN + ROSE_MIN_LEN;
> -
> -	if ((skb = sock_alloc_send_skb(sk, size, msg->msg_flags & MSG_DONTWAIT, &err)) == NULL)
> -		return err;
> -
> -	skb_reserve(skb, AX25_BPQ_HEADER_LEN + AX25_MAX_HEADER_LEN + ROSE_MIN_LEN);
> -
> -	/*
> -	 *	Put the data on the end
> -	 */
> -
> -	skb_reset_transport_header(skb);
> -	skb_put(skb, len);
> -
> -	err = memcpy_from_msg(skb_transport_header(skb), msg, len);
> -	if (err) {
> -		kfree_skb(skb);
> -		return err;
> -	}
> -
> -	/*
> -	 *	If the Q BIT Include socket option is in force, the first
> -	 *	byte of the user data is the logical value of the Q Bit.
> -	 */
> -	if (rose->qbitincl) {
> -		qbit = skb->data[0];
> -		skb_pull(skb, 1);
> -	}
> -
> -	/*
> -	 *	Push down the ROSE header
> -	 */
> -	asmptr = skb_push(skb, ROSE_MIN_LEN);
> -
> -	/* Build a ROSE Network header */
> -	asmptr[0] = ((rose->lci >> 8) & 0x0F) | ROSE_GFI;
> -	asmptr[1] = (rose->lci >> 0) & 0xFF;
> -	asmptr[2] = ROSE_DATA;
> -
> -	if (qbit)
> -		asmptr[0] |= ROSE_Q_BIT;
> -
> -	if (sk->sk_state != TCP_ESTABLISHED) {
> -		kfree_skb(skb);
> -		return -ENOTCONN;
> -	}
> -
> -#ifdef M_BIT
> -#define ROSE_PACLEN (256-ROSE_MIN_LEN)
> -	if (skb->len - ROSE_MIN_LEN > ROSE_PACLEN) {
> -		unsigned char header[ROSE_MIN_LEN];
> -		struct sk_buff *skbn;
> -		int frontlen;
> -		int lg;
> -
> -		/* Save a copy of the Header */
> -		skb_copy_from_linear_data(skb, header, ROSE_MIN_LEN);
> -		skb_pull(skb, ROSE_MIN_LEN);
> -
> -		frontlen = skb_headroom(skb);
> -
> -		while (skb->len > 0) {
> -			if ((skbn = sock_alloc_send_skb(sk, frontlen + ROSE_PACLEN, 0, &err)) == NULL) {
> -				kfree_skb(skb);
> -				return err;
> -			}
> -
> -			skbn->sk   = sk;
> -			skbn->free = 1;
> -			skbn->arp  = 1;
> -
> -			skb_reserve(skbn, frontlen);
> -
> -			lg = (ROSE_PACLEN > skb->len) ? skb->len : ROSE_PACLEN;
> -
> -			/* Copy the user data */
> -			skb_copy_from_linear_data(skb, skb_put(skbn, lg), lg);
> -			skb_pull(skb, lg);
> -
> -			/* Duplicate the Header */
> -			skb_push(skbn, ROSE_MIN_LEN);
> -			skb_copy_to_linear_data(skbn, header, ROSE_MIN_LEN);
> -
> -			if (skb->len > 0)
> -				skbn->data[2] |= M_BIT;
> -
> -			skb_queue_tail(&sk->sk_write_queue, skbn); /* Throw it on the queue */
> -		}
> -
> -		skb->free = 1;
> -		kfree_skb(skb);
> -	} else {
> -		skb_queue_tail(&sk->sk_write_queue, skb);		/* Throw it on the queue */
> -	}
> -#else
> -	skb_queue_tail(&sk->sk_write_queue, skb);	/* Shove it onto the queue */
> -#endif
> -
> -	rose_kick(sk);
> -
> -	return len;
> -}
> -
> -
> -static int rose_recvmsg(struct socket *sock, struct msghdr *msg, size_t size,
> -			int flags)
> -{
> -	struct sock *sk = sock->sk;
> -	struct rose_sock *rose = rose_sk(sk);
> -	size_t copied;
> -	unsigned char *asmptr;
> -	struct sk_buff *skb;
> -	int n, er, qbit;
> -
> -	/*
> -	 * This works for seqpacket too. The receiver has ordered the queue for
> -	 * us! We do one quick check first though
> -	 */
> -	if (sk->sk_state != TCP_ESTABLISHED)
> -		return -ENOTCONN;
> -
> -	/* Now we can treat all alike */
> -	skb = skb_recv_datagram(sk, flags, &er);
> -	if (!skb)
> -		return er;
> -
> -	qbit = (skb->data[0] & ROSE_Q_BIT) == ROSE_Q_BIT;
> -
> -	skb_pull(skb, ROSE_MIN_LEN);
> -
> -	if (rose->qbitincl) {
> -		asmptr  = skb_push(skb, 1);
> -		*asmptr = qbit;
> -	}
> -
> -	skb_reset_transport_header(skb);
> -	copied     = skb->len;
> -
> -	if (copied > size) {
> -		copied = size;
> -		msg->msg_flags |= MSG_TRUNC;
> -	}
> -
> -	skb_copy_datagram_msg(skb, 0, msg, copied);
> -
> -	if (msg->msg_name) {
> -		struct sockaddr_rose *srose;
> -		DECLARE_SOCKADDR(struct full_sockaddr_rose *, full_srose,
> -				 msg->msg_name);
> -
> -		memset(msg->msg_name, 0, sizeof(struct full_sockaddr_rose));
> -		srose = msg->msg_name;
> -		srose->srose_family = AF_ROSE;
> -		srose->srose_addr   = rose->dest_addr;
> -		srose->srose_call   = rose->dest_call;
> -		srose->srose_ndigis = rose->dest_ndigis;
> -		for (n = 0 ; n < rose->dest_ndigis ; n++)
> -			full_srose->srose_digis[n] = rose->dest_digis[n];
> -		msg->msg_namelen = sizeof(struct full_sockaddr_rose);
> -	}
> -
> -	skb_free_datagram(sk, skb);
> -
> -	return copied;
> -}
> -
> -
> -static int rose_ioctl(struct socket *sock, unsigned int cmd, unsigned long arg)
> -{
> -	struct sock *sk = sock->sk;
> -	struct rose_sock *rose = rose_sk(sk);
> -	void __user *argp = (void __user *)arg;
> -
> -	switch (cmd) {
> -	case TIOCOUTQ: {
> -		long amount;
> -
> -		amount = sk->sk_sndbuf - sk_wmem_alloc_get(sk);
> -		if (amount < 0)
> -			amount = 0;
> -		return put_user(amount, (unsigned int __user *) argp);
> -	}
> -
> -	case TIOCINQ: {
> -		struct sk_buff *skb;
> -		long amount = 0L;
> -
> -		spin_lock_irq(&sk->sk_receive_queue.lock);
> -		if ((skb = skb_peek(&sk->sk_receive_queue)) != NULL)
> -			amount = skb->len;
> -		spin_unlock_irq(&sk->sk_receive_queue.lock);
> -		return put_user(amount, (unsigned int __user *) argp);
> -	}
> -
> -	case SIOCGIFADDR:
> -	case SIOCSIFADDR:
> -	case SIOCGIFDSTADDR:
> -	case SIOCSIFDSTADDR:
> -	case SIOCGIFBRDADDR:
> -	case SIOCSIFBRDADDR:
> -	case SIOCGIFNETMASK:
> -	case SIOCSIFNETMASK:
> -	case SIOCGIFMETRIC:
> -	case SIOCSIFMETRIC:
> -		return -EINVAL;
> -
> -	case SIOCADDRT:
> -	case SIOCDELRT:
> -	case SIOCRSCLRRT:
> -		if (!capable(CAP_NET_ADMIN))
> -			return -EPERM;
> -		return rose_rt_ioctl(cmd, argp);
> -
> -	case SIOCRSGCAUSE: {
> -		struct rose_cause_struct rose_cause;
> -		rose_cause.cause      = rose->cause;
> -		rose_cause.diagnostic = rose->diagnostic;
> -		return copy_to_user(argp, &rose_cause, sizeof(struct rose_cause_struct)) ? -EFAULT : 0;
> -	}
> -
> -	case SIOCRSSCAUSE: {
> -		struct rose_cause_struct rose_cause;
> -		if (copy_from_user(&rose_cause, argp, sizeof(struct rose_cause_struct)))
> -			return -EFAULT;
> -		rose->cause      = rose_cause.cause;
> -		rose->diagnostic = rose_cause.diagnostic;
> -		return 0;
> -	}
> -
> -	case SIOCRSSL2CALL:
> -		if (!capable(CAP_NET_ADMIN)) return -EPERM;
> -		if (ax25cmp(&rose_callsign, &null_ax25_address) != 0)
> -			ax25_listen_release(&rose_callsign, NULL);
> -		if (copy_from_user(&rose_callsign, argp, sizeof(ax25_address)))
> -			return -EFAULT;
> -		if (ax25cmp(&rose_callsign, &null_ax25_address) != 0)
> -			return ax25_listen_register(&rose_callsign, NULL);
> -
> -		return 0;
> -
> -	case SIOCRSGL2CALL:
> -		return copy_to_user(argp, &rose_callsign, sizeof(ax25_address)) ? -EFAULT : 0;
> -
> -	case SIOCRSACCEPT:
> -		if (rose->state == ROSE_STATE_5) {
> -			rose_write_internal(sk, ROSE_CALL_ACCEPTED);
> -			rose_start_idletimer(sk);
> -			rose->condition = 0x00;
> -			rose->vs        = 0;
> -			rose->va        = 0;
> -			rose->vr        = 0;
> -			rose->vl        = 0;
> -			rose->state     = ROSE_STATE_3;
> -		}
> -		return 0;
> -
> -	default:
> -		return -ENOIOCTLCMD;
> -	}
> -
> -	return 0;
> -}
> -
> -#ifdef CONFIG_PROC_FS
> -static void *rose_info_start(struct seq_file *seq, loff_t *pos)
> -	__acquires(rose_list_lock)
> -{
> -	spin_lock_bh(&rose_list_lock);
> -	return seq_hlist_start_head(&rose_list, *pos);
> -}
> -
> -static void *rose_info_next(struct seq_file *seq, void *v, loff_t *pos)
> -{
> -	return seq_hlist_next(v, &rose_list, pos);
> -}
> -
> -static void rose_info_stop(struct seq_file *seq, void *v)
> -	__releases(rose_list_lock)
> -{
> -	spin_unlock_bh(&rose_list_lock);
> -}
> -
> -static int rose_info_show(struct seq_file *seq, void *v)
> -{
> -	char buf[11], rsbuf[11];
> -
> -	if (v == SEQ_START_TOKEN)
> -		seq_puts(seq,
> -			 "dest_addr  dest_call src_addr   src_call  dev   lci neigh st vs vr va   t  t1  t2  t3  hb    idle Snd-Q Rcv-Q inode\n");
> -
> -	else {
> -		struct sock *s = sk_entry(v);
> -		struct rose_sock *rose = rose_sk(s);
> -		const char *devname, *callsign;
> -		const struct net_device *dev = rose->device;
> -
> -		if (!dev)
> -			devname = "???";
> -		else
> -			devname = dev->name;
> -
> -		seq_printf(seq, "%-10s %-9s ",
> -			   rose2asc(rsbuf, &rose->dest_addr),
> -			   ax2asc(buf, &rose->dest_call));
> -
> -		if (ax25cmp(&rose->source_call, &null_ax25_address) == 0)
> -			callsign = "??????-?";
> -		else
> -			callsign = ax2asc(buf, &rose->source_call);
> -
> -		seq_printf(seq,
> -			   "%-10s %-9s %-5s %3.3X %05d  %d  %d  %d  %d %3lu %3lu %3lu %3lu %3lu %3lu/%03lu %5d %5d %llu\n",
> -			rose2asc(rsbuf, &rose->source_addr),
> -			callsign,
> -			devname,
> -			rose->lci & 0x0FFF,
> -			(rose->neighbour) ? rose->neighbour->number : 0,
> -			rose->state,
> -			rose->vs,
> -			rose->vr,
> -			rose->va,
> -			ax25_display_timer(&rose->timer) / HZ,
> -			rose->t1 / HZ,
> -			rose->t2 / HZ,
> -			rose->t3 / HZ,
> -			rose->hb / HZ,
> -			ax25_display_timer(&rose->idletimer) / (60 * HZ),
> -			rose->idle / (60 * HZ),
> -			sk_wmem_alloc_get(s),
> -			sk_rmem_alloc_get(s),
> -			s->sk_socket ? SOCK_INODE(s->sk_socket)->i_ino : (u64)0);
> -	}
> -
> -	return 0;
> -}
> -
> -static const struct seq_operations rose_info_seqops = {
> -	.start = rose_info_start,
> -	.next = rose_info_next,
> -	.stop = rose_info_stop,
> -	.show = rose_info_show,
> -};
> -#endif	/* CONFIG_PROC_FS */
> -
> -static const struct net_proto_family rose_family_ops = {
> -	.family		=	PF_ROSE,
> -	.create		=	rose_create,
> -	.owner		=	THIS_MODULE,
> -};
> -
> -static const struct proto_ops rose_proto_ops = {
> -	.family		=	PF_ROSE,
> -	.owner		=	THIS_MODULE,
> -	.release	=	rose_release,
> -	.bind		=	rose_bind,
> -	.connect	=	rose_connect,
> -	.socketpair	=	sock_no_socketpair,
> -	.accept		=	rose_accept,
> -	.getname	=	rose_getname,
> -	.poll		=	datagram_poll,
> -	.ioctl		=	rose_ioctl,
> -	.gettstamp	=	sock_gettstamp,
> -	.listen		=	rose_listen,
> -	.shutdown	=	sock_no_shutdown,
> -	.setsockopt	=	rose_setsockopt,
> -	.getsockopt	=	rose_getsockopt,
> -	.sendmsg	=	rose_sendmsg,
> -	.recvmsg	=	rose_recvmsg,
> -	.mmap		=	sock_no_mmap,
> -};
> -
> -static struct notifier_block rose_dev_notifier = {
> -	.notifier_call	=	rose_device_event,
> -};
> -
> -static struct net_device **dev_rose;
> -
> -static struct ax25_protocol rose_pid = {
> -	.pid	= AX25_P_ROSE,
> -	.func	= rose_route_frame
> -};
> -
> -static struct ax25_linkfail rose_linkfail_notifier = {
> -	.func	= rose_link_failed
> -};
> -
> -static int __init rose_proto_init(void)
> -{
> -	int i;
> -	int rc;
> -
> -	if (rose_ndevs > 0x7FFFFFFF/sizeof(struct net_device *)) {
> -		printk(KERN_ERR "ROSE: rose_proto_init - rose_ndevs parameter too large\n");
> -		rc = -EINVAL;
> -		goto out;
> -	}
> -
> -	rc = proto_register(&rose_proto, 0);
> -	if (rc != 0)
> -		goto out;
> -
> -	rose_callsign = null_ax25_address;
> -
> -	dev_rose = kzalloc_objs(struct net_device *, rose_ndevs);
> -	if (dev_rose == NULL) {
> -		printk(KERN_ERR "ROSE: rose_proto_init - unable to allocate device structure\n");
> -		rc = -ENOMEM;
> -		goto out_proto_unregister;
> -	}
> -
> -	for (i = 0; i < rose_ndevs; i++) {
> -		struct net_device *dev;
> -		char name[IFNAMSIZ];
> -
> -		sprintf(name, "rose%d", i);
> -		dev = alloc_netdev(0, name, NET_NAME_UNKNOWN, rose_setup);
> -		if (!dev) {
> -			printk(KERN_ERR "ROSE: rose_proto_init - unable to allocate memory\n");
> -			rc = -ENOMEM;
> -			goto fail;
> -		}
> -		rc = register_netdev(dev);
> -		if (rc) {
> -			printk(KERN_ERR "ROSE: netdevice registration failed\n");
> -			free_netdev(dev);
> -			goto fail;
> -		}
> -		rose_set_lockdep_key(dev);
> -		dev_rose[i] = dev;
> -	}
> -
> -	sock_register(&rose_family_ops);
> -	register_netdevice_notifier(&rose_dev_notifier);
> -
> -	ax25_register_pid(&rose_pid);
> -	ax25_linkfail_register(&rose_linkfail_notifier);
> -
> -#ifdef CONFIG_SYSCTL
> -	rose_register_sysctl();
> -#endif
> -	rose_loopback_init();
> -
> -	rose_add_loopback_neigh();
> -
> -	proc_create_seq("rose", 0444, init_net.proc_net, &rose_info_seqops);
> -	proc_create_seq("rose_neigh", 0444, init_net.proc_net,
> -		    &rose_neigh_seqops);
> -	proc_create_seq("rose_nodes", 0444, init_net.proc_net,
> -		    &rose_node_seqops);
> -	proc_create_seq("rose_routes", 0444, init_net.proc_net,
> -		    &rose_route_seqops);
> -out:
> -	return rc;
> -fail:
> -	while (--i >= 0) {
> -		unregister_netdev(dev_rose[i]);
> -		free_netdev(dev_rose[i]);
> -	}
> -	kfree(dev_rose);
> -out_proto_unregister:
> -	proto_unregister(&rose_proto);
> -	goto out;
> -}
> -module_init(rose_proto_init);
> -
> -module_param(rose_ndevs, int, 0);
> -MODULE_PARM_DESC(rose_ndevs, "number of ROSE devices");
> -
> -MODULE_AUTHOR("Jonathan Naylor G4KLX <g4klx@g4klx.demon.co.uk>");
> -MODULE_DESCRIPTION("The amateur radio ROSE network layer protocol");
> -MODULE_LICENSE("GPL");
> -MODULE_ALIAS_NETPROTO(PF_ROSE);
> -
> -static void __exit rose_exit(void)
> -{
> -	int i;
> -
> -	remove_proc_entry("rose", init_net.proc_net);
> -	remove_proc_entry("rose_neigh", init_net.proc_net);
> -	remove_proc_entry("rose_nodes", init_net.proc_net);
> -	remove_proc_entry("rose_routes", init_net.proc_net);
> -	rose_loopback_clear();
> -
> -	rose_rt_free();
> -
> -	ax25_protocol_release(AX25_P_ROSE);
> -	ax25_linkfail_release(&rose_linkfail_notifier);
> -
> -	if (ax25cmp(&rose_callsign, &null_ax25_address) != 0)
> -		ax25_listen_release(&rose_callsign, NULL);
> -
> -#ifdef CONFIG_SYSCTL
> -	rose_unregister_sysctl();
> -#endif
> -	unregister_netdevice_notifier(&rose_dev_notifier);
> -
> -	sock_unregister(PF_ROSE);
> -
> -	for (i = 0; i < rose_ndevs; i++) {
> -		struct net_device *dev = dev_rose[i];
> -
> -		if (dev) {
> -			unregister_netdev(dev);
> -			free_netdev(dev);
> -		}
> -	}
> -
> -	kfree(dev_rose);
> -	proto_unregister(&rose_proto);
> -}
> -
> -module_exit(rose_exit);
> diff --git a/net/rose/rose_dev.c b/net/rose/rose_dev.c
> deleted file mode 100644
> index f1a76a5820f1..000000000000
> --- a/net/rose/rose_dev.c
> +++ /dev/null
> @@ -1,141 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-or-later
> -/*
> - *
> - * Copyright (C) Jonathan Naylor G4KLX (g4klx@g4klx.demon.co.uk)
> - */
> -#include <linux/module.h>
> -#include <linux/proc_fs.h>
> -#include <linux/kernel.h>
> -#include <linux/interrupt.h>
> -#include <linux/fs.h>
> -#include <linux/types.h>
> -#include <linux/sysctl.h>
> -#include <linux/string.h>
> -#include <linux/socket.h>
> -#include <linux/errno.h>
> -#include <linux/fcntl.h>
> -#include <linux/in.h>
> -#include <linux/if_ether.h>
> -#include <linux/slab.h>
> -
> -#include <asm/io.h>
> -
> -#include <linux/inet.h>
> -#include <linux/netdevice.h>
> -#include <linux/etherdevice.h>
> -#include <linux/if_arp.h>
> -#include <linux/skbuff.h>
> -
> -#include <net/ip.h>
> -#include <net/arp.h>
> -
> -#include <net/ax25.h>
> -#include <net/rose.h>
> -
> -static int rose_header(struct sk_buff *skb, struct net_device *dev,
> -		       unsigned short type,
> -		       const void *daddr, const void *saddr, unsigned int len)
> -{
> -	unsigned char *buff = skb_push(skb, ROSE_MIN_LEN + 2);
> -
> -	if (daddr)
> -		memcpy(buff + 7, daddr, dev->addr_len);
> -
> -	*buff++ = ROSE_GFI | ROSE_Q_BIT;
> -	*buff++ = 0x00;
> -	*buff++ = ROSE_DATA;
> -	*buff++ = 0x7F;
> -	*buff++ = AX25_P_IP;
> -
> -	if (daddr != NULL)
> -		return 37;
> -
> -	return -37;
> -}
> -
> -static int rose_set_mac_address(struct net_device *dev, void *addr)
> -{
> -	struct sockaddr *sa = addr;
> -	int err;
> -
> -	if (!memcmp(dev->dev_addr, sa->sa_data, dev->addr_len))
> -		return 0;
> -
> -	if (dev->flags & IFF_UP) {
> -		err = rose_add_loopback_node((rose_address *)sa->sa_data);
> -		if (err)
> -			return err;
> -
> -		rose_del_loopback_node((const rose_address *)dev->dev_addr);
> -	}
> -
> -	dev_addr_set(dev, sa->sa_data);
> -
> -	return 0;
> -}
> -
> -static int rose_open(struct net_device *dev)
> -{
> -	int err;
> -
> -	err = rose_add_loopback_node((const rose_address *)dev->dev_addr);
> -	if (err)
> -		return err;
> -
> -	netif_start_queue(dev);
> -
> -	return 0;
> -}
> -
> -static int rose_close(struct net_device *dev)
> -{
> -	netif_stop_queue(dev);
> -	rose_del_loopback_node((const rose_address *)dev->dev_addr);
> -	return 0;
> -}
> -
> -static netdev_tx_t rose_xmit(struct sk_buff *skb, struct net_device *dev)
> -{
> -	struct net_device_stats *stats = &dev->stats;
> -	unsigned int len = skb->len;
> -
> -	if (!netif_running(dev)) {
> -		printk(KERN_ERR "ROSE: rose_xmit - called when iface is down\n");
> -		return NETDEV_TX_BUSY;
> -	}
> -
> -	if (!rose_route_frame(skb, NULL)) {
> -		dev_kfree_skb(skb);
> -		stats->tx_errors++;
> -		return NETDEV_TX_OK;
> -	}
> -
> -	stats->tx_packets++;
> -	stats->tx_bytes += len;
> -	return NETDEV_TX_OK;
> -}
> -
> -static const struct header_ops rose_header_ops = {
> -	.create	= rose_header,
> -};
> -
> -static const struct net_device_ops rose_netdev_ops = {
> -	.ndo_open		= rose_open,
> -	.ndo_stop		= rose_close,
> -	.ndo_start_xmit		= rose_xmit,
> -	.ndo_set_mac_address    = rose_set_mac_address,
> -};
> -
> -void rose_setup(struct net_device *dev)
> -{
> -	dev->mtu		= ROSE_MAX_PACKET_SIZE - 2;
> -	dev->netdev_ops		= &rose_netdev_ops;
> -
> -	dev->header_ops		= &rose_header_ops;
> -	dev->hard_header_len	= AX25_BPQ_HEADER_LEN + AX25_MAX_HEADER_LEN + ROSE_MIN_LEN;
> -	dev->addr_len		= ROSE_ADDR_LEN;
> -	dev->type		= ARPHRD_ROSE;
> -
> -	/* New-style flags. */
> -	dev->flags		= IFF_NOARP;
> -}
> diff --git a/net/rose/rose_in.c b/net/rose/rose_in.c
> deleted file mode 100644
> index ca4f217ef3d3..000000000000
> --- a/net/rose/rose_in.c
> +++ /dev/null
> @@ -1,301 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-or-later
> -/*
> - *
> - * Copyright (C) Jonathan Naylor G4KLX (g4klx@g4klx.demon.co.uk)
> - *
> - * Most of this code is based on the SDL diagrams published in the 7th ARRL
> - * Computer Networking Conference papers. The diagrams have mistakes in them,
> - * but are mostly correct. Before you modify the code could you read the SDL
> - * diagrams as the code is not obvious and probably very easy to break.
> - */
> -#include <linux/errno.h>
> -#include <linux/filter.h>
> -#include <linux/types.h>
> -#include <linux/socket.h>
> -#include <linux/in.h>
> -#include <linux/kernel.h>
> -#include <linux/timer.h>
> -#include <linux/string.h>
> -#include <linux/sockios.h>
> -#include <linux/net.h>
> -#include <net/ax25.h>
> -#include <linux/inet.h>
> -#include <linux/netdevice.h>
> -#include <linux/skbuff.h>
> -#include <net/sock.h>
> -#include <net/tcp_states.h>
> -#include <linux/fcntl.h>
> -#include <linux/mm.h>
> -#include <linux/interrupt.h>
> -#include <net/rose.h>
> -
> -/*
> - * State machine for state 1, Awaiting Call Accepted State.
> - * The handling of the timer(s) is in file rose_timer.c.
> - * Handling of state 0 and connection release is in af_rose.c.
> - */
> -static int rose_state1_machine(struct sock *sk, struct sk_buff *skb, int frametype)
> -{
> -	struct rose_sock *rose = rose_sk(sk);
> -
> -	switch (frametype) {
> -	case ROSE_CALL_ACCEPTED:
> -		rose_stop_timer(sk);
> -		rose_start_idletimer(sk);
> -		rose->condition = 0x00;
> -		rose->vs        = 0;
> -		rose->va        = 0;
> -		rose->vr        = 0;
> -		rose->vl        = 0;
> -		rose->state     = ROSE_STATE_3;
> -		sk->sk_state	= TCP_ESTABLISHED;
> -		if (!sock_flag(sk, SOCK_DEAD))
> -			sk->sk_state_change(sk);
> -		break;
> -
> -	case ROSE_CLEAR_REQUEST:
> -		rose_write_internal(sk, ROSE_CLEAR_CONFIRMATION);
> -		rose_disconnect(sk, ECONNREFUSED, skb->data[3], skb->data[4]);
> -		rose_neigh_put(rose->neighbour);
> -		break;
> -
> -	default:
> -		break;
> -	}
> -
> -	return 0;
> -}
> -
> -/*
> - * State machine for state 2, Awaiting Clear Confirmation State.
> - * The handling of the timer(s) is in file rose_timer.c
> - * Handling of state 0 and connection release is in af_rose.c.
> - */
> -static int rose_state2_machine(struct sock *sk, struct sk_buff *skb, int frametype)
> -{
> -	struct rose_sock *rose = rose_sk(sk);
> -
> -	switch (frametype) {
> -	case ROSE_CLEAR_REQUEST:
> -		rose_write_internal(sk, ROSE_CLEAR_CONFIRMATION);
> -		rose_disconnect(sk, 0, skb->data[3], skb->data[4]);
> -		rose_neigh_put(rose->neighbour);
> -		break;
> -
> -	case ROSE_CLEAR_CONFIRMATION:
> -		rose_disconnect(sk, 0, -1, -1);
> -		rose_neigh_put(rose->neighbour);
> -		break;
> -
> -	default:
> -		break;
> -	}
> -
> -	return 0;
> -}
> -
> -/*
> - * State machine for state 3, Connected State.
> - * The handling of the timer(s) is in file rose_timer.c
> - * Handling of state 0 and connection release is in af_rose.c.
> - */
> -static int rose_state3_machine(struct sock *sk, struct sk_buff *skb, int frametype, int ns, int nr, int q, int d, int m)
> -{
> -	struct rose_sock *rose = rose_sk(sk);
> -	int queued = 0;
> -
> -	switch (frametype) {
> -	case ROSE_RESET_REQUEST:
> -		rose_stop_timer(sk);
> -		rose_start_idletimer(sk);
> -		rose_write_internal(sk, ROSE_RESET_CONFIRMATION);
> -		rose->condition = 0x00;
> -		rose->vs        = 0;
> -		rose->vr        = 0;
> -		rose->va        = 0;
> -		rose->vl        = 0;
> -		rose_requeue_frames(sk);
> -		break;
> -
> -	case ROSE_CLEAR_REQUEST:
> -		rose_write_internal(sk, ROSE_CLEAR_CONFIRMATION);
> -		rose_disconnect(sk, 0, skb->data[3], skb->data[4]);
> -		rose_neigh_put(rose->neighbour);
> -		break;
> -
> -	case ROSE_RR:
> -	case ROSE_RNR:
> -		if (!rose_validate_nr(sk, nr)) {
> -			rose_write_internal(sk, ROSE_RESET_REQUEST);
> -			rose->condition = 0x00;
> -			rose->vs        = 0;
> -			rose->vr        = 0;
> -			rose->va        = 0;
> -			rose->vl        = 0;
> -			rose->state     = ROSE_STATE_4;
> -			rose_start_t2timer(sk);
> -			rose_stop_idletimer(sk);
> -		} else {
> -			rose_frames_acked(sk, nr);
> -			if (frametype == ROSE_RNR) {
> -				rose->condition |= ROSE_COND_PEER_RX_BUSY;
> -			} else {
> -				rose->condition &= ~ROSE_COND_PEER_RX_BUSY;
> -			}
> -		}
> -		break;
> -
> -	case ROSE_DATA:	/* XXX */
> -		rose->condition &= ~ROSE_COND_PEER_RX_BUSY;
> -		if (!rose_validate_nr(sk, nr)) {
> -			rose_write_internal(sk, ROSE_RESET_REQUEST);
> -			rose->condition = 0x00;
> -			rose->vs        = 0;
> -			rose->vr        = 0;
> -			rose->va        = 0;
> -			rose->vl        = 0;
> -			rose->state     = ROSE_STATE_4;
> -			rose_start_t2timer(sk);
> -			rose_stop_idletimer(sk);
> -			break;
> -		}
> -		rose_frames_acked(sk, nr);
> -		if (ns == rose->vr) {
> -			rose_start_idletimer(sk);
> -			if (!sk_filter_trim_cap(sk, skb, ROSE_MIN_LEN) &&
> -			    __sock_queue_rcv_skb(sk, skb) == 0) {
> -				rose->vr = (rose->vr + 1) % ROSE_MODULUS;
> -				queued = 1;
> -			} else {
> -				/* Should never happen ! */
> -				rose_write_internal(sk, ROSE_RESET_REQUEST);
> -				rose->condition = 0x00;
> -				rose->vs        = 0;
> -				rose->vr        = 0;
> -				rose->va        = 0;
> -				rose->vl        = 0;
> -				rose->state     = ROSE_STATE_4;
> -				rose_start_t2timer(sk);
> -				rose_stop_idletimer(sk);
> -				break;
> -			}
> -			if (atomic_read(&sk->sk_rmem_alloc) >
> -			    (sk->sk_rcvbuf >> 1))
> -				rose->condition |= ROSE_COND_OWN_RX_BUSY;
> -		}
> -		/*
> -		 * If the window is full, ack the frame, else start the
> -		 * acknowledge hold back timer.
> -		 */
> -		if (((rose->vl + sysctl_rose_window_size) % ROSE_MODULUS) == rose->vr) {
> -			rose->condition &= ~ROSE_COND_ACK_PENDING;
> -			rose_stop_timer(sk);
> -			rose_enquiry_response(sk);
> -		} else {
> -			rose->condition |= ROSE_COND_ACK_PENDING;
> -			rose_start_hbtimer(sk);
> -		}
> -		break;
> -
> -	default:
> -		printk(KERN_WARNING "ROSE: unknown %02X in state 3\n", frametype);
> -		break;
> -	}
> -
> -	return queued;
> -}
> -
> -/*
> - * State machine for state 4, Awaiting Reset Confirmation State.
> - * The handling of the timer(s) is in file rose_timer.c
> - * Handling of state 0 and connection release is in af_rose.c.
> - */
> -static int rose_state4_machine(struct sock *sk, struct sk_buff *skb, int frametype)
> -{
> -	struct rose_sock *rose = rose_sk(sk);
> -
> -	switch (frametype) {
> -	case ROSE_RESET_REQUEST:
> -		rose_write_internal(sk, ROSE_RESET_CONFIRMATION);
> -		fallthrough;
> -	case ROSE_RESET_CONFIRMATION:
> -		rose_stop_timer(sk);
> -		rose_start_idletimer(sk);
> -		rose->condition = 0x00;
> -		rose->va        = 0;
> -		rose->vr        = 0;
> -		rose->vs        = 0;
> -		rose->vl        = 0;
> -		rose->state     = ROSE_STATE_3;
> -		rose_requeue_frames(sk);
> -		break;
> -
> -	case ROSE_CLEAR_REQUEST:
> -		rose_write_internal(sk, ROSE_CLEAR_CONFIRMATION);
> -		rose_disconnect(sk, 0, skb->data[3], skb->data[4]);
> -		rose_neigh_put(rose->neighbour);
> -		break;
> -
> -	default:
> -		break;
> -	}
> -
> -	return 0;
> -}
> -
> -/*
> - * State machine for state 5, Awaiting Call Acceptance State.
> - * The handling of the timer(s) is in file rose_timer.c
> - * Handling of state 0 and connection release is in af_rose.c.
> - */
> -static int rose_state5_machine(struct sock *sk, struct sk_buff *skb, int frametype)
> -{
> -	if (frametype == ROSE_CLEAR_REQUEST) {
> -		rose_write_internal(sk, ROSE_CLEAR_CONFIRMATION);
> -		rose_disconnect(sk, 0, skb->data[3], skb->data[4]);
> -		rose_neigh_put(rose_sk(sk)->neighbour);
> -	}
> -
> -	return 0;
> -}
> -
> -/* Higher level upcall for a LAPB frame */
> -int rose_process_rx_frame(struct sock *sk, struct sk_buff *skb)
> -{
> -	struct rose_sock *rose = rose_sk(sk);
> -	int queued = 0, frametype, ns, nr, q, d, m;
> -
> -	if (rose->state == ROSE_STATE_0)
> -		return 0;
> -
> -	frametype = rose_decode(skb, &ns, &nr, &q, &d, &m);
> -
> -	/*
> -	 * ROSE_CLEAR_REQUEST carries cause and diagnostic in bytes 3..4.
> -	 * Reject a malformed frame that is too short to contain them.
> -	 */
> -	if (frametype == ROSE_CLEAR_REQUEST && skb->len < 5)
> -		return 0;
> -
> -	switch (rose->state) {
> -	case ROSE_STATE_1:
> -		queued = rose_state1_machine(sk, skb, frametype);
> -		break;
> -	case ROSE_STATE_2:
> -		queued = rose_state2_machine(sk, skb, frametype);
> -		break;
> -	case ROSE_STATE_3:
> -		queued = rose_state3_machine(sk, skb, frametype, ns, nr, q, d, m);
> -		break;
> -	case ROSE_STATE_4:
> -		queued = rose_state4_machine(sk, skb, frametype);
> -		break;
> -	case ROSE_STATE_5:
> -		queued = rose_state5_machine(sk, skb, frametype);
> -		break;
> -	}
> -
> -	rose_kick(sk);
> -
> -	return queued;
> -}
> diff --git a/net/rose/rose_link.c b/net/rose/rose_link.c
> deleted file mode 100644
> index 7746229fdc8c..000000000000
> --- a/net/rose/rose_link.c
> +++ /dev/null
> @@ -1,289 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-or-later
> -/*
> - *
> - * Copyright (C) Jonathan Naylor G4KLX (g4klx@g4klx.demon.co.uk)
> - */
> -#include <linux/errno.h>
> -#include <linux/types.h>
> -#include <linux/socket.h>
> -#include <linux/in.h>
> -#include <linux/kernel.h>
> -#include <linux/jiffies.h>
> -#include <linux/timer.h>
> -#include <linux/string.h>
> -#include <linux/sockios.h>
> -#include <linux/net.h>
> -#include <linux/slab.h>
> -#include <net/ax25.h>
> -#include <linux/inet.h>
> -#include <linux/netdevice.h>
> -#include <linux/skbuff.h>
> -#include <net/sock.h>
> -#include <linux/fcntl.h>
> -#include <linux/mm.h>
> -#include <linux/interrupt.h>
> -#include <net/rose.h>
> -
> -static void rose_ftimer_expiry(struct timer_list *);
> -static void rose_t0timer_expiry(struct timer_list *);
> -
> -static void rose_transmit_restart_confirmation(struct rose_neigh *neigh);
> -static void rose_transmit_restart_request(struct rose_neigh *neigh);
> -
> -void rose_start_ftimer(struct rose_neigh *neigh)
> -{
> -	timer_delete(&neigh->ftimer);
> -
> -	neigh->ftimer.function = rose_ftimer_expiry;
> -	neigh->ftimer.expires  =
> -		jiffies + msecs_to_jiffies(sysctl_rose_link_fail_timeout);
> -
> -	add_timer(&neigh->ftimer);
> -}
> -
> -static void rose_start_t0timer(struct rose_neigh *neigh)
> -{
> -	timer_delete(&neigh->t0timer);
> -
> -	neigh->t0timer.function = rose_t0timer_expiry;
> -	neigh->t0timer.expires  =
> -		jiffies + msecs_to_jiffies(sysctl_rose_restart_request_timeout);
> -
> -	add_timer(&neigh->t0timer);
> -}
> -
> -void rose_stop_ftimer(struct rose_neigh *neigh)
> -{
> -	timer_delete(&neigh->ftimer);
> -}
> -
> -void rose_stop_t0timer(struct rose_neigh *neigh)
> -{
> -	timer_delete(&neigh->t0timer);
> -}
> -
> -int rose_ftimer_running(struct rose_neigh *neigh)
> -{
> -	return timer_pending(&neigh->ftimer);
> -}
> -
> -static int rose_t0timer_running(struct rose_neigh *neigh)
> -{
> -	return timer_pending(&neigh->t0timer);
> -}
> -
> -static void rose_ftimer_expiry(struct timer_list *t)
> -{
> -}
> -
> -static void rose_t0timer_expiry(struct timer_list *t)
> -{
> -	struct rose_neigh *neigh = timer_container_of(neigh, t, t0timer);
> -
> -	rose_transmit_restart_request(neigh);
> -
> -	neigh->dce_mode = 0;
> -
> -	rose_start_t0timer(neigh);
> -}
> -
> -/*
> - *	Interface to ax25_send_frame. Changes my level 2 callsign depending
> - *	on whether we have a global ROSE callsign or use the default port
> - *	callsign.
> - */
> -static int rose_send_frame(struct sk_buff *skb, struct rose_neigh *neigh)
> -{
> -	const ax25_address *rose_call;
> -	ax25_cb *ax25s;
> -
> -	if (ax25cmp(&rose_callsign, &null_ax25_address) == 0)
> -		rose_call = (const ax25_address *)neigh->dev->dev_addr;
> -	else
> -		rose_call = &rose_callsign;
> -
> -	ax25s = neigh->ax25;
> -	neigh->ax25 = ax25_send_frame(skb, 260, rose_call, &neigh->callsign, neigh->digipeat, neigh->dev);
> -	if (ax25s)
> -		ax25_cb_put(ax25s);
> -
> -	return neigh->ax25 != NULL;
> -}
> -
> -/*
> - *	Interface to ax25_link_up. Changes my level 2 callsign depending
> - *	on whether we have a global ROSE callsign or use the default port
> - *	callsign.
> - */
> -static int rose_link_up(struct rose_neigh *neigh)
> -{
> -	const ax25_address *rose_call;
> -	ax25_cb *ax25s;
> -
> -	if (ax25cmp(&rose_callsign, &null_ax25_address) == 0)
> -		rose_call = (const ax25_address *)neigh->dev->dev_addr;
> -	else
> -		rose_call = &rose_callsign;
> -
> -	ax25s = neigh->ax25;
> -	neigh->ax25 = ax25_find_cb(rose_call, &neigh->callsign, neigh->digipeat, neigh->dev);
> -	if (ax25s)
> -		ax25_cb_put(ax25s);
> -
> -	return neigh->ax25 != NULL;
> -}
> -
> -/*
> - *	This handles all restart and diagnostic frames.
> - */
> -void rose_link_rx_restart(struct sk_buff *skb, struct rose_neigh *neigh, unsigned short frametype)
> -{
> -	struct sk_buff *skbn;
> -
> -	switch (frametype) {
> -	case ROSE_RESTART_REQUEST:
> -		rose_stop_t0timer(neigh);
> -		neigh->restarted = 1;
> -		neigh->dce_mode  = (skb->data[3] == ROSE_DTE_ORIGINATED);
> -		rose_transmit_restart_confirmation(neigh);
> -		break;
> -
> -	case ROSE_RESTART_CONFIRMATION:
> -		rose_stop_t0timer(neigh);
> -		neigh->restarted = 1;
> -		break;
> -
> -	case ROSE_DIAGNOSTIC:
> -		pr_warn("ROSE: received diagnostic #%d - %3ph\n", skb->data[3],
> -			skb->data + 4);
> -		break;
> -
> -	default:
> -		printk(KERN_WARNING "ROSE: received unknown %02X with LCI 000\n", frametype);
> -		break;
> -	}
> -
> -	if (neigh->restarted) {
> -		while ((skbn = skb_dequeue(&neigh->queue)) != NULL)
> -			if (!rose_send_frame(skbn, neigh))
> -				kfree_skb(skbn);
> -	}
> -}
> -
> -/*
> - *	This routine is called when a Restart Request is needed
> - */
> -static void rose_transmit_restart_request(struct rose_neigh *neigh)
> -{
> -	struct sk_buff *skb;
> -	unsigned char *dptr;
> -	int len;
> -
> -	len = AX25_BPQ_HEADER_LEN + AX25_MAX_HEADER_LEN + ROSE_MIN_LEN + 3;
> -
> -	if ((skb = alloc_skb(len, GFP_ATOMIC)) == NULL)
> -		return;
> -
> -	skb_reserve(skb, AX25_BPQ_HEADER_LEN + AX25_MAX_HEADER_LEN);
> -
> -	dptr = skb_put(skb, ROSE_MIN_LEN + 3);
> -
> -	*dptr++ = AX25_P_ROSE;
> -	*dptr++ = ROSE_GFI;
> -	*dptr++ = 0x00;
> -	*dptr++ = ROSE_RESTART_REQUEST;
> -	*dptr++ = ROSE_DTE_ORIGINATED;
> -	*dptr++ = 0;
> -
> -	if (!rose_send_frame(skb, neigh))
> -		kfree_skb(skb);
> -}
> -
> -/*
> - * This routine is called when a Restart Confirmation is needed
> - */
> -static void rose_transmit_restart_confirmation(struct rose_neigh *neigh)
> -{
> -	struct sk_buff *skb;
> -	unsigned char *dptr;
> -	int len;
> -
> -	len = AX25_BPQ_HEADER_LEN + AX25_MAX_HEADER_LEN + ROSE_MIN_LEN + 1;
> -
> -	if ((skb = alloc_skb(len, GFP_ATOMIC)) == NULL)
> -		return;
> -
> -	skb_reserve(skb, AX25_BPQ_HEADER_LEN + AX25_MAX_HEADER_LEN);
> -
> -	dptr = skb_put(skb, ROSE_MIN_LEN + 1);
> -
> -	*dptr++ = AX25_P_ROSE;
> -	*dptr++ = ROSE_GFI;
> -	*dptr++ = 0x00;
> -	*dptr++ = ROSE_RESTART_CONFIRMATION;
> -
> -	if (!rose_send_frame(skb, neigh))
> -		kfree_skb(skb);
> -}
> -
> -/*
> - * This routine is called when a Clear Request is needed outside of the context
> - * of a connected socket.
> - */
> -void rose_transmit_clear_request(struct rose_neigh *neigh, unsigned int lci, unsigned char cause, unsigned char diagnostic)
> -{
> -	struct sk_buff *skb;
> -	unsigned char *dptr;
> -	int len;
> -
> -	if (!neigh->dev)
> -		return;
> -
> -	len = AX25_BPQ_HEADER_LEN + AX25_MAX_HEADER_LEN + ROSE_MIN_LEN + 3;
> -
> -	if ((skb = alloc_skb(len, GFP_ATOMIC)) == NULL)
> -		return;
> -
> -	skb_reserve(skb, AX25_BPQ_HEADER_LEN + AX25_MAX_HEADER_LEN);
> -
> -	dptr = skb_put(skb, ROSE_MIN_LEN + 3);
> -
> -	*dptr++ = AX25_P_ROSE;
> -	*dptr++ = ((lci >> 8) & 0x0F) | ROSE_GFI;
> -	*dptr++ = ((lci >> 0) & 0xFF);
> -	*dptr++ = ROSE_CLEAR_REQUEST;
> -	*dptr++ = cause;
> -	*dptr++ = diagnostic;
> -
> -	if (!rose_send_frame(skb, neigh))
> -		kfree_skb(skb);
> -}
> -
> -void rose_transmit_link(struct sk_buff *skb, struct rose_neigh *neigh)
> -{
> -	unsigned char *dptr;
> -
> -	if (neigh->loopback) {
> -		rose_loopback_queue(skb, neigh);
> -		return;
> -	}
> -
> -	if (!rose_link_up(neigh))
> -		neigh->restarted = 0;
> -
> -	dptr = skb_push(skb, 1);
> -	*dptr++ = AX25_P_ROSE;
> -
> -	if (neigh->restarted) {
> -		if (!rose_send_frame(skb, neigh))
> -			kfree_skb(skb);
> -	} else {
> -		skb_queue_tail(&neigh->queue, skb);
> -
> -		if (!rose_t0timer_running(neigh)) {
> -			rose_transmit_restart_request(neigh);
> -			neigh->dce_mode = 0;
> -			rose_start_t0timer(neigh);
> -		}
> -	}
> -}
> diff --git a/net/rose/rose_loopback.c b/net/rose/rose_loopback.c
> deleted file mode 100644
> index b538e39b3df5..000000000000
> --- a/net/rose/rose_loopback.c
> +++ /dev/null
> @@ -1,133 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-or-later
> -/*
> - *
> - * Copyright (C) Jonathan Naylor G4KLX (g4klx@g4klx.demon.co.uk)
> - */
> -#include <linux/types.h>
> -#include <linux/slab.h>
> -#include <linux/socket.h>
> -#include <linux/timer.h>
> -#include <net/ax25.h>
> -#include <linux/skbuff.h>
> -#include <net/rose.h>
> -#include <linux/init.h>
> -
> -static struct sk_buff_head loopback_queue;
> -#define ROSE_LOOPBACK_LIMIT 1000
> -static struct timer_list loopback_timer;
> -
> -static void rose_set_loopback_timer(void);
> -static void rose_loopback_timer(struct timer_list *unused);
> -
> -void rose_loopback_init(void)
> -{
> -	skb_queue_head_init(&loopback_queue);
> -
> -	timer_setup(&loopback_timer, rose_loopback_timer, 0);
> -}
> -
> -static int rose_loopback_running(void)
> -{
> -	return timer_pending(&loopback_timer);
> -}
> -
> -int rose_loopback_queue(struct sk_buff *skb, struct rose_neigh *neigh)
> -{
> -	struct sk_buff *skbn = NULL;
> -
> -	if (skb_queue_len(&loopback_queue) < ROSE_LOOPBACK_LIMIT)
> -		skbn = skb_clone(skb, GFP_ATOMIC);
> -
> -	if (skbn) {
> -		consume_skb(skb);
> -		skb_queue_tail(&loopback_queue, skbn);
> -
> -		if (!rose_loopback_running())
> -			rose_set_loopback_timer();
> -	} else {
> -		kfree_skb(skb);
> -	}
> -
> -	return 1;
> -}
> -
> -static void rose_set_loopback_timer(void)
> -{
> -	mod_timer(&loopback_timer, jiffies + 10);
> -}
> -
> -static void rose_loopback_timer(struct timer_list *unused)
> -{
> -	struct sk_buff *skb;
> -	struct net_device *dev;
> -	rose_address *dest;
> -	struct sock *sk;
> -	unsigned short frametype;
> -	unsigned int lci_i, lci_o;
> -	int count;
> -
> -	for (count = 0; count < ROSE_LOOPBACK_LIMIT; count++) {
> -		skb = skb_dequeue(&loopback_queue);
> -		if (!skb)
> -			return;
> -		if (skb->len < ROSE_MIN_LEN) {
> -			kfree_skb(skb);
> -			continue;
> -		}
> -		lci_i     = ((skb->data[0] << 8) & 0xF00) + ((skb->data[1] << 0) & 0x0FF);
> -		frametype = skb->data[2];
> -		if (frametype == ROSE_CALL_REQUEST &&
> -		    (skb->len <= ROSE_CALL_REQ_FACILITIES_OFF ||
> -		     skb->data[ROSE_CALL_REQ_ADDR_LEN_OFF] !=
> -		     ROSE_CALL_REQ_ADDR_LEN_VAL)) {
> -			kfree_skb(skb);
> -			continue;
> -		}
> -		dest      = (rose_address *)(skb->data + ROSE_CALL_REQ_DEST_ADDR_OFF);
> -		lci_o     = ROSE_DEFAULT_MAXVC + 1 - lci_i;
> -
> -		skb_reset_transport_header(skb);
> -
> -		sk = rose_find_socket(lci_o, rose_loopback_neigh);
> -		if (sk) {
> -			if (rose_process_rx_frame(sk, skb) == 0)
> -				kfree_skb(skb);
> -			continue;
> -		}
> -
> -		if (frametype == ROSE_CALL_REQUEST) {
> -			if (!rose_loopback_neigh->dev &&
> -			    !rose_loopback_neigh->loopback) {
> -				kfree_skb(skb);
> -				continue;
> -			}
> -
> -			dev = rose_dev_get(dest);
> -			if (!dev) {
> -				kfree_skb(skb);
> -				continue;
> -			}
> -
> -			if (rose_rx_call_request(skb, dev, rose_loopback_neigh, lci_o) == 0) {
> -				dev_put(dev);
> -				kfree_skb(skb);
> -			}
> -		} else {
> -			kfree_skb(skb);
> -		}
> -	}
> -	if (!skb_queue_empty(&loopback_queue))
> -		mod_timer(&loopback_timer, jiffies + 1);
> -}
> -
> -void __exit rose_loopback_clear(void)
> -{
> -	struct sk_buff *skb;
> -
> -	timer_delete(&loopback_timer);
> -
> -	while ((skb = skb_dequeue(&loopback_queue)) != NULL) {
> -		skb->sk = NULL;
> -		kfree_skb(skb);
> -	}
> -}
> diff --git a/net/rose/rose_out.c b/net/rose/rose_out.c
> deleted file mode 100644
> index 9050e33c9604..000000000000
> --- a/net/rose/rose_out.c
> +++ /dev/null
> @@ -1,122 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-or-later
> -/*
> - *
> - * Copyright (C) Jonathan Naylor G4KLX (g4klx@g4klx.demon.co.uk)
> - */
> -#include <linux/errno.h>
> -#include <linux/types.h>
> -#include <linux/socket.h>
> -#include <linux/in.h>
> -#include <linux/kernel.h>
> -#include <linux/timer.h>
> -#include <linux/string.h>
> -#include <linux/sockios.h>
> -#include <linux/net.h>
> -#include <linux/gfp.h>
> -#include <net/ax25.h>
> -#include <linux/inet.h>
> -#include <linux/netdevice.h>
> -#include <linux/skbuff.h>
> -#include <net/sock.h>
> -#include <linux/fcntl.h>
> -#include <linux/mm.h>
> -#include <linux/interrupt.h>
> -#include <net/rose.h>
> -
> -/*
> - *	This procedure is passed a buffer descriptor for an iframe. It builds
> - *	the rest of the control part of the frame and then writes it out.
> - */
> -static void rose_send_iframe(struct sock *sk, struct sk_buff *skb)
> -{
> -	struct rose_sock *rose = rose_sk(sk);
> -
> -	if (skb == NULL)
> -		return;
> -
> -	skb->data[2] |= (rose->vr << 5) & 0xE0;
> -	skb->data[2] |= (rose->vs << 1) & 0x0E;
> -
> -	rose_start_idletimer(sk);
> -
> -	rose_transmit_link(skb, rose->neighbour);
> -}
> -
> -void rose_kick(struct sock *sk)
> -{
> -	struct rose_sock *rose = rose_sk(sk);
> -	struct sk_buff *skb, *skbn;
> -	unsigned short start, end;
> -
> -	if (rose->state != ROSE_STATE_3)
> -		return;
> -
> -	if (rose->condition & ROSE_COND_PEER_RX_BUSY)
> -		return;
> -
> -	if (!skb_peek(&sk->sk_write_queue))
> -		return;
> -
> -	start = (skb_peek(&rose->ack_queue) == NULL) ? rose->va : rose->vs;
> -	end   = (rose->va + sysctl_rose_window_size) % ROSE_MODULUS;
> -
> -	if (start == end)
> -		return;
> -
> -	rose->vs = start;
> -
> -	/*
> -	 * Transmit data until either we're out of data to send or
> -	 * the window is full.
> -	 */
> -
> -	skb  = skb_dequeue(&sk->sk_write_queue);
> -
> -	do {
> -		if ((skbn = skb_clone(skb, GFP_ATOMIC)) == NULL) {
> -			skb_queue_head(&sk->sk_write_queue, skb);
> -			break;
> -		}
> -
> -		skb_set_owner_w(skbn, sk);
> -
> -		/*
> -		 * Transmit the frame copy.
> -		 */
> -		rose_send_iframe(sk, skbn);
> -
> -		rose->vs = (rose->vs + 1) % ROSE_MODULUS;
> -
> -		/*
> -		 * Requeue the original data frame.
> -		 */
> -		skb_queue_tail(&rose->ack_queue, skb);
> -
> -	} while (rose->vs != end &&
> -		 (skb = skb_dequeue(&sk->sk_write_queue)) != NULL);
> -
> -	rose->vl         = rose->vr;
> -	rose->condition &= ~ROSE_COND_ACK_PENDING;
> -
> -	rose_stop_timer(sk);
> -}
> -
> -/*
> - * The following routines are taken from page 170 of the 7th ARRL Computer
> - * Networking Conference paper, as is the whole state machine.
> - */
> -
> -void rose_enquiry_response(struct sock *sk)
> -{
> -	struct rose_sock *rose = rose_sk(sk);
> -
> -	if (rose->condition & ROSE_COND_OWN_RX_BUSY)
> -		rose_write_internal(sk, ROSE_RNR);
> -	else
> -		rose_write_internal(sk, ROSE_RR);
> -
> -	rose->vl         = rose->vr;
> -	rose->condition &= ~ROSE_COND_ACK_PENDING;
> -
> -	rose_stop_timer(sk);
> -}
> diff --git a/net/rose/rose_route.c b/net/rose/rose_route.c
> deleted file mode 100644
> index e31842e6b3c8..000000000000
> --- a/net/rose/rose_route.c
> +++ /dev/null
> @@ -1,1333 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-or-later
> -/*
> - *
> - * Copyright (C) Jonathan Naylor G4KLX (g4klx@g4klx.demon.co.uk)
> - * Copyright (C) Terry Dawson VK2KTJ (terry@animats.net)
> - */
> -#include <linux/errno.h>
> -#include <linux/types.h>
> -#include <linux/socket.h>
> -#include <linux/in.h>
> -#include <linux/kernel.h>
> -#include <linux/timer.h>
> -#include <linux/string.h>
> -#include <linux/sockios.h>
> -#include <linux/net.h>
> -#include <linux/slab.h>
> -#include <net/ax25.h>
> -#include <linux/inet.h>
> -#include <linux/netdevice.h>
> -#include <net/arp.h>
> -#include <linux/if_arp.h>
> -#include <linux/skbuff.h>
> -#include <net/sock.h>
> -#include <net/tcp_states.h>
> -#include <linux/uaccess.h>
> -#include <linux/fcntl.h>
> -#include <linux/termios.h>	/* For TIOCINQ/OUTQ */
> -#include <linux/mm.h>
> -#include <linux/interrupt.h>
> -#include <linux/notifier.h>
> -#include <linux/init.h>
> -#include <net/rose.h>
> -#include <linux/seq_file.h>
> -#include <linux/export.h>
> -
> -static unsigned int rose_neigh_no = 1;
> -
> -static struct rose_node  *rose_node_list;
> -static DEFINE_SPINLOCK(rose_node_list_lock);
> -static struct rose_neigh *rose_neigh_list;
> -static DEFINE_SPINLOCK(rose_neigh_list_lock);
> -static struct rose_route *rose_route_list;
> -static DEFINE_SPINLOCK(rose_route_list_lock);
> -
> -struct rose_neigh *rose_loopback_neigh;
> -
> -/*
> - *	Add a new route to a node, and in the process add the node and the
> - *	neighbour if it is new.
> - */
> -static int __must_check rose_add_node(struct rose_route_struct *rose_route,
> -	struct net_device *dev)
> -{
> -	struct rose_node  *rose_node, *rose_tmpn, *rose_tmpp;
> -	struct rose_neigh *rose_neigh;
> -	int i, res = 0;
> -
> -	spin_lock_bh(&rose_node_list_lock);
> -	spin_lock_bh(&rose_neigh_list_lock);
> -
> -	rose_node = rose_node_list;
> -	while (rose_node != NULL) {
> -		if ((rose_node->mask == rose_route->mask) &&
> -		    (rosecmpm(&rose_route->address, &rose_node->address,
> -			      rose_route->mask) == 0))
> -			break;
> -		rose_node = rose_node->next;
> -	}
> -
> -	if (rose_node != NULL && rose_node->loopback) {
> -		res = -EINVAL;
> -		goto out;
> -	}
> -
> -	rose_neigh = rose_neigh_list;
> -	while (rose_neigh != NULL) {
> -		if (ax25cmp(&rose_route->neighbour,
> -			    &rose_neigh->callsign) == 0 &&
> -		    rose_neigh->dev == dev)
> -			break;
> -		rose_neigh = rose_neigh->next;
> -	}
> -
> -	if (rose_neigh == NULL) {
> -		rose_neigh = kmalloc_obj(*rose_neigh, GFP_ATOMIC);
> -		if (rose_neigh == NULL) {
> -			res = -ENOMEM;
> -			goto out;
> -		}
> -
> -		rose_neigh->callsign  = rose_route->neighbour;
> -		rose_neigh->digipeat  = NULL;
> -		rose_neigh->ax25      = NULL;
> -		rose_neigh->dev       = dev;
> -		rose_neigh->count     = 0;
> -		rose_neigh->dce_mode  = 0;
> -		rose_neigh->loopback  = 0;
> -		rose_neigh->number    = rose_neigh_no++;
> -		rose_neigh->restarted = 0;
> -		refcount_set(&rose_neigh->use, 1);
> -
> -		skb_queue_head_init(&rose_neigh->queue);
> -
> -		timer_setup(&rose_neigh->ftimer, NULL, 0);
> -		timer_setup(&rose_neigh->t0timer, NULL, 0);
> -
> -		if (rose_route->ndigis != 0) {
> -			rose_neigh->digipeat =
> -				kmalloc_obj(ax25_digi, GFP_ATOMIC);
> -			if (rose_neigh->digipeat == NULL) {
> -				kfree(rose_neigh);
> -				res = -ENOMEM;
> -				goto out;
> -			}
> -
> -			rose_neigh->digipeat->ndigi      = rose_route->ndigis;
> -			rose_neigh->digipeat->lastrepeat = -1;
> -
> -			for (i = 0; i < rose_route->ndigis; i++) {
> -				rose_neigh->digipeat->calls[i]    =
> -					rose_route->digipeaters[i];
> -				rose_neigh->digipeat->repeated[i] = 0;
> -			}
> -		}
> -
> -		rose_neigh->next = rose_neigh_list;
> -		rose_neigh_list  = rose_neigh;
> -	}
> -
> -	/*
> -	 * This is a new node to be inserted into the list. Find where it needs
> -	 * to be inserted into the list, and insert it. We want to be sure
> -	 * to order the list in descending order of mask size to ensure that
> -	 * later when we are searching this list the first match will be the
> -	 * best match.
> -	 */
> -	if (rose_node == NULL) {
> -		rose_tmpn = rose_node_list;
> -		rose_tmpp = NULL;
> -
> -		while (rose_tmpn != NULL) {
> -			if (rose_tmpn->mask > rose_route->mask) {
> -				rose_tmpp = rose_tmpn;
> -				rose_tmpn = rose_tmpn->next;
> -			} else {
> -				break;
> -			}
> -		}
> -
> -		/* create new node */
> -		rose_node = kmalloc_obj(*rose_node, GFP_ATOMIC);
> -		if (rose_node == NULL) {
> -			res = -ENOMEM;
> -			goto out;
> -		}
> -
> -		rose_node->address      = rose_route->address;
> -		rose_node->mask         = rose_route->mask;
> -		rose_node->count        = 1;
> -		rose_node->loopback     = 0;
> -		rose_node->neighbour[0] = rose_neigh;
> -
> -		if (rose_tmpn == NULL) {
> -			if (rose_tmpp == NULL) {	/* Empty list */
> -				rose_node_list  = rose_node;
> -				rose_node->next = NULL;
> -			} else {
> -				rose_tmpp->next = rose_node;
> -				rose_node->next = NULL;
> -			}
> -		} else {
> -			if (rose_tmpp == NULL) {	/* 1st node */
> -				rose_node->next = rose_node_list;
> -				rose_node_list  = rose_node;
> -			} else {
> -				rose_tmpp->next = rose_node;
> -				rose_node->next = rose_tmpn;
> -			}
> -		}
> -		rose_neigh->count++;
> -		rose_neigh_hold(rose_neigh);
> -
> -		goto out;
> -	}
> -
> -	/* We have space, slot it in */
> -	if (rose_node->count < 3) {
> -		rose_node->neighbour[rose_node->count] = rose_neigh;
> -		rose_node->count++;
> -		rose_neigh->count++;
> -		rose_neigh_hold(rose_neigh);
> -	}
> -
> -out:
> -	spin_unlock_bh(&rose_neigh_list_lock);
> -	spin_unlock_bh(&rose_node_list_lock);
> -
> -	return res;
> -}
> -
> -/*
> - * Caller is holding rose_node_list_lock.
> - */
> -static void rose_remove_node(struct rose_node *rose_node)
> -{
> -	struct rose_node *s;
> -
> -	if ((s = rose_node_list) == rose_node) {
> -		rose_node_list = rose_node->next;
> -		kfree(rose_node);
> -		return;
> -	}
> -
> -	while (s != NULL && s->next != NULL) {
> -		if (s->next == rose_node) {
> -			s->next = rose_node->next;
> -			kfree(rose_node);
> -			return;
> -		}
> -
> -		s = s->next;
> -	}
> -}
> -
> -/*
> - * Caller is holding rose_neigh_list_lock.
> - */
> -static void rose_remove_neigh(struct rose_neigh *rose_neigh)
> -{
> -	struct rose_neigh *s;
> -
> -	timer_delete_sync(&rose_neigh->ftimer);
> -	timer_delete_sync(&rose_neigh->t0timer);
> -
> -	skb_queue_purge(&rose_neigh->queue);
> -
> -	if ((s = rose_neigh_list) == rose_neigh) {
> -		rose_neigh_list = rose_neigh->next;
> -		return;
> -	}
> -
> -	while (s != NULL && s->next != NULL) {
> -		if (s->next == rose_neigh) {
> -			s->next = rose_neigh->next;
> -			return;
> -		}
> -
> -		s = s->next;
> -	}
> -}
> -
> -/*
> - * Caller is holding rose_route_list_lock.
> - */
> -static void rose_remove_route(struct rose_route *rose_route)
> -{
> -	struct rose_route *s;
> -
> -	if (rose_route->neigh1 != NULL)
> -		rose_neigh_put(rose_route->neigh1);
> -
> -	if (rose_route->neigh2 != NULL)
> -		rose_neigh_put(rose_route->neigh2);
> -
> -	if ((s = rose_route_list) == rose_route) {
> -		rose_route_list = rose_route->next;
> -		kfree(rose_route);
> -		return;
> -	}
> -
> -	while (s != NULL && s->next != NULL) {
> -		if (s->next == rose_route) {
> -			s->next = rose_route->next;
> -			kfree(rose_route);
> -			return;
> -		}
> -
> -		s = s->next;
> -	}
> -}
> -
> -/*
> - *	"Delete" a node. Strictly speaking remove a route to a node. The node
> - *	is only deleted if no routes are left to it.
> - */
> -static int rose_del_node(struct rose_route_struct *rose_route,
> -	struct net_device *dev)
> -{
> -	struct rose_node  *rose_node;
> -	struct rose_neigh *rose_neigh;
> -	int i, err = 0;
> -
> -	spin_lock_bh(&rose_node_list_lock);
> -	spin_lock_bh(&rose_neigh_list_lock);
> -
> -	rose_node = rose_node_list;
> -	while (rose_node != NULL) {
> -		if ((rose_node->mask == rose_route->mask) &&
> -		    (rosecmpm(&rose_route->address, &rose_node->address,
> -			      rose_route->mask) == 0))
> -			break;
> -		rose_node = rose_node->next;
> -	}
> -
> -	if (rose_node == NULL || rose_node->loopback) {
> -		err = -EINVAL;
> -		goto out;
> -	}
> -
> -	rose_neigh = rose_neigh_list;
> -	while (rose_neigh != NULL) {
> -		if (ax25cmp(&rose_route->neighbour,
> -			    &rose_neigh->callsign) == 0 &&
> -		    rose_neigh->dev == dev)
> -			break;
> -		rose_neigh = rose_neigh->next;
> -	}
> -
> -	if (rose_neigh == NULL) {
> -		err = -EINVAL;
> -		goto out;
> -	}
> -
> -	for (i = 0; i < rose_node->count; i++) {
> -		if (rose_node->neighbour[i] == rose_neigh) {
> -			rose_neigh->count--;
> -			rose_neigh_put(rose_neigh);
> -
> -			if (rose_neigh->count == 0) {
> -				rose_remove_neigh(rose_neigh);
> -				rose_neigh_put(rose_neigh);
> -			}
> -
> -			rose_node->count--;
> -
> -			if (rose_node->count == 0) {
> -				rose_remove_node(rose_node);
> -			} else {
> -				switch (i) {
> -				case 0:
> -					rose_node->neighbour[0] =
> -						rose_node->neighbour[1];
> -					fallthrough;
> -				case 1:
> -					rose_node->neighbour[1] =
> -						rose_node->neighbour[2];
> -					break;
> -				case 2:
> -					break;
> -				}
> -			}
> -			goto out;
> -		}
> -	}
> -	err = -EINVAL;
> -
> -out:
> -	spin_unlock_bh(&rose_neigh_list_lock);
> -	spin_unlock_bh(&rose_node_list_lock);
> -
> -	return err;
> -}
> -
> -/*
> - *	Add the loopback neighbour.
> - */
> -void rose_add_loopback_neigh(void)
> -{
> -	struct rose_neigh *sn;
> -
> -	rose_loopback_neigh = kmalloc_obj(struct rose_neigh);
> -	if (!rose_loopback_neigh)
> -		return;
> -	sn = rose_loopback_neigh;
> -
> -	sn->callsign  = null_ax25_address;
> -	sn->digipeat  = NULL;
> -	sn->ax25      = NULL;
> -	sn->dev       = NULL;
> -	sn->count     = 0;
> -	sn->dce_mode  = 1;
> -	sn->loopback  = 1;
> -	sn->number    = rose_neigh_no++;
> -	sn->restarted = 1;
> -	refcount_set(&sn->use, 1);
> -
> -	skb_queue_head_init(&sn->queue);
> -
> -	timer_setup(&sn->ftimer, NULL, 0);
> -	timer_setup(&sn->t0timer, NULL, 0);
> -
> -	spin_lock_bh(&rose_neigh_list_lock);
> -	sn->next = rose_neigh_list;
> -	rose_neigh_list           = sn;
> -	spin_unlock_bh(&rose_neigh_list_lock);
> -}
> -
> -/*
> - *	Add a loopback node.
> - */
> -int rose_add_loopback_node(const rose_address *address)
> -{
> -	struct rose_node *rose_node;
> -	int err = 0;
> -
> -	spin_lock_bh(&rose_node_list_lock);
> -
> -	rose_node = rose_node_list;
> -	while (rose_node != NULL) {
> -		if ((rose_node->mask == 10) &&
> -		     (rosecmpm(address, &rose_node->address, 10) == 0) &&
> -		     rose_node->loopback)
> -			break;
> -		rose_node = rose_node->next;
> -	}
> -
> -	if (rose_node != NULL)
> -		goto out;
> -
> -	if ((rose_node = kmalloc_obj(*rose_node, GFP_ATOMIC)) == NULL) {
> -		err = -ENOMEM;
> -		goto out;
> -	}
> -
> -	rose_node->address      = *address;
> -	rose_node->mask         = 10;
> -	rose_node->count        = 1;
> -	rose_node->loopback     = 1;
> -	rose_node->neighbour[0] = rose_loopback_neigh;
> -
> -	/* Insert at the head of list. Address is always mask=10 */
> -	rose_node->next = rose_node_list;
> -	rose_node_list  = rose_node;
> -
> -	rose_loopback_neigh->count++;
> -	rose_neigh_hold(rose_loopback_neigh);
> -
> -out:
> -	spin_unlock_bh(&rose_node_list_lock);
> -
> -	return err;
> -}
> -
> -/*
> - *	Delete a loopback node.
> - */
> -void rose_del_loopback_node(const rose_address *address)
> -{
> -	struct rose_node *rose_node;
> -
> -	spin_lock_bh(&rose_node_list_lock);
> -
> -	rose_node = rose_node_list;
> -	while (rose_node != NULL) {
> -		if ((rose_node->mask == 10) &&
> -		    (rosecmpm(address, &rose_node->address, 10) == 0) &&
> -		    rose_node->loopback)
> -			break;
> -		rose_node = rose_node->next;
> -	}
> -
> -	if (rose_node == NULL)
> -		goto out;
> -
> -	rose_remove_node(rose_node);
> -
> -	rose_loopback_neigh->count--;
> -	rose_neigh_put(rose_loopback_neigh);
> -
> -out:
> -	spin_unlock_bh(&rose_node_list_lock);
> -}
> -
> -/*
> - *	A device has been removed. Remove its routes and neighbours.
> - */
> -void rose_rt_device_down(struct net_device *dev)
> -{
> -	struct rose_neigh *s, *rose_neigh;
> -	struct rose_node  *t, *rose_node;
> -	int i;
> -
> -	spin_lock_bh(&rose_node_list_lock);
> -	spin_lock_bh(&rose_neigh_list_lock);
> -	rose_neigh = rose_neigh_list;
> -	while (rose_neigh != NULL) {
> -		s          = rose_neigh;
> -		rose_neigh = rose_neigh->next;
> -
> -		if (s->dev != dev)
> -			continue;
> -
> -		rose_node = rose_node_list;
> -
> -		while (rose_node != NULL) {
> -			t         = rose_node;
> -			rose_node = rose_node->next;
> -
> -			for (i = t->count - 1; i >= 0; i--) {
> -				if (t->neighbour[i] != s)
> -					continue;
> -
> -				t->count--;
> -
> -				memmove(&t->neighbour[i], &t->neighbour[i + 1],
> -					sizeof(t->neighbour[0]) *
> -						(t->count - i));
> -				rose_neigh_put(s);
> -			}
> -
> -			if (t->count <= 0)
> -				rose_remove_node(t);
> -		}
> -
> -		rose_remove_neigh(s);
> -		rose_neigh_put(s);
> -	}
> -	spin_unlock_bh(&rose_neigh_list_lock);
> -	spin_unlock_bh(&rose_node_list_lock);
> -}
> -
> -#if 0 /* Currently unused */
> -/*
> - *	A device has been removed. Remove its links.
> - */
> -void rose_route_device_down(struct net_device *dev)
> -{
> -	struct rose_route *s, *rose_route;
> -
> -	spin_lock_bh(&rose_route_list_lock);
> -	rose_route = rose_route_list;
> -	while (rose_route != NULL) {
> -		s          = rose_route;
> -		rose_route = rose_route->next;
> -
> -		if (s->neigh1->dev == dev || s->neigh2->dev == dev)
> -			rose_remove_route(s);
> -	}
> -	spin_unlock_bh(&rose_route_list_lock);
> -}
> -#endif
> -
> -/*
> - *	Clear all nodes and neighbours out, except for neighbours with
> - *	active connections going through them.
> - *  Do not clear loopback neighbour and nodes.
> - */
> -static int rose_clear_routes(void)
> -{
> -	struct rose_neigh *s, *rose_neigh;
> -	struct rose_node  *t, *rose_node;
> -	int i;
> -
> -	spin_lock_bh(&rose_node_list_lock);
> -	spin_lock_bh(&rose_neigh_list_lock);
> -
> -	rose_neigh = rose_neigh_list;
> -	rose_node  = rose_node_list;
> -
> -	while (rose_node != NULL) {
> -		t         = rose_node;
> -		rose_node = rose_node->next;
> -
> -		if (!t->loopback) {
> -			for (i = 0; i < t->count; i++)
> -				rose_neigh_put(t->neighbour[i]);
> -			rose_remove_node(t);
> -		}
> -	}
> -
> -	while (rose_neigh != NULL) {
> -		s          = rose_neigh;
> -		rose_neigh = rose_neigh->next;
> -
> -		if (!s->loopback) {
> -			rose_remove_neigh(s);
> -			rose_neigh_put(s);
> -		}
> -	}
> -
> -	spin_unlock_bh(&rose_neigh_list_lock);
> -	spin_unlock_bh(&rose_node_list_lock);
> -
> -	return 0;
> -}
> -
> -/*
> - *	Check that the device given is a valid AX.25 interface that is "up".
> - * 	called with RTNL
> - */
> -static struct net_device *rose_ax25_dev_find(char *devname)
> -{
> -	struct net_device *dev;
> -
> -	if ((dev = __dev_get_by_name(&init_net, devname)) == NULL)
> -		return NULL;
> -
> -	if ((dev->flags & IFF_UP) && dev->type == ARPHRD_AX25)
> -		return dev;
> -
> -	return NULL;
> -}
> -
> -/*
> - *	Find the first active ROSE device, usually "rose0".
> - */
> -struct net_device *rose_dev_first(void)
> -{
> -	struct net_device *dev, *first = NULL;
> -
> -	rcu_read_lock();
> -	for_each_netdev_rcu(&init_net, dev) {
> -		if ((dev->flags & IFF_UP) && dev->type == ARPHRD_ROSE)
> -			if (first == NULL || strncmp(dev->name, first->name, 3) < 0)
> -				first = dev;
> -	}
> -	if (first)
> -		dev_hold(first);
> -	rcu_read_unlock();
> -
> -	return first;
> -}
> -
> -/*
> - *	Find the ROSE device for the given address.
> - */
> -struct net_device *rose_dev_get(rose_address *addr)
> -{
> -	struct net_device *dev;
> -
> -	rcu_read_lock();
> -	for_each_netdev_rcu(&init_net, dev) {
> -		if ((dev->flags & IFF_UP) && dev->type == ARPHRD_ROSE &&
> -		    rosecmp(addr, (const rose_address *)dev->dev_addr) == 0) {
> -			dev_hold(dev);
> -			goto out;
> -		}
> -	}
> -	dev = NULL;
> -out:
> -	rcu_read_unlock();
> -	return dev;
> -}
> -
> -static int rose_dev_exists(rose_address *addr)
> -{
> -	struct net_device *dev;
> -
> -	rcu_read_lock();
> -	for_each_netdev_rcu(&init_net, dev) {
> -		if ((dev->flags & IFF_UP) && dev->type == ARPHRD_ROSE &&
> -		    rosecmp(addr, (const rose_address *)dev->dev_addr) == 0)
> -			goto out;
> -	}
> -	dev = NULL;
> -out:
> -	rcu_read_unlock();
> -	return dev != NULL;
> -}
> -
> -
> -
> -
> -struct rose_route *rose_route_free_lci(unsigned int lci, struct rose_neigh *neigh)
> -{
> -	struct rose_route *rose_route;
> -
> -	for (rose_route = rose_route_list; rose_route != NULL; rose_route = rose_route->next)
> -		if ((rose_route->neigh1 == neigh && rose_route->lci1 == lci) ||
> -		    (rose_route->neigh2 == neigh && rose_route->lci2 == lci))
> -			return rose_route;
> -
> -	return NULL;
> -}
> -
> -/*
> - *	Find a neighbour or a route given a ROSE address.
> - */
> -struct rose_neigh *rose_get_neigh(rose_address *addr, unsigned char *cause,
> -	unsigned char *diagnostic, int route_frame)
> -{
> -	struct rose_neigh *res = NULL;
> -	struct rose_node *node;
> -	int failed = 0;
> -	int i;
> -
> -	if (!route_frame) spin_lock_bh(&rose_node_list_lock);
> -	for (node = rose_node_list; node != NULL; node = node->next) {
> -		if (rosecmpm(addr, &node->address, node->mask) == 0) {
> -			for (i = 0; i < node->count; i++) {
> -				if (node->neighbour[i]->restarted) {
> -					res = node->neighbour[i];
> -					rose_neigh_hold(node->neighbour[i]);
> -					goto out;
> -				}
> -			}
> -		}
> -	}
> -	if (!route_frame) { /* connect request */
> -		for (node = rose_node_list; node != NULL; node = node->next) {
> -			if (rosecmpm(addr, &node->address, node->mask) == 0) {
> -				for (i = 0; i < node->count; i++) {
> -					if (!rose_ftimer_running(node->neighbour[i])) {
> -						res = node->neighbour[i];
> -						rose_neigh_hold(node->neighbour[i]);
> -						goto out;
> -					}
> -					failed = 1;
> -				}
> -			}
> -		}
> -	}
> -
> -	if (failed) {
> -		*cause      = ROSE_OUT_OF_ORDER;
> -		*diagnostic = 0;
> -	} else {
> -		*cause      = ROSE_NOT_OBTAINABLE;
> -		*diagnostic = 0;
> -	}
> -
> -out:
> -	if (!route_frame) spin_unlock_bh(&rose_node_list_lock);
> -	return res;
> -}
> -
> -/*
> - *	Handle the ioctls that control the routing functions.
> - */
> -int rose_rt_ioctl(unsigned int cmd, void __user *arg)
> -{
> -	struct rose_route_struct rose_route;
> -	struct net_device *dev;
> -	int err;
> -
> -	switch (cmd) {
> -	case SIOCADDRT:
> -		if (copy_from_user(&rose_route, arg, sizeof(struct rose_route_struct)))
> -			return -EFAULT;
> -		if ((dev = rose_ax25_dev_find(rose_route.device)) == NULL)
> -			return -EINVAL;
> -		if (rose_dev_exists(&rose_route.address)) /* Can't add routes to ourself */
> -			return -EINVAL;
> -		if (rose_route.mask > 10) /* Mask can't be more than 10 digits */
> -			return -EINVAL;
> -		if (rose_route.ndigis > AX25_MAX_DIGIS)
> -			return -EINVAL;
> -		err = rose_add_node(&rose_route, dev);
> -		return err;
> -
> -	case SIOCDELRT:
> -		if (copy_from_user(&rose_route, arg, sizeof(struct rose_route_struct)))
> -			return -EFAULT;
> -		if ((dev = rose_ax25_dev_find(rose_route.device)) == NULL)
> -			return -EINVAL;
> -		err = rose_del_node(&rose_route, dev);
> -		return err;
> -
> -	case SIOCRSCLRRT:
> -		return rose_clear_routes();
> -
> -	default:
> -		return -EINVAL;
> -	}
> -
> -	return 0;
> -}
> -
> -static void rose_del_route_by_neigh(struct rose_neigh *rose_neigh)
> -{
> -	struct rose_route *rose_route, *s;
> -
> -	rose_neigh->restarted = 0;
> -
> -	rose_stop_t0timer(rose_neigh);
> -	rose_start_ftimer(rose_neigh);
> -
> -	skb_queue_purge(&rose_neigh->queue);
> -
> -	spin_lock_bh(&rose_route_list_lock);
> -
> -	rose_route = rose_route_list;
> -
> -	while (rose_route != NULL) {
> -		if ((rose_route->neigh1 == rose_neigh && rose_route->neigh2 == rose_neigh) ||
> -		    (rose_route->neigh1 == rose_neigh && rose_route->neigh2 == NULL)       ||
> -		    (rose_route->neigh2 == rose_neigh && rose_route->neigh1 == NULL)) {
> -			s = rose_route->next;
> -			rose_remove_route(rose_route);
> -			rose_route = s;
> -			continue;
> -		}
> -
> -		if (rose_route->neigh1 == rose_neigh) {
> -			rose_neigh_put(rose_route->neigh1);
> -			rose_route->neigh1 = NULL;
> -			rose_transmit_clear_request(rose_route->neigh2, rose_route->lci2, ROSE_OUT_OF_ORDER, 0);
> -		}
> -
> -		if (rose_route->neigh2 == rose_neigh) {
> -			rose_neigh_put(rose_route->neigh2);
> -			rose_route->neigh2 = NULL;
> -			rose_transmit_clear_request(rose_route->neigh1, rose_route->lci1, ROSE_OUT_OF_ORDER, 0);
> -		}
> -
> -		rose_route = rose_route->next;
> -	}
> -	spin_unlock_bh(&rose_route_list_lock);
> -}
> -
> -/*
> - * 	A level 2 link has timed out, therefore it appears to be a poor link,
> - *	then don't use that neighbour until it is reset. Blow away all through
> - *	routes and connections using this route.
> - */
> -void rose_link_failed(ax25_cb *ax25, int reason)
> -{
> -	struct rose_neigh *rose_neigh;
> -
> -	spin_lock_bh(&rose_neigh_list_lock);
> -	rose_neigh = rose_neigh_list;
> -	while (rose_neigh != NULL) {
> -		if (rose_neigh->ax25 == ax25)
> -			break;
> -		rose_neigh = rose_neigh->next;
> -	}
> -
> -	if (rose_neigh != NULL) {
> -		rose_neigh->ax25 = NULL;
> -		ax25_cb_put(ax25);
> -
> -		rose_del_route_by_neigh(rose_neigh);
> -		rose_kill_by_neigh(rose_neigh);
> -	}
> -	spin_unlock_bh(&rose_neigh_list_lock);
> -}
> -
> -/*
> - * 	A device has been "downed" remove its link status. Blow away all
> - *	through routes and connections that use this device.
> - */
> -void rose_link_device_down(struct net_device *dev)
> -{
> -	struct rose_neigh *rose_neigh;
> -
> -	for (rose_neigh = rose_neigh_list; rose_neigh != NULL; rose_neigh = rose_neigh->next) {
> -		if (rose_neigh->dev == dev) {
> -			rose_del_route_by_neigh(rose_neigh);
> -			rose_kill_by_neigh(rose_neigh);
> -		}
> -	}
> -}
> -
> -/*
> - *	Route a frame to an appropriate AX.25 connection.
> - *	A NULL ax25_cb indicates an internally generated frame.
> - */
> -int rose_route_frame(struct sk_buff *skb, ax25_cb *ax25)
> -{
> -	struct rose_neigh *rose_neigh, *new_neigh;
> -	struct rose_route *rose_route;
> -	struct rose_facilities_struct facilities;
> -	rose_address *src_addr, *dest_addr;
> -	struct sock *sk;
> -	unsigned short frametype;
> -	unsigned int lci, new_lci;
> -	unsigned char cause, diagnostic;
> -	struct net_device *dev;
> -	int res = 0;
> -	char buf[11];
> -
> -	if (skb->len < ROSE_MIN_LEN)
> -		return res;
> -
> -	if (!ax25)
> -		return rose_loopback_queue(skb, NULL);
> -
> -	frametype = skb->data[2];
> -	lci = ((skb->data[0] << 8) & 0xF00) + ((skb->data[1] << 0) & 0x0FF);
> -	if (frametype == ROSE_CALL_REQUEST &&
> -	    (skb->len <= ROSE_CALL_REQ_FACILITIES_OFF ||
> -	     skb->data[ROSE_CALL_REQ_ADDR_LEN_OFF] !=
> -	     ROSE_CALL_REQ_ADDR_LEN_VAL))
> -		return res;
> -	src_addr  = (rose_address *)(skb->data + ROSE_CALL_REQ_SRC_ADDR_OFF);
> -	dest_addr = (rose_address *)(skb->data + ROSE_CALL_REQ_DEST_ADDR_OFF);
> -
> -	spin_lock_bh(&rose_neigh_list_lock);
> -	spin_lock_bh(&rose_route_list_lock);
> -
> -	rose_neigh = rose_neigh_list;
> -	while (rose_neigh != NULL) {
> -		if (ax25cmp(&ax25->dest_addr, &rose_neigh->callsign) == 0 &&
> -		    ax25->ax25_dev->dev == rose_neigh->dev)
> -			break;
> -		rose_neigh = rose_neigh->next;
> -	}
> -
> -	if (rose_neigh == NULL) {
> -		printk("rose_route : unknown neighbour or device %s\n",
> -		       ax2asc(buf, &ax25->dest_addr));
> -		goto out;
> -	}
> -
> -	/*
> -	 *	Obviously the link is working, halt the ftimer.
> -	 */
> -	rose_stop_ftimer(rose_neigh);
> -
> -	/*
> -	 *	LCI of zero is always for us, and its always a restart
> -	 * 	frame.
> -	 */
> -	if (lci == 0) {
> -		rose_link_rx_restart(skb, rose_neigh, frametype);
> -		goto out;
> -	}
> -
> -	/*
> -	 *	Find an existing socket.
> -	 */
> -	if ((sk = rose_find_socket(lci, rose_neigh)) != NULL) {
> -		if (frametype == ROSE_CALL_REQUEST) {
> -			struct rose_sock *rose = rose_sk(sk);
> -
> -			/* Remove an existing unused socket */
> -			rose_clear_queues(sk);
> -			rose->cause	 = ROSE_NETWORK_CONGESTION;
> -			rose->diagnostic = 0;
> -			rose_neigh_put(rose->neighbour);
> -			rose->neighbour	 = NULL;
> -			rose->lci	 = 0;
> -			rose->state	 = ROSE_STATE_0;
> -			sk->sk_state	 = TCP_CLOSE;
> -			sk->sk_err	 = 0;
> -			sk->sk_shutdown	 |= SEND_SHUTDOWN;
> -			if (!sock_flag(sk, SOCK_DEAD)) {
> -				sk->sk_state_change(sk);
> -				sock_set_flag(sk, SOCK_DEAD);
> -			}
> -		}
> -		else {
> -			skb_reset_transport_header(skb);
> -			res = rose_process_rx_frame(sk, skb);
> -			goto out;
> -		}
> -	}
> -
> -	/*
> -	 *	Is is a Call Request and is it for us ?
> -	 */
> -	if (frametype == ROSE_CALL_REQUEST)
> -		if ((dev = rose_dev_get(dest_addr)) != NULL) {
> -			res = rose_rx_call_request(skb, dev, rose_neigh, lci);
> -			dev_put(dev);
> -			goto out;
> -		}
> -
> -	if (!sysctl_rose_routing_control) {
> -		rose_transmit_clear_request(rose_neigh, lci, ROSE_NOT_OBTAINABLE, 0);
> -		goto out;
> -	}
> -
> -	/*
> -	 *	Route it to the next in line if we have an entry for it.
> -	 */
> -	rose_route = rose_route_list;
> -	while (rose_route != NULL) {
> -		if (rose_route->lci1 == lci &&
> -		    rose_route->neigh1 == rose_neigh) {
> -			if (frametype == ROSE_CALL_REQUEST) {
> -				/* F6FBB - Remove an existing unused route */
> -				rose_remove_route(rose_route);
> -				break;
> -			} else if (rose_route->neigh2 != NULL) {
> -				skb->data[0] &= 0xF0;
> -				skb->data[0] |= (rose_route->lci2 >> 8) & 0x0F;
> -				skb->data[1]  = (rose_route->lci2 >> 0) & 0xFF;
> -				rose_transmit_link(skb, rose_route->neigh2);
> -				if (frametype == ROSE_CLEAR_CONFIRMATION)
> -					rose_remove_route(rose_route);
> -				res = 1;
> -				goto out;
> -			} else {
> -				if (frametype == ROSE_CLEAR_CONFIRMATION)
> -					rose_remove_route(rose_route);
> -				goto out;
> -			}
> -		}
> -		if (rose_route->lci2 == lci &&
> -		    rose_route->neigh2 == rose_neigh) {
> -			if (frametype == ROSE_CALL_REQUEST) {
> -				/* F6FBB - Remove an existing unused route */
> -				rose_remove_route(rose_route);
> -				break;
> -			} else if (rose_route->neigh1 != NULL) {
> -				skb->data[0] &= 0xF0;
> -				skb->data[0] |= (rose_route->lci1 >> 8) & 0x0F;
> -				skb->data[1]  = (rose_route->lci1 >> 0) & 0xFF;
> -				rose_transmit_link(skb, rose_route->neigh1);
> -				if (frametype == ROSE_CLEAR_CONFIRMATION)
> -					rose_remove_route(rose_route);
> -				res = 1;
> -				goto out;
> -			} else {
> -				if (frametype == ROSE_CLEAR_CONFIRMATION)
> -					rose_remove_route(rose_route);
> -				goto out;
> -			}
> -		}
> -		rose_route = rose_route->next;
> -	}
> -
> -	/*
> -	 *	We know that:
> -	 *	1. The frame isn't for us,
> -	 *	2. It isn't "owned" by any existing route.
> -	 */
> -	if (frametype != ROSE_CALL_REQUEST) {	/* XXX */
> -		res = 0;
> -		goto out;
> -	}
> -
> -	memset(&facilities, 0x00, sizeof(struct rose_facilities_struct));
> -
> -	if (!rose_parse_facilities(skb->data + ROSE_CALL_REQ_FACILITIES_OFF,
> -				   skb->len - ROSE_CALL_REQ_FACILITIES_OFF,
> -				   &facilities)) {
> -		rose_transmit_clear_request(rose_neigh, lci, ROSE_INVALID_FACILITY, 76);
> -		goto out;
> -	}
> -
> -	/*
> -	 *	Check for routing loops.
> -	 */
> -	rose_route = rose_route_list;
> -	while (rose_route != NULL) {
> -		if (rose_route->rand == facilities.rand &&
> -		    rosecmp(src_addr, &rose_route->src_addr) == 0 &&
> -		    ax25cmp(&facilities.dest_call, &rose_route->src_call) == 0 &&
> -		    ax25cmp(&facilities.source_call, &rose_route->dest_call) == 0) {
> -			rose_transmit_clear_request(rose_neigh, lci, ROSE_NOT_OBTAINABLE, 120);
> -			goto out;
> -		}
> -		rose_route = rose_route->next;
> -	}
> -
> -	if ((new_neigh = rose_get_neigh(dest_addr, &cause, &diagnostic, 1)) == NULL) {
> -		rose_transmit_clear_request(rose_neigh, lci, cause, diagnostic);
> -		goto out;
> -	}
> -
> -	if ((new_lci = rose_new_lci(new_neigh)) == 0) {
> -		rose_transmit_clear_request(rose_neigh, lci, ROSE_NETWORK_CONGESTION, 71);
> -		goto put_neigh;
> -	}
> -
> -	if ((rose_route = kmalloc_obj(*rose_route, GFP_ATOMIC)) == NULL) {
> -		rose_transmit_clear_request(rose_neigh, lci, ROSE_NETWORK_CONGESTION, 120);
> -		goto put_neigh;
> -	}
> -
> -	rose_route->lci1      = lci;
> -	rose_route->src_addr  = *src_addr;
> -	rose_route->dest_addr = *dest_addr;
> -	rose_route->src_call  = facilities.dest_call;
> -	rose_route->dest_call = facilities.source_call;
> -	rose_route->rand      = facilities.rand;
> -	rose_route->neigh1    = rose_neigh;
> -	rose_route->lci2      = new_lci;
> -	rose_route->neigh2    = new_neigh;
> -
> -	rose_neigh_hold(rose_route->neigh1);
> -	rose_neigh_hold(rose_route->neigh2);
> -
> -	rose_route->next = rose_route_list;
> -	rose_route_list  = rose_route;
> -
> -	skb->data[0] &= 0xF0;
> -	skb->data[0] |= (rose_route->lci2 >> 8) & 0x0F;
> -	skb->data[1]  = (rose_route->lci2 >> 0) & 0xFF;
> -
> -	rose_transmit_link(skb, rose_route->neigh2);
> -	res = 1;
> -
> -put_neigh:
> -	rose_neigh_put(new_neigh);
> -out:
> -	spin_unlock_bh(&rose_route_list_lock);
> -	spin_unlock_bh(&rose_neigh_list_lock);
> -
> -	return res;
> -}
> -
> -#ifdef CONFIG_PROC_FS
> -
> -static void *rose_node_start(struct seq_file *seq, loff_t *pos)
> -	__acquires(rose_node_list_lock)
> -{
> -	struct rose_node *rose_node;
> -	int i = 1;
> -
> -	spin_lock_bh(&rose_node_list_lock);
> -	if (*pos == 0)
> -		return SEQ_START_TOKEN;
> -
> -	for (rose_node = rose_node_list; rose_node && i < *pos;
> -	     rose_node = rose_node->next, ++i);
> -
> -	return (i == *pos) ? rose_node : NULL;
> -}
> -
> -static void *rose_node_next(struct seq_file *seq, void *v, loff_t *pos)
> -{
> -	++*pos;
> -
> -	return (v == SEQ_START_TOKEN) ? rose_node_list
> -		: ((struct rose_node *)v)->next;
> -}
> -
> -static void rose_node_stop(struct seq_file *seq, void *v)
> -	__releases(rose_node_list_lock)
> -{
> -	spin_unlock_bh(&rose_node_list_lock);
> -}
> -
> -static int rose_node_show(struct seq_file *seq, void *v)
> -{
> -	char rsbuf[11];
> -	int i;
> -
> -	if (v == SEQ_START_TOKEN)
> -		seq_puts(seq, "address    mask n neigh neigh neigh\n");
> -	else {
> -		const struct rose_node *rose_node = v;
> -		seq_printf(seq, "%-10s %04d %d",
> -			   rose2asc(rsbuf, &rose_node->address),
> -			   rose_node->mask,
> -			   rose_node->count);
> -
> -		for (i = 0; i < rose_node->count; i++)
> -			seq_printf(seq, " %05d", rose_node->neighbour[i]->number);
> -
> -		seq_puts(seq, "\n");
> -	}
> -	return 0;
> -}
> -
> -const struct seq_operations rose_node_seqops = {
> -	.start = rose_node_start,
> -	.next = rose_node_next,
> -	.stop = rose_node_stop,
> -	.show = rose_node_show,
> -};
> -
> -static void *rose_neigh_start(struct seq_file *seq, loff_t *pos)
> -	__acquires(rose_neigh_list_lock)
> -{
> -	struct rose_neigh *rose_neigh;
> -	int i = 1;
> -
> -	spin_lock_bh(&rose_neigh_list_lock);
> -	if (*pos == 0)
> -		return SEQ_START_TOKEN;
> -
> -	for (rose_neigh = rose_neigh_list; rose_neigh && i < *pos;
> -	     rose_neigh = rose_neigh->next, ++i);
> -
> -	return (i == *pos) ? rose_neigh : NULL;
> -}
> -
> -static void *rose_neigh_next(struct seq_file *seq, void *v, loff_t *pos)
> -{
> -	++*pos;
> -
> -	return (v == SEQ_START_TOKEN) ? rose_neigh_list
> -		: ((struct rose_neigh *)v)->next;
> -}
> -
> -static void rose_neigh_stop(struct seq_file *seq, void *v)
> -	__releases(rose_neigh_list_lock)
> -{
> -	spin_unlock_bh(&rose_neigh_list_lock);
> -}
> -
> -static int rose_neigh_show(struct seq_file *seq, void *v)
> -{
> -	char buf[11];
> -	int i;
> -
> -	if (v == SEQ_START_TOKEN)
> -		seq_puts(seq,
> -			 "addr  callsign  dev  count use mode restart  t0  tf digipeaters\n");
> -	else {
> -		struct rose_neigh *rose_neigh = v;
> -
> -		/* if (!rose_neigh->loopback) { */
> -		seq_printf(seq, "%05d %-9s %-4s   %3d %3d  %3s     %3s %3lu %3lu",
> -			   rose_neigh->number,
> -			   (rose_neigh->loopback) ? "RSLOOP-0" : ax2asc(buf, &rose_neigh->callsign),
> -			   rose_neigh->dev ? rose_neigh->dev->name : "???",
> -			   rose_neigh->count,
> -			   refcount_read(&rose_neigh->use) - rose_neigh->count - 1,
> -			   (rose_neigh->dce_mode) ? "DCE" : "DTE",
> -			   (rose_neigh->restarted) ? "yes" : "no",
> -			   ax25_display_timer(&rose_neigh->t0timer) / HZ,
> -			   ax25_display_timer(&rose_neigh->ftimer)  / HZ);
> -
> -		if (rose_neigh->digipeat != NULL) {
> -			for (i = 0; i < rose_neigh->digipeat->ndigi; i++)
> -				seq_printf(seq, " %s", ax2asc(buf, &rose_neigh->digipeat->calls[i]));
> -		}
> -
> -		seq_puts(seq, "\n");
> -	}
> -	return 0;
> -}
> -
> -
> -const struct seq_operations rose_neigh_seqops = {
> -	.start = rose_neigh_start,
> -	.next = rose_neigh_next,
> -	.stop = rose_neigh_stop,
> -	.show = rose_neigh_show,
> -};
> -
> -static void *rose_route_start(struct seq_file *seq, loff_t *pos)
> -	__acquires(rose_route_list_lock)
> -{
> -	struct rose_route *rose_route;
> -	int i = 1;
> -
> -	spin_lock_bh(&rose_route_list_lock);
> -	if (*pos == 0)
> -		return SEQ_START_TOKEN;
> -
> -	for (rose_route = rose_route_list; rose_route && i < *pos;
> -	     rose_route = rose_route->next, ++i);
> -
> -	return (i == *pos) ? rose_route : NULL;
> -}
> -
> -static void *rose_route_next(struct seq_file *seq, void *v, loff_t *pos)
> -{
> -	++*pos;
> -
> -	return (v == SEQ_START_TOKEN) ? rose_route_list
> -		: ((struct rose_route *)v)->next;
> -}
> -
> -static void rose_route_stop(struct seq_file *seq, void *v)
> -	__releases(rose_route_list_lock)
> -{
> -	spin_unlock_bh(&rose_route_list_lock);
> -}
> -
> -static int rose_route_show(struct seq_file *seq, void *v)
> -{
> -	char buf[11], rsbuf[11];
> -
> -	if (v == SEQ_START_TOKEN)
> -		seq_puts(seq,
> -			 "lci  address     callsign   neigh  <-> lci  address     callsign   neigh\n");
> -	else {
> -		struct rose_route *rose_route = v;
> -
> -		if (rose_route->neigh1)
> -			seq_printf(seq,
> -				   "%3.3X  %-10s  %-9s  %05d      ",
> -				   rose_route->lci1,
> -				   rose2asc(rsbuf, &rose_route->src_addr),
> -				   ax2asc(buf, &rose_route->src_call),
> -				   rose_route->neigh1->number);
> -		else
> -			seq_puts(seq,
> -				 "000  *           *          00000      ");
> -
> -		if (rose_route->neigh2)
> -			seq_printf(seq,
> -				   "%3.3X  %-10s  %-9s  %05d\n",
> -				   rose_route->lci2,
> -				   rose2asc(rsbuf, &rose_route->dest_addr),
> -				   ax2asc(buf, &rose_route->dest_call),
> -				   rose_route->neigh2->number);
> -		 else
> -			 seq_puts(seq,
> -				  "000  *           *          00000\n");
> -		}
> -	return 0;
> -}
> -
> -struct seq_operations rose_route_seqops = {
> -	.start = rose_route_start,
> -	.next = rose_route_next,
> -	.stop = rose_route_stop,
> -	.show = rose_route_show,
> -};
> -#endif /* CONFIG_PROC_FS */
> -
> -/*
> - *	Release all memory associated with ROSE routing structures.
> - */
> -void __exit rose_rt_free(void)
> -{
> -	struct rose_neigh *s, *rose_neigh = rose_neigh_list;
> -	struct rose_node  *t, *rose_node  = rose_node_list;
> -	struct rose_route *u, *rose_route = rose_route_list;
> -	int i;
> -
> -	while (rose_neigh != NULL) {
> -		s          = rose_neigh;
> -		rose_neigh = rose_neigh->next;
> -
> -		rose_remove_neigh(s);
> -		rose_neigh_put(s);
> -	}
> -
> -	while (rose_node != NULL) {
> -		t         = rose_node;
> -		rose_node = rose_node->next;
> -
> -		for (i = 0; i < t->count; i++)
> -			rose_neigh_put(t->neighbour[i]);
> -		rose_remove_node(t);
> -	}
> -
> -	while (rose_route != NULL) {
> -		u          = rose_route;
> -		rose_route = rose_route->next;
> -
> -		rose_remove_route(u);
> -	}
> -}
> diff --git a/net/rose/rose_subr.c b/net/rose/rose_subr.c
> deleted file mode 100644
> index 4dbc437a9e22..000000000000
> --- a/net/rose/rose_subr.c
> +++ /dev/null
> @@ -1,556 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-or-later
> -/*
> - *
> - * Copyright (C) Jonathan Naylor G4KLX (g4klx@g4klx.demon.co.uk)
> - */
> -#include <linux/errno.h>
> -#include <linux/types.h>
> -#include <linux/socket.h>
> -#include <linux/in.h>
> -#include <linux/kernel.h>
> -#include <linux/timer.h>
> -#include <linux/string.h>
> -#include <linux/sockios.h>
> -#include <linux/net.h>
> -#include <linux/slab.h>
> -#include <net/ax25.h>
> -#include <linux/inet.h>
> -#include <linux/netdevice.h>
> -#include <linux/skbuff.h>
> -#include <net/sock.h>
> -#include <net/tcp_states.h>
> -#include <linux/fcntl.h>
> -#include <linux/mm.h>
> -#include <linux/interrupt.h>
> -#include <net/rose.h>
> -
> -static int rose_create_facilities(unsigned char *buffer, struct rose_sock *rose);
> -
> -/*
> - *	This routine purges all of the queues of frames.
> - */
> -void rose_clear_queues(struct sock *sk)
> -{
> -	skb_queue_purge(&sk->sk_write_queue);
> -	skb_queue_purge(&rose_sk(sk)->ack_queue);
> -}
> -
> -/*
> - * This routine purges the input queue of those frames that have been
> - * acknowledged. This replaces the boxes labelled "V(a) <- N(r)" on the
> - * SDL diagram.
> - */
> -void rose_frames_acked(struct sock *sk, unsigned short nr)
> -{
> -	struct sk_buff *skb;
> -	struct rose_sock *rose = rose_sk(sk);
> -
> -	/*
> -	 * Remove all the ack-ed frames from the ack queue.
> -	 */
> -	if (rose->va != nr) {
> -		while (skb_peek(&rose->ack_queue) != NULL && rose->va != nr) {
> -			skb = skb_dequeue(&rose->ack_queue);
> -			kfree_skb(skb);
> -			rose->va = (rose->va + 1) % ROSE_MODULUS;
> -		}
> -	}
> -}
> -
> -void rose_requeue_frames(struct sock *sk)
> -{
> -	struct sk_buff *skb, *skb_prev = NULL;
> -
> -	/*
> -	 * Requeue all the un-ack-ed frames on the output queue to be picked
> -	 * up by rose_kick. This arrangement handles the possibility of an
> -	 * empty output queue.
> -	 */
> -	while ((skb = skb_dequeue(&rose_sk(sk)->ack_queue)) != NULL) {
> -		if (skb_prev == NULL)
> -			skb_queue_head(&sk->sk_write_queue, skb);
> -		else
> -			skb_append(skb_prev, skb, &sk->sk_write_queue);
> -		skb_prev = skb;
> -	}
> -}
> -
> -/*
> - *	Validate that the value of nr is between va and vs. Return true or
> - *	false for testing.
> - */
> -int rose_validate_nr(struct sock *sk, unsigned short nr)
> -{
> -	struct rose_sock *rose = rose_sk(sk);
> -	unsigned short vc = rose->va;
> -
> -	while (vc != rose->vs) {
> -		if (nr == vc) return 1;
> -		vc = (vc + 1) % ROSE_MODULUS;
> -	}
> -
> -	return nr == rose->vs;
> -}
> -
> -/*
> - *  This routine is called when the packet layer internally generates a
> - *  control frame.
> - */
> -void rose_write_internal(struct sock *sk, int frametype)
> -{
> -	struct rose_sock *rose = rose_sk(sk);
> -	struct sk_buff *skb;
> -	unsigned char  *dptr;
> -	unsigned char  lci1, lci2;
> -	int maxfaclen = 0;
> -	int len, faclen;
> -	int reserve;
> -
> -	reserve = AX25_BPQ_HEADER_LEN + AX25_MAX_HEADER_LEN + 1;
> -	len = ROSE_MIN_LEN;
> -
> -	switch (frametype) {
> -	case ROSE_CALL_REQUEST:
> -		len   += 1 + ROSE_ADDR_LEN + ROSE_ADDR_LEN;
> -		maxfaclen = 256;
> -		break;
> -	case ROSE_CALL_ACCEPTED:
> -	case ROSE_CLEAR_REQUEST:
> -	case ROSE_RESET_REQUEST:
> -		len   += 2;
> -		break;
> -	}
> -
> -	skb = alloc_skb(reserve + len + maxfaclen, GFP_ATOMIC);
> -	if (!skb)
> -		return;
> -
> -	/*
> -	 *	Space for AX.25 header and PID.
> -	 */
> -	skb_reserve(skb, reserve);
> -
> -	dptr = skb_put(skb, len);
> -
> -	lci1 = (rose->lci >> 8) & 0x0F;
> -	lci2 = (rose->lci >> 0) & 0xFF;
> -
> -	switch (frametype) {
> -	case ROSE_CALL_REQUEST:
> -		*dptr++ = ROSE_GFI | lci1;
> -		*dptr++ = lci2;
> -		*dptr++ = frametype;
> -		*dptr++ = ROSE_CALL_REQ_ADDR_LEN_VAL;
> -		memcpy(dptr, &rose->dest_addr,  ROSE_ADDR_LEN);
> -		dptr   += ROSE_ADDR_LEN;
> -		memcpy(dptr, &rose->source_addr, ROSE_ADDR_LEN);
> -		dptr   += ROSE_ADDR_LEN;
> -		faclen = rose_create_facilities(dptr, rose);
> -		skb_put(skb, faclen);
> -		dptr   += faclen;
> -		break;
> -
> -	case ROSE_CALL_ACCEPTED:
> -		*dptr++ = ROSE_GFI | lci1;
> -		*dptr++ = lci2;
> -		*dptr++ = frametype;
> -		*dptr++ = 0x00;		/* Address length */
> -		*dptr++ = 0;		/* Facilities length */
> -		break;
> -
> -	case ROSE_CLEAR_REQUEST:
> -		*dptr++ = ROSE_GFI | lci1;
> -		*dptr++ = lci2;
> -		*dptr++ = frametype;
> -		*dptr++ = rose->cause;
> -		*dptr++ = rose->diagnostic;
> -		break;
> -
> -	case ROSE_RESET_REQUEST:
> -		*dptr++ = ROSE_GFI | lci1;
> -		*dptr++ = lci2;
> -		*dptr++ = frametype;
> -		*dptr++ = ROSE_DTE_ORIGINATED;
> -		*dptr++ = 0;
> -		break;
> -
> -	case ROSE_RR:
> -	case ROSE_RNR:
> -		*dptr++ = ROSE_GFI | lci1;
> -		*dptr++ = lci2;
> -		*dptr   = frametype;
> -		*dptr++ |= (rose->vr << 5) & 0xE0;
> -		break;
> -
> -	case ROSE_CLEAR_CONFIRMATION:
> -	case ROSE_RESET_CONFIRMATION:
> -		*dptr++ = ROSE_GFI | lci1;
> -		*dptr++ = lci2;
> -		*dptr++  = frametype;
> -		break;
> -
> -	default:
> -		printk(KERN_ERR "ROSE: rose_write_internal - invalid frametype %02X\n", frametype);
> -		kfree_skb(skb);
> -		return;
> -	}
> -
> -	rose_transmit_link(skb, rose->neighbour);
> -}
> -
> -int rose_decode(struct sk_buff *skb, int *ns, int *nr, int *q, int *d, int *m)
> -{
> -	unsigned char *frame;
> -
> -	frame = skb->data;
> -
> -	*ns = *nr = *q = *d = *m = 0;
> -
> -	switch (frame[2]) {
> -	case ROSE_CALL_REQUEST:
> -	case ROSE_CALL_ACCEPTED:
> -	case ROSE_CLEAR_REQUEST:
> -	case ROSE_CLEAR_CONFIRMATION:
> -	case ROSE_RESET_REQUEST:
> -	case ROSE_RESET_CONFIRMATION:
> -		return frame[2];
> -	default:
> -		break;
> -	}
> -
> -	if ((frame[2] & 0x1F) == ROSE_RR  ||
> -	    (frame[2] & 0x1F) == ROSE_RNR) {
> -		*nr = (frame[2] >> 5) & 0x07;
> -		return frame[2] & 0x1F;
> -	}
> -
> -	if ((frame[2] & 0x01) == ROSE_DATA) {
> -		*q  = (frame[0] & ROSE_Q_BIT) == ROSE_Q_BIT;
> -		*d  = (frame[0] & ROSE_D_BIT) == ROSE_D_BIT;
> -		*m  = (frame[2] & ROSE_M_BIT) == ROSE_M_BIT;
> -		*nr = (frame[2] >> 5) & 0x07;
> -		*ns = (frame[2] >> 1) & 0x07;
> -		return ROSE_DATA;
> -	}
> -
> -	return ROSE_ILLEGAL;
> -}
> -
> -static int rose_parse_national(unsigned char *p, struct rose_facilities_struct *facilities, int len)
> -{
> -	unsigned char *pt;
> -	unsigned char l, lg, n = 0;
> -	int fac_national_digis_received = 0;
> -
> -	do {
> -		switch (*p & 0xC0) {
> -		case 0x00:
> -			if (len < 2)
> -				return -1;
> -			p   += 2;
> -			n   += 2;
> -			len -= 2;
> -			break;
> -
> -		case 0x40:
> -			if (len < 3)
> -				return -1;
> -			if (*p == FAC_NATIONAL_RAND)
> -				facilities->rand = ((p[1] << 8) & 0xFF00) + ((p[2] << 0) & 0x00FF);
> -			p   += 3;
> -			n   += 3;
> -			len -= 3;
> -			break;
> -
> -		case 0x80:
> -			if (len < 4)
> -				return -1;
> -			p   += 4;
> -			n   += 4;
> -			len -= 4;
> -			break;
> -
> -		case 0xC0:
> -			if (len < 2)
> -				return -1;
> -			l = p[1];
> -			if (len < 2 + l)
> -				return -1;
> -			if (*p == FAC_NATIONAL_DEST_DIGI) {
> -				if (!fac_national_digis_received) {
> -					if (l < AX25_ADDR_LEN)
> -						return -1;
> -					memcpy(&facilities->source_digis[0], p + 2, AX25_ADDR_LEN);
> -					facilities->source_ndigis = 1;
> -				}
> -			}
> -			else if (*p == FAC_NATIONAL_SRC_DIGI) {
> -				if (!fac_national_digis_received) {
> -					if (l < AX25_ADDR_LEN)
> -						return -1;
> -					memcpy(&facilities->dest_digis[0], p + 2, AX25_ADDR_LEN);
> -					facilities->dest_ndigis = 1;
> -				}
> -			}
> -			else if (*p == FAC_NATIONAL_FAIL_CALL) {
> -				if (l < AX25_ADDR_LEN)
> -					return -1;
> -				memcpy(&facilities->fail_call, p + 2, AX25_ADDR_LEN);
> -			}
> -			else if (*p == FAC_NATIONAL_FAIL_ADD) {
> -				if (l < 1 + ROSE_ADDR_LEN)
> -					return -1;
> -				memcpy(&facilities->fail_addr, p + 3, ROSE_ADDR_LEN);
> -			}
> -			else if (*p == FAC_NATIONAL_DIGIS) {
> -				if (l % AX25_ADDR_LEN)
> -					return -1;
> -				fac_national_digis_received = 1;
> -				facilities->source_ndigis = 0;
> -				facilities->dest_ndigis   = 0;
> -				for (pt = p + 2, lg = 0 ; lg < l ; pt += AX25_ADDR_LEN, lg += AX25_ADDR_LEN) {
> -					if (pt[6] & AX25_HBIT) {
> -						if (facilities->dest_ndigis >= ROSE_MAX_DIGIS)
> -							return -1;
> -						memcpy(&facilities->dest_digis[facilities->dest_ndigis++], pt, AX25_ADDR_LEN);
> -					} else {
> -						if (facilities->source_ndigis >= ROSE_MAX_DIGIS)
> -							return -1;
> -						memcpy(&facilities->source_digis[facilities->source_ndigis++], pt, AX25_ADDR_LEN);
> -					}
> -				}
> -			}
> -			p   += l + 2;
> -			n   += l + 2;
> -			len -= l + 2;
> -			break;
> -		}
> -	} while (*p != 0x00 && len > 0);
> -
> -	return n;
> -}
> -
> -static int rose_parse_ccitt(unsigned char *p, struct rose_facilities_struct *facilities, int len)
> -{
> -	unsigned char l, n = 0;
> -	char callsign[11];
> -
> -	do {
> -		switch (*p & 0xC0) {
> -		case 0x00:
> -			if (len < 2)
> -				return -1;
> -			p   += 2;
> -			n   += 2;
> -			len -= 2;
> -			break;
> -
> -		case 0x40:
> -			if (len < 3)
> -				return -1;
> -			p   += 3;
> -			n   += 3;
> -			len -= 3;
> -			break;
> -
> -		case 0x80:
> -			if (len < 4)
> -				return -1;
> -			p   += 4;
> -			n   += 4;
> -			len -= 4;
> -			break;
> -
> -		case 0xC0:
> -			if (len < 2)
> -				return -1;
> -			l = p[1];
> -
> -			/* Prevent overflows*/
> -			if (l < 10 || l > 20)
> -				return -1;
> -
> -			if (*p == FAC_CCITT_DEST_NSAP) {
> -				memcpy(&facilities->source_addr, p + 7, ROSE_ADDR_LEN);
> -				memcpy(callsign, p + 12,   l - 10);
> -				callsign[l - 10] = '\0';
> -				asc2ax(&facilities->source_call, callsign);
> -			}
> -			if (*p == FAC_CCITT_SRC_NSAP) {
> -				memcpy(&facilities->dest_addr, p + 7, ROSE_ADDR_LEN);
> -				memcpy(callsign, p + 12, l - 10);
> -				callsign[l - 10] = '\0';
> -				asc2ax(&facilities->dest_call, callsign);
> -			}
> -			p   += l + 2;
> -			n   += l + 2;
> -			len -= l + 2;
> -			break;
> -		}
> -	} while (*p != 0x00 && len > 0);
> -
> -	return n;
> -}
> -
> -int rose_parse_facilities(unsigned char *p, unsigned packet_len,
> -	struct rose_facilities_struct *facilities)
> -{
> -	int facilities_len, len;
> -
> -	facilities_len = *p++;
> -
> -	if (facilities_len == 0 || (unsigned int)facilities_len > packet_len)
> -		return 0;
> -
> -	while (facilities_len >= 3 && *p == 0x00) {
> -		facilities_len--;
> -		p++;
> -
> -		switch (*p) {
> -		case FAC_NATIONAL:		/* National */
> -			len = rose_parse_national(p + 1, facilities, facilities_len - 1);
> -			break;
> -
> -		case FAC_CCITT:		/* CCITT */
> -			len = rose_parse_ccitt(p + 1, facilities, facilities_len - 1);
> -			break;
> -
> -		default:
> -			printk(KERN_DEBUG "ROSE: rose_parse_facilities - unknown facilities family %02X\n", *p);
> -			len = 1;
> -			break;
> -		}
> -
> -		if (len < 0)
> -			return 0;
> -		if (WARN_ON(len >= facilities_len))
> -			return 0;
> -		facilities_len -= len + 1;
> -		p += len + 1;
> -	}
> -
> -	return facilities_len == 0;
> -}
> -
> -static int rose_create_facilities(unsigned char *buffer, struct rose_sock *rose)
> -{
> -	unsigned char *p = buffer + 1;
> -	char *callsign;
> -	char buf[11];
> -	int len, nb;
> -
> -	/* National Facilities */
> -	if (rose->rand != 0 || rose->source_ndigis == 1 || rose->dest_ndigis == 1) {
> -		*p++ = 0x00;
> -		*p++ = FAC_NATIONAL;
> -
> -		if (rose->rand != 0) {
> -			*p++ = FAC_NATIONAL_RAND;
> -			*p++ = (rose->rand >> 8) & 0xFF;
> -			*p++ = (rose->rand >> 0) & 0xFF;
> -		}
> -
> -		/* Sent before older facilities */
> -		if ((rose->source_ndigis > 0) || (rose->dest_ndigis > 0)) {
> -			int maxdigi = 0;
> -			*p++ = FAC_NATIONAL_DIGIS;
> -			*p++ = AX25_ADDR_LEN * (rose->source_ndigis + rose->dest_ndigis);
> -			for (nb = 0 ; nb < rose->source_ndigis ; nb++) {
> -				if (++maxdigi >= ROSE_MAX_DIGIS)
> -					break;
> -				memcpy(p, &rose->source_digis[nb], AX25_ADDR_LEN);
> -				p[6] |= AX25_HBIT;
> -				p += AX25_ADDR_LEN;
> -			}
> -			for (nb = 0 ; nb < rose->dest_ndigis ; nb++) {
> -				if (++maxdigi >= ROSE_MAX_DIGIS)
> -					break;
> -				memcpy(p, &rose->dest_digis[nb], AX25_ADDR_LEN);
> -				p[6] &= ~AX25_HBIT;
> -				p += AX25_ADDR_LEN;
> -			}
> -		}
> -
> -		/* For compatibility */
> -		if (rose->source_ndigis > 0) {
> -			*p++ = FAC_NATIONAL_SRC_DIGI;
> -			*p++ = AX25_ADDR_LEN;
> -			memcpy(p, &rose->source_digis[0], AX25_ADDR_LEN);
> -			p   += AX25_ADDR_LEN;
> -		}
> -
> -		/* For compatibility */
> -		if (rose->dest_ndigis > 0) {
> -			*p++ = FAC_NATIONAL_DEST_DIGI;
> -			*p++ = AX25_ADDR_LEN;
> -			memcpy(p, &rose->dest_digis[0], AX25_ADDR_LEN);
> -			p   += AX25_ADDR_LEN;
> -		}
> -	}
> -
> -	*p++ = 0x00;
> -	*p++ = FAC_CCITT;
> -
> -	*p++ = FAC_CCITT_DEST_NSAP;
> -
> -	callsign = ax2asc(buf, &rose->dest_call);
> -
> -	*p++ = strlen(callsign) + 10;
> -	*p++ = (strlen(callsign) + 9) * 2;		/* ??? */
> -
> -	*p++ = 0x47; *p++ = 0x00; *p++ = 0x11;
> -	*p++ = ROSE_ADDR_LEN * 2;
> -	memcpy(p, &rose->dest_addr, ROSE_ADDR_LEN);
> -	p   += ROSE_ADDR_LEN;
> -
> -	memcpy(p, callsign, strlen(callsign));
> -	p   += strlen(callsign);
> -
> -	*p++ = FAC_CCITT_SRC_NSAP;
> -
> -	callsign = ax2asc(buf, &rose->source_call);
> -
> -	*p++ = strlen(callsign) + 10;
> -	*p++ = (strlen(callsign) + 9) * 2;		/* ??? */
> -
> -	*p++ = 0x47; *p++ = 0x00; *p++ = 0x11;
> -	*p++ = ROSE_ADDR_LEN * 2;
> -	memcpy(p, &rose->source_addr, ROSE_ADDR_LEN);
> -	p   += ROSE_ADDR_LEN;
> -
> -	memcpy(p, callsign, strlen(callsign));
> -	p   += strlen(callsign);
> -
> -	len       = p - buffer;
> -	buffer[0] = len - 1;
> -
> -	return len;
> -}
> -
> -void rose_disconnect(struct sock *sk, int reason, int cause, int diagnostic)
> -{
> -	struct rose_sock *rose = rose_sk(sk);
> -
> -	rose_stop_timer(sk);
> -	rose_stop_idletimer(sk);
> -
> -	rose_clear_queues(sk);
> -
> -	rose->lci   = 0;
> -	rose->state = ROSE_STATE_0;
> -
> -	if (cause != -1)
> -		rose->cause = cause;
> -
> -	if (diagnostic != -1)
> -		rose->diagnostic = diagnostic;
> -
> -	sk->sk_state     = TCP_CLOSE;
> -	sk->sk_err       = reason;
> -	sk->sk_shutdown |= SEND_SHUTDOWN;
> -
> -	if (!sock_flag(sk, SOCK_DEAD)) {
> -		sk->sk_state_change(sk);
> -		sock_set_flag(sk, SOCK_DEAD);
> -	}
> -}
> diff --git a/net/rose/rose_timer.c b/net/rose/rose_timer.c
> deleted file mode 100644
> index bb60a1654d61..000000000000
> --- a/net/rose/rose_timer.c
> +++ /dev/null
> @@ -1,227 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-or-later
> -/*
> - *
> - * Copyright (C) Jonathan Naylor G4KLX (g4klx@g4klx.demon.co.uk)
> - * Copyright (C) 2002 Ralf Baechle DO1GRB (ralf@gnu.org)
> - */
> -#include <linux/errno.h>
> -#include <linux/types.h>
> -#include <linux/socket.h>
> -#include <linux/in.h>
> -#include <linux/kernel.h>
> -#include <linux/jiffies.h>
> -#include <linux/timer.h>
> -#include <linux/string.h>
> -#include <linux/sockios.h>
> -#include <linux/net.h>
> -#include <net/ax25.h>
> -#include <linux/inet.h>
> -#include <linux/netdevice.h>
> -#include <linux/skbuff.h>
> -#include <net/sock.h>
> -#include <net/tcp_states.h>
> -#include <linux/fcntl.h>
> -#include <linux/mm.h>
> -#include <linux/interrupt.h>
> -#include <net/rose.h>
> -
> -static void rose_heartbeat_expiry(struct timer_list *t);
> -static void rose_timer_expiry(struct timer_list *);
> -static void rose_idletimer_expiry(struct timer_list *);
> -
> -void rose_start_heartbeat(struct sock *sk)
> -{
> -	sk_stop_timer(sk, &sk->sk_timer);
> -
> -	sk->sk_timer.function = rose_heartbeat_expiry;
> -	sk->sk_timer.expires  = jiffies + 5 * HZ;
> -
> -	sk_reset_timer(sk, &sk->sk_timer, sk->sk_timer.expires);
> -}
> -
> -void rose_start_t1timer(struct sock *sk)
> -{
> -	struct rose_sock *rose = rose_sk(sk);
> -
> -	sk_stop_timer(sk, &rose->timer);
> -
> -	rose->timer.function = rose_timer_expiry;
> -	rose->timer.expires  = jiffies + rose->t1;
> -
> -	sk_reset_timer(sk, &rose->timer, rose->timer.expires);
> -}
> -
> -void rose_start_t2timer(struct sock *sk)
> -{
> -	struct rose_sock *rose = rose_sk(sk);
> -
> -	sk_stop_timer(sk, &rose->timer);
> -
> -	rose->timer.function = rose_timer_expiry;
> -	rose->timer.expires  = jiffies + rose->t2;
> -
> -	sk_reset_timer(sk, &rose->timer, rose->timer.expires);
> -}
> -
> -void rose_start_t3timer(struct sock *sk)
> -{
> -	struct rose_sock *rose = rose_sk(sk);
> -
> -	sk_stop_timer(sk, &rose->timer);
> -
> -	rose->timer.function = rose_timer_expiry;
> -	rose->timer.expires  = jiffies + rose->t3;
> -
> -	sk_reset_timer(sk, &rose->timer, rose->timer.expires);
> -}
> -
> -void rose_start_hbtimer(struct sock *sk)
> -{
> -	struct rose_sock *rose = rose_sk(sk);
> -
> -	sk_stop_timer(sk, &rose->timer);
> -
> -	rose->timer.function = rose_timer_expiry;
> -	rose->timer.expires  = jiffies + rose->hb;
> -
> -	sk_reset_timer(sk, &rose->timer, rose->timer.expires);
> -}
> -
> -void rose_start_idletimer(struct sock *sk)
> -{
> -	struct rose_sock *rose = rose_sk(sk);
> -
> -	sk_stop_timer(sk, &rose->idletimer);
> -
> -	if (rose->idle > 0) {
> -		rose->idletimer.function = rose_idletimer_expiry;
> -		rose->idletimer.expires  = jiffies + rose->idle;
> -
> -		sk_reset_timer(sk, &rose->idletimer, rose->idletimer.expires);
> -	}
> -}
> -
> -void rose_stop_heartbeat(struct sock *sk)
> -{
> -	sk_stop_timer(sk, &sk->sk_timer);
> -}
> -
> -void rose_stop_timer(struct sock *sk)
> -{
> -	sk_stop_timer(sk, &rose_sk(sk)->timer);
> -}
> -
> -void rose_stop_idletimer(struct sock *sk)
> -{
> -	sk_stop_timer(sk, &rose_sk(sk)->idletimer);
> -}
> -
> -static void rose_heartbeat_expiry(struct timer_list *t)
> -{
> -	struct sock *sk = timer_container_of(sk, t, sk_timer);
> -	struct rose_sock *rose = rose_sk(sk);
> -
> -	bh_lock_sock(sk);
> -	if (sock_owned_by_user(sk)) {
> -		sk_reset_timer(sk, &sk->sk_timer, jiffies + HZ/20);
> -		goto out;
> -	}
> -	switch (rose->state) {
> -	case ROSE_STATE_0:
> -		/* Magic here: If we listen() and a new link dies before it
> -		   is accepted() it isn't 'dead' so doesn't get removed. */
> -		if (sock_flag(sk, SOCK_DESTROY) ||
> -		    (sk->sk_state == TCP_LISTEN && sock_flag(sk, SOCK_DEAD))) {
> -			bh_unlock_sock(sk);
> -			rose_destroy_socket(sk);
> -			sock_put(sk);
> -			return;
> -		}
> -		break;
> -
> -	case ROSE_STATE_3:
> -		/*
> -		 * Check for the state of the receive buffer.
> -		 */
> -		if (atomic_read(&sk->sk_rmem_alloc) < (sk->sk_rcvbuf / 2) &&
> -		    (rose->condition & ROSE_COND_OWN_RX_BUSY)) {
> -			rose->condition &= ~ROSE_COND_OWN_RX_BUSY;
> -			rose->condition &= ~ROSE_COND_ACK_PENDING;
> -			rose->vl         = rose->vr;
> -			rose_write_internal(sk, ROSE_RR);
> -			rose_stop_timer(sk);	/* HB */
> -			break;
> -		}
> -		break;
> -	}
> -
> -	rose_start_heartbeat(sk);
> -out:
> -	bh_unlock_sock(sk);
> -	sock_put(sk);
> -}
> -
> -static void rose_timer_expiry(struct timer_list *t)
> -{
> -	struct rose_sock *rose = timer_container_of(rose, t, timer);
> -	struct sock *sk = &rose->sock;
> -
> -	bh_lock_sock(sk);
> -	if (sock_owned_by_user(sk)) {
> -		sk_reset_timer(sk, &rose->timer, jiffies + HZ/20);
> -		goto out;
> -	}
> -	switch (rose->state) {
> -	case ROSE_STATE_1:	/* T1 */
> -	case ROSE_STATE_4:	/* T2 */
> -		rose_write_internal(sk, ROSE_CLEAR_REQUEST);
> -		rose->state = ROSE_STATE_2;
> -		rose_start_t3timer(sk);
> -		break;
> -
> -	case ROSE_STATE_2:	/* T3 */
> -		rose_neigh_put(rose->neighbour);
> -		rose_disconnect(sk, ETIMEDOUT, -1, -1);
> -		break;
> -
> -	case ROSE_STATE_3:	/* HB */
> -		if (rose->condition & ROSE_COND_ACK_PENDING) {
> -			rose->condition &= ~ROSE_COND_ACK_PENDING;
> -			rose_enquiry_response(sk);
> -		}
> -		break;
> -	}
> -out:
> -	bh_unlock_sock(sk);
> -	sock_put(sk);
> -}
> -
> -static void rose_idletimer_expiry(struct timer_list *t)
> -{
> -	struct rose_sock *rose = timer_container_of(rose, t, idletimer);
> -	struct sock *sk = &rose->sock;
> -
> -	bh_lock_sock(sk);
> -	if (sock_owned_by_user(sk)) {
> -		sk_reset_timer(sk, &rose->idletimer, jiffies + HZ/20);
> -		goto out;
> -	}
> -	rose_clear_queues(sk);
> -
> -	rose_write_internal(sk, ROSE_CLEAR_REQUEST);
> -	rose_sk(sk)->state = ROSE_STATE_2;
> -
> -	rose_start_t3timer(sk);
> -
> -	sk->sk_state     = TCP_CLOSE;
> -	sk->sk_err       = 0;
> -	sk->sk_shutdown |= SEND_SHUTDOWN;
> -
> -	if (!sock_flag(sk, SOCK_DEAD)) {
> -		sk->sk_state_change(sk);
> -		sock_set_flag(sk, SOCK_DEAD);
> -	}
> -out:
> -	bh_unlock_sock(sk);
> -	sock_put(sk);
> -}
> diff --git a/net/rose/sysctl_net_rose.c b/net/rose/sysctl_net_rose.c
> deleted file mode 100644
> index d801315b7083..000000000000
> --- a/net/rose/sysctl_net_rose.c
> +++ /dev/null
> @@ -1,125 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-or-later
> -/*
> - *
> - * Copyright (C) 1996 Mike Shaver (shaver@zeroknowledge.com)
> - */
> -#include <linux/mm.h>
> -#include <linux/sysctl.h>
> -#include <linux/init.h>
> -#include <net/ax25.h>
> -#include <net/rose.h>
> -
> -static int min_timer[]  = {1 * HZ};
> -static int max_timer[]  = {300 * HZ};
> -static int min_idle[]   = {0 * HZ};
> -static int max_idle[]   = {65535 * HZ};
> -static int min_route[1],       max_route[] = {1};
> -static int min_ftimer[] = {60 * HZ};
> -static int max_ftimer[] = {600 * HZ};
> -static int min_maxvcs[] = {1}, max_maxvcs[] = {254};
> -static int min_window[] = {1}, max_window[] = {7};
> -
> -static struct ctl_table_header *rose_table_header;
> -
> -static struct ctl_table rose_table[] = {
> -	{
> -		.procname	= "restart_request_timeout",
> -		.data		= &sysctl_rose_restart_request_timeout,
> -		.maxlen		= sizeof(int),
> -		.mode		= 0644,
> -		.proc_handler	= proc_dointvec_minmax,
> -		.extra1		= &min_timer,
> -		.extra2		= &max_timer
> -	},
> -	{
> -		.procname	= "call_request_timeout",
> -		.data		= &sysctl_rose_call_request_timeout,
> -		.maxlen		= sizeof(int),
> -		.mode		= 0644,
> -		.proc_handler	= proc_dointvec_minmax,
> -		.extra1		= &min_timer,
> -		.extra2		= &max_timer
> -	},
> -	{
> -		.procname	= "reset_request_timeout",
> -		.data		= &sysctl_rose_reset_request_timeout,
> -		.maxlen		= sizeof(int),
> -		.mode		= 0644,
> -		.proc_handler	= proc_dointvec_minmax,
> -		.extra1		= &min_timer,
> -		.extra2		= &max_timer
> -	},
> -	{
> -		.procname	= "clear_request_timeout",
> -		.data		= &sysctl_rose_clear_request_timeout,
> -		.maxlen		= sizeof(int),
> -		.mode		= 0644,
> -		.proc_handler	= proc_dointvec_minmax,
> -		.extra1		= &min_timer,
> -		.extra2		= &max_timer
> -	},
> -	{
> -		.procname	= "no_activity_timeout",
> -		.data		= &sysctl_rose_no_activity_timeout,
> -		.maxlen		= sizeof(int),
> -		.mode		= 0644,
> -		.proc_handler	= proc_dointvec_minmax,
> -		.extra1		= &min_idle,
> -		.extra2		= &max_idle
> -	},
> -	{
> -		.procname	= "acknowledge_hold_back_timeout",
> -		.data		= &sysctl_rose_ack_hold_back_timeout,
> -		.maxlen		= sizeof(int),
> -		.mode		= 0644,
> -		.proc_handler	= proc_dointvec_minmax,
> -		.extra1		= &min_timer,
> -		.extra2		= &max_timer
> -	},
> -	{
> -		.procname	= "routing_control",
> -		.data		= &sysctl_rose_routing_control,
> -		.maxlen		= sizeof(int),
> -		.mode		= 0644,
> -		.proc_handler	= proc_dointvec_minmax,
> -		.extra1		= &min_route,
> -		.extra2		= &max_route
> -	},
> -	{
> -		.procname	= "link_fail_timeout",
> -		.data		= &sysctl_rose_link_fail_timeout,
> -		.maxlen		= sizeof(int),
> -		.mode		= 0644,
> -		.proc_handler	= proc_dointvec_minmax,
> -		.extra1		= &min_ftimer,
> -		.extra2		= &max_ftimer
> -	},
> -	{
> -		.procname	= "maximum_virtual_circuits",
> -		.data		= &sysctl_rose_maximum_vcs,
> -		.maxlen		= sizeof(int),
> -		.mode		= 0644,
> -		.proc_handler	= proc_dointvec_minmax,
> -		.extra1		= &min_maxvcs,
> -		.extra2		= &max_maxvcs
> -	},
> -	{
> -		.procname	= "window_size",
> -		.data		= &sysctl_rose_window_size,
> -		.maxlen		= sizeof(int),
> -		.mode		= 0644,
> -		.proc_handler	= proc_dointvec_minmax,
> -		.extra1		= &min_window,
> -		.extra2		= &max_window
> -	},
> -};
> -
> -void __init rose_register_sysctl(void)
> -{
> -	rose_table_header = register_net_sysctl(&init_net, "net/rose", rose_table);
> -}
> -
> -void rose_unregister_sysctl(void)
> -{
> -	unregister_net_sysctl_table(rose_table_header);
> -}
> diff --git a/arch/mips/configs/bcm47xx_defconfig b/arch/mips/configs/bcm47xx_defconfig
> index d10b3d4adbd1..acbab8dae53f 100644
> --- a/arch/mips/configs/bcm47xx_defconfig
> +++ b/arch/mips/configs/bcm47xx_defconfig
> @@ -28,7 +28,6 @@ CONFIG_NETFILTER=y
>   CONFIG_VLAN_8021Q=y
>   CONFIG_NET_SCHED=y
>   CONFIG_NET_SCH_FQ_CODEL=y
> -CONFIG_HAMRADIO=y
>   CONFIG_CFG80211=y
>   CONFIG_MAC80211=y
>   CONFIG_MTD=y
> diff --git a/arch/mips/configs/bigsur_defconfig b/arch/mips/configs/bigsur_defconfig
> index 3b64e151e187..aa63ada62e28 100644
> --- a/arch/mips/configs/bigsur_defconfig
> +++ b/arch/mips/configs/bigsur_defconfig
> @@ -84,16 +84,6 @@ CONFIG_IP_VS_FTP=m
>   CONFIG_BRIDGE=m
>   CONFIG_VLAN_8021Q=m
>   CONFIG_VLAN_8021Q_GVRP=y
> -CONFIG_HAMRADIO=y
> -CONFIG_AX25=m
> -CONFIG_NETROM=m
> -CONFIG_ROSE=m
> -CONFIG_MKISS=m
> -CONFIG_6PACK=m
> -CONFIG_BPQETHER=m
> -CONFIG_BAYCOM_SER_FDX=m
> -CONFIG_BAYCOM_SER_HDX=m
> -CONFIG_YAM=m
>   CONFIG_FW_LOADER=m
>   CONFIG_BLK_DEV_LOOP=m
>   CONFIG_BLK_DEV_NBD=m
> diff --git a/arch/mips/configs/gpr_defconfig b/arch/mips/configs/gpr_defconfig
> index 8097974489e3..ad80ad2eae6b 100644
> --- a/arch/mips/configs/gpr_defconfig
> +++ b/arch/mips/configs/gpr_defconfig
> @@ -126,17 +126,6 @@ CONFIG_NET_EMATCH_TEXT=m
>   CONFIG_NET_CLS_ACT=y
>   CONFIG_NET_ACT_POLICE=y
>   CONFIG_NET_PKTGEN=m
> -CONFIG_HAMRADIO=y
> -CONFIG_AX25=m
> -# CONFIG_AX25_DAMA_SLAVE is not set
> -CONFIG_NETROM=m
> -CONFIG_ROSE=m
> -CONFIG_MKISS=m
> -CONFIG_6PACK=m
> -CONFIG_BPQETHER=m
> -CONFIG_BAYCOM_SER_FDX=m
> -CONFIG_BAYCOM_SER_HDX=m
> -CONFIG_YAM=m
>   CONFIG_CFG80211=y
>   CONFIG_MAC80211=y
>   CONFIG_MTD=y
> diff --git a/arch/mips/configs/mtx1_defconfig b/arch/mips/configs/mtx1_defconfig
> index 63787b8b733e..1295164af08e 100644
> --- a/arch/mips/configs/mtx1_defconfig
> +++ b/arch/mips/configs/mtx1_defconfig
> @@ -172,17 +172,6 @@ CONFIG_NET_EMATCH_TEXT=m
>   CONFIG_NET_CLS_ACT=y
>   CONFIG_NET_ACT_POLICE=y
>   CONFIG_NET_PKTGEN=m
> -CONFIG_HAMRADIO=y
> -CONFIG_AX25=m
> -# CONFIG_AX25_DAMA_SLAVE is not set
> -CONFIG_NETROM=m
> -CONFIG_ROSE=m
> -CONFIG_MKISS=m
> -CONFIG_6PACK=m
> -CONFIG_BPQETHER=m
> -CONFIG_BAYCOM_SER_FDX=m
> -CONFIG_BAYCOM_SER_HDX=m
> -CONFIG_YAM=m
>   CONFIG_BT=m
>   CONFIG_BT_RFCOMM=m
>   CONFIG_BT_RFCOMM_TTY=y
> diff --git a/arch/mips/configs/rb532_defconfig b/arch/mips/configs/rb532_defconfig
> index 30d18b084cda..a88322fe3935 100644
> --- a/arch/mips/configs/rb532_defconfig
> +++ b/arch/mips/configs/rb532_defconfig
> @@ -95,7 +95,6 @@ CONFIG_NET_ACT_GACT=m
>   CONFIG_GACT_PROB=y
>   CONFIG_NET_ACT_MIRRED=m
>   CONFIG_NET_ACT_PEDIT=m
> -CONFIG_HAMRADIO=y
>   CONFIG_MTD=y
>   CONFIG_MTD_BLOCK=y
>   CONFIG_MTD_BLOCK2MTD=y
> diff --git a/arch/mips/configs/rm200_defconfig b/arch/mips/configs/rm200_defconfig
> index b1e67ff0c4f0..ad9fbd0cbb38 100644
> --- a/arch/mips/configs/rm200_defconfig
> +++ b/arch/mips/configs/rm200_defconfig
> @@ -147,13 +147,6 @@ CONFIG_NET_CLS_FW=m
>   CONFIG_NET_CLS_U32=m
>   CONFIG_NET_CLS_RSVP=m
>   CONFIG_NET_CLS_RSVP6=m
> -CONFIG_HAMRADIO=y
> -CONFIG_AX25=m
> -CONFIG_NETROM=m
> -CONFIG_ROSE=m
> -CONFIG_MKISS=m
> -CONFIG_6PACK=m
> -CONFIG_BPQETHER=m
>   CONFIG_CONNECTOR=m
>   CONFIG_PARPORT=m
>   CONFIG_PARPORT_PC=m
> diff --git a/arch/mips/configs/rt305x_defconfig b/arch/mips/configs/rt305x_defconfig
> index 8f9701efef19..c920976bedd0 100644
> --- a/arch/mips/configs/rt305x_defconfig
> +++ b/arch/mips/configs/rt305x_defconfig
> @@ -64,7 +64,6 @@ CONFIG_BRIDGE=y
>   # CONFIG_BRIDGE_IGMP_SNOOPING is not set
>   CONFIG_VLAN_8021Q=y
>   CONFIG_NET_SCHED=y
> -CONFIG_HAMRADIO=y
>   CONFIG_MTD=y
>   CONFIG_MTD_CMDLINE_PARTS=y
>   CONFIG_MTD_BLOCK=y
> diff --git a/arch/mips/configs/xway_defconfig b/arch/mips/configs/xway_defconfig
> index aae8497b6872..f1c53bbb72e9 100644
> --- a/arch/mips/configs/xway_defconfig
> +++ b/arch/mips/configs/xway_defconfig
> @@ -66,7 +66,6 @@ CONFIG_BRIDGE=y
>   # CONFIG_BRIDGE_IGMP_SNOOPING is not set
>   CONFIG_VLAN_8021Q=y
>   CONFIG_NET_SCHED=y
> -CONFIG_HAMRADIO=y
>   CONFIG_MTD=y
>   CONFIG_MTD_CMDLINE_PARTS=y
>   CONFIG_MTD_BLOCK=y

