Return-Path: <linux-mips+bounces-12984-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WBaLJKVjcmnfjQAAu9opvQ
	(envelope-from <linux-mips+bounces-12984-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 22 Jan 2026 18:51:33 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 661116BB62
	for <lists+linux-mips@lfdr.de>; Thu, 22 Jan 2026 18:51:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7ACEB30DDD98
	for <lists+linux-mips@lfdr.de>; Thu, 22 Jan 2026 17:39:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEAFD2D6E63;
	Thu, 22 Jan 2026 17:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lVZmkcwn"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9D12DEA8C
	for <linux-mips@vger.kernel.org>; Thu, 22 Jan 2026 17:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769102829; cv=pass; b=vEu4JrE4Y42+Yf03pRtMjneYlPPbpWUSYFdPts68tY0pSTUuU2ERBPKiXLOWK99Jd3TxrZGfqGcQSyIb/MtISNhw2ht4LxzP1hSynE/G+cDUfSrh+duQQOWaNNQpafWfWEnf3dr/v86mVrZfJxV3QjNjSc9RWKgicEFH/Ja08jI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769102829; c=relaxed/simple;
	bh=BYyLZBP8y8y8dYg70IIuqbmfbBD25HnRi0CsXenU/+8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i4oTO49uOU+u8XpE5ui/PdWcHRbnuHCSRXjCJu52P1ErXshn7/sRDnGgN4Q1AfSjmS/4IvINFinWZKesE+Bf+q3mDuiFohi4kMfeW+9qw33RgInfe3JMmVK4mDwZkv9KyaGWNBHq2N3Ar7tq/GJ1W5/nCGunNQB9lFCUCVOzsWY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lVZmkcwn; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-59b6c13b68dso1973161e87.0
        for <linux-mips@vger.kernel.org>; Thu, 22 Jan 2026 09:26:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769102815; cv=none;
        d=google.com; s=arc-20240605;
        b=e8+Wacb71BZ1xiu0xMhMMVl7uORmGWQK8ajOMzAUgr4Ioe69lrJ9Jlu/F4w2pxQZTF
         zkVPe54ZytHJUKyxgGNLhZhWEd84xtIGLckybTKgRoysHnHKr2qZzHFtY6oavk3xhT10
         nmoJT7sIO+jOP4PF1DshHRhcQ96WXPh0MT2FaApTVmhSGFZSFQW9MyH7BOkmtEd8y14v
         V6Axfd4tgpacl9V6BrTiY4ZiFz1ieCy/McH9/3XBPedOerAdeOYB9KJnSFJN9jYkmcF6
         z28Dbrxy4no+IqFrfIn+SgCo5dlBf7dLKvla2minq/6BRKKs9mQH/D5Lx8VqwPInzzBB
         1rxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=O0wwwgamx5qsFGEUilYG/RiRlT7XyKwhafQRv/ycuZ4=;
        fh=/3jGmynifWuscstNjyqJ/jtquvBou0qv0rZkKgVjD5w=;
        b=gdSaBVxEsorMROmcDTmajNo0u1228SMub8K4k0lL23gOHL0SfZlSfX97qKrR+VGlVR
         erYqcEXengvgHp8hWAgJRBZ3ZtBXq1ZwNzgK0Bt5HP7llLC9MtVWDdF8vAqvKOzcJbaM
         p6eCMOuEbPoFoKUnzMO7JP5G2EJTc0oX1oEwWXYW8y86F8UuzAxyRxjvRmKTl2OhbUTr
         UilOAsRA8cDlTqtfLcpwJ8tL85Zvf1xUXwWIvDYhrVWDoQz6XTBxDqOk9fUm8ZkWiPr8
         ZzRW32cO2FQ3y7cdH/RY1k+UFucex/3bcpPM4CddsTIMF5PcvcuoCdIi0sPBi1DImMzA
         C0/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769102815; x=1769707615; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=O0wwwgamx5qsFGEUilYG/RiRlT7XyKwhafQRv/ycuZ4=;
        b=lVZmkcwncUrKQsCr9iZZ2DDZYy48Aq5IhASQaJm71kNC1ujNZd1gErmimptQIJw4l8
         9kA4tlZftyYXDrUeST2dgeKkfkxV+CJjfXLhPtIcVtYjiT2CQ8zbT8VpIUqiKfFdcoKN
         SVjwx2/bn1TIqc2vSEeqPYxtfkKTRx2ChdkNMmOqtqDvmPXJouseINFPl439+JCfRvXc
         339iWo5naNAYe8rbV6Q5hoDXVNXxARVgrBIxMerU8azZ3rdHb5tP98tZb1bTjBI9J0n6
         J9dJTQzHv/s7EkpWF/iEfZc2xsbW0GaQwXVvXCKBFoECOUR5y3tP3mn/fiLPKVeZ7l8v
         +oSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769102815; x=1769707615;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O0wwwgamx5qsFGEUilYG/RiRlT7XyKwhafQRv/ycuZ4=;
        b=X7aq5oUpn7W80Rn2YjdssVPrZ4ns9rIXIYwGdZ+V4McWibnJThU/t8blt5xniQPP+u
         G1oUCfWu2CLqXNYwXTd/UiSBQnzZqIQZ4AKvpZEEbwnZDndr/mPAmp/wlFpU39mOrFFT
         Q5VSGd5aevNXDJNoDhptWMyAlhTin7RLWDuLnptyW+D2tILIYDlsSc4HdLhGuJEKP0pf
         0r8XN7X0gNOCS7yFv3rQ/qlqvFf8FCl90ErGNiYiOHH4uis/evzpUSvLl9TKtd44ZnMi
         UzpW1SH4doypEbb6WBKbGzO1sPS5n2FnHMtdLa0jQ5kspSbz91rOBUPEfGPFPX0Bs2BS
         ELXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZoY3/inB87sE28k+IXxV2kp7Ej3BPn+8uLVhRmZQC5t7lgTZQnt+q2e6oXN1rPxvbLNGcE8SMnZPm@vger.kernel.org
X-Gm-Message-State: AOJu0YzuQc0+Ug9rUDns0jWpx1stfb6+VTts4iyfLP6hLmn4CHb99KwS
	mOtgayiZ0E05OCqeT+/gttRT+XxN3r5HzkDAWrSUP51GiNQpdAvKu3ZesvXihANHsrlguT2BeHb
	W4Iv0xlTFphZn/0g17v7JWMjkep8RQPKGWAPPFJC9UAunu7PcQ0/G
X-Gm-Gg: AZuq6aIn1k51ZpXUd0qh86SYUMd5WOH/yX6itYNBOAkrCw0v0+PO9PpKGTjN9N4texm
	X1EQi/+PUxBqH+SKhli1Fu4DoImDh8aLeuv+G8lw4U7x5b9qplUCUmRXxFgXRNY/whe06fcfBlf
	NtYHqXwyjtOtYLuMDoLLFOOJM9H2sXsGFUv7A7wcAF1volZ8DCGDhQQ4MEqcO7xWz+WqljvtDhj
	3YT9bQED7aIwuNOHR09KLE3odqUi+HnkItv7GrByNtrOcwXpldga9MnHLzU+0HtfLe+lTq4
X-Received: by 2002:ac2:4f0e:0:b0:59b:6ac6:115f with SMTP id
 2adb3069b0e04-59de45b3cc0mr47745e87.18.1769102815205; Thu, 22 Jan 2026
 09:26:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260112-mips-pic32-header-move-v2-0-927d516b1ff9@redhat.com> <20260112-mips-pic32-header-move-v2-9-927d516b1ff9@redhat.com>
In-Reply-To: <20260112-mips-pic32-header-move-v2-9-927d516b1ff9@redhat.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 22 Jan 2026 18:26:18 +0100
X-Gm-Features: AZwV_QhnJ9ztXIYztk-bUWG2DWjCH9tOitqOdGADe2tFkQurOXElAaxhsGE8iIA
Message-ID: <CAPDyKFoS-HBNm7m7AyGvm8nr82hN09qeAo+O4GADr-jO_mX+iA@mail.gmail.com>
Subject: Re: [PATCH v2 09/16] mmc: sdhci-pic32: update include to use pic32.h
 from platform_data
To: Brian Masney <bmasney@redhat.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Adrian Hunter <adrian.hunter@intel.com>, linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12984-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ulf.hansson@linaro.org,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	TAGGED_RCPT(0.00)[linux-mips];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,linaro.org:email,linaro.org:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 661116BB62
X-Rspamd-Action: no action

On Mon, 12 Jan 2026 at 23:49, Brian Masney <bmasney@redhat.com> wrote:
>
> Use the linux/platform_data/pic32.h include instead of
> asm/mach-pic32/pic32.h so that the asm variant can be dropped. This
> is in preparation for allowing some drivers to be compiled on other
> architectures with COMPILE_TEST enabled.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>

I noticed Adrian has acked this already, but if not too late, feel
free to add my ack too.

Acked-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

>
> ---
> To: Adrian Hunter <adrian.hunter@intel.com>
> To: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: linux-mmc@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  drivers/mmc/host/sdhci-pic32.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/sdhci-pic32.c b/drivers/mmc/host/sdhci-pic32.c
> index 7ddac0befed87e6e46acfa7593203a5b540558bf..2cc632e91fe454bf29c1da22e45135d5d0267f54 100644
> --- a/drivers/mmc/host/sdhci-pic32.c
> +++ b/drivers/mmc/host/sdhci-pic32.c
> @@ -18,6 +18,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/irq.h>
>  #include <linux/of.h>
> +#include <linux/platform_data/sdhci-pic32.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm.h>
>  #include <linux/slab.h>
> @@ -25,7 +26,6 @@
>  #include <linux/io.h>
>  #include "sdhci.h"
>  #include "sdhci-pltfm.h"
> -#include <linux/platform_data/sdhci-pic32.h>
>
>  #define SDH_SHARED_BUS_CTRL            0x000000E0
>  #define SDH_SHARED_BUS_NR_CLK_PINS_MASK        0x7
>
> --
> 2.52.0
>

