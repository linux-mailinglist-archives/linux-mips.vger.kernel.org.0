Return-Path: <linux-mips+bounces-12852-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2707AD11CAB
	for <lists+linux-mips@lfdr.de>; Mon, 12 Jan 2026 11:19:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 72C61306D2A6
	for <lists+linux-mips@lfdr.de>; Mon, 12 Jan 2026 10:16:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 652E82C21E6;
	Mon, 12 Jan 2026 10:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UUvp/+Oi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jOwGroHl"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9030C2C1584
	for <linux-mips@vger.kernel.org>; Mon, 12 Jan 2026 10:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768212982; cv=none; b=uQZKOlZiQ8rOOoRi9rL4GSf9T9JPgC1hLrBZS8++/cuhFsG4zLa2KXuEMU9A8AjOLNvQWOCCMPhJKe8hGJVWIuqS7nXe3xMfMfgX417vueTmrZRmWkCFRbZACiHhMDdw+eC4zm1nKSTM+5n/8/8PrrCEDbRw5kMwooHBCsnXSXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768212982; c=relaxed/simple;
	bh=T4dB7qhSOB7MNSy9r85wdPbIeNqb5QyQF+j4L2O76eE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tR3zv5czbaPdKfKIJLIiSLzH0fdSKCOfOni0joooK7oq09F0swnFilE6ZIkyGujuVZT4Mc2GrVmtnQs8/3e4BwQnsHdLyoRfCuzKFpf57/sA5l98k2g8CwqrN1CIb6cmKlzyJjHZ2b5p6nSXh13QawBmoijHKCAjdc9s4M5jxTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UUvp/+Oi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jOwGroHl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60CAEXRQ1315835
	for <linux-mips@vger.kernel.org>; Mon, 12 Jan 2026 10:16:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=I5WkPX0kRroo4V3hS9zD0M
	7qGrJz1a+233BafHlg7M8=; b=UUvp/+Oirl/JKPuLWMZJav/yN6zNonSorJhHyc
	HjPQMtsEhHtxvh5lVrgwjIvbIw/j5TqpgfwSE+F2/e0SH0p0LtPEJ9jlwnDGFvuA
	hWyKt+yzS394njsmcmKzqLU+kSc9S+AwydI76tkAAS1/NP2AKijN0IM5HbKz9oAM
	klj/yE4PW7pxkrIfYAGQL0EtCjvVprXF8fOg/EyKddcAMmgN09Me4j43+UAGQEXz
	RO11BRsy9emAJJeTNJQuZNWz9xUYn9mbqw9jbsdWRfaL3/2UMptnfs7CzT7h868b
	sntlQ9/RAcom+7rw81sByH7O9r05dPxuyOwFtAMeObXrUSjQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmy1hg053-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Mon, 12 Jan 2026 10:16:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8bb6a7fea4dso1529692685a.0
        for <linux-mips@vger.kernel.org>; Mon, 12 Jan 2026 02:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768212978; x=1768817778; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I5WkPX0kRroo4V3hS9zD0M7qGrJz1a+233BafHlg7M8=;
        b=jOwGroHlRYD6XCcTdLsTL4ngz6oo+g0LgnMlrYL5H/AFnxrHpMNPKx3scXosN2uR5U
         PMVi3t0KrraQv7lu+Ec2zhi6xpX/mtWIR1bnAc1aRz9LBA6TYLV6D+E8Q0qOhcXW3NBb
         PcIIZ5wfBcgpJDBfc9ut/KaDYIS/1MN/B1mKsKAlcwzGgQ6h/Rj4ViY1Qgl+8faqti6P
         obankc9ohjqgPu+7VH5qvBw84rGRVkxgfkQaCw14Tk2JTG5FBUHnUW2etSL1nAwcyEiN
         b3n0qLO7/FEV9cIfQvqhAuVboKMQnWCB6OjCOVq9OybrAojjZskkRgYbnfdOP6BWj3Iv
         uZZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768212978; x=1768817778;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I5WkPX0kRroo4V3hS9zD0M7qGrJz1a+233BafHlg7M8=;
        b=UUsH0b3SosiXuvSQjNUIATaeUbAtclSEsq1HKJmD+ZtHPNY2MDeVGtPdDdYZqZnZ8t
         JS93ZF122HBVG0vazemEh6I/iJd0VZkgaN2HoAfpXSJsDbhJFJxGlFrU6TdHIMSgi/Cl
         rrqG9bP12prYFWbcElRJzEB6xGynAfFm8ncbpT0EDHS2XCZqVZp4qU2LLEabr3rxciXn
         P/9rf7OYrRZeWNi8oRUbsjB0uBENLjlLi5qtGpVAkXhoq1wpIQXYdWcaEvgZOXk/2nlX
         VoG4Dzo0cI+fbmXmnSAaI1nX5tZZduNZ98HArrgirKWE8jGyVNf7VCG2IiQEh9h+iDAk
         +23A==
X-Forwarded-Encrypted: i=1; AJvYcCUnWUkuorjF1RI0bM/ae8yrqwyzmTIGfuDTDnj+Yj2Xv7NiUUKU2OVEjXFnlDEKF2dA3yhC1g2Ui0KT@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy1bsav+S9PdzxAmfzL5IYLN94xkwTT5EJWuhkIDjew28BKD/+
	0gkmGjIAcxZ5EK3z3pvCZQvUPT6UCYeo4FOAAkKROFC1H8p6+DGG+8dP+HLaeR+yQe4C11L4NIU
	xMbX4+dxpRBlbPjWPt0yo+mcejRFQiAd/Qj3EFZjO6IMTEWzitvIXdI8JuYyYJbZT
X-Gm-Gg: AY/fxX7KAlTM0343L8O8gsOcqFBvcwgka0h6oflnt6Wy+2PKyn0ClZGV5BvN/sYzeHN
	smg9LR0DGYGvusjJjjq53B9HKEulgoFKJx9U7u6QBePmgcgkiDZrqYkgl8vSvm9d/Yx53GSyaPR
	M4lJ9sgaB4MC5DJH7QE7mYhjctTczrkA9w974746SGcV5S0lAKchFy1sfQ1vllIlyJe/l7xUdtM
	2kufCjN9MbKkAvTgIhtb658MM3uN2HK49puN+DdxCOFzB2FpfHfSWWr5OPCJXv1nI3QWFteQ65d
	slAkVAhMjXjMXWpeaUkSN7vVCYbs4PZBlOpku6p8KIFxvQrBSnFHevdYY773OJeKzEiGqopMb/G
	iw1D3r8etdDvf9HrHLcfr23nGUyljmZGnWqFnemSg
X-Received: by 2002:a05:620a:40c9:b0:8c3:6603:cf63 with SMTP id af79cd13be357-8c3893f6de8mr2627912185a.68.1768212977803;
        Mon, 12 Jan 2026 02:16:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGs8ShypNhVdDakSevb2ZS1sNpt+R6FIEerItjbw5zTxbNLfiPTZKzHXym+g0nfOdJdvZoOQA==
X-Received: by 2002:a05:620a:40c9:b0:8c3:6603:cf63 with SMTP id af79cd13be357-8c3893f6de8mr2627906885a.68.1768212977127;
        Mon, 12 Jan 2026 02:16:17 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:eb74:bf66:83a8:4e98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d865f0cf2sm126530355e9.3.2026.01.12.02.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 02:16:16 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH RESEND net-next v6 0/7] net: stmmac: qcom-ethqos: add
 support for SCMI power domains
Date: Mon, 12 Jan 2026 11:15:39 +0100
Message-Id: <20260112-qcom-sa8255p-emac-v6-0-86a3d4b2ad83@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMvJZGkC/23PPW/CMBAG4L8Sea6j87fTiaGsDO1YMRhzAUskB
 jtEVCj/vVaGUilZTjrpvefuniRjCpjJe/UkCceQQ+xLo98q4s+uPyENx9ITDlyBAUlvPnY0O8u
 VulLsnKdWauBCOa8YJ2XumrANj9n8Jp/br+3uo+pxoD0+BrIvgXPIQ0w/886RzbGZbxis8COjQ
 AV3pvEtQ63t5hJ6l2Id02nmRvFHMOBmjRCFMMpoc2i4AHdYEPJFsNUnR1mI1mitAazx6BaE+k+
 sXqEKAewoUDjXCrt8RL8Izpo1QhdCWtMysFxqhpuYc327u0uJdnUpZD9N0y8pfHmS1gEAAA==
X-Change-ID: 20250704-qcom-sa8255p-emac-8460235ac512
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
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
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4504;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=T4dB7qhSOB7MNSy9r85wdPbIeNqb5QyQF+j4L2O76eE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpZMngqzZ8uvruPvEUoAlIERmJXZV4GOvLD2CUA
 2jk6739/fCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaWTJ4AAKCRAFnS7L/zaE
 wxLsD/4pIBV9PSLE5cLStoWto/nEchd0bGE8MvbAwpY7xBNhsGbWLx5qp7yR/7ipfEsRkp+n2w8
 dDysWC7Pz4fAkEk4FtwXRb+R5d/2QncX00PG3luGttmg6zSJcNvGNnnBaGKKSBmgqyjwTIJQ2Dx
 qVjNEW137Sm4alGKEtkzhPmGECSWlii1AwKTcDQWEIJPPPTh+0bhFL+zi8kSgYMAJDMm0AsvMk1
 kyc3bdP8vYqFzhW1iXRVBQ2EtaZkYwflo9aUMrbREmHfOtcR7DwOkAD605RA1QmBsCKizR0Qphq
 0tk83ExlrDkRqK24PjAQByuN4gq0MICaVQfj1QAlNSVrAZA9HWIL179Q7j1tBaff7SAJ6I+f7h4
 Kba+rBS1aOF/2x4inPQXPcoecyJvQQLrHvSVkJPOY+8LaHRqFsBfTC5MP7zl87mmHHRo7e+WCr2
 V4eudb2DJwf9MQG4HMNDlRBQjctY/HQdcQODvJzycFFDkaGQ9UR0yNGCziPRj+l8DNKOQaTMtdT
 CdW8HN1Aia0NAg5TOmP9La2/8J90fInR6UufA8+X+RmuspgHWcSu+GwWQeLOol/nfqeNgo2G6/r
 R2hKOuoUwXqPLKKwYaNyjSW9cXRY7Ps71Ttwyrx3d7r04rLYz2jN0ZK4Ws6zA9MfIDqcj0I4MCM
 hANNzlBXjH4lQvA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: i-ASLYGrvzAgCUUTZZS4yXeMhSZnCI9U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4MCBTYWx0ZWRfX3qxgpyG2BTqc
 J88FigDdTDNAuSl4WRMYTccKzpOC2trwaTCFEahoK1mf6vJn+KVgpYgNqofkPQ2t1OooyLsKm37
 myHSYZeIwZiVOAUiKN3HKO6OdrURhredNQTsGEgZT95wO2Bo3dhF3PbUCmL8EJY8PCpAPKFBFNr
 aeau3PehrQ8r7k+INkuMEdN41RgLM017h/uyWCWFUiLwiEI8FJ9erW6uJ8bCZswQV9QHa4lR1b5
 9sflYDuP+6wNwCKMAwmkUlM7RWdMb51Emh7yrATIliCg398WyT3Xl1GZSMmhgqf/hoYqUmPNRvL
 a6NXkWWqxXU4hnyzmSRvEQkFxNd/bkVnJ3ChNGI2W/rQddDhfQsPPx978qr99O/vlkYknF1sMbs
 St+YTNK8OyrrhGiJGNYS23AYzDZjiqJ4z3rzMwMQC0MeNXOs/pOS2zM8bFSOHCdKqo2TAfwY+Ot
 B3lg2AESBScawdVK7ZQ==
X-Proofpoint-ORIG-GUID: i-ASLYGrvzAgCUUTZZS4yXeMhSZnCI9U
X-Authority-Analysis: v=2.4 cv=EovfbCcA c=1 sm=1 tr=0 ts=6964c9f3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=PHq6YzTAAAAA:8
 a=h7uu4O38hj_b6GN6T5YA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601120080

Add support for the firmware-managed variant of the DesignWare MAC on
the sa8255p platform. This series contains new DT bindings and driver
changes required to support the MAC in the STMMAC driver.

It also reorganizes the ethqos code quite a bit to make the introduction
of power domains into the driver a bit easier on the eye.

The DTS changes will go in separately.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v6:
- Fix $id value in the bindings
- Drop patch 3/8 from the series
- Update init/exit callback signatures
- Link to v5: https://lore.kernel.org/r/20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org
- Link to v6: https://lore.kernel.org/r/20251219-qcom-sa8255p-emac-v6-0-487f1082461e@oss.qualcomm.com

Changes in v5:
- Name the DT binding document after the new compatbile
- Add missing space
- Make the power-domains limits stricter
- Link to v4: https://lore.kernel.org/r/20251104-qcom-sa8255p-emac-v4-0-f76660087cea@linaro.org

Changes in v4:
- Remove the phys property from the SCMI bindings
- Mark the power-domain-names property as required
- Set maxItems for power-domains to 1 for all existing bindings to
  maintain the current requirements after modifying the value in the
  top-level document
- Link to v3: https://lore.kernel.org/r/20251027-qcom-sa8255p-emac-v3-0-75767b9230ab@linaro.org

Changes in v3:
- Drop 'power' and 'perf' prefixes from power domain names
- Rebase on top of Russell's changes to dwmac
- Rebase on top of even more changes from Russell that are not yet
  in next (E1vB6ld-0000000BIPy-2Qi4@rmk-PC.armlinux.org.uk)
- Link to v2: https://lore.kernel.org/all/20251008-qcom-sa8255p-emac-v2-0-92bc29309fce@linaro.org/

Changes in v2:
- Fix the power-domains property in DT bindings
- Rework the DT bindings example
- Drop the DTS patch, it will go upstream separately
- Link to v1: https://lore.kernel.org/r/20250910-qcom-sa8255p-emac-v1-0-32a79cf1e668@linaro.org

---
Bartosz Golaszewski (7):
      dt-bindings: net: qcom: document the ethqos device for SCMI-based systems
      net: stmmac: qcom-ethqos: use generic device properties
      net: stmmac: qcom-ethqos: wrap emac driver data in additional structure
      net: stmmac: qcom-ethqos: split power management fields into a separate structure
      net: stmmac: qcom-ethqos: split power management context into a separate struct
      net: stmmac: qcom-ethqos: define a callback for setting the serdes speed
      net: stmmac: qcom-ethqos: add support for sa8255p

 .../bindings/net/allwinner,sun7i-a20-gmac.yaml     |   3 +
 .../bindings/net/altr,socfpga-stmmac.yaml          |   3 +
 .../bindings/net/amlogic,meson-dwmac.yaml          |   3 +
 .../devicetree/bindings/net/eswin,eic7700-eth.yaml |   3 +
 .../devicetree/bindings/net/intel,dwmac-plat.yaml  |   3 +
 .../bindings/net/loongson,ls1b-gmac.yaml           |   3 +
 .../bindings/net/loongson,ls1c-emac.yaml           |   3 +
 .../devicetree/bindings/net/nxp,dwmac-imx.yaml     |   3 +
 .../devicetree/bindings/net/nxp,lpc1850-dwmac.yaml |   3 +
 .../devicetree/bindings/net/nxp,s32-dwmac.yaml     |   3 +
 .../devicetree/bindings/net/qcom,ethqos.yaml       |   3 +
 .../bindings/net/qcom,sa8255p-ethqos.yaml          |  98 ++++++
 .../devicetree/bindings/net/renesas,rzn1-gmac.yaml |   3 +
 .../bindings/net/renesas,rzv2h-gbeth.yaml          |   3 +
 .../devicetree/bindings/net/rockchip-dwmac.yaml    |   3 +
 .../devicetree/bindings/net/snps,dwmac.yaml        |   5 +-
 .../bindings/net/sophgo,cv1800b-dwmac.yaml         |   3 +
 .../bindings/net/sophgo,sg2044-dwmac.yaml          |   3 +
 .../bindings/net/starfive,jh7110-dwmac.yaml        |   3 +
 .../devicetree/bindings/net/stm32-dwmac.yaml       |   3 +
 .../devicetree/bindings/net/tesla,fsd-ethqos.yaml  |   3 +
 .../devicetree/bindings/net/thead,th1520-gmac.yaml |   3 +
 .../bindings/net/toshiba,visconti-dwmac.yaml       |   3 +
 MAINTAINERS                                        |   1 +
 drivers/net/ethernet/stmicro/stmmac/Kconfig        |   2 +-
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 344 +++++++++++++++++----
 26 files changed, 454 insertions(+), 59 deletions(-)
---
base-commit: f417b7ffcbef7d76b0d8860518f50dae0e7e5eda
change-id: 20250704-qcom-sa8255p-emac-8460235ac512

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


