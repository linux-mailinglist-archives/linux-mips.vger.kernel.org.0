Return-Path: <linux-mips+bounces-15271-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ngo/A/xaQmpD5QkAu9opvQ
	(envelope-from <linux-mips+bounces-15271-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jun 2026 13:46:04 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D286D999E
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jun 2026 13:46:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=VME4b6pe;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=VFUtPBML;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15271-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15271-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5DB6431E433E
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jun 2026 11:30:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20763402B96;
	Mon, 29 Jun 2026 11:29:38 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB78B400DEF
	for <linux-mips@vger.kernel.org>; Mon, 29 Jun 2026 11:29:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782732578; cv=none; b=dk2WWf9nBHrIoJMXHzS8RIkfN1CDAgtjYHnLs+DNJu5ylfWZJ2R7gD6a8I8gOWbjFKTlYYQVhwzZ+iJAcncOW638RIxCzUbfV25rHCL1BRJkBtdt/hiGVI084aLmsrdoYF6WVRknINTuW0/m3O7GNpN09dYdx/dfRQO+a4wS0Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782732578; c=relaxed/simple;
	bh=zlpwRA2B5tVQ/D/s7B0Bufz2lMNZ9fNOyqanrb1FAug=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YKuUtwuQgpNwAxS5pm7e220naejcCDYcN+GDUwm24B1WnyVjTghWvgrgGgPNWJXd4VgkCDZFDoSzN/VtHFy1AsVqmmYmC/tcoZymBaRMO/CLlZuXlT0kAeb16NfBjvDXwbC2iephjlQQrg5SxssvIvo54AkGfqlJRBf2336lUPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VME4b6pe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VFUtPBML; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATRxt2592814
	for <linux-mips@vger.kernel.org>; Mon, 29 Jun 2026 11:29:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+Q6bqQDHUHrjtIHiVjOhXKx+2i7lMgyb4QA6T5rl8AE=; b=VME4b6pe0s8CuQcT
	zb9F7XtQFAMjYW3UUW4Xs4rfkBOz89g3rI1FkLqhocUuFQ1NshWQ0OfLcdrSWGv3
	dCDKd9Z9myw7SA2E9nxEVSL9ookplm32yU7k3WCOX7lJGwphKL9ZJsOG3Agr7zm+
	RuuuS1+5w9qaXhUyF2bxnoBO0dTpAoTF+pTkoLxhDc1FLbTtwsMDq+k3aCcfQobP
	sIkguaOaDTYm9E/Ac5kRS+b7sFym7konv97/6OSBPsAvUNzevqbzP4vjmd1K6Z2X
	1FKX4LqzVeWDz7KkMOgN6mtZhd9U2vCEAtQ2LuHqm3fbIFpJ4JO3QSWN/+dwaFxu
	oy9rxA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3k7vhdff-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Mon, 29 Jun 2026 11:29:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92ac0a54110so512348885a.2
        for <linux-mips@vger.kernel.org>; Mon, 29 Jun 2026 04:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782732574; x=1783337374; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Q6bqQDHUHrjtIHiVjOhXKx+2i7lMgyb4QA6T5rl8AE=;
        b=VFUtPBML0zvsliyPq+4Adcww7DJObpevjkkBisRkABUX92Ez+sNHAGcxs2WofpWDph
         ms5irQ8rx/VCrL6VaWbB9Wd9pFtclx1CyRu4aoNNi/HANWk+dEz/wAUnsoGp8LdgHspY
         K7RWvzaMhVF/WWfhg/KtImyLcKfOqAmGGnQnH1rcStjKwAuOXJTDXNdt171UxdFWxFRW
         HKHpjoXwZDB4ahKvB012K+0hvCLnAZn3nB/wvzDpbaaBIOQxxi8aMjzr8mVCTgNP2uhD
         l+XWqwkIT9hDqExZiTzbX/QH1+xBWz1Q9XbcQPoISwor5JJqX6kUck9CyCEFaQgrMrfc
         ntSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782732574; x=1783337374;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+Q6bqQDHUHrjtIHiVjOhXKx+2i7lMgyb4QA6T5rl8AE=;
        b=BvY+eOyDWUk12jbaDpMs2lpKUnp0RPQc9ttdRmOR2/Rj2EymiJpCS4hPzF0Y+h5wH6
         RXhMcGVMms77kJBG05URXeOnJh8AqkMildsf8IUHvgyxBGyj0K4YD0hWUwygRRLh8gDH
         vWr/3Q5tWLIguv7an/NSFMxmIp4TZF9Sm0YbM9ibwC7C7wPDaeAAmNDCC1y1MadWVmec
         h7D1F6iuwy+SZrSsc2V4o9+hxTykC6RVXadPoJnKzl5jIafhZQuTxdXoND9QRsPCfYpg
         G6ujmC/81smLlXmnEMbt7uIJZ4RTs1MEynepWB3nty4hOVV9/vwvoiV5v/BqQCYRdILo
         Zuxw==
X-Forwarded-Encrypted: i=1; AFNElJ8EMi5Q0kDwxnkBbqlPAWLCZli2a4+tnH1RxMRjbOapkrZLFA6GGccAwVXiCVKNqZ8fpyFtkFc8FvWq@vger.kernel.org
X-Gm-Message-State: AOJu0Yyps5kx7wYPJpNO0n+TUV0vNnXito1oSrO28mbF0LnLgsvVQWI9
	OeSqlbnx+OpGlF0I1ohbZmTufZzKQ03p3AxnCRsyXKBhCaHkhYxKFuiLFVETVtsEfju0YguOvpD
	Y4J7tWGaPPzjcBYPrh6QKu/z/jm0YMDc9frS9sOOlLoEIKS1S9CFgU+S1q0A0VCsD
X-Gm-Gg: AfdE7ckjuMCdaLqjO844ZAL7M+KcOa+ZATpet/Mz1PejburqJDF6Bk0j9fQT/2bfVU/
	XPqiirVDmyKndPVmfV8tkTXdig08x1qzr+IJrtoM+d35DCobfgNBD4Mr869DPv8l3S1wx0GfLjU
	3rgCM8TPgEAEwDTwwkX8boOA+uC8J53fuh6ii5YX/AJq+6mOFANlo8arXZ3pf35GzWpSB/h3TDc
	7p4t9ETV3o0dWc6mD2wa1JDZABzybu+rnU1F1/6ycdylpZjW3imuTkM/Cd+IqMZtnNFTtA5LQvA
	VDydWJmTT0mqbaaaUSdEKYuZEs2ja5AeHrHD+58bIK5nCmBvXbSjY26bKJjYmOuMCgOa5HQC606
	9ZdajpOvbJt+mN5gobkWA+Nnz9DjKC7+Cs8B/NKlF
X-Received: by 2002:a05:620a:6910:b0:915:b852:435e with SMTP id af79cd13be357-9293a9a0911mr2438678985a.14.1782732574051;
        Mon, 29 Jun 2026 04:29:34 -0700 (PDT)
X-Received: by 2002:a05:620a:6910:b0:915:b852:435e with SMTP id af79cd13be357-9293a9a0911mr2438669785a.14.1782732573277;
        Mon, 29 Jun 2026 04:29:33 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46d86960983sm41936351f8f.4.2026.06.29.04.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 04:29:32 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 13:28:53 +0200
Subject: [PATCH net-next v11 7/7] net: stmmac: qcom-ethqos: add support for
 sa8255p
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-qcom-sa8255p-emac-v11-7-1b7fb95b51f9@oss.qualcomm.com>
References: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com>
In-Reply-To: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vinod Koul <vkoul@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Romain Gantois <romain.gantois@bootlin.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Radu Rendec <rrendec@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5134;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=zlpwRA2B5tVQ/D/s7B0Bufz2lMNZ9fNOyqanrb1FAug=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQlcEanL1FozExLzbB2CNw7QgHT0+vuG3E3TYv
 vlirghb6BWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakJXBAAKCRAFnS7L/zaE
 w545D/sFwyf136vnKWGIWE5mFjoPntaYvEb9XbIPHbPDLyLyBE5XGa4vL8daVHrE9ttYSHHicug
 cgto+b7tNG+Fdgv66ccpX/OPFJ288VrdQXu08TFHm8rbVuAwdJVGakFZDQM586+nnFtHX90FFCJ
 IYbBvmkPtI4jX6tVNt04onvWsH60gsbQaOJ2sXc0qrzlABFC3ZDyWCOnuHSjyptruZk7K1KOgTR
 np3KO1nttnj3nBFUVaVmgnFkKgpzwvqrkGPbEPX5mhvla5xe5ixRTykZ9dRDNi3KhhJeSqvrHpW
 mvjIt+lhH2YYRzTQ8pbVEdXw+wLTE+ix41vqVoQBPDWLcRtOOIsBA7gZln2tlyHeHabfa3RAxl/
 4K4gfxWbVNQDSX59JsK760mq7/UOtG9vZe+0N0RD45radrnHGCDyXrGbnLjrGr8vg4L07SXkfAU
 TrwHAdR+H/fNHAzriC5y+8lwoLcVl/eSl6fBwEMJzTRhcpaUbUBvHhCCGI78tyBUS3/43Ssrlg/
 yhK/f+h2j9bAwb2MebJspnvTZw1oALLO48vK6Bi+MBekjlSHXyEkVAtHaK/9Z1HPp5S/9vvAf6X
 a6YOb07mTXouuxowjFQ+eSdQ54brBkbr9MQWCJxU34Rx3HFTBWgtURBW7cuivUHI/CzFRWHbF6D
 tQOXj/IRERuPa5w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: q9gljpG_7QZTSYsfcl9Z0-kTEEw46XBv
X-Authority-Analysis: v=2.4 cv=CqCPtH4D c=1 sm=1 tr=0 ts=6a42571e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=RTgpwGSXUauNkVmvBPUA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA5NCBTYWx0ZWRfXyvIVGzyYnOTl
 M3YfQ9gq8FsOZSlEDDySEobbEF4e/Dfl5wBQAbZp+aui5jX4qAtjAwByxxyg69UdTjItG66WLGw
 qMrM6VgA3hfKwMgbbRCVhl1YfGTwAvI=
X-Proofpoint-ORIG-GUID: q9gljpG_7QZTSYsfcl9Z0-kTEEw46XBv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA5NCBTYWx0ZWRfX97FCUu5grgI0
 MVzX5UbEvfCsIbttqWnF1T2tTH2iG2ACIW+PBSOS6WlaYbe86iBxIz/cTIkBxxwCXVA/Je6I4GW
 LlL0itsr4UqDMIY50k8auAukKvCE7JdOaFOjTalAqLnKnUlWJWDj9dztadG88vgpgnu40EJfm12
 Lojc0bhFzYOXI/dtA2j5ZWt0w63RsOtFoxDakXouepV8d+n9wx/TbBwuYCLZm8mv5QMU+NE6Bq+
 4RsA0UUZ49jaibXZlORsrobzcHUDlO6h3Esz0qlPhos6Hod9IkL4QcDm47onTmLDJPd+gVaAVH+
 C3pjxwwThVUfPJHwaIoICFW1NNAAIPf+SE3X4NXUU1Y61SWeUKdImeLzoT+skZNZL81Hl/cC6NS
 Ddn4zR4iHK0frFUpX7Xy3lwHfHgPTOqNgmKiUA2jnz6uo1xJCTSADI7pI6ITOtRUcZ7W0tbTFat
 4r2HGN+APa+yQmyxlRA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290094
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-15271-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,gmail.com,foss.st.com,st.com,linaro.org,baylibre.com,oss.nxp.com,nxp.com,oss.qualcomm.com,bootlin.com,glider.be];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:vkoul@kernel.org,m:peppe.cavallaro@st.com,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:shawnguo@kernel.org,m:festevam@gmail.com,m:jan.petrous@oss.nxp.com,m:s32@nxp.com,m:mohd.anwar@oss.qualcomm.com,m:romain.gantois@bootlin.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:mripard@kernel.org,m:christophe.roullier@foss.st.com,m:brgl@kernel.org,m:rrendec@redhat.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:dfustini@tenstorrent.com,m:linux-sunxi@lists.linu
 x.dev,m:linux-amlogic@lists.infradead.org,m:linux-mips@vger.kernel.org,m:imx@lists.linux.dev,m:linux-renesas-soc@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:sophgo@lists.linux.dev,m:linux-riscv@lists.infradead.org,m:bartosz.golaszewski@linaro.org,m:bartosz.golaszewski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:jernejskrabec@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt,netdev,renesas];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 02D286D999E

Extend the driver to support a new model - sa8255p. Unlike the previously
supported variants, this one's power management is done in the firmware
over SCMI. This is modeled in linux using power domains so add a new
emac data variant and a separate setup callback.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 83 ++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index f379570f80680e96f027873cda6a6bca398e22dc..47175670a32631369a2cf8b00388d9359513e090 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -108,6 +108,7 @@ struct qcom_ethqos {
 	struct clk *link_clk;
 	struct phy *serdes_phy;
 	phy_interface_t phy_mode;
+	struct dev_pm_domain_list *pds;
 	const struct ethqos_emac_driver_data *data;
 };
 
@@ -206,6 +207,8 @@ static void ethqos_set_func_clk_en(struct qcom_ethqos *ethqos)
 
 static int ethqos_hlos_setup(struct qcom_ethqos *ethqos,
 			     struct plat_stmmacenet_data *plat_dat);
+static int ethqos_scmi_setup(struct qcom_ethqos *ethqos,
+			     struct plat_stmmacenet_data *plat_dat);
 
 static const struct ethqos_emac_por emac_v2_3_0_por[] = {
 	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x00C01343 },
@@ -310,6 +313,29 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	.setup = ethqos_hlos_setup,
 };
 
+static const struct ethqos_emac_driver_data emac_v4_0_0_scmi_data = {
+	.has_emac_ge_3 = true,
+	.needs_sgmii_loopback = true,
+	.dma_addr_width = 36,
+	.dwmac4_addrs = {
+		.dma_chan = 0x00008100,
+		.dma_chan_offset = 0x1000,
+		.mtl_chan = 0x00008000,
+		.mtl_chan_offset = 0x1000,
+		.mtl_ets_ctrl = 0x00008010,
+		.mtl_ets_ctrl_offset = 0x1000,
+		.mtl_txq_weight = 0x00008018,
+		.mtl_txq_weight_offset = 0x1000,
+		.mtl_send_slp_cred = 0x0000801c,
+		.mtl_send_slp_cred_offset = 0x1000,
+		.mtl_high_cred = 0x00008020,
+		.mtl_high_cred_offset = 0x1000,
+		.mtl_low_cred = 0x00008024,
+		.mtl_low_cred_offset = 0x1000,
+	},
+	.setup = ethqos_scmi_setup,
+};
+
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 {
 	struct device *dev = &ethqos->pdev->dev;
@@ -749,6 +775,62 @@ static int ethqos_hlos_setup(struct qcom_ethqos *ethqos,
 	return 0;
 }
 
+static const char *const ethqos_scmi_pd_names[] = { "core", "mdio" };
+
+static int ethqos_scmi_setup(struct qcom_ethqos *ethqos,
+			     struct plat_stmmacenet_data *plat_dat)
+{
+	const struct dev_pm_domain_attach_data pd_data = {
+		.pd_names	= ethqos_scmi_pd_names,
+		.num_pd_names	= ARRAY_SIZE(ethqos_scmi_pd_names),
+		.pd_flags	= PD_FLAG_DEV_LINK_ON,
+	};
+
+	struct platform_device *pdev = ethqos->pdev;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	ret = devm_pm_domain_attach_list(dev, &pd_data, &ethqos->pds);
+	if (ret < 0)
+		return dev_err_probe(dev, ret,
+				     "Failed to attach power domains\n");
+
+	/*
+	 * The SerDes lane, its clocks and the MAC AXI/AHB clocks are owned by
+	 * firmware and brought up through the SCMI power domains above. The
+	 * MAC wrapper itself, however is in the kernel's register space: the
+	 * mux that feeds the SerDes recovered RX clock into the MAC's clk_rx_i
+	 * is not configured by firmware. Without it, clk_rx_i never toggles
+	 * and the DMA SW-reset polled in dwmac4_dma_reset() never completes.
+	 *
+	 * Map the wrapper and program the same loopback/functional clock bits
+	 * the non-firmware platforms rely on (see ethqos_clks_config) so the
+	 * RX clock is present by the time the DMA engine is reset.
+	 */
+	ethqos->rgmii_base = devm_platform_ioremap_resource_byname(pdev, "rgmii");
+	if (IS_ERR(ethqos->rgmii_base))
+		return dev_err_probe(dev, PTR_ERR(ethqos->rgmii_base),
+				     "Failed to map rgmii resource\n");
+
+	/*
+	 * Run on every runtime resume, which stmmac performs after the power
+	 * domains are on but before serdes_powerup() and the DMA reset, so the
+	 * wrapper is always configured ahead of the reset.
+	 */
+	plat_dat->clks_config = ethqos_clks_config;
+
+	switch (ethqos->phy_mode) {
+	case PHY_INTERFACE_MODE_2500BASEX:
+	case PHY_INTERFACE_MODE_SGMII:
+		plat_dat->fix_mac_speed = ethqos_fix_mac_speed_sgmii;
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -836,6 +918,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 static const struct of_device_id qcom_ethqos_match[] = {
 	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_v2_3_0_data},
+	{ .compatible = "qcom,sa8255p-ethqos", .data = &emac_v4_0_0_scmi_data},
 	{ .compatible = "qcom,sa8775p-ethqos", .data = &emac_v4_0_0_data},
 	{ .compatible = "qcom,sc8280xp-ethqos", .data = &emac_v3_0_0_data},
 	{ .compatible = "qcom,sm8150-ethqos", .data = &emac_v2_1_0_data},

-- 
2.47.3


