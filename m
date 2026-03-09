Return-Path: <linux-mips+bounces-13416-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBAvI9CXrmnRGQIAu9opvQ
	(envelope-from <linux-mips+bounces-13416-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 09 Mar 2026 10:50:08 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA2D23685E
	for <lists+linux-mips@lfdr.de>; Mon, 09 Mar 2026 10:50:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6F2603028EF6
	for <lists+linux-mips@lfdr.de>; Mon,  9 Mar 2026 09:50:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48E4D37D12B;
	Mon,  9 Mar 2026 09:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lhq0/5i+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L97SyvNf"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9C137BE85
	for <linux-mips@vger.kernel.org>; Mon,  9 Mar 2026 09:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773049803; cv=none; b=GEhJM2cppG5we9u2Lq4jaNB3MiKMF+o84aGBYa0qwhX7WQXWC3Yv2MXvUljfyqEtFL9Zcc6IGVnhKuH8FU2V+9oVIQnf9X3Z4+zBEbn+2lIB8VSN7TISWgztZUnPEnmTWQ4V9lVP9y2YhW2MsE9IgoqW5JkQi/nKE3YZ+UoxmFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773049803; c=relaxed/simple;
	bh=uOtCARhSePA3YS0iVPprhrCJJMKvZLLOo9ES2BD8tNs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bWSnK6g2N8Igq1g7P8TlSbw0stJHimD5qwfk+LqWmWWsv6WrllMKWOktjU1grNEGpHYMo9qCQpMQk7+vkuvWF1ReIVOj0xZ6KtPWJIlCzsRylqWuNLpTZ+S/lyNVwhvgAG2uC5FgJp6MIp9+9vXjnE6l6hA4MmLkC1xeoX7FPII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lhq0/5i+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L97SyvNf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62986XYs3462759
	for <linux-mips@vger.kernel.org>; Mon, 9 Mar 2026 09:50:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZY1KMDG5mEhmybM9QUi64JQp3OjXLAuIqQxIS+L8bEE=; b=lhq0/5i+W9qNegQH
	4iZ2TDv+OYhkmoRgfhmxvPmWSlkpXEIuh5MZQgwo4AM3Ynv3hoJj/umUgQuspVVD
	tJNZB5kVcAKcswPNFCXiLK/XNzXJ6OQ01jnzIGffo+5jm0FuBezCFMl7vQ1REBci
	vtUsoJox3RcSzTnlFKMvPzBjnQX0elu+qzW3D0n+D/pjoeym9h1ZpLfUHM2r4mIc
	RgFO1UtlTnMC8hAPCyX8DNvS3m9eHukz0wUSD1RjkW6kWOUoS2dFLAPpsgq0xU9O
	biw8oZyeI+PGjkxkYiVbuyegRStV5PXmlXJIL/f7rskHcht0q+m+s4i4TrCa+wfe
	fPZ+4w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crcd8csdk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Mon, 09 Mar 2026 09:50:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd77502295so1078573785a.1
        for <linux-mips@vger.kernel.org>; Mon, 09 Mar 2026 02:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773049800; x=1773654600; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZY1KMDG5mEhmybM9QUi64JQp3OjXLAuIqQxIS+L8bEE=;
        b=L97SyvNfNZSYCAOoPG71q1XgalNtDwOcogrnNDU22psWfsfLw6oD/zea3v5p6879MS
         aOaLxYtH8avfH1RU0K/04ILedDoMod+0ixNj3RgE3JQchayRgmfH5dZckB1IedO10TRa
         JCMhve807eX5lJirUsY4g5MFIPSjP0//c0WBSqKACwoDM1dZoFwLdYoJkILmvK9HnfRQ
         f4a2U5vFK/2yrLBXnnQD3Rzl+BvBqISsmT/gxhcX7lQtWyXZ/VQVPMrHuaYII0QejhDf
         LOXMjyOy2lsWhh2Q7GTaV16nS+IEzNAK+XcYr/02NZ4uRSXBebpkR8Ck9TNw3kRyIWWO
         ZQKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773049800; x=1773654600;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZY1KMDG5mEhmybM9QUi64JQp3OjXLAuIqQxIS+L8bEE=;
        b=jamXXhr1t2uBnZ4zbPfiQjsz17TU/+MjwTqQZ/cXsmyy1Y3gZ+HSKcw6542necn+mS
         OIZxtoOFio2pXAlGxxF0SFoPKXTvfNYjdPgwsmrNKWMOd+TlSPOJtv+bePVws27vtgV9
         YnO21FwQdfuC80rs/y6poWzmaUW4PWZcCOu+yWqfKdgskYBTeMhlZgNQCvj0J1V/DjO5
         1HHsBDFT/LtYAn0CcQPFU7+Qh3m9DI9x+UUGzg8IkXn6eWgjfHwIL3W9gK66k89rSpzU
         itNx0hiF5n+nMEyhGUlrfjrLRFhPQMJZCjnMNarUMn69VoBCYaljwxY1mcYN7nLHZTVQ
         sPqA==
X-Forwarded-Encrypted: i=1; AJvYcCXHdNJwe7EsEy3J4OYrtHB8oMY8cdIhg1aDokZahPh7OnYtdaJLCM+3MNV7E4CO8htB594BT/IR+VFz@vger.kernel.org
X-Gm-Message-State: AOJu0YydFNy0rHGWJb3/oM9CJ+fBnz7dzCr6etUE6FNEoEQxV0qKlOOC
	Ce5rCUlmSesPMek6Glqu/jdaN8ivy2kt6AJZSFZh+rklurAyYtLkXNvilzJdMghdqfF5lJGL0Hx
	cI1YltvoAH8W3UbnXwgi5cflZ4TUqnRaxUHE0H8bsoxKroO0CzywDYoVxH30rhp4r
X-Gm-Gg: ATEYQzwhxv4FAkvSJz0CiK/IBcTtZ8VQ4De6zINPZUMidDZFpXxevddmOHGq5+kGD7K
	oYOZkkna4IQaaeGGb3vc2NjW8H/MvV0DZ7lrPJGW3nStPM62zB8Mtkb2uDGFJnzKELGrwyYZKXW
	ZxNO1JWokPyO8si8o9GDhVCSFRf6+Qzu9kolQHH+SORy7eQZ9ZMPqCh4BoTUFxGUHT5d3NCSJot
	9Ae6iaTjZqzwEc6FWsAGaeIykoLBm9G8XdLlOK+Zubjw+hJELkHn5LIG40JLCTNBrIw40HStTvX
	Wq3AeHhyzWxwIlLEsKC0zbTHKSgGcwi0ARIV/9KM0CxHAzHFTEzk7oEIeVFEndJ1MZaYi8w+2Yx
	tvHH9Kgf1F/V6/rX8gs9hZp9+Wgg7LHWVU6f7vG9IlFkDQMUl
X-Received: by 2002:a05:620a:470d:b0:8ca:d5cb:6841 with SMTP id af79cd13be357-8cd6d4a51a7mr1312876985a.49.1773049799863;
        Mon, 09 Mar 2026 02:49:59 -0700 (PDT)
X-Received: by 2002:a05:620a:470d:b0:8ca:d5cb:6841 with SMTP id af79cd13be357-8cd6d4a51a7mr1312873785a.49.1773049799331;
        Mon, 09 Mar 2026 02:49:59 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4852f1964edsm58099595e9.13.2026.03.09.02.49.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 02:49:58 -0700 (PDT)
Message-ID: <3d78694a-6a20-4197-95bb-717ec74c0433@oss.qualcomm.com>
Date: Mon, 9 Mar 2026 10:49:52 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v7 1/7] dt-bindings: net: qcom: document the
 ethqos device for SCMI-based systems
To: Bartosz Golaszewski <brgl@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vinod Koul <vkoul@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Matthew Gerlach <matthew.gerlach@altera.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Keguang Zhang <keguang.zhang@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
        Romain Gantois <romain.gantois@bootlin.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Heiko Stuebner <heiko@sntech.de>, Chen Wang <unicorn_wang@outlook.com>,
        Inochi Amaoto <inochiama@gmail.com>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Minda Chen <minda.chen@starfivetech.com>,
        Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
        Fu Wei <wefu@redhat.com>,
        Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Shuang Liang <liangshuang@eswincomputing.com>,
        Zhi Li <lizhi2@eswincomputing.com>,
        Shangjuan Wei <weishangjuan@eswincomputing.com>,
        "G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>,
        Clark Wang <xiaoning.wang@nxp.com>, Linux Team <linux-imx@nxp.com>,
        Frank Li <Frank.Li@nxp.com>, David Wu <david.wu@rock-chips.com>,
        Samin Guo <samin.guo@starfivetech.com>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Swathi K S <swathi.ks@samsung.com>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini
 <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20260306-qcom-sa8255p-emac-v7-0-d6a3013094b7@oss.qualcomm.com>
 <20260306-qcom-sa8255p-emac-v7-1-d6a3013094b7@oss.qualcomm.com>
 <20260307-boisterous-tuscan-rat-1eb9bb@quoll>
 <CAMRc=MeeHP_ZjhOHu5NNLCU6Cg59EAWQAS0JngEHDQkmcDH3HQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <CAMRc=MeeHP_ZjhOHu5NNLCU6Cg59EAWQAS0JngEHDQkmcDH3HQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Ga9zA52Tnn6IercrtEG-tFhEWHJYW6fO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA5MCBTYWx0ZWRfX9/CqreJRkIpb
 fZNFN9yEVonDrEEkCyecWua2K9RZ79ZqH0QKVRWfYIn+sPMykeykFLkB4xZ+Pxg4uKpeA+sfiYR
 DVab794rjqnnEJ84M/S2blwL5YqL0i65yNFkeACJW5UE2dZyddcGLoNX/2tNobFePh9vHpRWC4P
 R4zhm3TWhuB1ydsBPstocBR8SQMpHkUbvnWQuEsQCduOIuoqsPr6teK004QAbyFW4i1UilN6UrI
 F86LhZFq6YXnZzDf3ZLVVAAMSdnt6fPAOGybWJ/LcuZBMq46cRVWQNNBxbjAaQDUUeT97QZ+X4w
 UFLRA65+3EXhJqniTHU+Kcg7huPW9PjKQkd/ODepIzBvh6Ze9ZxTugqyqShiikKTcTrXGuDqX8C
 wvTy5H1/OtwDB1B2Hsbs52evaVtkfyLJkwsNJjAVdlbaCARuxlBFrdceaN4OxMRJDYxSklmPT4P
 9H/RHwCGdEVrOBxpA9g==
X-Authority-Analysis: v=2.4 cv=O/w0fR9W c=1 sm=1 tr=0 ts=69ae97c8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=P-IC7800AAAA:8 a=hmWrw1lzc97rlj7zVzYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: Ga9zA52Tnn6IercrtEG-tFhEWHJYW6fO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090090
X-Rspamd-Queue-Id: CFA2D23685E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,gmail.com,lunn.ch,davemloft.net,google.com,redhat.com,foss.st.com,st.com,synopsys.com,sholland.org,altera.com,linaro.org,baylibre.com,googlemail.com,pengutronix.de,oss.nxp.com,nxp.com,bootlin.com,bp.renesas.com,sntech.de,outlook.com,esmil.dk,starfivetech.com,mail.toshiba,glider.be,eswincomputing.com,intel.com,rock-chips.com,samsung.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org,tenstorrent.com,lists.linux.dev];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-13416-lists,linux-mips=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,linaro.org:email,bootlin.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_GT_50(0.00)[76];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.989];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt,netdev,renesas];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 09/03/2026 09:39, Bartosz Golaszewski wrote:
> On Sat, Mar 7, 2026 at 11:25 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On Fri, Mar 06, 2026 at 04:46:39PM +0100, Bartosz Golaszewski wrote:
>>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>
>>> Describe the firmware-managed variant of the QCom DesignWare MAC. As the
>>> properties here differ a lot from the HLOS-managed variant, lets put it
>>> in a separate file. Since we need to update the maximum number of power
>>> domains, let's update existing bindings referencing the top-level
>>> snps,dwmac.yaml and limit their maxItems for power-domains to 1.
>>>
>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>> Reviewed-by: Romain Gantois <romain.gantois@bootlin.com> # For RZ/N1
>>
>> Can we drop half-baked reviews? Reviewing only that piece is not even
>> possible, because it makes no sense outside of main change context. IOW,
>> it's pointless review of nothing, if you do not actually review the main
>> change impacting RZ/N1.
>>
> 
> This is the first time I'm hearing we can't review individual parts of
> changesets? I see your point about this particular patch and the fact

Of course you can review. And that will be Ack, not reviewer's statement
of oversight.

> it only makes sense as a whole but is this the official policy for
> parts of larger DTS patches?


"Acked-by.... user may not have carried out a technical review of the
patch,yet they may be satisfied ..."

"Reviewed-by:, instead, indicates that the patch has been reviewed and
found acceptable according to the Reviewer's Statement:"

Above important: "THE PATCH"

It is not "the patch or its parts"

Further:

"I state that:
(a) I have carried out a technical review of *this* patch to evaluate
its appropriateness and readiness for inclusion into  the mainline kernel."

And further:

"A Reviewed-by tag is a statement of opinion that *the patch* is an"

And really, really reviewing only Renesas part in this patch is NOT a
review. It caries zero meaning whether this patch is correct. It caries
only acknowledgment that Renesas part seems fine, but if main binding is
wrong by mistake (because it was unreviewed), then Renesas part is not
fine either.

IOW, I believe, you cannot give a correct, *meaningful* review of this
binding patch without reviewing the referenced schema.

That's not a official position, that's my interpretation of submitting
patches document and my feeling of logic behind performing any review.

Best regards,
Krzysztof

