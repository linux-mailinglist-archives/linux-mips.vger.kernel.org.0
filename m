Return-Path: <linux-mips+bounces-10228-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C34B222AF
	for <lists+linux-mips@lfdr.de>; Tue, 12 Aug 2025 11:17:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7EA723A46D4
	for <lists+linux-mips@lfdr.de>; Tue, 12 Aug 2025 09:14:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63ACA2E7BB7;
	Tue, 12 Aug 2025 09:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IhtfSRQ2"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0A12E888C
	for <linux-mips@vger.kernel.org>; Tue, 12 Aug 2025 09:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754990049; cv=none; b=RCya/7oizD2ZYKKUOtiiAOZX65eroFVWlDz0BYANfJG7uIZpDLkrMeXIgcoBDNF0S87DIniWZ6aVxhvbNAByzJt5PJUjTEAA3IAlLYDlOADxaTBLbdv1fdJl5G/IatskKRvtJA8t5KC+FBM+EPy3T1E459jC5rEPM5/4vIoYVfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754990049; c=relaxed/simple;
	bh=nr4/zLMgjwtBkW7NNaGIi8b89hI3W0RdBciJLBm7x6A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WPtvS6EbG5PeiYxz96ocua4UVAppmoIGP5GawCIZZUZW6QH3sSfEfXOh/3yBIzxUaJj6VdAZNR0SahRZw5+5CcCEH+2gT3KUEDjJRP0i6uE/3/j2REbWdmoBV+mJeYACfAvQEzwRpRZVYAlzYBHGFp0mScjFOUyuk5v6AUxPnhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IhtfSRQ2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C7XGew026164
	for <linux-mips@vger.kernel.org>; Tue, 12 Aug 2025 09:14:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TcdYyVsr8u2xyDR+M+UHLCKM6ilDd8iFcrZx6NwCMNw=; b=IhtfSRQ2YMp3r9Qb
	QTBakXU39kXnh3NAEBJK+jxPUhNti+qh2TnSA3O6FuXxZMFWJ92mtfpgaYuzpKlM
	79O6emmm+ijVk/GZsDz+7Y0utYD8xhI/HE1GcmNUUDbYPwtTK/pqvfAvkX1MCHXt
	zLgnT0FMJcu8wg830X801jUiQpgV5Zh9XqCh+ADbELn2FnOS9gICrZzQd5ELXDqc
	JMuHjW+zNFuPoGB+sR9PNb5guLJaT/oSku8iZRr5nqLYWea9Y4dIfvAon+7aBHnw
	WWDckRpDvB5IABisZYJyWOoePRF2XmOtgsNh7HDAjsCYrKKntzAOspkZicbfU5RC
	7W6NDg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48eqhx5qqr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Tue, 12 Aug 2025 09:14:05 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-7073674bc2aso19187276d6.3
        for <linux-mips@vger.kernel.org>; Tue, 12 Aug 2025 02:14:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754990044; x=1755594844;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TcdYyVsr8u2xyDR+M+UHLCKM6ilDd8iFcrZx6NwCMNw=;
        b=f77aBtEQV0WqPP2WUh86Ee7viLE9+Kj4jjATlBVQvuvEeoqX72OVyh4SxVJbvvJdkU
         ddxl26Lpul5VzmsE+RBPJdqTg8aTu3oixMu4AbKXGtAvlAMOqEy1FKONWs8WwayLFTBA
         eCKo5CIQbmHvAn3YWOSOR5m1XIk7niBmJg+nx85kX2Eshm73N/pCAHXrI0Ta3ak97MUo
         CgWsCe5E79tltvyNJnwIBlcJebgTYxZ0Ce8elMcWDTdEK4bxKmCAeBsSXCfojJ701v1C
         nEJ5EG3LWlOrvTA/4MWySF8DR4CLHDmXYxWWUqE4irV7KbK2B8UwtStfHq/l9uygyRe1
         FTBQ==
X-Forwarded-Encrypted: i=1; AJvYcCULUne7UGLo2uwPWneFxz7fHURq8OgdPKZrAWSQx2wQNAK/wkbWFRoKrRc7vP8IIB5E8w4VIPsg2LRH@vger.kernel.org
X-Gm-Message-State: AOJu0YxWVAlCbX35SFwEpew1p/jFSwtMf+P3INqiQGZ+wLXpLUzwW0Lq
	Asy4J/3Q+N1/3XvUr0aeU/CpvJjA/EvSd61CGmZfDNg8zQDZigM2zifxM26ePPiCRksFM5cboFs
	YOEDSwcDlLGwVM1byYE91fYNeyhxTgyuMaWu40DAD0AT4cvUtpmWIyZMJ6L1GazZa
X-Gm-Gg: ASbGncvUy5Zh2cofhwp0vIfdz8e8UBmZf+L3OVcaNkf0YDIO4E3VJpPT9uvdEABdLy+
	Ek5rNize6u5cUsZamLiWUwDcugaIMzOOotD0jZmnMPFZTppj0PwOxwdD/YdPgym37PtUAJk19p4
	o8SUDkn6Lrr94e0IPmzBobPlZ+VP/vxZK2PbxmnSAAkJ8Q9Xj6vUtRuD00HqTwMyCXTKZxr9hFl
	nWyK7XFGH8Zkso61m1inAZ7z/p1gOh7Cm0Ij+RHHQON+zwt1XjX9cwhk0i1qscgwXS5fyrPUrmd
	k4i0NhKJVk0RxM3/4qR2gjH3N4lGIQRcpG94JFExAAIqwBQAK0odq3YpnBLWoP77cVEFgUBLNdi
	sisQCqh3KG0BwAyeTbg==
X-Received: by 2002:a05:620a:462b:b0:7e6:3c48:408e with SMTP id af79cd13be357-7e860096e15mr26712085a.0.1754990044201;
        Tue, 12 Aug 2025 02:14:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIPCXaPbFG7yAsR8pzw0t16fLvywO1iDk8kuIeOO1bInlVQuLKav0rw2YYkObsTH0QGuYx8w==
X-Received: by 2002:a05:620a:462b:b0:7e6:3c48:408e with SMTP id af79cd13be357-7e860096e15mr26705885a.0.1754990043559;
        Tue, 12 Aug 2025 02:14:03 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0a1251sm2177380166b.30.2025.08.12.02.13.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 02:14:02 -0700 (PDT)
Message-ID: <90f4eaaf-2513-4479-8647-b855a72e0e65@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 11:13:53 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 090/114] clk: qcom: alpha-pll: convert from round_rate()
 to determine_rate()
To: bmasney@redhat.com, Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Chen Wang <unicorn_wang@outlook.com>,
        Inochi Amaoto <inochiama@gmail.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Paul Cercueil <paul@crapouillou.net>,
        Keguang Zhang
 <keguang.zhang@gmail.com>,
        Taichi Sugaya <sugaya.taichi@socionext.com>,
        Takao Orito <orito.takao@socionext.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Jacky Huang <ychuang3@nuvoton.com>,
        Shan-Chun Hung <schung@nuvoton.com>, Vladimir Zapolskiy <vz@mleia.com>,
        Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Yixun Lan <dlan@gentoo.org>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Daniel Machon <daniel.machon@microchip.com>,
        UNGLinuxDriver@microchip.com, Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang
 <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Michal Simek <michal.simek@amd.com>,
        Maxime Ripard <mripard@kernel.org>,
        =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>, Sven Peter <sven@kernel.org>,
        Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Neal Gompa <neal@gompa.dev>,
        Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Daniel Palmer <daniel@thingy.jp>,
        Romain Perier <romain.perier@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Heiko Stuebner <heiko@sntech.de>,
        Andrea della Porta
 <andrea.porta@suse.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>, Qin Jian <qinjian@cqplus1.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Alex Helms <alexander.helms.jy@renesas.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        sophgo@lists.linux.dev, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-riscv@lists.infradead.org,
        spacemit@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
        patches@opensource.cirrus.com, linux-actions@lists.infradead.org,
        asahi@lists.linux.dev, linux-mediatek@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        soc@lists.linux.dev
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
 <20250811-clk-for-stephen-round-rate-v1-90-b3bf97b038dc@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-90-b3bf97b038dc@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEwMDA1NyBTYWx0ZWRfXz3GhW1Z+0zgC
 U0cw7fpAkdwHAglQ4nto1PkrFTjix3DJVUXgwRU/jtekIJqvixnCHuu61LYIhKuUVdocZIT7znR
 oJFfswqWVlmvY2ji8XzZo0wuqMOMX62gLC2YRqufA0JSsJe3UElav9biihkHNWqAputByE+kOre
 7l+5HZiUR2D8B2xWXcMHHEda+17XclRKdmaCq+0/S4P62dJR+5wTj3dEn8GZeYfGzq5+4LETfBr
 6CHOZTRUi8+upXXB8fi5dhPEGDhDwtVf5lztbyyA0uakKDg5tSiF/QQ7sVXOOPa3FtjU5cy52tT
 /FiF5KbApGMob5L1ue96Oja/QL+MAsp8hhNHNGrk7nnitGy5qVI4yFCIVv/qKy3i/G1GDaxdlNe
 wEUCCB+o
X-Proofpoint-GUID: Ta-_3_b6MToZxJxN9p6GbpnchveJM20s
X-Authority-Analysis: v=2.4 cv=aYNhnQot c=1 sm=1 tr=0 ts=689b05dd cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=42SW9st40EnfI9Ma3XoA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: Ta-_3_b6MToZxJxN9p6GbpnchveJM20s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_04,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508100057

On 8/11/25 5:19 PM, Brian Masney via B4 Relay wrote:
> From: Brian Masney <bmasney@redhat.com>
> 
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Note that prior to running the Coccinelle,
> clk_alpha_pll_postdiv_round_ro_rate() was renamed to
> clk_alpha_pll_postdiv_ro_round_rate().
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

[...]

> +	req->rate = DIV_ROUND_UP_ULL((u64) req->best_parent_rate, div);

space after typecast is 'eeeh'

but the rest looks good

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

