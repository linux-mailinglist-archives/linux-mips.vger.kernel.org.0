Return-Path: <linux-mips+bounces-13792-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCZYDoBivGmLxwIAu9opvQ
	(envelope-from <linux-mips+bounces-13792-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 19 Mar 2026 21:54:24 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 208DC2D2684
	for <lists+linux-mips@lfdr.de>; Thu, 19 Mar 2026 21:54:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 701D53016292
	for <lists+linux-mips@lfdr.de>; Thu, 19 Mar 2026 20:54:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 783953F8E15;
	Thu, 19 Mar 2026 20:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i5Da/vfQ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="JL2MEzcg"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135983803F4
	for <linux-mips@vger.kernel.org>; Thu, 19 Mar 2026 20:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773953660; cv=none; b=dhBiFUIWj6wCCqBpGQpVQKj724HzHi6X4ufrP4Yw3QVpV7RWFfsJeGtLXyLUfKeRYGl8z3/EgFo563FxtMpeOxhn1/p0J5ShQ3nt7Brytxklc0JElCBXbN9M/1sfjiJfzQWT3qeShawgEMpXYiSRr7LO70LCBp9uNm4hjfO7iZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773953660; c=relaxed/simple;
	bh=OspvSUceR9D7FWErEaMeS4pbjFGXhTs0d3vC6fXFa4g=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nuCNLyxoXKC+ZFaPVv8ZZYGg+ZjlL1QNWHA78ZhwLoSyRGIScvPxoamdHkz5OzcW1GR2BKpDML8KwXcXVWPukNsfvq9w8ThHwwYBaaFDe33GjqQ9e35PPlCxuHdGJGs0Gz9/BJ437rTW1UfD+DCFkBMA3bWyjdfJZsizcq8qfiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=i5Da/vfQ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=JL2MEzcg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773953658;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OspvSUceR9D7FWErEaMeS4pbjFGXhTs0d3vC6fXFa4g=;
	b=i5Da/vfQQUDm2uf3tcOptZL5DQrMwOU6IgvDH0Pauitz+9D5T+97ikCR2+7agzhUNtoyau
	EkkaDSiPmBCq74PTATbRJ5RACQag8VIgjeCDthLR9G6HJm3A097LBpFAl7XGMa26eyggq5
	H0KlMWvFZDeJgXUcqrfHAFpp7i/aLcs=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-113-KbNW6yPsNgenQsOnjnwZIw-1; Thu, 19 Mar 2026 16:54:16 -0400
X-MC-Unique: KbNW6yPsNgenQsOnjnwZIw-1
X-Mimecast-MFC-AGG-ID: KbNW6yPsNgenQsOnjnwZIw_1773953656
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5090bc4823cso102283101cf.3
        for <linux-mips@vger.kernel.org>; Thu, 19 Mar 2026 13:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773953656; x=1774558456; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OspvSUceR9D7FWErEaMeS4pbjFGXhTs0d3vC6fXFa4g=;
        b=JL2MEzcgSbicNblhfTU1iXOAgbqxYIHkpSmAswQ7p1tadNZEPo7Aao7dQbRQbf2Ndo
         qamwj58PsJlLevsNlswwEbbxNSHA0CFrLEmkL3z3sGZQ1qeTDA5pdtGjmnW06Loadzec
         /pHRRyLXi70FNGLrizMJs34rv1Za+up24KeJciqCYoNbfHJ41C5hh/5Ur5uxwxpW2KmY
         pJSyzChg2j5Be2PehooHZhj6lAUBIxnniAdVh1aJEV3MSyvWfhOH/xRmudYCdOhnR7Ij
         B2QRYM8fpTJjriKRV95OzN7jUxCYWkmF7FmH11Kpk5NUhMwtnwA5Z/SV4tLvzTdzfT9M
         ZV0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773953656; x=1774558456;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OspvSUceR9D7FWErEaMeS4pbjFGXhTs0d3vC6fXFa4g=;
        b=k8/q6rB3QWG7soabioCfZlOcbh4GbZEHIsEQtRWzau9nayDx8+F2jZTyJ+4kuVTbXf
         iyykxziEk7BjCm79972P9zIw/JEHic5U58HBgqXCNvdpDx5jAbUNJ7Cl69YPFOs99yXp
         CJw8NYMOjmKrjGnU2UIfiJwUJRoVaf9iJ9A4B8YnnmWhIWo4bGuOetMJHtLSXZiiABx1
         yRDZxHilVej0T0QDvdX5aUmRbouextiHLfM+XgganX+Hu2k84aA2mGUdBRFRNF4SY+mD
         7eBF0G1KAWYXVRNYutdKAtndVKXx5aV8m4532lLnwiDRVRaSi1B1rTSioeI/pZUTBCsY
         YGtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZhIAFao/XL1GZ+SF6djFfgMlwPkhxQbQdOIW1OLppafswqFaiUNN9ICsSsmxLDfw/35dBUNN7owPe@vger.kernel.org
X-Gm-Message-State: AOJu0YzhR+fsiMO8rHOzQcXM9veQxtG/Dt5IgIs+APItqdy3+HFjqNGp
	yOFgZ1kcZcpzCqvHWMzdmHTeO9X/pAF42tBYGRlLM7QDi4s9KsATfOZ+3Ue0cQYMLJnPm+VzNZu
	vWRk1hwSyPvI1YMDDsjBpa+6GqfbPnCG5rv6Su/63NU9/YZDoX3WQ6WsPtlvKJhs=
X-Gm-Gg: ATEYQzwa4YxDTW6F1SrodwUHUqYZ3CAQwB/Ul/rWUwYFZzOqxLIpRN8KkTra2OZ8EmU
	yl173ZlcMnR17EeRGr+L9/fXBdNKwY079Kol89R8+Q9BoLBsqS0AecgaL+ndSz7h5+bJKPyR16L
	/wY+1Pcadfm8wlRW3L7DZk+epB1WLnBreuXxJTp6t2u/3fsfvbypzKu/4wdkWcSGaCgNvNm05k5
	zf1kqFWe0eEj0Ycsv5ARR2ULDzAN7LF5ELBYt0NGP7oBll9QP7nZeRTLOaq3H/6/k1aPszOVfW/
	lcpVddXllqPANge1iDaJMUxkd1+FnrRINb4GXlwASBMH3nkm9Mp7yH7ThiYir3AADRC4Nfo0tWh
	S4YiKQuaNC2PmYu6JJOhJSMCbGfL8ASB9odX1pBZwlg7+3WwGNkChmk6LTxVXcJXjgRzRFag9Q9
	Io14wpS/oxl0Vgmw==
X-Received: by 2002:ac8:7f54:0:b0:509:4e1e:1b9a with SMTP id d75a77b69052e-50b37586c7cmr10125451cf.54.1773953656279;
        Thu, 19 Mar 2026 13:54:16 -0700 (PDT)
X-Received: by 2002:ac8:7f54:0:b0:509:4e1e:1b9a with SMTP id d75a77b69052e-50b37586c7cmr10124851cf.54.1773953655634;
        Thu, 19 Mar 2026 13:54:15 -0700 (PDT)
Received: from thinkpad-p1.localdomain (pool-174-112-193-187.cpe.net.cable.rogers.com. [174.112.193.187])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b36e350c3sm6518601cf.19.2026.03.19.13.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 13:54:15 -0700 (PDT)
Message-ID: <cf908b20e5f6237c887f6d751be82670d7cbd7b7.camel@redhat.com>
Subject: Re: [PATCH net-next v9 0/6] net: stmmac: qcom-ethqos: add support
 for SCMI power domains
From: Radu Rendec <rrendec@redhat.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Bjorn
 Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn	 <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet	
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni	
 <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, Vinod Koul <vkoul@kernel.org>,
 Giuseppe Cavallaro	 <peppe.cavallaro@st.com>, Chen-Yu Tsai
 <wens@kernel.org>, Jernej Skrabec	 <jernej.skrabec@gmail.com>, Neil
 Armstrong <neil.armstrong@linaro.org>,  Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo
 <shawnguo@kernel.org>,  Fabio Estevam <festevam@gmail.com>, Jan Petrous
 <jan.petrous@oss.nxp.com>, s32@nxp.com, Mohd Ayaan Anwar	
 <mohd.anwar@oss.qualcomm.com>, Romain Gantois <romain.gantois@bootlin.com>,
  Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
 <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,  Christophe
 Roullier <christophe.roullier@foss.st.com>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, 	linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,  Drew Fustini
 <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
 linux-amlogic@lists.infradead.org, 	linux-mips@vger.kernel.org,
 imx@lists.linux.dev, 	linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, 	sophgo@lists.linux.dev,
 linux-riscv@lists.infradead.org, Bartosz Golaszewski	
 <bartosz.golaszewski@linaro.org>, Martin Blumenstingl	
 <martin.blumenstingl@googlemail.com>, Krzysztof Kozlowski	
 <krzysztof.kozlowski@oss.qualcomm.com>, Lad Prabhakar	
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Konrad Dybcio	
 <konrad.dybcio@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 16:54:12 -0400
In-Reply-To: <CAMRc=MfNcK3MLndik1jy-yhHAph5=amnTGgn-MpXXG0Uv1ifpQ@mail.gmail.com>
References: <20260316-qcom-sa8255p-emac-v9-0-c58934e76ff2@oss.qualcomm.com>
	 <64d282fd94be1546df75d7df5b47eacc0479797a.camel@redhat.com>
	 <CAMRc=MfNcK3MLndik1jy-yhHAph5=amnTGgn-MpXXG0Uv1ifpQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,gmail.com,foss.st.com,st.com,linaro.org,baylibre.com,oss.nxp.com,nxp.com,bootlin.com,glider.be,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org,tenstorrent.com,lists.linux.dev,googlemail.com,bp.renesas.com];
	DKIM_TRACE(0.00)[redhat.com:+];
	TAGGED_FROM(0.00)[bounces-13792-lists,linux-mips=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rrendec@redhat.com,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_GT_50(0.00)[51];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.989];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt,netdev,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 208DC2D2684
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 2026-03-17 at 15:12 +0100, Bartosz Golaszewski wrote:
> On Mon, Mar 16, 2026 at 7:31=E2=80=AFPM Radu Rendec <rrendec@redhat.com> =
wrote:
> >=20
> > On Mon, 2026-03-16 at 13:05 +0100, Bartosz Golaszewski wrote:
> > > Add support for the firmware-managed variant of the DesignWare MAC on
> > > the sa8255p platform. This series contains new DT bindings and driver
> > > changes required to support the MAC in the STMMAC driver.
> > >=20
> > > It also reorganizes the ethqos code quite a bit to make the introduct=
ion
> > > of power domains into the driver a bit easier on the eye.
> > >=20
> > > The DTS changes will go in separately.
> >=20
> > I'm seeing some weird behavior with this version. The probe part looks
> > good (but see below), but when I try to bring an interface up, it fails
> > with ETIMEDOUT. The relevant part of the stack trace leading to the
> > error is this:
> >=20
> > dwmac4_dma_reset+0x208/0x220 [stmmac]
> > stmmac_reset+0x2c/0x68 [stmmac]
> > stmmac_init_dma_engine+0x108/0x400 [stmmac]
> > stmmac_hw_setup+0x5c/0x538 [stmmac]
> > __stmmac_open+0xc8/0x2a0 [stmmac]
> > stmmac_open+0xcc/0x238 [stmmac]
> > __dev_open+0x138/0x2a8
> >=20
> > Now dwmac4_dma_reset() is very simple. It sets the soft reset bit in
> > the DMA_BUS_MODE register, then waits for the hardware to clear it, and
> > that never happens.
> >=20
> > Now, getting back to the probe part, there is one extra message
> > (compared to my previous successful test on v7), which I see at the
> > very end of the probing:
> >=20
> > =C2=A0 qcom-ethqos 23040000.ethernet: clk_csr value out of range (0xfff=
fff00
> > =C2=A0 exceeds mask 0x00000f00), truncating
> >=20
> > This is a sa8775p ride board, so there are two stmmac devices. I only
> > see that message for the 2nd one, which is also the one I'm trying to
> > enable, and which fails.
> >=20
> > I realize this may or may not be related to your changes. But there is
> > no way to test on a SCMI-pd board without them. I'm not sure how
> > relevant it would be to test on the non-SCMI variant. I'm assuming the
> > DMA part should work the same way (regardless of SCMI-pd), so if I can
> > reproduce it there, and since I know it works on mainline Linux (that's
> > where I tested v7), I could bisect and see which commit in net-next
> > breaks it. If you don't have any better idea, let me know and I can
> > try. Meanwhile, I'll keep poking at v9.
> >=20
>=20
> Does current net-next on its own still work? Or is the second
> interface broken even without this series?

I don't think there is a way to test net-next on its own (without your
series) on a board with SCMI-pd firmware. It would require the
qcom-ethqos driver to have direct access to the clocks, but the clocks
would not be there.

What I could test though is a board with the "other" firmware (without
SCMI-pd). And on that board, I do *not* see the problem even with your
series applied. In fact, I tested the exact same kernel build I had
previously tested on the SCMI-pd board.

I'm not sure what to make of that or what else I could try.

FWIW, the "clk_csr value out of range" message I mentioned before is
still there on the board where everything works, so it's probably a
red herring.

--=20
Radu


