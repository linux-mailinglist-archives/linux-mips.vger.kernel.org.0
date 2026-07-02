Return-Path: <linux-mips+bounces-15414-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CwAzBboxRmojLgsAu9opvQ
	(envelope-from <linux-mips+bounces-15414-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 02 Jul 2026 11:39:06 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BCD6F55D7
	for <lists+linux-mips@lfdr.de>; Thu, 02 Jul 2026 11:39:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15414-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-15414-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 93F81314F735
	for <lists+linux-mips@lfdr.de>; Thu,  2 Jul 2026 09:22:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F51947CC61;
	Thu,  2 Jul 2026 09:22:31 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3B747B429
	for <linux-mips@vger.kernel.org>; Thu,  2 Jul 2026 09:22:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782984151; cv=none; b=aw0k4n50+YZRpGbU/QltRftGoNpuXaj5XxllNapFtGgGnYZqeefPg08bmPHjMLHZDy38Jw6HbJ0OJUxlL7JwdjchPS+kSB2FJDy+UyMK72VARKQ4wlcvlmA9Y6m8iTSiUaAW/EFAWl8c72h36jwQMUeDuttgc7Y3vLjSS/9JlN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782984151; c=relaxed/simple;
	bh=n9yLVv4ONKzRdpCf8VFwTS/MdDc1G1FjImPOjJ/IqKk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BjOqw03bTICBcNZqRNSIw1kWjBZOeUllTQ6ezBzgQZbJz4CSwq3dpvd8Wu2NqqoEA7oHoEg7ZErdiIugR+doXQN87+hfzYwW3NjNptbHzII7dDyoobjy8h92x4Hnb+IvBivomKptjdhGMXkykxw8dModmY6DstitM1wsRHBSKOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.175
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-845ea8924fdso1255174b3a.0
        for <linux-mips@vger.kernel.org>; Thu, 02 Jul 2026 02:22:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782984149; x=1783588949;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w3iqz34neGUxAgVEYrpwzzcpe57aRQt9k5cgKzpkuWc=;
        b=E4khHj2ECsnvxLbgy392SiF2jKy3dBO0+Bt0mWJU9JMRfLSLClt5oMztaKK2FAf0EZ
         YmcwC8DibX+lRu+ElsmjvUWG4y3RbkmKbH6aB904Hvrff+stKIopDOaa+XfA9ebWOBUV
         VeYdPFGg//BORUb1ukzIbE/TfAZMWNx110wJWd6nGCVejcEYIeovqQB6qMfqzvvgPWH+
         DzWTnxa1dlwS8e+zEI4FacLJNKKQfrROBvsESWMha6tLSqbcR4q94RcUqMtniSyHLv9R
         qixFXvTvO8WG+zceItHE8tn5FCMglOarfGaQ5UeSzfOh0TpKYXP2MqavxarSPBIAKQPw
         p16g==
X-Forwarded-Encrypted: i=1; AFNElJ9atYe/JgpLo5Aqn5+7WNuuIZ/fj+C0Qh53tkG42eyXvgpqqWX4oVdKbdHUwN33JRquo/xoJp26tQp0@vger.kernel.org
X-Gm-Message-State: AOJu0YxY5XWBQYfTK/MRPvRd7Gp3UOHQOwjVKf8cqJMmgnI2QnmH2ChN
	u9JdohNBeRbsYZFudd+Nhf4FXVEGvrU8OqIeV7dplZH0eODoj9yMq7HOoqqwejdnTQA=
X-Gm-Gg: AfdE7cmBaEDMev961yA0JMYpHLD3Q8Euml5k7D7m6fUuGjId7gXMI0a9IX0LHTLMNWM
	D4eYFrSfNjOWristSho/xyzHz633H+WtaEbEqbKsDF9eeemxrHZ0Y0Y70S2xWtXbxGqERp/FpGh
	A9x2RoSMRRdTV0qPN2TnXG7ea9jkMLdF3Li15vzlqMVlQwjpT2TEk4EHJgX/pFjW7h64YrtlaSC
	IkuaTbWfCHxlan3b5X7miJaRut80njvezpcPeFaQaiGWnTJ2VtDY15yMIQ8DQh/9v3VE76Xa5Qi
	mP1ScpK3Gvp5+PDJKJT+KaxD6wpJPEIism1Kqk+Edtx9d4pFrtXk6irZyXygDYni0WuGW2rtyNf
	3nEYt5GExX/NWpOXaWfFxCJ+t+axwUBY/Bxvq5yVIM/+8+hcUmG2gtVo+Bx2YiNZbdqeGuJrZF4
	itnCcEBg/Mpih8dIk1WMIB0rOiKjt+aMUuqWiGJrzj3EOCPv9EWSQ7yA==
X-Received: by 2002:a05:6a00:170b:b0:846:d499:b53a with SMTP id d2e1a72fcca58-847c068625bmr5008635b3a.6.1782984149283;
        Thu, 02 Jul 2026 02:22:29 -0700 (PDT)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com. [209.85.214.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb79b9adsm1121280b3a.27.2026.07.02.02.22.28
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 02:22:29 -0700 (PDT)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ca1479dfe0so14603425ad.1
        for <linux-mips@vger.kernel.org>; Thu, 02 Jul 2026 02:22:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoudMeO/qjZmzM5bsOVC6E8zWbQdtzg6e3ivQhZqN3W09KMcqEYBJ+r67Ry8UbYvKsthaVdaHvTrBE4@vger.kernel.org
X-Received: by 2002:a05:6102:1620:b0:62f:46be:8318 with SMTP id
 ada2fe7eead31-73da7681403mr2525301137.6.1782983793184; Thu, 02 Jul 2026
 02:16:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com>
 <20260629-qcom-sa8255p-emac-v11-1-1b7fb95b51f9@oss.qualcomm.com>
 <CAMuHMdXen+E-Ai51aWBa_KV9W8Fz2cQPpT-FG_kQ7akhrrYa_A@mail.gmail.com>
 <CAMRc=Me3jaZXiXa1sFXr=8Do4sCd+XN1pKTcWC8-0j78SjCkKA@mail.gmail.com>
 <CAMuHMdVUBgG0EFB16OxHisbxx-sBvDKvBPNZdpyDnmBrnX4ptQ@mail.gmail.com>
 <akOZFIowVvprnAMf@vaman> <CAMRc=MfBcOhbj=ETxy2Xz9o_nyzykrEhKAc3jYi6V5_jMZEE3Q@mail.gmail.com>
In-Reply-To: <CAMRc=MfBcOhbj=ETxy2Xz9o_nyzykrEhKAc3jYi6V5_jMZEE3Q@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 2 Jul 2026 11:16:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXNG=C=XcioQUEN1M7cQgKhO0AxUyg5X+TWb2rQ3-H3fw@mail.gmail.com>
X-Gm-Features: AVVi8Cef5-UyxrfN1fWvFDcXcIwIbwhU7f5lsircbKpxY8MZwCT2oXalNKmt_xQ
Message-ID: <CAMuHMdXNG=C=XcioQUEN1M7cQgKhO0AxUyg5X+TWb2rQ3-H3fw@mail.gmail.com>
Subject: Re: [PATCH net-next v11 1/7] dt-bindings: phy: document the serdes
 PHY on sa8255p
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com, 
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, Romain Gantois <romain.gantois@bootlin.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Radu Rendec <rrendec@redhat.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15414-lists,linux-mips=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:vkoul@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:peppe.cavallaro@st.com,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:shawnguo@kernel.org,m:festevam@gmail.com,m:jan.petrous@oss.nxp.com,m:s32@nxp.com,m:mohd.anwar@oss.qualcomm.com,m:romain.gantois@bootlin.com,m:magnus.damm@gmail.com,m:mripard@kernel.org,m:christophe.roullier@foss.st.com,m:rrendec@redhat.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:dfustini@tenstorrent.com,m:linux-sunxi@lists.linux.dev,m:linux-amlogic@list
 s.infradead.org,m:linux-mips@vger.kernel.org,m:imx@lists.linux.dev,m:linux-renesas-soc@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:sophgo@lists.linux.dev,m:linux-riscv@lists.infradead.org,m:bartosz.golaszewski@linaro.org,m:bartosz.golaszewski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:jernejskrabec@gmail.com,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-mips@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[47];
	FREEMAIL_CC(0.00)[kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,gmail.com,foss.st.com,st.com,linaro.org,baylibre.com,oss.nxp.com,nxp.com,oss.qualcomm.com,bootlin.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org,tenstorrent.com,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt,netdev];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linux-m68k.org:from_mime,linux-m68k.org:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 63BCD6F55D7

Hi Bartosz,

On Thu, 2 Jul 2026 at 11:12, Bartosz Golaszewski <brgl@kernel.org> wrote:
> On Tue, 30 Jun 2026 12:23:16 +0200, Vinod Koul <vkoul@kernel.org> said:
> > On 29-06-26, 16:51, Geert Uytterhoeven wrote:
> >> > Russell King asked me to put the PHY logic for SCMI pm domains into the PHY
> >> > driver instead of the MAC driver where it was previously. Instead of cramming
> >> > both HLOS and firmware handling into the same driver, I figured it makes more
> >> > sense to have a dedicated, cleaner driver as the two share very little code (if
> >> > any).
> >>
> >> I think you are mixing up DT bindings and driver implementation?
> >
> > Should the bindings change if we have different driver and firmware
> > implementations? Isn't binding supposed to be agnostic of
> > implementations..?
>
> I've thought about it some more and I believe this question is philosophical in
> nature.
>
> sa8775p and sa8255p are *the same* hardware. I can flash different firmware on
> the same Lemans Ride board and it becomes one or the other. Yet they are not
> described by the same DTS and the bindings differ as well. I don't see why we
> wouldn't allow the same approach for the this PHY.
>
> We treat it as different HW variant when it's managed by firmware - just like
> we do with the rest of the SoC.

DT describes hardware, not software policy.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

