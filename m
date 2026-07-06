Return-Path: <linux-mips+bounces-15537-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pEK8BYSvS2oGYgEAu9opvQ
	(envelope-from <linux-mips+bounces-15537-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 06 Jul 2026 15:37:08 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 059D27115A0
	for <lists+linux-mips@lfdr.de>; Mon, 06 Jul 2026 15:37:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=mJEEF2hq;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=h6w7B2yC;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15537-lists+linux-mips=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-mips+bounces-15537-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 06F0B3137453
	for <lists+linux-mips@lfdr.de>; Mon,  6 Jul 2026 12:54:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A48BE4DA52F;
	Mon,  6 Jul 2026 12:46:10 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9296433BA6
	for <linux-mips@vger.kernel.org>; Mon,  6 Jul 2026 12:45:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783341968; cv=none; b=F27yl6EgwdM9z8gEKRXnEYDOkjXpA9Y7+jWXrvCNqPzyMFr202dWVip61snyvmc0ftxTJj53evNlEG3IG2ds4xPLa3/KiJ0/BW+zp7+jsR7O2VsbroG7a6MisbNa14vfR1dVrceBnaRxKPQ6Ty0jgQMz7Swdb5oGTgeQR5OIT1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783341968; c=relaxed/simple;
	bh=IqF/4dKgB1628r62VJTRc6pv/7HE6yY73nomq/D91IU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZP8UuEoo3kL8meMoLY/sYx9YvyIlilnwdvXjvmbuXj2YJt5ddK8GG7E1nT5380vCHq8y7RQmdyBZwXZYELCpxvDWwGxmcRrQbMmimuA1eXk+H+Q19Hb/Lzv7QM1X0hFn4yoprEm761dUa+Q+0pmwWj6urhaAXz29445/hbQfuBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mJEEF2hq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h6w7B2yC; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxHEJ391231
	for <linux-mips@vger.kernel.org>; Mon, 6 Jul 2026 12:45:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j94N3D67YZmp+yB/bJ2N7wl2Db8ez4ZkEgubeH9mxnM=; b=mJEEF2hqlR/uOjVJ
	VGxfq6X8Coeflz9gG17PG5AS1d8bsHMFXhdZWsQVpoBGNxPvBhyMKeuA+dyOCDVQ
	f1hfsjqCoXOdNFPJoAu72h5EhTA2RJe8aHAuVR3do6hcY/6XuWdPi5v4ABh+SBK/
	rcNeX0qyntCP4cdXULNVaYmo+GOzB4IXw/vS1gy2FdSZK/epGthEs0eICwD0JDHC
	qLwA7MiAX+whloAu+BOq3pVZA9mRrwwWNHrvcFQktC3WPAB1dKapRcEh1XLp4aGO
	t0DPDKiFYVlnUQvHVG/TurGAk+efJV3NTROGxUtnqQUlu+PHgMshaUYjPMuJ3IBZ
	RMPGMA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89kgrrmd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Mon, 06 Jul 2026 12:45:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e63df032bso328984585a.0
        for <linux-mips@vger.kernel.org>; Mon, 06 Jul 2026 05:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783341951; x=1783946751; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j94N3D67YZmp+yB/bJ2N7wl2Db8ez4ZkEgubeH9mxnM=;
        b=h6w7B2yC64hERrSEv3KVmydDBLqbCSiU+R84v4YgZKY6Zn8jToGkof3At0DxnImDAS
         jLayZ53LM6dhN0T4pBFGl8O4aurS3grzb5UbBsi3oKuHYWr9kKwQk9/87dD7rROdzwWm
         a3oC8cZh2JYIe7K7Iq/aOK9BE8lcG0wMVr4OtN2+mLWwiQd/kQIQ4jwPV3fAwHkOk90t
         YRxaeo1Ejx4NgrX2Q49OUU5Kl7t5+467cpuv3OBclUWOm4O9lGhmSrNwdqO+uT6wGPhx
         xRribaQi1/QN+HejfnbbPG45WUs8jFO1g6RdEVLTfUV1B2K9C4Sp+Rw2ViRiVuWJIGqO
         +qyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783341951; x=1783946751;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j94N3D67YZmp+yB/bJ2N7wl2Db8ez4ZkEgubeH9mxnM=;
        b=TdF3txNF854PoELXhAYlnocWGIf/gwjSygMCJBE1R1CX10DFez3i1VscWI/FwzX8An
         JrR4tmnlR2+vdgj+KgXwMTG+qKOAXvqzq6sYrbQgvGuscfYv8Cho66DcGdBsX/3nz064
         PEoagrUC1C5MIevNUbsTtEpAHk1DxAGVZHGHEseMb/UD8KBAe6Bu/ORv3+F1J9etqe4o
         r2/8YvvQ/Joy3hBZQr/WpVItPjrfAHmry7plotwr+ZF5cRRlWaoVpGy3dALxT2Hq3zdB
         E1rpw0YzVgX0N6U0I55rM5h3ORJaRncsvqPrhXA4Zkx88xzBzIX86LmyZ7Knnvzvoxid
         Uykg==
X-Forwarded-Encrypted: i=1; AHgh+Ros6+M7o/DRpN0o6GtmadhO1vmoUv9XLoiQf+BjlY4DRF+ZmGbj5QQ9fzPH5o+pF7231wu32v4EeDg7@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3pRDPMbJbqGP4MJmqguP7/h8aF5+wRehQq3w4T0m8VwMGDl0P
	DCOK29/10HECWKPWxKw6wJ+MkPQE6PFsTFQFfsvo0RstfESRJBXTAGpv2g1rhKzx/YEt5xEvUbN
	pJR/awFSnb1ETgVDMa+QJ50GkL/jDCDgcbmRrSDbcc5YF0zrP11kxyOiCa4BOAzVD
X-Gm-Gg: AfdE7cnRi4Une8DYBa50bxKhNX4qJFNU3rsnppoDC+FiIgoLDsSmVu+Rccxw0bf+OXf
	uGKsGfbkjQ8lpyBDrCEZjuEl2ffYphJhyRsMfl1PM3QMPz3TeemmPWHvqsXs2tk70atnvLo9V0x
	++rsnvWJvlPYfe1uvR9bRGLMbfZuG4zaq9E7Y2rKOAPbSDfyC90JA/WrHoXkT0W548bONjs/UpY
	s/hPSeKKfmvjflwYhkL2MXDjZqJURoow2WxzwdQEWS3xENRPokBCjAuLVKEoECFNiDITtSoCsUe
	cassTfrQjC1nELeLrFEXe/QaQryYb7A53bLj/ZdbMvSM+jUEJhV8kkZx1dXV+/thX7rC5wJvaHm
	fWcqBiLavYZVs0R6OGhu3Ux5skleLkVHGvhSqJrj5
X-Received: by 2002:a05:620a:459f:b0:92e:5b63:224e with SMTP id af79cd13be357-92e8b5049abmr1749180085a.22.1783341951029;
        Mon, 06 Jul 2026 05:45:51 -0700 (PDT)
X-Received: by 2002:a05:620a:459f:b0:92e:5b63:224e with SMTP id af79cd13be357-92e8b5049abmr1749171985a.22.1783341950261;
        Mon, 06 Jul 2026 05:45:50 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0a55be4sm22126539f8f.31.2026.07.06.05.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 05:45:49 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 14:44:32 +0200
Subject: [PATCH v3 20/20] driver core: platform: count references to all
 kinds of firmware nodes
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-pdev-fwnode-ref-v3-20-1ff028e33779@oss.qualcomm.com>
References: <20260706-pdev-fwnode-ref-v3-0-1ff028e33779@oss.qualcomm.com>
In-Reply-To: <20260706-pdev-fwnode-ref-v3-0-1ff028e33779@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>,
        Mark Brown <broonie@opensource.wolfsonmicro.com>,
        Thierry Reding <thierry.reding@avionic-design.de>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Doug Berger <opendmb@gmail.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Ulf Hansson <ulfh@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Matthew Brost <matthew.brost@intel.com>,
        =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Peter Chen <peter.chen@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>, Bin Liu <b-liu@ti.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: brgl@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        driver-core@lists.linux.dev, devicetree@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        iommu@lists.linux.dev, linux-pm@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, intel-xe@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org,
        linux-mips@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        mfd@lists.linux.dev,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2537;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=IqF/4dKgB1628r62VJTRc6pv/7HE6yY73nomq/D91IU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqS6M9ruJ8yyUk+I6pdpFWbcAtYm5CgsYvefKU+
 TywqoMuS8KJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakujPQAKCRAFnS7L/zaE
 w0+BD/9zjT3fKJr7/zYP0sHpUApNtRCsyLsJzRKuAlcO+cogBO21GRQk1DGikSTFqOqALVvaQ2g
 83j83HjHg+bMyaUlGN/FEHSMVHmKvXmesanFWRUyj5q/cQcFMH8POK0Xe3edFHZZx4BBkdJLCiU
 YBgV2p9qKU7Yx9ujTc0nbFflTLCPc+KLCa6XMeNIL7NcRgHVvMgBJocHY4ppEVSl3w0N1MqzNLN
 MJ2jEc+08OGTNE6VqBsWKGpcVcsy0c/flgXequGSLwF2lbMvrEVBeckaXblcohUFBgsZTwHIilr
 DuAyyAxwT3CWTsisqCJ/uzziDpBphBHYSMVHgzJR0EvF/dg0gFk2JrYTFDjipwiMhwshuY4pMG6
 brBELDRVNzWmoJxvrqtCNEs2g6/282jmP5bq8VSGXsiFh0Tlh1WMQesFTI3Dru/rc0SNeU4rkul
 wq2awNwyKdDtNJtZDmRz22Vrcbh76dcF1Halbc2omaKC8QdnXDZFTtncn03dXnNqBcF2/RucoRD
 PgoRvdtJOI/EakLR/ayb7hAHHB2aey6mLr7a280QfJRvxTxQ9lcDY4ZxG2oeQyo5EJpmBhQCPl8
 BmnHyLd2X+djvXjF8tGCWMjxCty1aDjcqXp8ApTdwR04CWKI/ZYVFf+bcapravEbsUypfWAAx2W
 0i3DMYG/6NOmHjA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: BODi1I7hKnbBScNcyjd4oZYOdPRdWD9t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfX4/piQkj05AWs
 vt7536KZjwSxR95QVMTQf/JfFYXAuNtAB64lQc20JD9/ooNN3aRr3JOsqRxPndk7Z1G3THGzB22
 EcEIRDJaljVJdr/N/WCcXsodYXMytNZCrqZ9hB8FVo4YfSn4AryfC6Dn88igB5TZagFElWkKhD7
 rFGM1Q9UPP3DFLZfN5/NAF5om0MQLQzQ+sX3pFmyfvsAKnI6EFYZhdlR1dugtc+fk3hisWMfSNY
 OEaxxeoD3XpaPU0VD6D8dMyFpFYNPomuoRtB2m6sacd94AXPs9hcIAeS8ygrL11be2MNDvMala7
 zVGVXaOIjQfpB3V3LM1U/+9BE8RMMhn9LXYsIn/UAIO6reUHSZTvY3VbfQflVoWcCi1codjZ9dl
 Je3LF+gWixHWcrtdfoaOR/KtDfzbFz4n6/Ko33iSe8gv3HWwrkMaEroFbO+NDmxKsq95rpRrDlK
 SZk3PpmRdvHt4dRhmZQ==
X-Proofpoint-ORIG-GUID: BODi1I7hKnbBScNcyjd4oZYOdPRdWD9t
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfX0apoYc/yesv+
 j/ZU7QyoBb1FXr1B6v/+b3U21pyqMfJyPt2affBSLhjalhLRoXE5WcMnmLmAibQ9U3vt9CkgurB
 MeGVO6pUzP0zLaWOBx8hX1dpdFwyhDg=
X-Authority-Analysis: v=2.4 cv=c6Sbhx9l c=1 sm=1 tr=0 ts=6a4ba380 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=2sGp0kyKjRk1obZUzdUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060129
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15537-lists,linux-mips=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:broonie@opensource.wolfsonmicro.com,m:thierry.reding@avionic-design.de,m:sebastian.hesselbarth@gmail.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:srini@kernel.org,m:gregkh@linuxfoundation.org,m:vkoul@kernel.org,m:rafael@kernel.org,m:dakr@kernel.org,m:robh@kernel.org,m:saravanak@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:andi.shyti@kernel.org,m:andriy.shevchenko@linux.intel.com,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:opendmb@gmail.com,m:florian.fainelli@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:ulfh@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:rodrigo.vivi@intel.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:peter.chen@kernel.org,m:paul@crapouillou.net,m:b-liu@ti.com,m:p.zabel
 @pengutronix.de,m:luzmaximilian@gmail.com,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:krzk@kernel.org,m:benh@kernel.crashing.org,m:brgl@kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:driver-core@lists.linux.dev,m:devicetree@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-i2c@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-pm@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:intel-xe@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:linux-usb@vger.kernel.org,m:linux-mips@vger.kernel.org,m:platform-driver-x86@vger.kernel.org,m:mfd@lists.linux.dev,m:bartosz.golaszewski@oss.qualcomm.com,m:sebastianhesselbarth@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,opensource.wolfsonmicro.com,avionic-design.de,gmail.com,lunn.ch,davemloft.net,google.com,redhat.com,linuxfoundation.org,linux.ibm.com,ellerman.id.au,linux.intel.com,8bytes.org,arm.com,broadcom.com,nxp.com,pengutronix.de,intel.com,ffwll.ch,crapouillou.net,ti.com,kernel.crashing.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,pdev.dev:url,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_GT_50(0.00)[67];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 059D27115A0

When using platform_device_register_full(), we currently only increase
the reference count of the OF node associated with a platform device. We
symmetrically decrease it in platform_device_release(). With all users in
tree now converted to using provided platform device helpers for
assigning OF and firmware nodes, we can now switch to counting references
of all kinds of firmware nodes.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/platform.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index 9357942d0c79b032645035879b2bed3d53305b9f..a71015f1d915340aa01ebfae67196d4d7ccecba8 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -599,7 +599,7 @@ static void platform_device_release(struct device *dev)
 	struct platform_object *pa = container_of(dev, struct platform_object,
 						  pdev.dev);
 
-	of_node_put(pa->pdev.dev.of_node);
+	fwnode_handle_put(pa->pdev.dev.fwnode);
 	kfree(pa->pdev.dev.platform_data);
 	kfree(pa->pdev.mfd_cell);
 	kfree(pa->pdev.resource);
@@ -712,9 +712,7 @@ EXPORT_SYMBOL_GPL(platform_device_add_data);
 void platform_device_set_of_node(struct platform_device *pdev,
 				 struct device_node *np)
 {
-	of_node_put(pdev->dev.of_node);
-	pdev->dev.of_node = of_node_get(np);
-	pdev->dev.fwnode = of_fwnode_handle(np);
+	platform_device_set_fwnode(pdev, of_fwnode_handle(np));
 }
 EXPORT_SYMBOL_GPL(platform_device_set_of_node);
 
@@ -730,10 +728,8 @@ EXPORT_SYMBOL_GPL(platform_device_set_of_node);
 void platform_device_set_fwnode(struct platform_device *pdev,
 				struct fwnode_handle *fwnode)
 {
-	if (is_of_node(fwnode))
-		platform_device_set_of_node(pdev, to_of_node(fwnode));
-	else
-		pdev->dev.fwnode = fwnode;
+	fwnode_handle_put(pdev->dev.fwnode);
+	device_set_node(&pdev->dev, fwnode_handle_get(fwnode));
 }
 EXPORT_SYMBOL_GPL(platform_device_set_fwnode);
 
@@ -928,8 +924,7 @@ struct platform_device *platform_device_register_full(const struct platform_devi
 		return ERR_PTR(-ENOMEM);
 
 	pdev->dev.parent = pdevinfo->parent;
-	pdev->dev.fwnode = pdevinfo->fwnode;
-	pdev->dev.of_node = of_node_get(to_of_node(pdev->dev.fwnode));
+	device_set_node(&pdev->dev, fwnode_handle_get(pdevinfo->fwnode));
 	dev_assign_of_node_reused(&pdev->dev, pdevinfo->of_node_reused);
 
 	if (pdevinfo->dma_mask) {

-- 
2.47.3


