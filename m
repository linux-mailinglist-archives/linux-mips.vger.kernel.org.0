Return-Path: <linux-mips+bounces-13538-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBhLAxbPsGkKnQIAu9opvQ
	(envelope-from <linux-mips+bounces-13538-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 11 Mar 2026 03:10:30 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF6725AB40
	for <lists+linux-mips@lfdr.de>; Wed, 11 Mar 2026 03:10:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0743031BD10F
	for <lists+linux-mips@lfdr.de>; Wed, 11 Mar 2026 02:07:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06B9A35AC08;
	Wed, 11 Mar 2026 02:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SqpOgAb4"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270E01EA65
	for <linux-mips@vger.kernel.org>; Wed, 11 Mar 2026 02:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773194855; cv=pass; b=dNE5Qav3RhraDTCwQXXSfR3bxmTRaNRODtK54qBupUizg1iPnGnjX9YMRJ2qFzKQ7zzLorvBbMplNQAyfxX7Y3lpzv6V/Am8+3YF29jkhwjVrLzUga/IUV1Xz7zybhSZdztMeDoECqtse3HQuyUP7XFR38GWjEv61es65KSZA5s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773194855; c=relaxed/simple;
	bh=8UJnLa/DDQ+b65RDSHa97nR/Rm6zetnRjswOkVb13wc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BXpJVfRbo4LlXCcOZcdMTSZguzp+cVIx0KISpfGfBR5GZsgpQoVAlwFx48a7FZe92mvAfCs4pISJzIGD35j4fUHxXz1jh6LAAkO/dRo3RdeyRnOvOMKB8uyqlSRY6aMKh1lACEP4J4hko00bjgaT9gA/dJ05ihAnODVVoWzn1po=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SqpOgAb4; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a0ff30b240so8038067e87.0
        for <linux-mips@vger.kernel.org>; Tue, 10 Mar 2026 19:07:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773194852; cv=none;
        d=google.com; s=arc-20240605;
        b=KcFXc/Um+MSQSvKPzi12sfQqsPXrRm6HYaKh5dx1sxM/XDUt2HOq/rFr6gORGVnxrH
         6yj3stn4k9xah/C0kdUosXViHHGAZDeCo9T+I2+ZNgxNSG7Po4cjdynxqhPTS/PwReby
         bu2e9/lTGz1aVhKBQpZOC0NblEzuYxq7ZBIE0OdnCzVwODHO9APLrIojaJ6WVbCcUOSD
         tKTzBCNT5VEcDnZ9BFQylqy/kJ3MHQ0E4i7MTNBm5c8uc/4yrhim9Kq5LWVKE9tGEmUc
         jFP4RaDNnfrBbzxS2omfEH0aUtV0jaACXDeoGizX85VhXis2oBMa/JmWikGGYHS88Wce
         Y7AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+zLBLQzKjcztDlxJqoLP6w+B6xnZmfHibV4jlBQCebA=;
        fh=Q1ptFDKASS44xBgugKuOi7fW+A653oyuia7HMJiSir4=;
        b=aLiLvRt1FhYK/xN9At2VtEfgh+BCDviQTU8j/oSMFLYU0OeAEFCltYbdu1g06Q4NSq
         /PIxQzwXwmjW8YadZCzG2IAPgO3/CxNcYILmL7EQNskNAsFVRD9x8Gq9GZceWvjvawtv
         qgSVDba4NIgBXpczZgYe57EVki2t8ef9TMPSO/qpe5gj0LnUWpamNz3NbRlHydQDchGf
         IOHIK9+AibLordzUPphfEqV5sBk0ETlQYUOt3GDUfKxBxt67s0By06foqck/mqj9sLhF
         aicDb73bmgC7m5/4ghbffrhYHiXYtQ7kHhgZONB20IQxXARfvel4umU7MZRirDFT2kWU
         GxlA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773194852; x=1773799652; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+zLBLQzKjcztDlxJqoLP6w+B6xnZmfHibV4jlBQCebA=;
        b=SqpOgAb4CQOCp6QT1IhDiJXNOENCCAthmmQiQ2Xm1LqdH6AuNnr9pWEOxoaM6J2EHp
         TaZvrNsWvEAAdeAh3rGZCGLrxzU767HUy57VJt43+079ae3+2kuAr2+JBVbU8T9+l/BT
         vjjO+GANIyds0bGFgUhdgNG0FnF3NJi/nWQH4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773194852; x=1773799652;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+zLBLQzKjcztDlxJqoLP6w+B6xnZmfHibV4jlBQCebA=;
        b=auhiPH3k6bj6niO/nedVfoLeL0EuqTROd/r54eX5ELCY8dibtfjvPsUl+qK1yxDDuL
         tsn5O2nbpxhBlhPGbP19yyAeHSBXIcwRNFbP/5Vwb+LnheDFOWLNjE+xvDpOS9my7+Nw
         D0JP/BsW1KShy0nTqsNPoNVF9Kg3GIMjqyjBMrrqpdOuRZNTSKbokWM+2S2shdmiOoQd
         blfWa6+Y8x/xeJNQ+g4mBifiKzW5aXEuIcRJWCf16whnl0Eh9kwvr8Px0qm3FKfKL25E
         GucetdupSuV+PnMxx6gJES04jCFt0t0m6YILE5dxh89JEUXbxQnImwFJl8QL7afmIbUV
         YIRA==
X-Forwarded-Encrypted: i=1; AJvYcCUwS3tiMOxULuzcmxr1abty2wvPcXbjihriPLY8krOFMOjXIDtKIivPLVTGWaCsYiaqPOGGNIhfA8iv@vger.kernel.org
X-Gm-Message-State: AOJu0YwPrpWjjJ22vtYMLrWT4L35J1W0Fr/n2FOddgSbX+AB1Uq+ozhs
	cHxmRCyCpqDPmRsf2ZzQtEOXcuRWRzlanQwFVc+5qYSHz2KmsryUrF+5VMer8o/PEjLe/43m+5l
	VMZXkzCTS4n0SwaLGaWvrppf6kDBwiF1OaepVGKkv
X-Gm-Gg: ATEYQzwI+4vsSma3wcR88bp8wyDUwd8TlLRIV5kD4IfpUPVTkOMv+okM/gRHTAMeftY
	P6nLeCdw7C4NyYyigbARQ5n2D6j31ib40+9kN1OBn1xLy/yajVwsPUoa03l1df48nhYdYjPGbx/
	pjG/j8Via7657XIv7gRlRWmkF8TgIKThM7FrMDnZyMrW5FpaIK1ljCR3/21KFUng72dZzbZPF6X
	R9OOIQPAxo9bkeR9GDeOciOA6ve9wJwHhSLEpPSFAzmopUn4/vu2oPOtYqEcm/JdFBe7UaEd9L1
	YIyYHEd2ow==
X-Received: by 2002:ac2:4427:0:b0:5a1:3134:9bac with SMTP id
 2adb3069b0e04-5a156cbd1bbmr169453e87.28.1773194852284; Tue, 10 Mar 2026
 19:07:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de> <20260310-b4-is_err_or_null-v1-56-bd63b656022d@avm.de>
In-Reply-To: <20260310-b4-is_err_or_null-v1-56-bd63b656022d@avm.de>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 11 Mar 2026 11:07:21 +0900
X-Gm-Features: AaiRm5028PWt8n-JnveiRgn8oYMksdR_-_nk4JOkvxMfplWs-GDr7RRk-OxICyw
Message-ID: <CAGXv+5FQAVaJjqhv+Xq-ysOc4SHQn2mCNTgCAp8XocmWBWGGoA@mail.gmail.com>
Subject: Re: [PATCH 56/61] clk: Prefer IS_ERR_OR_NULL over manual NULL check
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
	v9fs@lists.linux.dev, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 7EF6725AB40
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13538-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenst@chromium.org,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[58];
	TAGGED_RCPT(0.00)[linux-mips];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[avm.de:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,baylibre.com:email,mail.gmail.com:mid,chromium.org:dkim]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 9:57=E2=80=AFPM Philipp Hahn <phahn-oss@avm.de> wro=
te:
>
> Prefer using IS_ERR_OR_NULL() over using IS_ERR() and a manual NULL
> check.
>
> Semantich change: Previously the code only printed the warning on error,
> but not when the pointer was NULL. Now the warning is printed in both
> cases!
>
> Change found with coccinelle.
>
> To: Michael Turquette <mturquette@baylibre.com>
> To: Stephen Boyd <sboyd@kernel.org>
> To: Daniel Lezcano <daniel.lezcano@kernel.org>
> To: Thomas Gleixner <tglx@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Philipp Hahn <phahn-oss@avm.de>
> ---
>  drivers/clk/clk.c               | 4 ++--
>  drivers/clocksource/timer-pxa.c | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 47093cda9df32223c1120c3710261296027c4cd3..35146e3869a7dd93741d10b72=
23d4488a9216ed1 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -4558,7 +4558,7 @@ void clk_unregister(struct clk *clk)
>         unsigned long flags;
>         const struct clk_ops *ops;
>
> -       if (!clk || WARN_ON_ONCE(IS_ERR(clk)))
> +       if (WARN_ON_ONCE(IS_ERR_OR_NULL(clk)))
>                 return;
>
>         clk_debug_unregister(clk->core);
> @@ -4744,7 +4744,7 @@ void __clk_put(struct clk *clk)
>  {
>         struct module *owner;
>
> -       if (!clk || WARN_ON_ONCE(IS_ERR(clk)))
> +       if (WARN_ON_ONCE(IS_ERR_OR_NULL(clk)))

clk_get_optional() returns NULL if the clk isn't present.

Drivers would just pass this to clk_put(). Your change here would cause
this pattern to emit a very big warning.

I don't think this change should be landed.


ChenYu

>                 return;
>
>         clk_prepare_lock();
> diff --git a/drivers/clocksource/timer-pxa.c b/drivers/clocksource/timer-=
pxa.c
> index 7ad0e5adb2ffac4125c34710fc67f4b45f30331d..f65fb0b7fc318b766227e5e7a=
4c0fb08ba11c8f9 100644
> --- a/drivers/clocksource/timer-pxa.c
> +++ b/drivers/clocksource/timer-pxa.c
> @@ -218,7 +218,7 @@ void __init pxa_timer_nodt_init(int irq, void __iomem=
 *base)
>
>         timer_base =3D base;
>         clk =3D clk_get(NULL, "OSTIMER0");
> -       if (clk && !IS_ERR(clk)) {
> +       if (!IS_ERR_OR_NULL(clk)) {
>                 clk_prepare_enable(clk);
>                 pxa_timer_common_init(irq, clk_get_rate(clk));
>         } else {
>
> --
> 2.43.0
>
>

