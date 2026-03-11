Return-Path: <linux-mips+bounces-13562-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yHecLc5rsWkuvAIAu9opvQ
	(envelope-from <linux-mips+bounces-13562-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 11 Mar 2026 14:19:10 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7CA264512
	for <lists+linux-mips@lfdr.de>; Wed, 11 Mar 2026 14:19:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6EA81318FCA0
	for <lists+linux-mips@lfdr.de>; Wed, 11 Mar 2026 13:16:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9BBF306D26;
	Wed, 11 Mar 2026 13:16:11 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549533090CC
	for <linux-mips@vger.kernel.org>; Wed, 11 Mar 2026 13:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773234971; cv=none; b=ZvI21s+bveivUtLxN7kaqhDXYUqhYwZvMymdbmeAfLRCLzqh6+yD/W2BUdy0t/zbHMHNbeWxK2B3tY7wv6A7JsM0II+B4gEoCHG9kwwQwgAJ+AVEsicbF3TrgzabDV2gaHPbus+MWaVlHY3RVjb0OHiB4B8Io5lxn+c8TqV1CPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773234971; c=relaxed/simple;
	bh=bQRlE5OR+3/41N9B/xBGXfMeOTv3hgeQ2WrY6jcTpBY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fjrC5WgzOX4Q1FQASlGYMYhwefWiV/1AzMpyO2xd8Z+QU9unll77tV2lXIt4l3hYmoJbeuAvwJ9kO4jU/mKPpfBYT1Q+dDgC2DyYyHD5H3zycdNgiurXd8yPauD/Cf4ab2HYjURDC6VXBM6OJH9AnbQIgSUvd5Gk7AcR2tnzdoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5675d609621so11786927e0c.2
        for <linux-mips@vger.kernel.org>; Wed, 11 Mar 2026 06:16:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773234969; x=1773839769;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=34DR94e/1PAvLLEaib58vFA4GW0m5SGe6jvxchEhMek=;
        b=hbdac/R1658yk3lW1Brec1LqjBM6y1WYfzssllsZbqWCMfQEQF9qHPCZvdhQcqqD5S
         EyjRm+k2GARrF0zjcpipOvK9z60Rekn2A9zSd5I3N3FGU1AOD8w5JwzZx+tD15mMlE1g
         sSu1wEr29kpSapLTOdQWcT6L+Idg40nkQgAf6VNEz0JYxt9+wFfY1BUoNKSSD9n3te6l
         s/jn4W0l9VQWDYsl9kaq3ZFdoZOk47XLfXwjqmAQUrBOd2j5Z4/CEZrIEw4ZmbrLJ6+R
         U8dmpsxaVO78m97c0I66djDEUy3dlpHpQDgZbda7b2qtwhKzVA1BY8/WlMV98MLdzjDy
         YvCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcZn2gIRuEZuyNxiLxxT93Q2l4GlW19tuHy7ZGJqiGP3CVtfz8T0crm4++AbpLfKfAT8UlHyRcuzTp@vger.kernel.org
X-Gm-Message-State: AOJu0YykxcWckgDU0ld7zmeF5b/EczeRgicahUT3GOyVkrgzopkEb5aG
	BJaSr5adLdv0/h6qZkvmG6PIl22tLqqE5F2zk/a33UrOrjOh+7PsiJS3vTuc0A6M0Ao=
X-Gm-Gg: ATEYQzzXSs+az0E51xdMebzhgEUD0gqBRrXIPv2za91TaeVAr+ev0YJR/lIehDSdzGK
	f51tRYru58JgDElOgkeOmV1SppTSsHrw2jdTMwb28hnTQdt4xbElLZVQALOYOhKUfqw8esQtjGS
	ACUZdf3Jn1Uh74+UNpBL2YO2DzLCHX8wZ7DEQ/otVjbNmEMKSzjaUt1p9lhmaB6dgZ4ompYO3W2
	+e1xAvgb43tnKaP6DTz6BHScjkKQljhbkJTtEYdivMHKU4PNMZK6gV/fttDKGxHh00On2I+2F3c
	PfhZMa7OHB/GZfioFViRBJxwB+GNA4fThq2k6Cypt2bvDu0/11X3cUjz93ejdJJRgsNzo6P0Y2T
	TYkX3KAxVdRYquBm563VcWZjuuRvSXoCI/6pUWfiwO8VR4hlSE++zVJD+HSNiCaHJrB5bk+bUrv
	wTQSgtoEVdbjswMimz2H27uvSgzkBld9niN4+8F1r4X2H4xyimfT7UqOcySs4r/yD+
X-Received: by 2002:a05:6122:459b:b0:56a:f015:82c7 with SMTP id 71dfb90a1353d-56b4752d736mr943915e0c.9.1773234969393;
        Wed, 11 Mar 2026 06:16:09 -0700 (PDT)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56b4645d132sm928372e0c.11.2026.03.11.06.16.07
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 06:16:07 -0700 (PDT)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-56b18f05f49so2419034e0c.1
        for <linux-mips@vger.kernel.org>; Wed, 11 Mar 2026 06:16:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXP5KXvf83xT2+25fEJKxd+7/H/IdEWAGEuMAxzSq/72cwrkmAlp5/FFmZDvsDPiiWfvlqOz4BTdINF@vger.kernel.org
X-Received: by 2002:a05:6122:1d05:b0:55b:7494:177b with SMTP id
 71dfb90a1353d-56b4752d806mr922396e0c.10.1773234967338; Wed, 11 Mar 2026
 06:16:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de> <20260310-b4-is_err_or_null-v1-36-bd63b656022d@avm.de>
In-Reply-To: <20260310-b4-is_err_or_null-v1-36-bd63b656022d@avm.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Mar 2026 14:15:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXQ8Q4jvkgFRJYhghz2BZRDC-9Mk6DbXxuaOc6C9DFHZQ@mail.gmail.com>
X-Gm-Features: AaiRm52J84H77ROK64ZWWtJfaiCpnFeKyoSRmPbi-NC8CN6Ju1TJEFxJU9gZQQ8
Message-ID: <CAMuHMdXQ8Q4jvkgFRJYhghz2BZRDC-9Mk6DbXxuaOc6C9DFHZQ@mail.gmail.com>
Subject: Re: [PATCH 36/61] arch/sh: Prefer IS_ERR_OR_NULL over manual NULL check
To: Philipp Hahn <phahn-oss@avm.de>
Cc: amd-gfx@lists.freedesktop.org, apparmor@lists.ubuntu.com, 
	bpf@vger.kernel.org, ceph-devel@vger.kernel.org, cocci@inria.fr, 
	dm-devel@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	gfs2@lists.linux.dev, intel-gfx@lists.freedesktop.org, 
	intel-wired-lan@lists.osuosl.org, iommu@lists.linux.dev, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-block@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, linux-btrfs@vger.kernel.org, 
	linux-cifs@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-mips@vger.kernel.org, linux-mm@kvack.org, 
	linux-modules@vger.kernel.org, linux-mtd@lists.infradead.org, 
	linux-nfs@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linux-sctp@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-trace-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org, ntfs3@lists.linux.dev, 
	samba-technical@lists.samba.org, sched-ext@lists.linux.dev, 
	target-devel@vger.kernel.org, tipc-discussion@lists.sourceforge.net, 
	v9fs@lists.linux.dev, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 1C7CA264512
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13562-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-mips@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_GT_50(0.00)[57];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,glider.be:email,avm.de:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,fu-berlin.de:email,libc.org:email]
X-Rspamd-Action: no action

On Tue, 10 Mar 2026 at 12:56, Philipp Hahn <phahn-oss@avm.de> wrote:
> Prefer using IS_ERR_OR_NULL() over using IS_ERR() and a manual NULL
> check.
>
> Change generated with coccinelle.
>
> To: Yoshinori Sato <ysato@users.sourceforge.jp>
> To: Rich Felker <dalias@libc.org>
> To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> Cc: linux-sh@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Philipp Hahn <phahn-oss@avm.de>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

