Return-Path: <linux-mips+bounces-13623-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uCrSLDrRs2ncbAAAu9opvQ
	(envelope-from <linux-mips+bounces-13623-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 13 Mar 2026 09:56:26 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD90280126
	for <lists+linux-mips@lfdr.de>; Fri, 13 Mar 2026 09:56:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8B2D930490FF
	for <lists+linux-mips@lfdr.de>; Fri, 13 Mar 2026 08:56:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A720436DA10;
	Fri, 13 Mar 2026 08:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TuNN/sds"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8334136C9F0
	for <linux-mips@vger.kernel.org>; Fri, 13 Mar 2026 08:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773392158; cv=none; b=QtCYTXKk1zgt0ieyA8tpxRQsg7sh4uy6WjvU7T1yODz2sOU5QWre+TU5V7dpOWPvxPqy1uGD7SYoXiVAo4v27d9Q4oMtVtzD+/zedHT/BOIgGDYrPVtBY4fq2nyYko2VYwM5paefx9OsAoGXjfrYz6JNJ3+xz9UKUOZVWMxDyGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773392158; c=relaxed/simple;
	bh=dIPXg2emkEHtVSMn/uiweeN0mkAf0sj6N0jCu1Xxr2I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ou7DlXi7rWTHgt/fyvU9xPwR2lud6M8ZK1ZDp8QkbEVnQ7W2Esl9h1rf/tNNApO6IgawGDcg8acas0tGk+E2G9wtdhmpOe5SQFqI3AHJbQJIurvLiaUMby0gYHXEj0UACwHwAcVsYDJ3UNZNd8o3AnUhwvmLZ1nWtXYmpC93Gto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TuNN/sds; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BF40C2BCB3
	for <linux-mips@vger.kernel.org>; Fri, 13 Mar 2026 08:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773392158;
	bh=dIPXg2emkEHtVSMn/uiweeN0mkAf0sj6N0jCu1Xxr2I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TuNN/sdsSHwP/VHRKKsG1F4YTUS5ZhzO3eF6ZjflRECLSxm52GZn0O+a6DYtw8s9w
	 AztRsZ6hwk6mFH9QjMLP6ul2unGjmpkpIqrGCVRM7XJ91lE5qjYrRo421vuqGU+Ips
	 dUTvUP2lPwGo6cUpGRPiarN2csB7JvMb0jI/Ci+wBxM0t4CvddwnzhqGPCkq7OZ2uz
	 q1FLHibPBhnYDoXHHAzK4gd8xjmC/HbpS/GJkB9AsODxRC/oP9dyHczV035sr3rZQ7
	 zhugJAyuq9iyE0d58vLAu0TaPaxVAVMP78UrAtKR75moc4u0qVEPZakARFdazt8gZI
	 bL3wWDwmcIB/Q==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-38a870c777dso6944331fa.2
        for <linux-mips@vger.kernel.org>; Fri, 13 Mar 2026 01:55:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUiiMdojC24L6Q7t24zfPQsldEvFigJh5GEnCUyPwin57wdZOMakFySepp/SM5SYLnmDoMFM+EHLOz4@vger.kernel.org
X-Gm-Message-State: AOJu0YwOIOOoq47j89mydf3/s0P0CWZhoX9TU+chWdED9PmJd8o8BVVO
	UWA7KKCQl7SL0Gwn7FAtdXTzo+tFDrZeqvgm5B6thADLp5pQ+KdkbB+foZU1EnQ3DAFsAoXM5H0
	DunghZ5kjjJ7OvwLsEcbJLI9tepz7ZICUljKclatCAw==
X-Received: by 2002:a2e:350d:0:b0:38a:878b:b567 with SMTP id
 38308e7fff4ca-38a897de73cmr6682211fa.36.1773392156502; Fri, 13 Mar 2026
 01:55:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311-qcom-sa8255p-emac-v8-0-58227bcf1018@oss.qualcomm.com> <20260312181654.2d9ba69c@kernel.org>
In-Reply-To: <20260312181654.2d9ba69c@kernel.org>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 13 Mar 2026 09:55:43 +0100
X-Gmail-Original-Message-ID: <CAMRc=Md8i6oCAqOBB_3q9PkkbaUxrCftum+WBjvac2O+Hk8kTg@mail.gmail.com>
X-Gm-Features: AaiRm5311s8a1dkokfIWdxBu9dTaoHy4sXAtnoSYnP4jjneoiOLY-XItyfiRHlE
Message-ID: <CAMRc=Md8i6oCAqOBB_3q9PkkbaUxrCftum+WBjvac2O+Hk8kTg@mail.gmail.com>
Subject: Re: [PATCH net-next v8 0/6] net: stmmac: qcom-ethqos: add support for
 SCMI power domains
To: Jakub Kicinski <kuba@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com, 
	Romain Gantois <romain.gantois@bootlin.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
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
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,gmail.com,foss.st.com,st.com,linaro.org,baylibre.com,oss.nxp.com,nxp.com,bootlin.com,glider.be,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org,tenstorrent.com,lists.linux.dev,googlemail.com,bp.renesas.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-13623-lists,linux-mips=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-mips@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_GT_50(0.00)[50];
	TAGGED_RCPT(0.00)[linux-mips,dt,netdev,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1DD90280126
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 2:16=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Wed, 11 Mar 2026 18:03:35 +0100 Bartosz Golaszewski wrote:
> > Add support for the firmware-managed variant of the DesignWare MAC on
> > the sa8255p platform. This series contains new DT bindings and driver
> > changes required to support the MAC in the STMMAC driver.
> >
> > It also reorganizes the ethqos code quite a bit to make the introductio=
n
> > of power domains into the driver a bit easier on the eye.
>
> Not entirely sure what the conclusion was in the sub-thread with Russell
> but FWIW this doesn't apply to net-next as posted so respin will be
> needed either way.

net-next is quite the moving target, isn't it? I did just that between
v7 and v8. :)

As for Russell's response: I think this is the third time we're doing
this for this driver. :( This series is not touching the existing
functionality and rebasing of Russell's changes on top of this should
for most part be trivial. The core of the changeset is to add support
for power domains to enable ethernet on SCMI driven SoCs. I would
really appreciate it if we could get it upstream and then any
subsequent rework can take into account the two types of systems we
support.

Russell: I see your point and didn't mind the first two times but it's
been way too long since I posted v1.

Bartosz

