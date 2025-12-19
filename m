Return-Path: <linux-mips+bounces-12522-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E2296CCFA58
	for <lists+linux-mips@lfdr.de>; Fri, 19 Dec 2025 12:45:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 38EC430AE09E
	for <lists+linux-mips@lfdr.de>; Fri, 19 Dec 2025 11:43:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81C0D31AA8F;
	Fri, 19 Dec 2025 11:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CBHFp77w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CDKrIU1t"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF9431D39A
	for <linux-mips@vger.kernel.org>; Fri, 19 Dec 2025 11:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766144581; cv=none; b=ViLtmlmNJZbLAbzTOyQDI5DmA+zdZQ+7jttQl3PgVWqJ/B0ovVEhQd9jHVXRMXissxNAcleZa5AGihOnNkSLtNC7USvv61o+S+Ax9wCQV5RUCBJk/ma4btvUtJ+W/hQoKqCmGVNq5hitCgHBrGBpvsWR6EEVqEJUcmMpeTk19jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766144581; c=relaxed/simple;
	bh=Djhq+Qs7UcuFRjlz7V1IxtmMHXL21sAEDKp3PNofzZ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LWHAEYXLHKmcMozLtV6u8oMh0BfLyBRJgJeoGtq3sVSoj3NNfe7/FWJlRnlRH7kMSrdoj+L3ftgahTgdqoPaLfoNfc9dbZ5Lst/y570LGe6PUBHPLVx4qkR8NxIkqoWOY7N5E20kdNkCS+sJy2Vh4RL/1jJ/Bsb9HCA6MI9BLa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CBHFp77w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CDKrIU1t; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJBXccG091384
	for <linux-mips@vger.kernel.org>; Fri, 19 Dec 2025 11:42:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kD1ssSCTHDMOR3VnweMegknREdJvLsJSq4g8eG51V+M=; b=CBHFp77wpmg4I3K7
	Rg/zPjnBug7Mvz8+cpO95J+3tPdoWdrXTCJTbkEtKa23Lbh6i34cVMmpsY+uOueZ
	Vbuil+bTAuzBVjv8uuJDvYsZvF9EvsuEyzaYAVrwdprCSF3TedQpqZuEzy3LPi2y
	ukmz8jEM0pPXOmp6xDA6zka7gU+Y1H1e1CUVxhhQHJqwDOOAVv9Bm+BbFyXS08ef
	wOiGb52r1BhhhIzWcSfbx9TP/WCYP1WYAdMQkQZgw+X1HURHcVFLerNGVDnnfZQF
	GLq3XzzlftyUytUd/QVBiQ5xMbzCRr5j2wnRSxDPNez/Hx801e/L2AD6IVcQKVa0
	p9O9wg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2eagj1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Fri, 19 Dec 2025 11:42:55 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f1d26abbd8so40930021cf.1
        for <linux-mips@vger.kernel.org>; Fri, 19 Dec 2025 03:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766144575; x=1766749375; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kD1ssSCTHDMOR3VnweMegknREdJvLsJSq4g8eG51V+M=;
        b=CDKrIU1tP5KFRG9jNsK0D7eKgKI6ao6l2c1rx3H3QbYV8y5uGoqbfLPseO89SY8gYI
         vJciKTRdkhtDgLCixXhP7Wzz4T7STUpD4c3Jlroh5AZyNVYwvVuICmJSYKzrmyuaGH8K
         J8oNe5y0ZhylCKZNK0NdCMWgvV14HkrYv91iCfDcS6f38y72YBG7Fl4Pal7+QYWmido2
         0BOUeOfLA/nKT69x6y5/cLxzkJLile+XtRwGPbfIyDLHMjnz7VsCvVX+MA34whYrcKwl
         Iqd4mHZQRh15My+yOVQTMuhOKFvTo11GBNTUsibUeZyKzP9glL48HQ1BIIkmQfKpjYi3
         SbXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766144575; x=1766749375;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kD1ssSCTHDMOR3VnweMegknREdJvLsJSq4g8eG51V+M=;
        b=Hv3sZJEhtDFJsSONfCp0NFVb72i3ehD1M077RqRsBxYasPqXR9lBUa9gZ9y7vYFZ6l
         LW84wcS3bpLsd8kDLik2rDSJDY0GeVh3eGzfEvzbyU+IBz7aKrde+u7cwO51/siAl9mh
         3nrz6WMqy2h0q3qwIazvodNjp3AfFBiruB2wIM+COZp7AnnVZMcBBEliwBO3ycP3zs5Y
         7Lf34huzuJpUhdiB2KWLw7XTcco0WL61OCo1pHIGLyTVF6xVccUznIDmjOarRZGx2vi2
         i+C+aQsHkxNiw5Y/RgVH55KVTjVeoR6IBK0IGsxFW9JEoy1YTu44yjrJDVeXzvgjjk85
         nZlA==
X-Forwarded-Encrypted: i=1; AJvYcCXJqpe+udNIqguSTpg/zhBM3yRsq5MYF/o42NPc/1uQ7lUP1fieY4fYXQ2khw7B2CFoGRh6x1i44C+d@vger.kernel.org
X-Gm-Message-State: AOJu0YwpXIdK/3Y16IlLTZi1mdGm9KI44tmlGD6gqP1Bl9HG8Q/LFne1
	TMXDA6QJVxneZvCzXtzPYTg5xt53sQuHUU6Zds+TZ02Ha37cMWpY37w2d3kh61smC0m1bdgF+4l
	O5qC9pzZqaXce0Ue9JxUYmjhHRODvchmuLHu3HKuXDNufaE3458kQkxjtZOOjq6iw
X-Gm-Gg: AY/fxX68BqyUkFOm2rWKs8kFWSaTh0U6YvXgxC8s6zP/iP9Rin+BZ73Aly/ktBqdvlW
	IPCVhOc9GTygGOggGztKvKKFqvdeUCKigrQe1n3yjmZnXd/c93fLOmEBorVatHRy1FjxHnCiA9p
	BdpIL4gBsv1pJTQeWBud1zxShmeE/rn4XiHdq7JB4I0BspZCm7FWtXiVW9e6ZdFeb8xsSCvnvy3
	Uu9cZuOehtAlnZ5yQdqrShdmomKqKq0rWfS4bvWlz/4GD935oK6aIToCh+YwD7hNuY7GEaIqkpl
	OPyOStwXUyq/LaG/EYhGHW3ji4ZiLssIQPZWL8RRIACpp51tKix/6UFTVo29nPMsyNeAurZW9FB
	a3FpJ75eGEVJjqLcAFPVF9sF4ONeJAQcaYkWzoHk=
X-Received: by 2002:a05:622a:198b:b0:4ec:eec7:4850 with SMTP id d75a77b69052e-4f4abd8ca70mr31652521cf.44.1766144575410;
        Fri, 19 Dec 2025 03:42:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGXqKhXyGW/sOCylHSqPsU9xZo9abZxVRQYCYTMt6lSiNRCCt2ixMu9EsVynhaWcGrEf/49ww==
X-Received: by 2002:a05:622a:198b:b0:4ec:eec7:4850 with SMTP id d75a77b69052e-4f4abd8ca70mr31652031cf.44.1766144574971;
        Fri, 19 Dec 2025 03:42:54 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:d857:5c4e:6d25:707c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d4f09sm41134425e9.12.2025.12.19.03.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 03:42:54 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 12:42:19 +0100
Subject: [PATCH v6 4/7] net: stmmac: qcom-ethqos: split power management
 fields into a separate structure
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-qcom-sa8255p-emac-v6-4-487f1082461e@oss.qualcomm.com>
References: <20251219-qcom-sa8255p-emac-v6-0-487f1082461e@oss.qualcomm.com>
In-Reply-To: <20251219-qcom-sa8255p-emac-v6-0-487f1082461e@oss.qualcomm.com>
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
        Swathi K S <swathi.ks@samsung.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3459;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=xDKLLZ/nGakVrTmQ+/4MLzBk+KmOo6dAa2oHorRw58A=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpRTosU5uN+G2JPXQO6N/VK1p008Oy6bofZoKjo
 4TC9E8cTb6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUU6LAAKCRAFnS7L/zaE
 w8KcD/9ZLZTgUdutIP1az4i2m9SlSrbZuBpSxCTk3tVAOh+pTUXnqxh44wcriaptAi7CAdjYTsW
 bvBu0uld9h2v02gfR7d7KST7DXd3WuHxsE0CEWVvEipG5rJeroe12tLfcoLVHhJSkHS+WKFR2j0
 NtOFNStGn6A2142OljZTa1/9PatjKIgBxSTTuFskeqOs3+2IhIH+P1/rOkFDM7nLIUicSRdpDI/
 luhS8I1dCa2N87ZP8osUOpu1J5AuCCed9LJQtnLGDXJRpHHwX7SIqXdB2lEFcWuTyOtBdK4x5to
 /zAzDREVu73NkkoUL9WeaR7LMcCgvujivWWJOzuENtUoJCQi667HIb7ewTqvBJcGf2s63hxySAv
 st7UtHOzFtJZ+1ic90B0fOoFJWEHhiMhljyfNlCHt9htbxgKwLyFbr+ny2zKTdvUF/FFgllMFA3
 m/s0PKyeVehgH84mFxxFScJN7BxGZsxxHgEMPGCX8iJfeMQ+HLuz5pBtLPRGMD+g6MW3oRi2prr
 3MhkAUBFVRYpQAjjL1QYYPX3UhWVkBdxnv4/L6D25Ut2s3PpOX92lI+Vt7zECxME9g3x9xJbW9w
 xSnslNc5kfLfVgheENGgHolGcNe+tosRYeTSnd8MkMX4aCyqXAmez9E/q4e9EzmM7LaHsqEkrYi
 YE8Hk92iOl8+j3g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA5NiBTYWx0ZWRfX+XVKSoR5mD+Z
 CgqU9aw/I65mQzU9/s/hSL14XRw1jalQOzPAI4QBTTltS2/jG0ofhhcONasykNXjuA81aH+6BTU
 Azgv/rwzV/NwAxbt1YySbiNKLn3J5A9KimYV6jOKCl9a+sPf+kJEVsB1QUuCkDW0NZ0JWrKEu+x
 7qH1ixb/dTyJHPw9jbg4vL3C0yXtOiwhnnUIrbzm7rvTpZY83jPR54cx21Q7j/xiAGeRUAVT1mi
 vRBx+DdB5uZVIJVhsOopNpWAv1D17TbZTbGu1Jk4xRrIIYk2q4q6mRTUH6t3LZ5Bb8hsIL5D6Pl
 PY/eACnKIWJ4DK7Xyu0Sx2sq8bwOFuppb1TbnwkWta4/Q1wn+HhT/teZ1YcxT18L8iCYRsvo89I
 /WWOE0c28qII8phY66vYTN2xP2RjIJCZcEuqMJBQQJftKeOClIXmmimfsYUbP6xY0S/I1h5U5f6
 uf1OSLyHHoktJpFhy2Q==
X-Authority-Analysis: v=2.4 cv=W+c1lBWk c=1 sm=1 tr=0 ts=69453a40 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=fthQcs0maGYz3WdgJrEA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 4owAmyfj0jlll_2ub4pbhnB-MrCdDhnd
X-Proofpoint-GUID: 4owAmyfj0jlll_2ub4pbhnB-MrCdDhnd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512190096

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Now that we have a separate wrapper for device match data, let's extend
this structure with a pointer to the structure containing fields related
to power-management only. This is done because a device may have the
same device settings but different power management mode (e.g.: firmware
vs manual).

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c   | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index e0f0eca94342..54458ff5c910 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -91,14 +91,18 @@ struct ethqos_emac_driver_data {
 	unsigned int num_por;
 	bool rgmii_config_loopback_en;
 	bool has_emac_ge_3;
-	const char *link_clk_name;
 	u32 dma_addr_width;
 	struct dwmac4_addrs dwmac4_addrs;
 	bool needs_sgmii_loopback;
 };
 
+struct ethqos_emac_pm_data {
+	const char *link_clk_name;
+};
+
 struct ethqos_emac_match_data {
 	const struct ethqos_emac_driver_data *drv_data;
+	const struct ethqos_emac_pm_data *pm_data;
 };
 
 struct qcom_ethqos {
@@ -303,7 +307,6 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	.num_por = ARRAY_SIZE(emac_v4_0_0_por),
 	.rgmii_config_loopback_en = false,
 	.has_emac_ge_3 = true,
-	.link_clk_name = "phyaux",
 	.needs_sgmii_loopback = true,
 	.dma_addr_width = 36,
 	.dwmac4_addrs = {
@@ -324,8 +327,13 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	},
 };
 
+static const struct ethqos_emac_pm_data emac_sa8775p_pm_data = {
+	.link_clk_name = "phyaux",
+};
+
 static const struct ethqos_emac_match_data emac_sa8775p_data = {
 	.drv_data = &emac_v4_0_0_data,
+	.pm_data = &emac_sa8775p_pm_data,
 };
 
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
@@ -744,11 +752,13 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
 	const struct ethqos_emac_driver_data *drv_data;
+	const struct ethqos_emac_pm_data *pm_data;
 	const struct ethqos_emac_match_data *data;
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
 	struct device *dev = &pdev->dev;
 	struct qcom_ethqos *ethqos;
+	const char *clk_name;
 	int ret, i;
 
 	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
@@ -796,6 +806,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 	data = device_get_match_data(dev);
 	drv_data = data->drv_data;
+	pm_data = data->pm_data;
+	clk_name = pm_data && pm_data->link_clk_name ?
+				pm_data->link_clk_name : "rgmii";
 
 	ethqos->por = drv_data->por;
 	ethqos->num_por = drv_data->num_por;
@@ -803,7 +816,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	ethqos->has_emac_ge_3 = drv_data->has_emac_ge_3;
 	ethqos->needs_sgmii_loopback = drv_data->needs_sgmii_loopback;
 
-	ethqos->link_clk = devm_clk_get(dev, drv_data->link_clk_name ?: "rgmii");
+	ethqos->link_clk = devm_clk_get(dev, clk_name);
 	if (IS_ERR(ethqos->link_clk))
 		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),
 				     "Failed to get link_clk\n");

-- 
2.47.3


