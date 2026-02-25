Return-Path: <linux-mips+bounces-13208-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wOt1LljMnmm0XQQAu9opvQ
	(envelope-from <linux-mips+bounces-13208-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 25 Feb 2026 11:18:00 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 35380195A4A
	for <lists+linux-mips@lfdr.de>; Wed, 25 Feb 2026 11:17:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BF9643013471
	for <lists+linux-mips@lfdr.de>; Wed, 25 Feb 2026 10:17:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64F932D0620;
	Wed, 25 Feb 2026 10:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="iZoN3TCO"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1076C39282B
	for <linux-mips@vger.kernel.org>; Wed, 25 Feb 2026 10:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772014678; cv=none; b=jDoiCG8lwUtsHDbjH5X63RLS9OEfbjyFFh+lZf65DvLbPytLLTIyfYLWfy01ZzARE+y4mfHGdSOsIg5YfeR36FtHu7uOY3GGdfktf37BVV6yaUqEQK7lAzUZROd+q+THQJ/mDn+v/FZl7Pws7ZKTJyxLfCZssTQbbO06W3wOlrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772014678; c=relaxed/simple;
	bh=TtcnBccQxi8FOGkE/UaV5tbSNhX6L2OFs8ogHDtdZ24=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cMWYsa9A7k1S2G450tsMmmOnaby9hIC2Q2a9nH1jvO1XoqQAOj2uFQlIYTNnYYdCzS0oOwrx3BliPswLFckywPW1Znhu+3XA253HDU8dAxDevawF5KFRe4H9y6PsXVcJbeWMEGYSyE5IkKgs7YnJnko7mVJ7oGLgdXgmrpQy/y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=iZoN3TCO; arc=none smtp.client-ip=209.85.221.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-43767807cf3so4837993f8f.1
        for <linux-mips@vger.kernel.org>; Wed, 25 Feb 2026 02:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1772014660; x=1772619460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7rE5YdbBvGxTszqA04wcuSEGVi/cTtpmZWmHp1wb9gc=;
        b=iZoN3TCOpGEp9LSsQrqC93yvtzScZvqhdVqlT7MLKzNLPkwfPwIADUxzfWQDIwF5RJ
         B/IzT7KL16dZ1JJFUJjocu73l1MdIO2p43Xe98RfxE0/dv1bEMpFOzbt09FhSGCRr8uM
         xb/J0bXf3QDRCW3TmzRkyN6qdTXohAp3e+u9brIRRdSrJYoDbTUJlVGkMowYDLbU7UF3
         zYG9gi5PjSw0RFAJU0KsBPfsiOPyrziT1zvxWV1HiM1krTX8rxY+1kY5YGrPj6Q3hnUl
         DukcVS/NM3axUGf9eF7+/Ee4+F33kTv1PrkHdoHB3hO8G9MkalnvARqo6P6Zl4OTl7BW
         FR3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772014660; x=1772619460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7rE5YdbBvGxTszqA04wcuSEGVi/cTtpmZWmHp1wb9gc=;
        b=B7EJ8pcgadDeQjHYyWFS7MZUd4S+PPO01c2owUJEgdD2W3edwFw/249EzJKR8ZdiO8
         hqvswTPe2jm2iKCa56qQQ1NLDd+/xC+mHvjTxpGBhKF2pi86XAl9nvubVZ1yl/AnTmNb
         qGQK/ZCHO4PL4oEthDRCkAqZuUfYb8n3hHlY/OX78YIFtmCKGkRgJwU4SHKx5mriuPrQ
         qEWoWXg+VytN2gy7uSrPxweDhqj9Bo0D1lqOYTrhuc2/SCwRHLvYuI5sXF10yvlS6koS
         IoCv3yNQ31wQr7nEaVwU4ONwouHtZgXeo5ziinH9k3MGkwM1pSYHMgVMthP4g5vkS3yH
         qgwQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/AgrfR48djYKuM7m/DQst33XCqXu1L7SIBtdwauBZ2SJQRvKn9IdFbjLD2DSToaN9hBsg9KOOKZ1D@vger.kernel.org
X-Gm-Message-State: AOJu0YwEQAWrEA2LQC1437LiqELB17YpwE4FPH6SugPABFAKu4W3p/SS
	U77mD0M1JCV7z0+W/8QkG1G7QhY9sg5+6H7RvqZuuSoj6rgwRza3Vvldvy09Oc83jjU=
X-Gm-Gg: ATEYQzxdKzpPCBjAw75UGLnv6evDqx4OqC4lsPybbnWxbn0jOoyIIiLTdRRKYiJZGyc
	qBnGD4m4b9IlUjHZ53DYijIEbf3uadaoXDCuMC6gQpKCCznC2uFg+3PD1ttoAKD2yydoNvPxKzB
	nMze+JtRUM7LztigKKPwvbhX5B5E5We7ZHwoFOR15GZvK/NjfksSYgU1fKujEl1enyeDMncMeWj
	pbY/wjXrcz466wcxyTYpD6cK0GtWQYdKa8awqy5c+Hbkx3y2CmJZsi7KVeztE3AmUozUq8oC4Lp
	HOqr4WKxTaz8bMGZhy7iFo/+ex+WX2umLb9IfvP82KaNMSzOkZl7c4XaoWrbanxAHY4RcqFfxrs
	GslY8CXai97sO8Ch0sFd2f+Mz/EqRMFB+7k2qbNDgz+8fGUwjxi6K52DrqhiPVCddIvHGfw==
X-Received: by 2002:a05:6000:144e:b0:436:14d2:540c with SMTP id ffacd0b85a97d-4398faa1d51mr2891333f8f.25.1772014659104;
        Wed, 25 Feb 2026 02:17:39 -0800 (PST)
Received: from localhost ([151.35.220.155])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4398a09aad0sm8451227f8f.2.2026.02.25.02.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 02:17:38 -0800 (PST)
From: Francesco Lavra <flavra@baylibre.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Lucas Stankus <lucas.p.stankus@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Puranjay Mohan <puranjay@kernel.org>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Ramona Gradinariu <ramona.gradinariu@analog.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Petre Rodan <petre.rodan@subdimension.ro>,
	Dan Robertson <dan@dlrobertson.com>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Jiri Kosina <jikos@kernel.org>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Marcelo Schmitt <marcelo.schmitt@analog.com>,
	Esteban Blanc <eblanc@baylibre.com>,
	Jorge Marques <jorge.marques@analog.com>,
	Sergiu Cuciurean <sergiu.cuciurean@analog.com>,
	Dragos Bogdan <dragos.bogdan@analog.com>,
	Alisa-Dariana Roman <alisa.roman@analog.com>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Renato Lui Geh <renatogeh@gmail.com>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andreas Klinger <ak@it-klinger.de>,
	Paul Cercueil <paul@crapouillou.net>,
	Ramona Bolboaca <ramona.bolboaca@analog.com>,
	Marcus Folkesson <marcus.folkesson@gmail.com>,
	Kent Gustavsson <kent@minoris.se>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Matteo Martelli <matteomartelli3@gmail.com>,
	Marius Cristea <marius.cristea@microchip.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Kurt Borja <kuurtb@gmail.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	=?UTF-8?q?Jo=C3=A3o=20Paulo=20Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>,
	=?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Haibo Chen <haibo.chen@nxp.com>,
	Salih Erim <salih.erim@amd.com>,
	"Conall O'Griofa" <conall.ogriofa@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Gustavo Silva <gustavograzs@gmail.com>,
	Tomasz Duszynski <tduszyns@gmail.com>,
	Roan van Dijk <roan@protonic.nl>,
	Jyoti Bhayana <jbhayana@google.com>,
	Mariel Tinaco <Mariel.Tinaco@analog.com>,
	Nishant Malpani <nish.malpani25@gmail.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Alex Lanzano <lanzano.alex@gmail.com>,
	Jagath Jog J <jagathjog1996@gmail.com>,
	Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
	Remi Buisson <remi.buisson@tdk.com>,
	Christian Eggers <ceggers@arri.de>,
	Mudit Sharma <muditsharma.info@gmail.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	=?UTF-8?q?Ond=C5=99ej=20Jirman?= <megi@xff.cz>,
	Song Qiang <songqiang1304521@gmail.com>,
	Dixit Parmar <dixitparmar19@gmail.com>,
	Gerald Loacker <gerald.loacker@wolfvision.net>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	imx@lists.linux.dev,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v6 4/7] iio: Rename 'sign' field to `format` in struct iio_scan_type
Date: Wed, 25 Feb 2026 11:17:21 +0100
Message-Id: <20260225101735.2368252-1-flavra@baylibre.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260225100421.2366864-1-flavra@baylibre.com>
References: <20260225100421.2366864-1-flavra@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=214419; i=flavra@baylibre.com; h=from:subject; bh=TtcnBccQxi8FOGkE/UaV5tbSNhX6L2OFs8ogHDtdZ24=; b=owEB7QES/pANAwAKAe3xO3POlDZfAcsmYgBpnswx+Er+XYg2jxlvd6ja+3QiPAIA52FOqfKVw jZY+Bazii+JAbMEAAEKAB0WIQSGV4VPlTvcox7DFObt8TtzzpQ2XwUCaZ7MMQAKCRDt8TtzzpQ2 X882C/4gJh7kNFJbj89Jk5TSORQRke/vSNjwgJoK10K34csT2zmon6a2A7fL/unLJ+rGoPC3Ybd emgqXc2FT2MH1iYJd/x0MQJazkoPCNINnNxsNDe6Y3WKVuS4g0hxvyBJwnLP2mjo5LsuEQjeHe9 89aP5xcXLSRO6GlelXUU4NRXPs4j/F1DTek3yjpIRHMEGgL5prf+3IiQ+7/dVH63jyfvf8/dsFF kquy2G26No/QmXRSHAZ9rlO0+aYcDbwj7N26dFuyHlp1E3tLLjM5oyFacgU4qRlaEcfhgYCHRow ZB5hA/f0ekwHrmK97OB50KSKMlwKbA1gSlAgglvNgD+EueH6s0H0/aRt9bcZiIszxpdXmEWGX81 r2gmT8h0FT+EfkMvPchEFNx4QIgTv4Vjil/hF/wZ0/fdsMMLhtZ+sASq7ThdWYIBtzILDaoR6E8 3mvEe6aPKynYHa5tcpsERnFFOFswTUgVzVlPBrOww2WBQ5cahfvYUCzbQ/LbYu36qW1KU=
X-Developer-Key: i=flavra@baylibre.com; a=openpgp; fpr=8657854F953BDCA31EC314E6EDF13B73CE94365F
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20230601.gappssmtp.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-13208-lists,linux-mips=lfdr.de];
	DMARC_NA(0.00)[baylibre.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[lwn.net,linuxfoundation.org,metafoo.de,analog.com,gmail.com,kernel.org,baylibre.com,subdimension.ro,dlrobertson.com,chromium.org,linux.intel.com,linaro.org,microchip.com,bootlin.com,tuxon.dev,it-klinger.de,crapouillou.net,minoris.se,collabora.com,nxp.com,pengutronix.de,sntech.de,foss.st.com,dolcini.it,amd.com,protonic.nl,google.com,tdk.com,arri.de,xff.cz,wolfvision.net,vger.kernel.org,lists.linux.dev,lists.infradead.org,st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[flavra@baylibre.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_GT_50(0.00)[88];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,baylibre-com.20230601.gappssmtp.com:dkim,baylibre.com:mid,baylibre.com:email]
X-Rspamd-Queue-Id: 35380195A4A
X-Rspamd-Action: no action

This field is used to differentiate between signed and unsigned integers.
A following commit will extend its use to in order to add support for non-
integer scan elements; therefore, change its name from 'sign' to a more
generic 'format'.

Signed-off-by: Francesco Lavra <flavra@baylibre.com>
---
 Documentation/driver-api/iio/buffers.rst      |  4 +-
 drivers/iio/accel/adxl313_core.c              |  2 +-
 drivers/iio/accel/adxl345_core.c              |  2 +-
 drivers/iio/accel/adxl355_core.c              |  4 +-
 drivers/iio/accel/adxl367.c                   |  4 +-
 drivers/iio/accel/adxl372.c                   |  2 +-
 drivers/iio/accel/adxl380.c                   |  4 +-
 drivers/iio/accel/bma180.c                    | 10 ++---
 drivers/iio/accel/bma220_core.c               |  2 +-
 drivers/iio/accel/bma400_core.c               |  4 +-
 drivers/iio/accel/bmc150-accel-core.c         |  2 +-
 drivers/iio/accel/cros_ec_accel_legacy.c      |  2 +-
 drivers/iio/accel/fxls8962af-core.c           |  4 +-
 drivers/iio/accel/hid-sensor-accel-3d.c       |  2 +-
 drivers/iio/accel/kionix-kx022a.c             |  2 +-
 drivers/iio/accel/kxcjk-1013.c                |  2 +-
 drivers/iio/accel/kxsd9.c                     |  4 +-
 drivers/iio/accel/mma7455_core.c              |  2 +-
 drivers/iio/accel/mma8452.c                   |  4 +-
 drivers/iio/accel/msa311.c                    |  2 +-
 drivers/iio/accel/mxc4005.c                   |  2 +-
 drivers/iio/accel/sca3000.c                   |  4 +-
 drivers/iio/accel/sca3300.c                   |  6 +--
 drivers/iio/accel/stk8312.c                   |  2 +-
 drivers/iio/accel/stk8ba50.c                  |  2 +-
 drivers/iio/adc/ad4000.c                      |  8 ++--
 drivers/iio/adc/ad4030.c                      | 10 ++---
 drivers/iio/adc/ad4062.c                      |  8 ++--
 drivers/iio/adc/ad4080.c                      |  2 +-
 drivers/iio/adc/ad4130.c                      |  2 +-
 drivers/iio/adc/ad4170-4.c                    | 12 ++---
 drivers/iio/adc/ad4695.c                      | 24 +++++-----
 drivers/iio/adc/ad4851.c                      | 12 ++---
 drivers/iio/adc/ad7124.c                      |  4 +-
 drivers/iio/adc/ad7173.c                      |  6 +--
 drivers/iio/adc/ad7191.c                      |  6 +--
 drivers/iio/adc/ad7192.c                      |  2 +-
 drivers/iio/adc/ad7266.c                      |  6 +--
 drivers/iio/adc/ad7280a.c                     |  4 +-
 drivers/iio/adc/ad7298.c                      |  4 +-
 drivers/iio/adc/ad7380.c                      | 44 +++++++++----------
 drivers/iio/adc/ad7405.c                      |  2 +-
 drivers/iio/adc/ad7476.c                      |  2 +-
 drivers/iio/adc/ad7606.c                      | 14 +++---
 drivers/iio/adc/ad7625.c                      |  2 +-
 drivers/iio/adc/ad7766.c                      |  2 +-
 drivers/iio/adc/ad7768-1.c                    |  8 ++--
 drivers/iio/adc/ad7779.c                      |  2 +-
 drivers/iio/adc/ad7780.c                      |  2 +-
 drivers/iio/adc/ad7791.c                      |  2 +-
 drivers/iio/adc/ad7793.c                      |  2 +-
 drivers/iio/adc/ad7887.c                      |  2 +-
 drivers/iio/adc/ad7923.c                      |  2 +-
 drivers/iio/adc/ad7944.c                      |  8 ++--
 drivers/iio/adc/ad799x.c                      |  2 +-
 drivers/iio/adc/ad9467.c                      |  4 +-
 drivers/iio/adc/ade9000.c                     |  4 +-
 drivers/iio/adc/at91-sama5d2_adc.c            | 10 ++---
 drivers/iio/adc/at91_adc.c                    |  4 +-
 drivers/iio/adc/cc10001_adc.c                 |  4 +-
 drivers/iio/adc/cpcap-adc.c                   |  2 +-
 drivers/iio/adc/dln2-adc.c                    |  4 +-
 drivers/iio/adc/hx711.c                       |  4 +-
 drivers/iio/adc/ina2xx-adc.c                  |  8 ++--
 drivers/iio/adc/ingenic-adc.c                 | 12 ++---
 drivers/iio/adc/max1027.c                     |  4 +-
 drivers/iio/adc/max1118.c                     |  2 +-
 drivers/iio/adc/max11205.c                    |  2 +-
 drivers/iio/adc/max11410.c                    |  2 +-
 drivers/iio/adc/max1363.c                     |  4 +-
 drivers/iio/adc/mcp3911.c                     |  2 +-
 drivers/iio/adc/mt6359-auxadc.c               |  2 +-
 drivers/iio/adc/mt6360-adc.c                  |  2 +-
 drivers/iio/adc/mxs-lradc-adc.c               |  6 +--
 drivers/iio/adc/nxp-sar-adc.c                 |  2 +-
 drivers/iio/adc/pac1921.c                     |  8 ++--
 drivers/iio/adc/pac1934.c                     | 32 +++++++-------
 drivers/iio/adc/rockchip_saradc.c             |  2 +-
 drivers/iio/adc/rtq6056.c                     | 16 +++----
 drivers/iio/adc/sd_adc_modulator.c            |  2 +-
 drivers/iio/adc/stm32-adc.c                   |  4 +-
 drivers/iio/adc/stm32-dfsdm-adc.c             |  2 +-
 drivers/iio/adc/ti-adc081c.c                  |  2 +-
 drivers/iio/adc/ti-adc0832.c                  |  4 +-
 drivers/iio/adc/ti-adc084s021.c               |  2 +-
 drivers/iio/adc/ti-adc108s102.c               |  2 +-
 drivers/iio/adc/ti-adc12138.c                 |  4 +-
 drivers/iio/adc/ti-adc161s626.c               |  4 +-
 drivers/iio/adc/ti-ads1015.c                  |  4 +-
 drivers/iio/adc/ti-ads1018.c                  |  6 +--
 drivers/iio/adc/ti-ads1100.c                  |  2 +-
 drivers/iio/adc/ti-ads1119.c                  |  2 +-
 drivers/iio/adc/ti-ads124s08.c                |  2 +-
 drivers/iio/adc/ti-ads1298.c                  |  2 +-
 drivers/iio/adc/ti-ads131e08.c                |  2 +-
 drivers/iio/adc/ti-ads7950.c                  |  2 +-
 drivers/iio/adc/ti-ads8688.c                  |  2 +-
 drivers/iio/adc/ti-lmp92064.c                 |  4 +-
 drivers/iio/adc/ti-tlc4541.c                  |  2 +-
 drivers/iio/adc/ti-tsc2046.c                  |  2 +-
 drivers/iio/adc/ti_am335x_adc.c               |  2 +-
 drivers/iio/adc/vf610_adc.c                   |  4 +-
 drivers/iio/adc/xilinx-ams.c                  |  2 +-
 drivers/iio/adc/xilinx-xadc-core.c            | 10 ++---
 drivers/iio/addac/ad74115.c                   |  2 +-
 drivers/iio/addac/ad74413r.c                  |  2 +-
 drivers/iio/chemical/atlas-ezo-sensor.c       |  4 +-
 drivers/iio/chemical/atlas-sensor.c           | 12 ++---
 drivers/iio/chemical/bme680_core.c            |  8 ++--
 drivers/iio/chemical/ccs811.c                 |  4 +-
 drivers/iio/chemical/ens160_core.c            |  4 +-
 drivers/iio/chemical/pms7003.c                |  2 +-
 drivers/iio/chemical/scd30_core.c             |  2 +-
 drivers/iio/chemical/scd4x.c                  |  6 +--
 drivers/iio/chemical/sps30.c                  |  2 +-
 .../common/cros_ec_sensors/cros_ec_activity.c |  2 +-
 .../cros_ec_sensors/cros_ec_lid_angle.c       |  2 +-
 .../common/cros_ec_sensors/cros_ec_sensors.c  |  4 +-
 drivers/iio/common/scmi_sensors/scmi_iio.c    |  4 +-
 .../iio/common/ssp_sensors/ssp_iio_sensor.h   |  4 +-
 drivers/iio/dac/ad3552r-hs.c                  |  2 +-
 drivers/iio/dac/ad3552r.c                     |  2 +-
 drivers/iio/dac/ad5064.c                      |  2 +-
 drivers/iio/dac/ad5360.c                      |  2 +-
 drivers/iio/dac/ad5380.c                      |  2 +-
 drivers/iio/dac/ad5421.c                      |  2 +-
 drivers/iio/dac/ad5446.h                      |  2 +-
 drivers/iio/dac/ad5449.c                      |  2 +-
 drivers/iio/dac/ad5504.c                      |  2 +-
 drivers/iio/dac/ad5592r-base.c                |  2 +-
 drivers/iio/dac/ad5624r_spi.c                 |  2 +-
 drivers/iio/dac/ad5686.c                      |  2 +-
 drivers/iio/dac/ad5755.c                      |  2 +-
 drivers/iio/dac/ad5761.c                      |  2 +-
 drivers/iio/dac/ad5764.c                      |  2 +-
 drivers/iio/dac/ad5766.c                      |  2 +-
 drivers/iio/dac/ad5791.c                      |  4 +-
 drivers/iio/dac/ad7303.c                      |  2 +-
 drivers/iio/dac/ad8460.c                      |  2 +-
 drivers/iio/dac/ad9739a.c                     |  2 +-
 drivers/iio/dac/ltc1660.c                     |  2 +-
 drivers/iio/dac/max5522.c                     |  2 +-
 drivers/iio/dac/mcp4922.c                     |  2 +-
 drivers/iio/dac/stm32-dac.c                   |  2 +-
 drivers/iio/dummy/iio_simple_dummy.c          |  8 ++--
 drivers/iio/gyro/adis16136.c                  |  4 +-
 drivers/iio/gyro/adxrs290.c                   |  4 +-
 drivers/iio/gyro/bmg160_core.c                |  2 +-
 drivers/iio/gyro/fxas21002c_core.c            |  2 +-
 drivers/iio/gyro/hid-sensor-gyro-3d.c         |  2 +-
 drivers/iio/gyro/itg3200_core.c               |  2 +-
 drivers/iio/gyro/mpu3050-core.c               |  4 +-
 drivers/iio/health/afe440x.h                  |  2 +-
 drivers/iio/health/max30100.c                 |  4 +-
 drivers/iio/health/max30102.c                 |  2 +-
 drivers/iio/humidity/am2315.c                 |  4 +-
 drivers/iio/humidity/hdc100x.c                |  4 +-
 drivers/iio/humidity/hid-sensor-humidity.c    |  2 +-
 drivers/iio/humidity/hts221_core.c            |  4 +-
 drivers/iio/imu/adis.c                        |  2 +-
 drivers/iio/imu/adis16400.c                   | 16 +++----
 drivers/iio/imu/adis16460.c                   |  4 +-
 drivers/iio/imu/adis16475.c                   |  6 +--
 drivers/iio/imu/adis16480.c                   |  6 +--
 drivers/iio/imu/adis16550.c                   |  6 +--
 drivers/iio/imu/bmi160/bmi160_core.c          |  2 +-
 drivers/iio/imu/bmi270/bmi270_core.c          |  4 +-
 drivers/iio/imu/bmi323/bmi323_core.c          |  4 +-
 drivers/iio/imu/bno055/bno055.c               |  2 +-
 .../iio/imu/inv_icm42600/inv_icm42600_accel.c |  2 +-
 .../iio/imu/inv_icm42600/inv_icm42600_gyro.c  |  2 +-
 .../iio/imu/inv_icm42600/inv_icm42600_temp.h  |  2 +-
 drivers/iio/imu/inv_icm45600/inv_icm45600.h   |  2 +-
 .../iio/imu/inv_icm45600/inv_icm45600_accel.c |  2 +-
 .../iio/imu/inv_icm45600/inv_icm45600_gyro.c  |  2 +-
 drivers/iio/imu/inv_mpu6050/inv_mpu_core.c    |  6 +--
 drivers/iio/imu/kmx61.c                       |  4 +-
 drivers/iio/imu/smi240.c                      |  4 +-
 drivers/iio/imu/smi330/smi330_core.c          |  6 +--
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx.h       |  4 +-
 drivers/iio/industrialio-buffer.c             |  4 +-
 drivers/iio/light/acpi-als.c                  |  2 +-
 drivers/iio/light/adjd_s311.c                 |  2 +-
 drivers/iio/light/apds9960.c                  |  2 +-
 drivers/iio/light/as73211.c                   |  6 +--
 drivers/iio/light/bh1745.c                    |  2 +-
 drivers/iio/light/cros_ec_light_prox.c        |  4 +-
 drivers/iio/light/gp2ap020a00f.c              |  6 +--
 drivers/iio/light/hid-sensor-als.c            |  2 +-
 drivers/iio/light/hid-sensor-prox.c           |  2 +-
 drivers/iio/light/isl29125.c                  |  2 +-
 drivers/iio/light/ltr501.c                    |  4 +-
 drivers/iio/light/max44000.c                  |  4 +-
 drivers/iio/light/opt4060.c                   |  4 +-
 drivers/iio/light/rohm-bu27034.c              |  4 +-
 drivers/iio/light/rpr0521.c                   |  6 +--
 drivers/iio/light/si1145.c                    |  2 +-
 drivers/iio/light/st_uvis25_core.c            |  2 +-
 drivers/iio/light/tcs3414.c                   |  2 +-
 drivers/iio/light/tcs3472.c                   |  2 +-
 drivers/iio/light/vcnl4000.c                  |  2 +-
 drivers/iio/light/vcnl4035.c                  |  4 +-
 drivers/iio/light/veml6030.c                  |  8 ++--
 drivers/iio/light/veml6046x00.c               |  8 ++--
 drivers/iio/light/vl6180.c                    |  6 +--
 drivers/iio/magnetometer/af8133j.c            |  2 +-
 drivers/iio/magnetometer/ak8974.c             |  2 +-
 drivers/iio/magnetometer/ak8975.c             |  2 +-
 drivers/iio/magnetometer/als31300.c           |  4 +-
 drivers/iio/magnetometer/bmc150_magn.c        |  2 +-
 drivers/iio/magnetometer/hid-sensor-magn-3d.c |  2 +-
 drivers/iio/magnetometer/hmc5843_core.c       |  4 +-
 drivers/iio/magnetometer/mag3110.c            |  4 +-
 drivers/iio/magnetometer/rm3100-core.c        |  2 +-
 drivers/iio/magnetometer/tlv493d.c            |  4 +-
 drivers/iio/magnetometer/tmag5273.c           |  8 ++--
 drivers/iio/magnetometer/yamaha-yas530.c      |  4 +-
 drivers/iio/orientation/hid-sensor-incl-3d.c  |  2 +-
 drivers/iio/orientation/hid-sensor-rotation.c |  2 +-
 .../position/hid-sensor-custom-intel-hinge.c  |  6 +--
 drivers/iio/potentiostat/lmp91000.c           |  2 +-
 drivers/iio/pressure/abp2030pa.c              |  4 +-
 drivers/iio/pressure/bmp280-core.c            | 18 ++++----
 drivers/iio/pressure/cros_ec_baro.c           |  4 +-
 drivers/iio/pressure/dlhl60d.c                |  4 +-
 drivers/iio/pressure/hid-sensor-press.c       |  2 +-
 drivers/iio/pressure/hsc030pa.c               |  4 +-
 drivers/iio/pressure/mpl3115.c                |  4 +-
 drivers/iio/pressure/mprls0025pa.c            |  2 +-
 drivers/iio/pressure/ms5611_core.c            |  4 +-
 drivers/iio/pressure/rohm-bm1390.c            |  4 +-
 drivers/iio/pressure/st_pressure_core.c       | 12 ++---
 drivers/iio/pressure/zpa2326.c                |  4 +-
 drivers/iio/proximity/as3935.c                |  2 +-
 drivers/iio/proximity/hx9023s.c               |  2 +-
 drivers/iio/proximity/irsd200.c               |  2 +-
 drivers/iio/proximity/isl29501.c              |  2 +-
 drivers/iio/proximity/mb1232.c                |  2 +-
 .../iio/proximity/pulsedlight-lidar-lite-v2.c |  2 +-
 drivers/iio/proximity/srf08.c                 |  2 +-
 drivers/iio/proximity/sx9310.c                |  2 +-
 drivers/iio/proximity/sx9324.c                |  2 +-
 drivers/iio/proximity/sx9360.c                |  4 +-
 drivers/iio/proximity/sx9500.c                |  2 +-
 drivers/iio/proximity/vl53l0x-i2c.c           |  2 +-
 drivers/iio/resolver/ad2s1210.c               |  4 +-
 .../iio/temperature/hid-sensor-temperature.c  |  2 +-
 drivers/iio/temperature/maxim_thermocouple.c  |  6 +--
 drivers/iio/temperature/tmp006.c              |  4 +-
 include/linux/iio/common/st_sensors.h         |  2 +-
 include/linux/iio/iio.h                       |  6 +--
 include/linux/iio/imu/adis.h                  |  6 +--
 252 files changed, 511 insertions(+), 511 deletions(-)

diff --git a/Documentation/driver-api/iio/buffers.rst b/Documentation/driver-api/iio/buffers.rst
index 63f364e862d1..00398472ce59 100644
--- a/Documentation/driver-api/iio/buffers.rst
+++ b/Documentation/driver-api/iio/buffers.rst
@@ -78,7 +78,7 @@ fields in iio_chan_spec definition::
    /* other members */
            int scan_index
            struct {
-                   char sign;
+                   char format;
                    u8 realbits;
                    u8 storagebits;
                    u8 shift;
@@ -98,7 +98,7 @@ following channel definition::
 		   /* other stuff here */
 		   .scan_index = 0,
 		   .scan_type = {
-		           .sign = 's',
+			   .format = 's',
 			   .realbits = 12,
 			   .storagebits = 16,
 			   .shift = 4,
diff --git a/drivers/iio/accel/adxl313_core.c b/drivers/iio/accel/adxl313_core.c
index 9f5d4d2cb325..f80e6dbb445c 100644
--- a/drivers/iio/accel/adxl313_core.c
+++ b/drivers/iio/accel/adxl313_core.c
@@ -259,7 +259,7 @@ static const int adxl313_odr_freqs[][2] = {
 	.info_mask_shared_by_type_available =				\
 		BIT(IIO_CHAN_INFO_SAMP_FREQ),				\
 	.scan_type = {							\
-		.sign = 's',						\
+		.format = 's',						\
 		.realbits = 13,						\
 		.storagebits = 16,					\
 		.endianness = IIO_BE,					\
diff --git a/drivers/iio/accel/adxl345_core.c b/drivers/iio/accel/adxl345_core.c
index 78e3f799ecc1..d98dfd357b2a 100644
--- a/drivers/iio/accel/adxl345_core.c
+++ b/drivers/iio/accel/adxl345_core.c
@@ -254,7 +254,7 @@ static const struct iio_event_spec adxl345_events[] = {
 		BIT(IIO_CHAN_INFO_SAMP_FREQ),		\
 	.scan_index = (index),				\
 	.scan_type = {					\
-		.sign = 's',				\
+		.format = 's',				\
 		.realbits = 13,				\
 		.storagebits = 16,			\
 		.endianness = IIO_LE,			\
diff --git a/drivers/iio/accel/adxl355_core.c b/drivers/iio/accel/adxl355_core.c
index 1c1d64d5cbcb..00b0ec7f3e8f 100644
--- a/drivers/iio/accel/adxl355_core.c
+++ b/drivers/iio/accel/adxl355_core.c
@@ -725,7 +725,7 @@ static irqreturn_t adxl355_trigger_handler(int irq, void *p)
 		BIT(IIO_CHAN_INFO_HIGH_PASS_FILTER_3DB_FREQUENCY),	\
 	.scan_index = index,						\
 	.scan_type = {							\
-		.sign = 's',						\
+		.format = 's',						\
 		.realbits = 20,						\
 		.storagebits = 32,					\
 		.shift = 4,						\
@@ -745,7 +745,7 @@ static const struct iio_chan_spec adxl355_channels[] = {
 				      BIT(IIO_CHAN_INFO_OFFSET),
 		.scan_index = 3,
 		.scan_type = {
-			.sign = 's',
+			.format = 's',
 			.realbits = 12,
 			.storagebits = 16,
 			.endianness = IIO_BE,
diff --git a/drivers/iio/accel/adxl367.c b/drivers/iio/accel/adxl367.c
index 0c04b2bb7efb..df4bb72dae68 100644
--- a/drivers/iio/accel/adxl367.c
+++ b/drivers/iio/accel/adxl367.c
@@ -1344,7 +1344,7 @@ static const struct iio_event_spec adxl367_events[] = {
 	.num_event_specs = ARRAY_SIZE(adxl367_events),			\
 	.scan_index = (index),						\
 	.scan_type = {							\
-		.sign = 's',						\
+		.format = 's',						\
 		.realbits = 14,						\
 		.storagebits = 16,					\
 		.endianness = IIO_BE,					\
@@ -1360,7 +1360,7 @@ static const struct iio_event_spec adxl367_events[] = {
 	.info_mask_shared_by_all = BIT(IIO_CHAN_INFO_SAMP_FREQ),	\
 	.scan_index = (index),						\
 	.scan_type = {							\
-		.sign = 's',						\
+		.format = 's',						\
 		.realbits = 14,						\
 		.storagebits = 16,					\
 		.endianness = IIO_BE,					\
diff --git a/drivers/iio/accel/adxl372.c b/drivers/iio/accel/adxl372.c
index 28a8793a53b6..2d04fecb1508 100644
--- a/drivers/iio/accel/adxl372.c
+++ b/drivers/iio/accel/adxl372.c
@@ -262,7 +262,7 @@ static const struct iio_event_spec adxl372_events[] = {
 		BIT(IIO_CHAN_INFO_LOW_PASS_FILTER_3DB_FREQUENCY),	\
 	.scan_index = index,						\
 	.scan_type = {							\
-		.sign = 's',						\
+		.format = 's',						\
 		.realbits = 12,						\
 		.storagebits = 16,					\
 		.shift = 4,						\
diff --git a/drivers/iio/accel/adxl380.c b/drivers/iio/accel/adxl380.c
index 8fab2fdbe147..4a648ea3f7bc 100644
--- a/drivers/iio/accel/adxl380.c
+++ b/drivers/iio/accel/adxl380.c
@@ -1789,7 +1789,7 @@ static const struct iio_event_spec adxl380_events[] = {
 		BIT(IIO_CHAN_INFO_HIGH_PASS_FILTER_3DB_FREQUENCY),	\
 	.scan_index = index,						\
 	.scan_type = {							\
-		.sign = 's',						\
+		.format = 's',						\
 		.realbits = 16,						\
 		.storagebits = 16,					\
 		.endianness = IIO_BE,					\
@@ -1810,7 +1810,7 @@ static const struct iio_chan_spec adxl380_channels[] = {
 				      BIT(IIO_CHAN_INFO_OFFSET),
 		.scan_index = 3,
 		.scan_type = {
-			.sign = 's',
+			.format = 's',
 			.realbits = 12,
 			.storagebits = 16,
 			.shift = 4,
diff --git a/drivers/iio/accel/bma180.c b/drivers/iio/accel/bma180.c
index 7bc6761f5135..47244a70799b 100644
--- a/drivers/iio/accel/bma180.c
+++ b/drivers/iio/accel/bma180.c
@@ -541,7 +541,7 @@ static int bma180_read_raw(struct iio_dev *indio_dev,
 		iio_device_release_direct(indio_dev);
 		if (ret < 0)
 			return ret;
-		if (chan->scan_type.sign == 's') {
+		if (chan->scan_type.format == 's') {
 			*val = sign_extend32(ret >> chan->scan_type.shift,
 				chan->scan_type.realbits - 1);
 		} else {
@@ -663,7 +663,7 @@ static const struct iio_chan_spec_ext_info bma180_ext_info[] = {
 		BIT(IIO_CHAN_INFO_LOW_PASS_FILTER_3DB_FREQUENCY),	\
 	.scan_index = AXIS_##_axis,					\
 	.scan_type = {							\
-		.sign = 's',						\
+		.format = 's',						\
 		.realbits = _bits,					\
 		.storagebits = 16,					\
 		.shift = 16 - _bits,					\
@@ -677,7 +677,7 @@ static const struct iio_chan_spec_ext_info bma180_ext_info[] = {
 		BIT(IIO_CHAN_INFO_SCALE) | BIT(IIO_CHAN_INFO_OFFSET),	\
 	.scan_index = TEMP,						\
 	.scan_type = {							\
-		.sign = 'u',						\
+		.format = 'u',						\
 		.realbits = 8,						\
 		.storagebits = 16,					\
 	},								\
@@ -692,7 +692,7 @@ static const struct iio_chan_spec_ext_info bma180_ext_info[] = {
 		BIT(IIO_CHAN_INFO_LOW_PASS_FILTER_3DB_FREQUENCY),	\
 	.scan_index = AXIS_##_axis,					\
 	.scan_type = {							\
-		.sign = 's',						\
+		.format = 's',						\
 		.realbits = _bits,					\
 		.storagebits = 16,					\
 		.shift = 16 - _bits,					\
@@ -706,7 +706,7 @@ static const struct iio_chan_spec_ext_info bma180_ext_info[] = {
 		BIT(IIO_CHAN_INFO_SCALE) | BIT(IIO_CHAN_INFO_OFFSET),	\
 	.scan_index = TEMP,						\
 	.scan_type = {							\
-		.sign = 's',						\
+		.format = 's',						\
 		.realbits = 8,						\
 		.storagebits = 16,					\
 	},								\
diff --git a/drivers/iio/accel/bma220_core.c b/drivers/iio/accel/bma220_core.c
index f32d875b994e..e4a9b33d1e1c 100644
--- a/drivers/iio/accel/bma220_core.c
+++ b/drivers/iio/accel/bma220_core.c
@@ -107,7 +107,7 @@
 	    BIT(IIO_CHAN_INFO_LOW_PASS_FILTER_3DB_FREQUENCY),		\
 	.scan_index = index,						\
 	.scan_type = {							\
-		.sign = 's',						\
+		.format = 's',						\
 		.realbits = 6,						\
 		.storagebits = 8,					\
 		.shift = 2,						\
diff --git a/drivers/iio/accel/bma400_core.c b/drivers/iio/accel/bma400_core.c
index 05f72707f830..05c17e8ea077 100644
--- a/drivers/iio/accel/bma400_core.c
+++ b/drivers/iio/accel/bma400_core.c
@@ -399,7 +399,7 @@ static const struct attribute_group bma400_event_attribute_group = {
 	.ext_info = bma400_ext_info, \
 	.scan_index = _index,	\
 	.scan_type = {		\
-		.sign = 's',	\
+		.format = 's',		\
 		.realbits = 12,		\
 		.storagebits = 16,	\
 		.endianness = IIO_LE,	\
@@ -428,7 +428,7 @@ static const struct iio_chan_spec bma400_channels[] = {
 		.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SAMP_FREQ),
 		.scan_index = 3,
 		.scan_type = {
-			.sign = 's',
+			.format = 's',
 			.realbits = 8,
 			.storagebits = 8,
 			.endianness = IIO_LE,
diff --git a/drivers/iio/accel/bmc150-accel-core.c b/drivers/iio/accel/bmc150-accel-core.c
index 42ccf0316ce5..9712a35929c1 100644
--- a/drivers/iio/accel/bmc150-accel-core.c
+++ b/drivers/iio/accel/bmc150-accel-core.c
@@ -1059,7 +1059,7 @@ static const struct iio_event_spec bmc150_accel_event = {
 				BIT(IIO_CHAN_INFO_SAMP_FREQ),		\
 	.scan_index = AXIS_##_axis,					\
 	.scan_type = {							\
-		.sign = 's',						\
+		.format = 's',						\
 		.realbits = (bits),					\
 		.storagebits = 16,					\
 		.shift = 16 - (bits),					\
diff --git a/drivers/iio/accel/cros_ec_accel_legacy.c b/drivers/iio/accel/cros_ec_accel_legacy.c
index f7e4dc02b34d..82e361e12b3d 100644
--- a/drivers/iio/accel/cros_ec_accel_legacy.c
+++ b/drivers/iio/accel/cros_ec_accel_legacy.c
@@ -189,7 +189,7 @@ static const struct iio_info cros_ec_accel_legacy_info = {
 			BIT(IIO_CHAN_INFO_SAMP_FREQ),			\
 		.ext_info = cros_ec_sensors_ext_info,			\
 		.scan_type = {						\
-			.sign = 's',					\
+			.format = 's',					\
 			.realbits = CROS_EC_SENSOR_BITS,		\
 			.storagebits = CROS_EC_SENSOR_BITS,		\
 		},							\
diff --git a/drivers/iio/accel/fxls8962af-core.c b/drivers/iio/accel/fxls8962af-core.c
index 8763e91c63d2..778e9a927ea4 100644
--- a/drivers/iio/accel/fxls8962af-core.c
+++ b/drivers/iio/accel/fxls8962af-core.c
@@ -731,7 +731,7 @@ static const struct iio_event_spec fxls8962af_event[] = {
 					      BIT(IIO_CHAN_INFO_SAMP_FREQ), \
 	.scan_index = idx, \
 	.scan_type = { \
-		.sign = 's', \
+		.format = 's', \
 		.realbits = 12, \
 		.storagebits = 16, \
 		.endianness = IIO_LE, \
@@ -748,7 +748,7 @@ static const struct iio_event_spec fxls8962af_event[] = {
 			      BIT(IIO_CHAN_INFO_OFFSET),\
 	.scan_index = -1, \
 	.scan_type = { \
-		.sign = 's', \
+		.format = 's', \
 		.realbits = 8, \
 		.storagebits = 8, \
 	}, \
diff --git a/drivers/iio/accel/hid-sensor-accel-3d.c b/drivers/iio/accel/hid-sensor-accel-3d.c
index 2ff591b3458f..e0a7f7ca72b0 100644
--- a/drivers/iio/accel/hid-sensor-accel-3d.c
+++ b/drivers/iio/accel/hid-sensor-accel-3d.c
@@ -123,7 +123,7 @@ static const struct iio_chan_spec gravity_channels[] = {
 static void accel_3d_adjust_channel_bit_mask(struct iio_chan_spec *channels,
 						int channel, int size)
 {
-	channels[channel].scan_type.sign = 's';
+	channels[channel].scan_type.format = 's';
 	/* Real storage bits will change based on the report desc. */
 	channels[channel].scan_type.realbits = size * 8;
 	/* Maximum size of a sample to capture is u32 */
diff --git a/drivers/iio/accel/kionix-kx022a.c b/drivers/iio/accel/kionix-kx022a.c
index 39485572a76b..7ab15251b416 100644
--- a/drivers/iio/accel/kionix-kx022a.c
+++ b/drivers/iio/accel/kionix-kx022a.c
@@ -348,7 +348,7 @@ static const struct iio_chan_spec_ext_info kx022a_ext_info[] = {
 	.address = reg,						\
 	.scan_index = index,					\
 	.scan_type = {                                          \
-		.sign = 's',					\
+		.format = 's',					\
 		.realbits = 16,					\
 		.storagebits = 16,				\
 		.endianness = IIO_LE,				\
diff --git a/drivers/iio/accel/kxcjk-1013.c b/drivers/iio/accel/kxcjk-1013.c
index 2823ddde4bf2..71bf203d7666 100644
--- a/drivers/iio/accel/kxcjk-1013.c
+++ b/drivers/iio/accel/kxcjk-1013.c
@@ -1147,7 +1147,7 @@ static const struct iio_chan_spec_ext_info kxcjk1013_ext_info[] = {
 				BIT(IIO_CHAN_INFO_SAMP_FREQ),		\
 	.scan_index = AXIS_##_axis,					\
 	.scan_type = {							\
-		.sign = 's',						\
+		.format = 's',						\
 		.realbits = 12,						\
 		.storagebits = 16,					\
 		.shift = 4,						\
diff --git a/drivers/iio/accel/kxsd9.c b/drivers/iio/accel/kxsd9.c
index 4717d80fc24a..36a91cf776ea 100644
--- a/drivers/iio/accel/kxsd9.c
+++ b/drivers/iio/accel/kxsd9.c
@@ -284,7 +284,7 @@ static const struct iio_chan_spec_ext_info kxsd9_ext_info[] = {
 		.address = KXSD9_REG_##axis,				\
 		.scan_index = index,					\
 		.scan_type = {                                          \
-			.sign = 'u',					\
+			.format = 'u',					\
 			.realbits = 12,					\
 			.storagebits = 16,				\
 			.shift = 4,					\
@@ -303,7 +303,7 @@ static const struct iio_chan_spec kxsd9_channels[] = {
 		.address = KXSD9_REG_AUX,
 		.scan_index = 3,
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 12,
 			.storagebits = 16,
 			.shift = 4,
diff --git a/drivers/iio/accel/mma7455_core.c b/drivers/iio/accel/mma7455_core.c
index a2b5bdf14dde..3b0b3159892f 100644
--- a/drivers/iio/accel/mma7455_core.c
+++ b/drivers/iio/accel/mma7455_core.c
@@ -219,7 +219,7 @@ static const struct iio_info mma7455_info = {
 				    BIT(IIO_CHAN_INFO_SCALE), \
 	.scan_index = idx, \
 	.scan_type = { \
-		.sign = 's', \
+		.format = 's', \
 		.realbits = 10, \
 		.storagebits = 16, \
 		.endianness = IIO_LE, \
diff --git a/drivers/iio/accel/mma8452.c b/drivers/iio/accel/mma8452.c
index 15172ba2972c..69942239d3ed 100644
--- a/drivers/iio/accel/mma8452.c
+++ b/drivers/iio/accel/mma8452.c
@@ -1233,7 +1233,7 @@ static const struct iio_chan_spec_ext_info mma8452_ext_info[] = {
 			BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO), \
 	.scan_index = idx, \
 	.scan_type = { \
-		.sign = 's', \
+		.format = 's', \
 		.realbits = (bits), \
 		.storagebits = 16, \
 		.shift = 16 - (bits), \
@@ -1255,7 +1255,7 @@ static const struct iio_chan_spec_ext_info mma8452_ext_info[] = {
 		BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO), \
 	.scan_index = idx, \
 	.scan_type = { \
-		.sign = 's', \
+		.format = 's', \
 		.realbits = (bits), \
 		.storagebits = 16, \
 		.shift = 16 - (bits), \
diff --git a/drivers/iio/accel/msa311.c b/drivers/iio/accel/msa311.c
index 5eace0de3750..a239c48d44fb 100644
--- a/drivers/iio/accel/msa311.c
+++ b/drivers/iio/accel/msa311.c
@@ -382,7 +382,7 @@ enum msa311_si {
 					      BIT(IIO_CHAN_INFO_SAMP_FREQ), \
 	.scan_index = MSA311_SI_##axis,                                     \
 	.scan_type = {                                                      \
-		.sign = 's',                                                \
+		.format = 's',                                              \
 		.realbits = 12,                                             \
 		.storagebits = 16,                                          \
 		.shift = 4,                                                 \
diff --git a/drivers/iio/accel/mxc4005.c b/drivers/iio/accel/mxc4005.c
index a2c3cf13d098..f3aa7f25cc7f 100644
--- a/drivers/iio/accel/mxc4005.c
+++ b/drivers/iio/accel/mxc4005.c
@@ -306,7 +306,7 @@ static const unsigned long mxc4005_scan_masks[] = {
 	.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE),	\
 	.scan_index = AXIS_##_axis,				\
 	.scan_type = {						\
-		.sign = 's',					\
+		.format = 's',					\
 		.realbits = 12,					\
 		.storagebits = 16,				\
 		.shift = 4,					\
diff --git a/drivers/iio/accel/sca3000.c b/drivers/iio/accel/sca3000.c
index 4a827be439a2..5acba0f31aca 100644
--- a/drivers/iio/accel/sca3000.c
+++ b/drivers/iio/accel/sca3000.c
@@ -485,7 +485,7 @@ static const struct iio_event_spec sca3000_event = {
 		.address = index,				\
 		.scan_index = index,				\
 		.scan_type = {					\
-			.sign = 's',				\
+			.format = 's',				\
 			.realbits = 13,				\
 			.storagebits = 16,			\
 			.shift = 3,				\
@@ -528,7 +528,7 @@ static const struct iio_chan_spec sca3000_channels_with_temp[] = {
 		/* No buffer support */
 		.scan_index = -1,
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 9,
 			.storagebits = 16,
 			.shift = 5,
diff --git a/drivers/iio/accel/sca3300.c b/drivers/iio/accel/sca3300.c
index 8380b237831c..ff5fed5f2dbc 100644
--- a/drivers/iio/accel/sca3300.c
+++ b/drivers/iio/accel/sca3300.c
@@ -70,7 +70,7 @@ enum sca3300_scan_indexes {
 	BIT(IIO_CHAN_INFO_LOW_PASS_FILTER_3DB_FREQUENCY),		\
 	.scan_index = index,						\
 	.scan_type = {							\
-		.sign = 's',						\
+		.format = 's',						\
 		.realbits = 16,						\
 		.storagebits = 16,					\
 		.endianness = IIO_CPU,					\
@@ -87,7 +87,7 @@ enum sca3300_scan_indexes {
 	.info_mask_shared_by_type_available = BIT(IIO_CHAN_INFO_SCALE), \
 	.scan_index = index,						\
 	.scan_type = {							\
-		.sign = 's',						\
+		.format = 's',						\
 		.realbits = 16,						\
 		.storagebits = 16,					\
 		.endianness = IIO_CPU,					\
@@ -100,7 +100,7 @@ enum sca3300_scan_indexes {
 		.scan_index = index,					\
 		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),		\
 		.scan_type = {						\
-			.sign = 's',					\
+			.format = 's',					\
 			.realbits = 16,					\
 			.storagebits = 16,				\
 			.endianness = IIO_CPU,				\
diff --git a/drivers/iio/accel/stk8312.c b/drivers/iio/accel/stk8312.c
index f31c6ab3392d..2493758f6a82 100644
--- a/drivers/iio/accel/stk8312.c
+++ b/drivers/iio/accel/stk8312.c
@@ -80,7 +80,7 @@ static const struct {
 				    BIT(IIO_CHAN_INFO_SAMP_FREQ),	\
 	.scan_index = index,						\
 	.scan_type = {							\
-		.sign = 's',						\
+		.format = 's',						\
 		.realbits = 8,						\
 		.storagebits = 8,					\
 		.endianness = IIO_CPU,					\
diff --git a/drivers/iio/accel/stk8ba50.c b/drivers/iio/accel/stk8ba50.c
index a9ff2a273fe1..e1a720e7d460 100644
--- a/drivers/iio/accel/stk8ba50.c
+++ b/drivers/iio/accel/stk8ba50.c
@@ -108,7 +108,7 @@ struct stk8ba50_data {
 				    BIT(IIO_CHAN_INFO_SAMP_FREQ),	\
 	.scan_index = index,						\
 	.scan_type = {							\
-		.sign = 's',						\
+		.format = 's',						\
 		.realbits = 10,						\
 		.storagebits = 16,					\
 		.shift = STK8BA50_DATA_SHIFT,				\
diff --git a/drivers/iio/adc/ad4000.c b/drivers/iio/adc/ad4000.c
index fd3d79fca785..b83303ea852e 100644
--- a/drivers/iio/adc/ad4000.c
+++ b/drivers/iio/adc/ad4000.c
@@ -51,7 +51,7 @@
 	.info_mask_separate_available = _reg_access ? BIT(IIO_CHAN_INFO_SCALE) : 0,\
 	.scan_index = 0,							\
 	.scan_type = {								\
-		.sign = _sign,							\
+		.format = _sign,						\
 		.realbits = _real_bits,						\
 		.storagebits = _storage_bits,					\
 		.shift = (_offl ? 0 : _storage_bits - _real_bits),		\
@@ -89,7 +89,7 @@
 	.info_mask_separate_available = _reg_access ? BIT(IIO_CHAN_INFO_SCALE) : 0,\
 	.scan_index = 0,							\
 	.scan_type = {								\
-		.sign = _sign,							\
+		.format = _sign,						\
 		.realbits = _real_bits,						\
 		.storagebits = _storage_bits,					\
 		.shift = (_offl ? 0 : _storage_bits - _real_bits),		\
@@ -540,7 +540,7 @@ static void ad4000_fill_scale_tbl(struct ad4000_state *st,
 	 * ADCs that output two's complement code have one less bit to express
 	 * voltage magnitude.
 	 */
-	if (chan->scan_type.sign == 's')
+	if (chan->scan_type.format == 's')
 		scale_bits = chan->scan_type.realbits - 1;
 	else
 		scale_bits = chan->scan_type.realbits;
@@ -657,7 +657,7 @@ static int ad4000_single_conversion(struct iio_dev *indio_dev,
 
 	sample >>= chan->scan_type.shift;
 
-	if (chan->scan_type.sign == 's')
+	if (chan->scan_type.format == 's')
 		*val = sign_extend32(sample, chan->scan_type.realbits - 1);
 	else
 		*val = sample;
diff --git a/drivers/iio/adc/ad4030.c b/drivers/iio/adc/ad4030.c
index 68446db9bef1..d27acd7f1cb9 100644
--- a/drivers/iio/adc/ad4030.c
+++ b/drivers/iio/adc/ad4030.c
@@ -196,7 +196,7 @@ struct ad4030_state {
 	.channel = ((_idx) - (_ch)) * 2 + (_ch),			\
 	.scan_index = (_idx),						\
 	.scan_type = {							\
-		.sign = 'u',						\
+		.format = 'u',						\
 		.storagebits = 8,					\
 		.realbits = 8,						\
 		.endianness = IIO_BE,					\
@@ -1083,14 +1083,14 @@ static const unsigned long ad4630_channel_masks[] = {
 
 static const struct iio_scan_type ad4030_24_scan_types[] = {
 	[AD4030_SCAN_TYPE_NORMAL] = {
-		.sign = 's',
+		.format = 's',
 		.storagebits = 32,
 		.realbits = 24,
 		.shift = 8,
 		.endianness = IIO_BE,
 	},
 	[AD4030_SCAN_TYPE_AVG] = {
-		.sign = 's',
+		.format = 's',
 		.storagebits = 32,
 		.realbits = 30,
 		.shift = 2,
@@ -1100,14 +1100,14 @@ static const struct iio_scan_type ad4030_24_scan_types[] = {
 
 static const struct iio_scan_type ad4030_16_scan_types[] = {
 	[AD4030_SCAN_TYPE_NORMAL] = {
-		.sign = 's',
+		.format = 's',
 		.storagebits = 32,
 		.realbits = 16,
 		.shift = 16,
 		.endianness = IIO_BE,
 	},
 	[AD4030_SCAN_TYPE_AVG] = {
-		.sign = 's',
+		.format = 's',
 		.storagebits = 32,
 		.realbits = 30,
 		.shift = 2,
diff --git a/drivers/iio/adc/ad4062.c b/drivers/iio/adc/ad4062.c
index dd4ad32aa6f5..985017f04970 100644
--- a/drivers/iio/adc/ad4062.c
+++ b/drivers/iio/adc/ad4062.c
@@ -122,13 +122,13 @@ enum {
 
 static const struct iio_scan_type ad4062_scan_type_12_s[] = {
 	[AD4062_SCAN_TYPE_SAMPLE] = {
-		.sign = 's',
+		.format = 's',
 		.realbits = 12,
 		.storagebits = 16,
 		.endianness = IIO_BE,
 	},
 	[AD4062_SCAN_TYPE_BURST_AVG] = {
-		.sign = 's',
+		.format = 's',
 		.realbits = 14,
 		.storagebits = 16,
 		.endianness = IIO_BE,
@@ -137,13 +137,13 @@ static const struct iio_scan_type ad4062_scan_type_12_s[] = {
 
 static const struct iio_scan_type ad4062_scan_type_16_s[] = {
 	[AD4062_SCAN_TYPE_SAMPLE] = {
-		.sign = 's',
+		.format = 's',
 		.realbits = 16,
 		.storagebits = 16,
 		.endianness = IIO_BE,
 	},
 	[AD4062_SCAN_TYPE_BURST_AVG] = {
-		.sign = 's',
+		.format = 's',
 		.realbits = 20,
 		.storagebits = 32,
 		.endianness = IIO_BE,
diff --git a/drivers/iio/adc/ad4080.c b/drivers/iio/adc/ad4080.c
index 7cf3b6ed7940..7b67e229dedf 100644
--- a/drivers/iio/adc/ad4080.c
+++ b/drivers/iio/adc/ad4080.c
@@ -432,7 +432,7 @@ static struct iio_chan_spec_ext_info ad4080_ext_info[] = {
 	.ext_info = ad4080_ext_info,					\
 	.scan_index = 0,						\
 	.scan_type = {							\
-		.sign = 's',						\
+		.format = 's',						\
 		.realbits = (bits),					\
 		.storagebits = (storage),				\
 	},								\
diff --git a/drivers/iio/adc/ad4130.c b/drivers/iio/adc/ad4130.c
index 5567ae5dee88..d20a0180201e 100644
--- a/drivers/iio/adc/ad4130.c
+++ b/drivers/iio/adc/ad4130.c
@@ -1002,7 +1002,7 @@ static const struct iio_chan_spec ad4130_channel_template = {
 					BIT(IIO_CHAN_INFO_SAMP_FREQ),
 	.ext_info = ad4130_ext_info,
 	.scan_type = {
-		.sign = 'u',
+		.format = 'u',
 		.endianness = IIO_BE,
 	},
 };
diff --git a/drivers/iio/adc/ad4170-4.c b/drivers/iio/adc/ad4170-4.c
index 82205bfae531..96b0302331cd 100644
--- a/drivers/iio/adc/ad4170-4.c
+++ b/drivers/iio/adc/ad4170-4.c
@@ -955,7 +955,7 @@ static const struct iio_chan_spec ad4170_temp_channel_template = {
 			      BIT(IIO_CHAN_INFO_SAMP_FREQ),
 	.info_mask_separate_available = BIT(IIO_CHAN_INFO_SAMP_FREQ),
 	.scan_type = {
-		.sign = 's',
+		.format = 's',
 		.realbits = 24,
 		.storagebits = 32,
 		.shift = 8,
@@ -1101,7 +1101,7 @@ static int ad4170_get_input_range(struct ad4170_state *st,
 				  struct iio_chan_spec const *chan,
 				  unsigned int ch_reg, unsigned int ref_sel)
 {
-	bool bipolar = chan->scan_type.sign == 's';
+	bool bipolar = chan->scan_type.format == 's';
 	struct device *dev = &st->spi->dev;
 	int refp, refn, ain_voltage, ret;
 
@@ -1228,7 +1228,7 @@ static int __ad4170_read_sample(struct iio_dev *indio_dev,
 	if (ret)
 		return ret;
 
-	if (chan->scan_type.sign == 's')
+	if (chan->scan_type.format == 's')
 		*val = sign_extend32(*val, chan->scan_type.realbits - 1);
 
 	return 0;
@@ -1353,7 +1353,7 @@ static int ad4170_fill_scale_tbl(struct iio_dev *indio_dev,
 	struct ad4170_state *st = iio_priv(indio_dev);
 	struct ad4170_chan_info *chan_info = &st->chan_infos[chan->address];
 	struct device *dev = &st->spi->dev;
-	int bipolar = chan->scan_type.sign == 's' ? 1 : 0;
+	int bipolar = chan->scan_type.format == 's' ? 1 : 0;
 	int precision_bits = chan->scan_type.realbits;
 	int pga, ainm_voltage, ret;
 	unsigned long long offset;
@@ -2335,9 +2335,9 @@ static int ad4170_parse_channel_node(struct iio_dev *indio_dev,
 	bipolar = fwnode_property_read_bool(child, "bipolar");
 	setup->afe |= FIELD_PREP(AD4170_AFE_BIPOLAR_MSK, bipolar);
 	if (bipolar)
-		chan->scan_type.sign = 's';
+		chan->scan_type.format = 's';
 	else
-		chan->scan_type.sign = 'u';
+		chan->scan_type.format = 'u';
 
 	ret = ad4170_validate_channel(st, chan);
 	if (ret)
diff --git a/drivers/iio/adc/ad4695.c b/drivers/iio/adc/ad4695.c
index cda419638d9a..fd7378b3e0e4 100644
--- a/drivers/iio/adc/ad4695.c
+++ b/drivers/iio/adc/ad4695.c
@@ -314,25 +314,25 @@ enum {
 
 static const struct iio_scan_type ad4695_scan_type_offload_u[] = {
 	[AD4695_SCAN_TYPE_OSR_1] = {
-		.sign = 'u',
+		.format = 'u',
 		.realbits = 16,
 		.shift = 3,
 		.storagebits = 32,
 	},
 	[AD4695_SCAN_TYPE_OSR_4] = {
-		.sign = 'u',
+		.format = 'u',
 		.realbits = 17,
 		.shift = 2,
 		.storagebits = 32,
 	},
 	[AD4695_SCAN_TYPE_OSR_16] = {
-		.sign = 'u',
+		.format = 'u',
 		.realbits = 18,
 		.shift = 1,
 		.storagebits = 32,
 	},
 	[AD4695_SCAN_TYPE_OSR_64] = {
-		.sign = 'u',
+		.format = 'u',
 		.realbits = 19,
 		.storagebits = 32,
 	},
@@ -340,25 +340,25 @@ static const struct iio_scan_type ad4695_scan_type_offload_u[] = {
 
 static const struct iio_scan_type ad4695_scan_type_offload_s[] = {
 	[AD4695_SCAN_TYPE_OSR_1] = {
-		.sign = 's',
+		.format = 's',
 		.realbits = 16,
 		.shift = 3,
 		.storagebits = 32,
 	},
 	[AD4695_SCAN_TYPE_OSR_4] = {
-		.sign = 's',
+		.format = 's',
 		.realbits = 17,
 		.shift = 2,
 		.storagebits = 32,
 	},
 	[AD4695_SCAN_TYPE_OSR_16] = {
-		.sign = 's',
+		.format = 's',
 		.realbits = 18,
 		.shift = 1,
 		.storagebits = 32,
 	},
 	[AD4695_SCAN_TYPE_OSR_64] = {
-		.sign = 's',
+		.format = 's',
 		.realbits = 19,
 		.storagebits = 32,
 	},
@@ -375,7 +375,7 @@ static const struct iio_chan_spec ad4695_channel_template = {
 	.info_mask_separate_available = BIT(IIO_CHAN_INFO_CALIBSCALE) |
 					BIT(IIO_CHAN_INFO_CALIBBIAS),
 	.scan_type = {
-		.sign = 'u',
+		.format = 'u',
 		.realbits = 16,
 		.storagebits = 16,
 	},
@@ -388,7 +388,7 @@ static const struct iio_chan_spec ad4695_temp_channel_template = {
 			      BIT(IIO_CHAN_INFO_SCALE) |
 			      BIT(IIO_CHAN_INFO_OFFSET),
 	.scan_type = {
-		.sign = 's',
+		.format = 's',
 		.realbits = 16,
 		.storagebits = 16,
 	},
@@ -1037,7 +1037,7 @@ static int __ad4695_read_info_raw(struct ad4695_state *st,
 	if (ret)
 		return ret;
 
-	if (chan->scan_type.sign == 's')
+	if (chan->scan_type.format == 's')
 		*val = sign_extend32(st->raw_data, realbits - 1);
 	else
 		*val = st->raw_data;
@@ -1603,7 +1603,7 @@ static int ad4695_parse_channel_cfg(struct ad4695_state *st)
 				fwnode_get_name(child));
 
 		if (chan_cfg->bipolar)
-			iio_chan->scan_type.sign = 's';
+			iio_chan->scan_type.format = 's';
 
 		ret = ad4695_write_chn_cfg(st, chan_cfg);
 		if (ret)
diff --git a/drivers/iio/adc/ad4851.c b/drivers/iio/adc/ad4851.c
index 1ad77f2a4580..080f069e0f84 100644
--- a/drivers/iio/adc/ad4851.c
+++ b/drivers/iio/adc/ad4851.c
@@ -891,12 +891,12 @@ static int ad4851_read_avail(struct iio_dev *indio_dev,
 
 static const struct iio_scan_type ad4851_scan_type_20_u[] = {
 	[AD4851_SCAN_TYPE_NORMAL] = {
-		.sign = 'u',
+		.format = 'u',
 		.realbits = 20,
 		.storagebits = 32,
 	},
 	[AD4851_SCAN_TYPE_RESOLUTION_BOOST] = {
-		.sign = 'u',
+		.format = 'u',
 		.realbits = 24,
 		.storagebits = 32,
 	},
@@ -904,12 +904,12 @@ static const struct iio_scan_type ad4851_scan_type_20_u[] = {
 
 static const struct iio_scan_type ad4851_scan_type_20_b[] = {
 	[AD4851_SCAN_TYPE_NORMAL] = {
-		.sign = 's',
+		.format = 's',
 		.realbits = 20,
 		.storagebits = 32,
 	},
 	[AD4851_SCAN_TYPE_RESOLUTION_BOOST] = {
-		.sign = 's',
+		.format = 's',
 		.realbits = 24,
 		.storagebits = 32,
 	},
@@ -949,7 +949,7 @@ static int ad4851_get_current_scan_type(const struct iio_dev *indio_dev,
 {										\
 	AD4851_IIO_CHANNEL,							\
 	.scan_type = {								\
-		.sign = 'u',							\
+		.format = 'u',							\
 		.realbits = 16,							\
 		.storagebits = 16,						\
 	},									\
@@ -997,7 +997,7 @@ static int ad4851_parse_channels_common(struct iio_dev *indio_dev,
 		st->bipolar_ch[reg] = fwnode_property_read_bool(child, "bipolar");
 
 		if (st->bipolar_ch[reg]) {
-			channels->scan_type.sign = 's';
+			channels->scan_type.format = 's';
 		} else {
 			ret = regmap_write(st->regmap, AD4851_REG_CHX_SOFTSPAN(reg),
 					   AD4851_SOFTSPAN_0V_40V);
diff --git a/drivers/iio/adc/ad7124.c b/drivers/iio/adc/ad7124.c
index 5c1a8f886bcc..76fdc732d426 100644
--- a/drivers/iio/adc/ad7124.c
+++ b/drivers/iio/adc/ad7124.c
@@ -1182,7 +1182,7 @@ static const struct iio_chan_spec ad7124_channel_template = {
 		BIT(IIO_CHAN_INFO_LOW_PASS_FILTER_3DB_FREQUENCY),
 	.info_mask_shared_by_type_available = BIT(IIO_CHAN_INFO_SCALE),
 	.scan_type = {
-		.sign = 'u',
+		.format = 'u',
 		.realbits = 24,
 		.storagebits = 32,
 		.endianness = IIO_BE,
@@ -1308,7 +1308,7 @@ static int ad7124_parse_channel_config(struct iio_dev *indio_dev,
 				 * measurement yields an unsigned value, but
 				 * this matches the device's manual.
 				 */
-				.sign = 'u',
+				.format = 'u',
 				.realbits = 24,
 				.storagebits = 32,
 				.endianness = IIO_BE,
diff --git a/drivers/iio/adc/ad7173.c b/drivers/iio/adc/ad7173.c
index d36612352b44..ca8cffd3b279 100644
--- a/drivers/iio/adc/ad7173.c
+++ b/drivers/iio/adc/ad7173.c
@@ -1549,7 +1549,7 @@ static const struct iio_info ad7173_info = {
 };
 
 static const struct iio_scan_type ad4113_scan_type = {
-	.sign = 'u',
+	.format = 'u',
 	.realbits = 16,
 	.storagebits = 16,
 	.endianness = IIO_BE,
@@ -1561,7 +1561,7 @@ static const struct iio_chan_spec ad7173_channel_template = {
 	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW) |
 		BIT(IIO_CHAN_INFO_SCALE) | BIT(IIO_CHAN_INFO_SAMP_FREQ),
 	.scan_type = {
-		.sign = 'u',
+		.format = 'u',
 		.realbits = 24,
 		.storagebits = 32,
 		.endianness = IIO_BE,
@@ -1577,7 +1577,7 @@ static const struct iio_chan_spec ad7173_temp_iio_channel_template = {
 		BIT(IIO_CHAN_INFO_SCALE) | BIT(IIO_CHAN_INFO_OFFSET) |
 		BIT(IIO_CHAN_INFO_SAMP_FREQ),
 	.scan_type = {
-		.sign = 'u',
+		.format = 'u',
 		.realbits = 24,
 		.storagebits = 32,
 		.endianness = IIO_BE,
diff --git a/drivers/iio/adc/ad7191.c b/drivers/iio/adc/ad7191.c
index d9cd903ffdd2..5ebdf06c093c 100644
--- a/drivers/iio/adc/ad7191.c
+++ b/drivers/iio/adc/ad7191.c
@@ -437,7 +437,7 @@ static const struct iio_chan_spec ad7191_channels[] = {
 		.info_mask_shared_by_all_available = BIT(IIO_CHAN_INFO_SAMP_FREQ),
 		.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE),
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 24,
 			.storagebits = 32,
 			.endianness = IIO_BE,
@@ -458,7 +458,7 @@ static const struct iio_chan_spec ad7191_channels[] = {
 		.info_mask_shared_by_type_available = BIT(IIO_CHAN_INFO_SCALE),
 		.scan_index = 1,
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 24,
 			.storagebits = 32,
 			.endianness = IIO_BE,
@@ -479,7 +479,7 @@ static const struct iio_chan_spec ad7191_channels[] = {
 		.info_mask_shared_by_type_available = BIT(IIO_CHAN_INFO_SCALE),
 		.scan_index = 2,
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 24,
 			.storagebits = 32,
 			.endianness = IIO_BE,
diff --git a/drivers/iio/adc/ad7192.c b/drivers/iio/adc/ad7192.c
index 530e1d307860..f1874071698c 100644
--- a/drivers/iio/adc/ad7192.c
+++ b/drivers/iio/adc/ad7192.c
@@ -1151,7 +1151,7 @@ static const struct iio_info ad7195_info = {
 		.ext_info = (_ext_info), \
 		.scan_index = (_si), \
 		.scan_type = { \
-			.sign = 'u', \
+			.format = 'u', \
 			.realbits = 24, \
 			.storagebits = 32, \
 			.endianness = IIO_BE, \
diff --git a/drivers/iio/adc/ad7266.c b/drivers/iio/adc/ad7266.c
index 3364ac6c4631..0a8c0aa98916 100644
--- a/drivers/iio/adc/ad7266.c
+++ b/drivers/iio/adc/ad7266.c
@@ -160,7 +160,7 @@ static int ad7266_read_raw(struct iio_dev *indio_dev,
 		if (ret < 0)
 			return ret;
 		*val = (*val >> 2) & 0xfff;
-		if (chan->scan_type.sign == 's')
+		if (chan->scan_type.format == 's')
 			*val = sign_extend32(*val,
 					     chan->scan_type.realbits - 1);
 
@@ -196,7 +196,7 @@ static int ad7266_read_raw(struct iio_dev *indio_dev,
 		| BIT(IIO_CHAN_INFO_OFFSET),			\
 	.scan_index = (_chan),				\
 	.scan_type = {					\
-		.sign = (_sign),			\
+		.format = (_sign),			\
 		.realbits = 12,				\
 		.storagebits = 16,			\
 		.shift = 2,				\
@@ -244,7 +244,7 @@ static AD7266_DECLARE_SINGLE_ENDED_CHANNELS_FIXED(s, 's');
 		| BIT(IIO_CHAN_INFO_OFFSET),			\
 	.scan_index = (_chan),				\
 	.scan_type = {					\
-		.sign = _sign,			\
+		.format = _sign,			\
 		.realbits = 12,				\
 		.storagebits = 16,			\
 		.shift = 2,				\
diff --git a/drivers/iio/adc/ad7280a.c b/drivers/iio/adc/ad7280a.c
index ba12a3796e2b..d0f9e4db6a63 100644
--- a/drivers/iio/adc/ad7280a.c
+++ b/drivers/iio/adc/ad7280a.c
@@ -621,7 +621,7 @@ static void ad7280_common_fields_init(struct iio_chan_spec *chan, int addr,
 	chan->info_mask_shared_by_all = BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO);
 	chan->address = addr;
 	chan->scan_index = cnt;
-	chan->scan_type.sign = 'u';
+	chan->scan_type.format = 'u';
 	chan->scan_type.realbits = 12;
 	chan->scan_type.storagebits = 32;
 }
@@ -638,7 +638,7 @@ static void ad7280_total_voltage_channel_init(struct iio_chan_spec *chan,
 	chan->info_mask_separate = BIT(IIO_CHAN_INFO_RAW);
 	chan->info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE);
 	chan->scan_index = cnt;
-	chan->scan_type.sign = 'u';
+	chan->scan_type.format = 'u';
 	chan->scan_type.realbits = 32;
 	chan->scan_type.storagebits = 32;
 }
diff --git a/drivers/iio/adc/ad7298.c b/drivers/iio/adc/ad7298.c
index 7c0538ea15c8..c5a4a063a432 100644
--- a/drivers/iio/adc/ad7298.c
+++ b/drivers/iio/adc/ad7298.c
@@ -63,7 +63,7 @@ struct ad7298_state {
 		.address = index,					\
 		.scan_index = index,					\
 		.scan_type = {						\
-			.sign = 'u',					\
+			.format = 'u',					\
 			.realbits = 12,					\
 			.storagebits = 16,				\
 			.endianness = IIO_BE,				\
@@ -81,7 +81,7 @@ static const struct iio_chan_spec ad7298_channels[] = {
 		.address = AD7298_CH_TEMP,
 		.scan_index = -1,
 		.scan_type = {
-			.sign = 's',
+			.format = 's',
 			.realbits = 32,
 			.storagebits = 32,
 		},
diff --git a/drivers/iio/adc/ad7380.c b/drivers/iio/adc/ad7380.c
index bfd908deefc0..e51a19c15ed8 100644
--- a/drivers/iio/adc/ad7380.c
+++ b/drivers/iio/adc/ad7380.c
@@ -155,13 +155,13 @@ enum {
 /* Extended scan types for 12-bit unsigned chips. */
 static const struct iio_scan_type ad7380_scan_type_12_u[] = {
 	[AD7380_SCAN_TYPE_NORMAL] = {
-		.sign = 'u',
+		.format = 'u',
 		.realbits = 12,
 		.storagebits = 16,
 		.endianness = IIO_CPU,
 	},
 	[AD7380_SCAN_TYPE_RESOLUTION_BOOST] = {
-		.sign = 'u',
+		.format = 'u',
 		.realbits = 14,
 		.storagebits = 16,
 		.endianness = IIO_CPU,
@@ -171,13 +171,13 @@ static const struct iio_scan_type ad7380_scan_type_12_u[] = {
 /* Extended scan types for 14-bit signed chips. */
 static const struct iio_scan_type ad7380_scan_type_14_s[] = {
 	[AD7380_SCAN_TYPE_NORMAL] = {
-		.sign = 's',
+		.format = 's',
 		.realbits = 14,
 		.storagebits = 16,
 		.endianness = IIO_CPU,
 	},
 	[AD7380_SCAN_TYPE_RESOLUTION_BOOST] = {
-		.sign = 's',
+		.format = 's',
 		.realbits = 16,
 		.storagebits = 16,
 		.endianness = IIO_CPU,
@@ -187,13 +187,13 @@ static const struct iio_scan_type ad7380_scan_type_14_s[] = {
 /* Extended scan types for 14-bit unsigned chips. */
 static const struct iio_scan_type ad7380_scan_type_14_u[] = {
 	[AD7380_SCAN_TYPE_NORMAL] = {
-		.sign = 'u',
+		.format = 'u',
 		.realbits = 14,
 		.storagebits = 16,
 		.endianness = IIO_CPU,
 	},
 	[AD7380_SCAN_TYPE_RESOLUTION_BOOST] = {
-		.sign = 'u',
+		.format = 'u',
 		.realbits = 16,
 		.storagebits = 16,
 		.endianness = IIO_CPU,
@@ -203,13 +203,13 @@ static const struct iio_scan_type ad7380_scan_type_14_u[] = {
 /* Extended scan types for 16-bit signed_chips. */
 static const struct iio_scan_type ad7380_scan_type_16_s[] = {
 	[AD7380_SCAN_TYPE_NORMAL] = {
-		.sign = 's',
+		.format = 's',
 		.realbits = 16,
 		.storagebits = 16,
 		.endianness = IIO_CPU,
 	},
 	[AD7380_SCAN_TYPE_RESOLUTION_BOOST] = {
-		.sign = 's',
+		.format = 's',
 		.realbits = 18,
 		.storagebits = 32,
 		.endianness = IIO_CPU,
@@ -219,13 +219,13 @@ static const struct iio_scan_type ad7380_scan_type_16_s[] = {
 /* Extended scan types for 16-bit unsigned chips. */
 static const struct iio_scan_type ad7380_scan_type_16_u[] = {
 	[AD7380_SCAN_TYPE_NORMAL] = {
-		.sign = 'u',
+		.format = 'u',
 		.realbits = 16,
 		.storagebits = 16,
 		.endianness = IIO_CPU,
 	},
 	[AD7380_SCAN_TYPE_RESOLUTION_BOOST] = {
-		.sign = 'u',
+		.format = 'u',
 		.realbits = 18,
 		.storagebits = 32,
 		.endianness = IIO_CPU,
@@ -240,13 +240,13 @@ static const struct iio_scan_type ad7380_scan_type_16_u[] = {
 /* Extended scan types for 12-bit unsigned chips, offload support. */
 static const struct iio_scan_type ad7380_scan_type_12_u_offload[] = {
 	[AD7380_SCAN_TYPE_NORMAL] = {
-		.sign = 'u',
+		.format = 'u',
 		.realbits = 12,
 		.storagebits = 32,
 		.endianness = IIO_CPU,
 	},
 	[AD7380_SCAN_TYPE_RESOLUTION_BOOST] = {
-		.sign = 'u',
+		.format = 'u',
 		.realbits = 14,
 		.storagebits = 32,
 		.endianness = IIO_CPU,
@@ -256,13 +256,13 @@ static const struct iio_scan_type ad7380_scan_type_12_u_offload[] = {
 /* Extended scan types for 14-bit signed chips, offload support. */
 static const struct iio_scan_type ad7380_scan_type_14_s_offload[] = {
 	[AD7380_SCAN_TYPE_NORMAL] = {
-		.sign = 's',
+		.format = 's',
 		.realbits = 14,
 		.storagebits = 32,
 		.endianness = IIO_CPU,
 	},
 	[AD7380_SCAN_TYPE_RESOLUTION_BOOST] = {
-		.sign = 's',
+		.format = 's',
 		.realbits = 16,
 		.storagebits = 32,
 		.endianness = IIO_CPU,
@@ -272,13 +272,13 @@ static const struct iio_scan_type ad7380_scan_type_14_s_offload[] = {
 /* Extended scan types for 14-bit unsigned chips, offload support. */
 static const struct iio_scan_type ad7380_scan_type_14_u_offload[] = {
 	[AD7380_SCAN_TYPE_NORMAL] = {
-		.sign = 'u',
+		.format = 'u',
 		.realbits = 14,
 		.storagebits = 32,
 		.endianness = IIO_CPU,
 	},
 	[AD7380_SCAN_TYPE_RESOLUTION_BOOST] = {
-		.sign = 'u',
+		.format = 'u',
 		.realbits = 16,
 		.storagebits = 32,
 		.endianness = IIO_CPU,
@@ -288,13 +288,13 @@ static const struct iio_scan_type ad7380_scan_type_14_u_offload[] = {
 /* Extended scan types for 16-bit signed_chips, offload support. */
 static const struct iio_scan_type ad7380_scan_type_16_s_offload[] = {
 	[AD7380_SCAN_TYPE_NORMAL] = {
-		.sign = 's',
+		.format = 's',
 		.realbits = 16,
 		.storagebits = 32,
 		.endianness = IIO_CPU,
 	},
 	[AD7380_SCAN_TYPE_RESOLUTION_BOOST] = {
-		.sign = 's',
+		.format = 's',
 		.realbits = 18,
 		.storagebits = 32,
 		.endianness = IIO_CPU,
@@ -304,13 +304,13 @@ static const struct iio_scan_type ad7380_scan_type_16_s_offload[] = {
 /* Extended scan types for 16-bit unsigned chips, offload support. */
 static const struct iio_scan_type ad7380_scan_type_16_u_offload[] = {
 	[AD7380_SCAN_TYPE_NORMAL] = {
-		.sign = 'u',
+		.format = 'u',
 		.realbits = 16,
 		.storagebits = 32,
 		.endianness = IIO_CPU,
 	},
 	[AD7380_SCAN_TYPE_RESOLUTION_BOOST] = {
-		.sign = 'u',
+		.format = 'u',
 		.realbits = 18,
 		.storagebits = 32,
 		.endianness = IIO_CPU,
@@ -1400,14 +1400,14 @@ static int ad7380_read_direct(struct ad7380_state *st, unsigned int scan_index,
 		return ret;
 
 	if (scan_type->realbits > 16) {
-		if (scan_type->sign == 's')
+		if (scan_type->format == 's')
 			*val = sign_extend32(*(u32 *)(st->scan_data + 4 * index),
 					     scan_type->realbits - 1);
 		else
 			*val = *(u32 *)(st->scan_data + 4 * index) &
 				GENMASK(scan_type->realbits - 1, 0);
 	} else {
-		if (scan_type->sign == 's')
+		if (scan_type->format == 's')
 			*val = sign_extend32(*(u16 *)(st->scan_data + 2 * index),
 					     scan_type->realbits - 1);
 		else
diff --git a/drivers/iio/adc/ad7405.c b/drivers/iio/adc/ad7405.c
index 9adf85a732ce..85566b635d3c 100644
--- a/drivers/iio/adc/ad7405.c
+++ b/drivers/iio/adc/ad7405.c
@@ -133,7 +133,7 @@ static const struct iio_chan_spec ad7405_channel = {
 	.differential = 1,
 	.scan_index = 0,
 	.scan_type = {
-		.sign = 'u',
+		.format = 'u',
 		.realbits = 16,
 		.storagebits = 16,
 	},
diff --git a/drivers/iio/adc/ad7476.c b/drivers/iio/adc/ad7476.c
index 21d3f6aae972..a52e70827a8b 100644
--- a/drivers/iio/adc/ad7476.c
+++ b/drivers/iio/adc/ad7476.c
@@ -160,7 +160,7 @@ static int ad7476_read_raw(struct iio_dev *indio_dev,
 	.info_mask_separate = _info_mask_sep,			\
 	.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE),	\
 	.scan_type = {						\
-		.sign = 'u',					\
+		.format = 'u',					\
 		.realbits = (bits),				\
 		.storagebits = 16,				\
 		.shift = (_shift),				\
diff --git a/drivers/iio/adc/ad7606.c b/drivers/iio/adc/ad7606.c
index d9271894f091..80aca38118e3 100644
--- a/drivers/iio/adc/ad7606.c
+++ b/drivers/iio/adc/ad7606.c
@@ -413,7 +413,7 @@ static int ad7606c_18bit_chan_scale_setup(struct iio_dev *indio_dev,
 		/* Bipolar single-ended ranges start at 0 (b0000) */
 		ci->reg_offset = 0;
 		ci->range = 3;
-		chan->scan_type.sign = 's';
+		chan->scan_type.format = 's';
 
 		return 0;
 	}
@@ -424,7 +424,7 @@ static int ad7606c_18bit_chan_scale_setup(struct iio_dev *indio_dev,
 	/* Unipolar single-ended ranges start at 5 (b0101) */
 	ci->reg_offset = 5;
 	ci->range = 1;
-	chan->scan_type.sign = 'u';
+	chan->scan_type.format = 'u';
 
 	return 0;
 }
@@ -458,7 +458,7 @@ static int ad7606c_16bit_chan_scale_setup(struct iio_dev *indio_dev,
 		ci->range = 1;
 		chan->differential = 1;
 		chan->channel2 = chan->channel;
-		chan->scan_type.sign = 's';
+		chan->scan_type.format = 's';
 
 		return 0;
 	}
@@ -472,7 +472,7 @@ static int ad7606c_16bit_chan_scale_setup(struct iio_dev *indio_dev,
 		/* Bipolar single-ended ranges start at 0 (b0000) */
 		ci->reg_offset = 0;
 		ci->range = 3;
-		chan->scan_type.sign = 's';
+		chan->scan_type.format = 's';
 
 		return 0;
 	}
@@ -483,7 +483,7 @@ static int ad7606c_16bit_chan_scale_setup(struct iio_dev *indio_dev,
 	/* Unipolar single-ended ranges start at 5 (b0101) */
 	ci->reg_offset = 5;
 	ci->range = 1;
-	chan->scan_type.sign = 'u';
+	chan->scan_type.format = 'u';
 
 	return 0;
 }
@@ -703,7 +703,7 @@ static int ad7606_scan_direct(struct iio_dev *indio_dev, unsigned int ch,
 
 	*val &= GENMASK(realbits - 1, 0);
 
-	if (chan->scan_type.sign == 's')
+	if (chan->scan_type.format == 's')
 		*val = sign_extend32(*val, realbits - 1);
 
 error_ret:
@@ -1412,7 +1412,7 @@ static int ad7606_probe_channels(struct iio_dev *indio_dev)
 		chan->indexed = 1;
 		chan->channel = i;
 		chan->scan_index = i;
-		chan->scan_type.sign = 's';
+		chan->scan_type.format = 's';
 		chan->scan_type.realbits = st->chip_info->bits;
 		/*
 		 * If in SPI offload mode, storagebits are set based
diff --git a/drivers/iio/adc/ad7625.c b/drivers/iio/adc/ad7625.c
index 0466c0c7eae4..bccc83437611 100644
--- a/drivers/iio/adc/ad7625.c
+++ b/drivers/iio/adc/ad7625.c
@@ -54,7 +54,7 @@ struct ad7625_chip_info {
 	.info_mask_separate = BIT(IIO_CHAN_INFO_SCALE),			\
 	.info_mask_shared_by_all = BIT(IIO_CHAN_INFO_SAMP_FREQ),	\
 	.scan_index = 0,						\
-	.scan_type.sign = 's',						\
+	.scan_type.format = 's',					\
 	.scan_type.storagebits = (_bits) > 16 ? 32 : 16,		\
 	.scan_type.realbits = (_bits),					\
 }
diff --git a/drivers/iio/adc/ad7766.c b/drivers/iio/adc/ad7766.c
index 9e4a66477d2d..510fbdbb223b 100644
--- a/drivers/iio/adc/ad7766.c
+++ b/drivers/iio/adc/ad7766.c
@@ -154,7 +154,7 @@ static const struct iio_chan_spec ad7766_channels[] = {
 		.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE),
 		.info_mask_shared_by_all = BIT(IIO_CHAN_INFO_SAMP_FREQ),
 		.scan_type = {
-			.sign = 's',
+			.format = 's',
 			.realbits = 24,
 			.storagebits = 32,
 			.endianness = IIO_BE,
diff --git a/drivers/iio/adc/ad7768-1.c b/drivers/iio/adc/ad7768-1.c
index fcd8aea7152e..43da6d33340d 100644
--- a/drivers/iio/adc/ad7768-1.c
+++ b/drivers/iio/adc/ad7768-1.c
@@ -254,14 +254,14 @@ static const char * const ad7768_filter_enum[] = {
 
 static const struct iio_scan_type ad7768_scan_type[] = {
 	[AD7768_SCAN_TYPE_NORMAL] = {
-		.sign = 's',
+		.format = 's',
 		.realbits = 24,
 		.storagebits = 32,
 		.shift = 8,
 		.endianness = IIO_BE,
 	},
 	[AD7768_SCAN_TYPE_HIGH_SPEED] = {
-		.sign = 's',
+		.format = 's',
 		.realbits = 16,
 		.storagebits = 16,
 		.endianness = IIO_BE,
@@ -541,7 +541,7 @@ static void ad7768_fill_scale_tbl(struct iio_dev *dev)
 	u64 tmp2;
 
 	scan_type = iio_get_current_scan_type(dev, &dev->channels[0]);
-	if (scan_type->sign == 's')
+	if (scan_type->format == 's')
 		val2 = scan_type->realbits - 1;
 	else
 		val2 = scan_type->realbits;
@@ -1102,7 +1102,7 @@ static int ad7768_write_raw(struct iio_dev *indio_dev,
 		if (!st->chip->has_pga)
 			return -EOPNOTSUPP;
 
-		if (scan_type->sign == 's')
+		if (scan_type->format == 's')
 			gain_mode = ad7768_calc_pga_gain(st, val, val2,
 							 scan_type->realbits - 1);
 		else
diff --git a/drivers/iio/adc/ad7779.c b/drivers/iio/adc/ad7779.c
index 695cc79e78da..2e91ebc9196b 100644
--- a/drivers/iio/adc/ad7779.c
+++ b/drivers/iio/adc/ad7779.c
@@ -690,7 +690,7 @@ static const struct iio_chan_spec_ext_info ad7779_ext_filter[] = {
 		.scan_index = (index),					\
 		.ext_info = (_ext_info),				\
 		.scan_type = {						\
-			.sign = 's',					\
+			.format = 's',					\
 			.realbits = 24,					\
 			.storagebits = 32,				\
 			.endianness = IIO_BE,				\
diff --git a/drivers/iio/adc/ad7780.c b/drivers/iio/adc/ad7780.c
index 24d2dcad8f4d..23b50160d150 100644
--- a/drivers/iio/adc/ad7780.c
+++ b/drivers/iio/adc/ad7780.c
@@ -217,7 +217,7 @@ static const struct ad_sigma_delta_info ad7780_sigma_delta_info = {
 	.info_mask_shared_by_all = _mask_all,			\
 	.scan_index = 1,					\
 	.scan_type = {						\
-		.sign = 'u',					\
+		.format = 'u',					\
 		.realbits = (_bits),				\
 		.storagebits = 32,				\
 		.shift = (_wordsize) - (_bits),			\
diff --git a/drivers/iio/adc/ad7791.c b/drivers/iio/adc/ad7791.c
index 041fc25e3209..d033cecfc7cf 100644
--- a/drivers/iio/adc/ad7791.c
+++ b/drivers/iio/adc/ad7791.c
@@ -80,7 +80,7 @@
 		.info_mask_shared_by_all = _mask_all, \
 		.scan_index = (_si), \
 		.scan_type = { \
-			.sign = 'u', \
+			.format = 'u', \
 			.realbits = (_bits), \
 			.storagebits = (_storagebits), \
 			.shift = (_shift), \
diff --git a/drivers/iio/adc/ad7793.c b/drivers/iio/adc/ad7793.c
index ccf18ce48e34..bc28309f52c7 100644
--- a/drivers/iio/adc/ad7793.c
+++ b/drivers/iio/adc/ad7793.c
@@ -568,7 +568,7 @@ static const struct iio_info ad7797_info = {
 		.info_mask_shared_by_all = _mask_all, \
 		.scan_index = (_si), \
 		.scan_type = { \
-			.sign = 'u', \
+			.format = 'u', \
 			.realbits = (_bits), \
 			.storagebits = (_storagebits), \
 			.shift = (_shift), \
diff --git a/drivers/iio/adc/ad7887.c b/drivers/iio/adc/ad7887.c
index 87ff95643794..183a9fdf55d8 100644
--- a/drivers/iio/adc/ad7887.c
+++ b/drivers/iio/adc/ad7887.c
@@ -188,7 +188,7 @@ static int ad7887_read_raw(struct iio_dev *indio_dev,
 	.address = (x), \
 	.scan_index = (x), \
 	.scan_type = { \
-		.sign = 'u', \
+		.format = 'u', \
 		.realbits = 12, \
 		.storagebits = 16, \
 		.shift = 0, \
diff --git a/drivers/iio/adc/ad7923.c b/drivers/iio/adc/ad7923.c
index 0369151c7db1..d0f939ceccfb 100644
--- a/drivers/iio/adc/ad7923.c
+++ b/drivers/iio/adc/ad7923.c
@@ -91,7 +91,7 @@ enum ad7923_id {
 		.address = index,					\
 		.scan_index = index,					\
 		.scan_type = {						\
-			.sign = 'u',					\
+			.format = 'u',					\
 			.realbits = (bits),				\
 			.storagebits = 16,				\
 			.shift = 12 - (bits),				\
diff --git a/drivers/iio/adc/ad7944.c b/drivers/iio/adc/ad7944.c
index 7722cf9e8214..ae17adeebd3a 100644
--- a/drivers/iio/adc/ad7944.c
+++ b/drivers/iio/adc/ad7944.c
@@ -135,7 +135,7 @@ static const struct ad7944_chip_info _name##_chip_info = {		\
 			.channel = 0,					\
 			.channel2 = _diff ? 1 : 0,			\
 			.scan_index = 0,				\
-			.scan_type.sign = _diff ? 's' : 'u',		\
+			.scan_type.format = _diff ? 's' : 'u',		\
 			.scan_type.realbits = _bits,			\
 			.scan_type.storagebits = _bits > 16 ? 32 : 16,	\
 			.scan_type.endianness = IIO_CPU,		\
@@ -152,7 +152,7 @@ static const struct ad7944_chip_info _name##_chip_info = {		\
 			.channel = 0,					\
 			.channel2 = _diff ? 1 : 0,			\
 			.scan_index = 0,				\
-			.scan_type.sign = _diff ? 's' : 'u',		\
+			.scan_type.format = _diff ? 's' : 'u',		\
 			.scan_type.realbits = _bits,			\
 			.scan_type.storagebits = 32,			\
 			.scan_type.endianness = IIO_CPU,		\
@@ -364,7 +364,7 @@ static int ad7944_single_conversion(struct ad7944_adc *adc,
 			*val = adc->sample.raw.u16;
 	}
 
-	if (chan->scan_type.sign == 's')
+	if (chan->scan_type.format == 's')
 		*val = sign_extend32(*val, chan->scan_type.realbits - 1);
 	else
 		*val &= GENMASK(chan->scan_type.realbits - 1, 0);
@@ -410,7 +410,7 @@ static int ad7944_read_raw(struct iio_dev *indio_dev,
 		case IIO_VOLTAGE:
 			*val = adc->ref_mv;
 
-			if (chan->scan_type.sign == 's')
+			if (chan->scan_type.format == 's')
 				*val2 = chan->scan_type.realbits - 1;
 			else
 				*val2 = chan->scan_type.realbits;
diff --git a/drivers/iio/adc/ad799x.c b/drivers/iio/adc/ad799x.c
index 108bb22162ef..5731e6d04eb5 100644
--- a/drivers/iio/adc/ad799x.c
+++ b/drivers/iio/adc/ad799x.c
@@ -586,7 +586,7 @@ static const struct iio_event_spec ad799x_events[] = {
 	.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE), \
 	.scan_index = (_index), \
 	.scan_type = { \
-		.sign = 'u', \
+		.format = 'u', \
 		.realbits = (_realbits), \
 		.storagebits = 16, \
 		.shift = 12 - (_realbits), \
diff --git a/drivers/iio/adc/ad9467.c b/drivers/iio/adc/ad9467.c
index 022888545580..31a7d23020d1 100644
--- a/drivers/iio/adc/ad9467.c
+++ b/drivers/iio/adc/ad9467.c
@@ -319,7 +319,7 @@ static void __ad9467_get_scale(struct ad9467_state *st, int index,
 	.info_mask_shared_by_type_available = avai_mask,		\
 	.scan_index = _si,						\
 	.scan_type = {							\
-		.sign = _sign,						\
+		.format = _sign,					\
 		.realbits = _bits,					\
 		.storagebits = 16,					\
 	},								\
@@ -343,7 +343,7 @@ static const struct iio_chan_spec ad9434_channels[] = {
 			BIT(IIO_CHAN_INFO_CALIBBIAS),
 		.scan_index = 0,
 		.scan_type = {
-			.sign = 's',
+			.format = 's',
 			.realbits = 12,
 			.storagebits = 16,
 		},
diff --git a/drivers/iio/adc/ade9000.c b/drivers/iio/adc/ade9000.c
index db085dc5e526..3523c8fb5409 100644
--- a/drivers/iio/adc/ade9000.c
+++ b/drivers/iio/adc/ade9000.c
@@ -451,7 +451,7 @@ static const struct iio_chan_spec_ext_info ade9000_ext_info[] = {
 	.scan_index = num,						\
 	.indexed = 1,							\
 	.scan_type = {							\
-		.sign = 's',						\
+		.format = 's',						\
 		.realbits = 32,						\
 		.storagebits = 32,					\
 		.endianness = IIO_BE,					\
@@ -471,7 +471,7 @@ static const struct iio_chan_spec_ext_info ade9000_ext_info[] = {
 	.scan_index = num + 1,	/* interleave with current channels */	\
 	.indexed = 1,							\
 	.scan_type = {							\
-		.sign = 's',						\
+		.format = 's',						\
 		.realbits = 32,						\
 		.storagebits = 32,					\
 		.endianness = IIO_BE,					\
diff --git a/drivers/iio/adc/at91-sama5d2_adc.c b/drivers/iio/adc/at91-sama5d2_adc.c
index aa4ba3f5a506..559bed1ed59e 100644
--- a/drivers/iio/adc/at91-sama5d2_adc.c
+++ b/drivers/iio/adc/at91-sama5d2_adc.c
@@ -337,7 +337,7 @@ static const struct at91_adc_reg_layout sama7g5_layout = {
 		.address = addr,					\
 		.scan_index = index,					\
 		.scan_type = {						\
-			.sign = 'u',					\
+			.format = 'u',					\
 			.realbits = rbits,				\
 			.storagebits = 16,				\
 		},							\
@@ -366,7 +366,7 @@ static const struct at91_adc_reg_layout sama7g5_layout = {
 		.address = addr,					\
 		.scan_index = index,					\
 		.scan_type = {						\
-			.sign = 's',					\
+			.format = 's',					\
 			.realbits = rbits,				\
 			.storagebits = 16,				\
 		},							\
@@ -394,7 +394,7 @@ static const struct at91_adc_reg_layout sama7g5_layout = {
 		.channel2 = mod,					\
 		.scan_index = num,					\
 		.scan_type = {						\
-			.sign = 'u',					\
+			.format = 'u',					\
 			.realbits = 12,					\
 			.storagebits = 16,				\
 		},							\
@@ -411,7 +411,7 @@ static const struct at91_adc_reg_layout sama7g5_layout = {
 		.channel = num,						\
 		.scan_index = num,					\
 		.scan_type = {						\
-			.sign = 'u',					\
+			.format = 'u',					\
 			.realbits = 12,					\
 			.storagebits = 16,				\
 		},							\
@@ -1787,7 +1787,7 @@ static int at91_adc_read_info_raw(struct iio_dev *indio_dev,
 	if (ret > 0) {
 		*val = st->conversion_value;
 		ret = at91_adc_adjust_val_osr(st, val);
-		if (chan->scan_type.sign == 's')
+		if (chan->scan_type.format == 's')
 			*val = sign_extend32(*val,
 					     chan->scan_type.realbits - 1);
 		st->conversion_done = false;
diff --git a/drivers/iio/adc/at91_adc.c b/drivers/iio/adc/at91_adc.c
index 920dd9ffd27a..01d52190fd42 100644
--- a/drivers/iio/adc/at91_adc.c
+++ b/drivers/iio/adc/at91_adc.c
@@ -514,7 +514,7 @@ static int at91_adc_channel_init(struct iio_dev *idev)
 		chan->indexed = 1;
 		chan->channel = bit;
 		chan->scan_index = idx;
-		chan->scan_type.sign = 'u';
+		chan->scan_type.format = 'u';
 		chan->scan_type.realbits = st->res;
 		chan->scan_type.storagebits = 16;
 		chan->info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE);
@@ -526,7 +526,7 @@ static int at91_adc_channel_init(struct iio_dev *idev)
 	timestamp->type = IIO_TIMESTAMP;
 	timestamp->channel = -1;
 	timestamp->scan_index = idx;
-	timestamp->scan_type.sign = 's';
+	timestamp->scan_type.format = 's';
 	timestamp->scan_type.realbits = 64;
 	timestamp->scan_type.storagebits = 64;
 
diff --git a/drivers/iio/adc/cc10001_adc.c b/drivers/iio/adc/cc10001_adc.c
index 2c51b90b7101..3a53ab745017 100644
--- a/drivers/iio/adc/cc10001_adc.c
+++ b/drivers/iio/adc/cc10001_adc.c
@@ -281,7 +281,7 @@ static int cc10001_adc_channel_init(struct iio_dev *indio_dev,
 		chan->indexed = 1;
 		chan->channel = bit;
 		chan->scan_index = idx;
-		chan->scan_type.sign = 'u';
+		chan->scan_type.format = 'u';
 		chan->scan_type.realbits = 10;
 		chan->scan_type.storagebits = 16;
 		chan->info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE);
@@ -293,7 +293,7 @@ static int cc10001_adc_channel_init(struct iio_dev *indio_dev,
 	timestamp->type = IIO_TIMESTAMP;
 	timestamp->channel = -1;
 	timestamp->scan_index = idx;
-	timestamp->scan_type.sign = 's';
+	timestamp->scan_type.format = 's';
 	timestamp->scan_type.realbits = 64;
 	timestamp->scan_type.storagebits = 64;
 
diff --git a/drivers/iio/adc/cpcap-adc.c b/drivers/iio/adc/cpcap-adc.c
index d9ee2ea116a7..0c5034c4279e 100644
--- a/drivers/iio/adc/cpcap-adc.c
+++ b/drivers/iio/adc/cpcap-adc.c
@@ -340,7 +340,7 @@ static const int temp_map[CPCAP_MAX_TEMP_LVL][2] = {
 			      BIT(IIO_CHAN_INFO_PROCESSED), \
 	.scan_index = (_index), \
 	.scan_type = { \
-		.sign = 'u', \
+		.format = 'u', \
 		.realbits = 10, \
 		.storagebits = 16, \
 		.endianness = IIO_CPU, \
diff --git a/drivers/iio/adc/dln2-adc.c b/drivers/iio/adc/dln2-adc.c
index eb902a946efe..0db0ac027c9e 100644
--- a/drivers/iio/adc/dln2-adc.c
+++ b/drivers/iio/adc/dln2-adc.c
@@ -438,7 +438,7 @@ static int dln2_update_scan_mode(struct iio_dev *indio_dev,
 	lval.info_mask_shared_by_all = BIT(IIO_CHAN_INFO_SCALE) |	\
 				       BIT(IIO_CHAN_INFO_SAMP_FREQ);	\
 	lval.scan_index = idx;						\
-	lval.scan_type.sign = 'u';					\
+	lval.scan_type.format = 'u';					\
 	lval.scan_type.realbits = DLN2_ADC_DATA_BITS;			\
 	lval.scan_type.storagebits = 16;				\
 	lval.scan_type.endianness = IIO_LE;				\
@@ -449,7 +449,7 @@ static int dln2_update_scan_mode(struct iio_dev *indio_dev,
 	lval.type = IIO_TIMESTAMP;			\
 	lval.channel = -1;				\
 	lval.scan_index = _si;				\
-	lval.scan_type.sign = 's';			\
+	lval.scan_type.format = 's';			\
 	lval.scan_type.realbits = 64;			\
 	lval.scan_type.storagebits = 64;		\
 }
diff --git a/drivers/iio/adc/hx711.c b/drivers/iio/adc/hx711.c
index 1db8b68a8f64..01fe7fa171a5 100644
--- a/drivers/iio/adc/hx711.c
+++ b/drivers/iio/adc/hx711.c
@@ -432,7 +432,7 @@ static const struct iio_chan_spec hx711_chan_spec[] = {
 		.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE),
 		.scan_index = 0,
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 24,
 			.storagebits = 32,
 			.endianness = IIO_CPU,
@@ -446,7 +446,7 @@ static const struct iio_chan_spec hx711_chan_spec[] = {
 		.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE),
 		.scan_index = 1,
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 24,
 			.storagebits = 32,
 			.endianness = IIO_CPU,
diff --git a/drivers/iio/adc/ina2xx-adc.c b/drivers/iio/adc/ina2xx-adc.c
index 857e1b69d6cd..bee4622f4cf6 100644
--- a/drivers/iio/adc/ina2xx-adc.c
+++ b/drivers/iio/adc/ina2xx-adc.c
@@ -623,7 +623,7 @@ static ssize_t ina2xx_shunt_resistor_store(struct device *dev,
 	.info_mask_shared_by_dir = BIT(IIO_CHAN_INFO_SAMP_FREQ), \
 	.scan_index = (_index), \
 	.scan_type = { \
-		.sign = 'u', \
+		.format = 'u', \
 		.realbits = 16, \
 		.storagebits = 16, \
 		.endianness = IIO_CPU, \
@@ -641,7 +641,7 @@ static ssize_t ina2xx_shunt_resistor_store(struct device *dev,
 				   BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO), \
 	.scan_index = (_index), \
 	.scan_type = { \
-		.sign = 'u', \
+		.format = 'u', \
 		.realbits = 16, \
 		.storagebits = 16, \
 		.endianness = IIO_CPU, \
@@ -666,7 +666,7 @@ static ssize_t ina2xx_shunt_resistor_store(struct device *dev,
 	.info_mask_shared_by_dir = BIT(IIO_CHAN_INFO_SAMP_FREQ), \
 	.scan_index = (_index), \
 	.scan_type = { \
-		.sign = 'u', \
+		.format = 'u', \
 		.shift = _shift, \
 		.realbits = 16 - _shift, \
 		.storagebits = 16, \
@@ -686,7 +686,7 @@ static ssize_t ina2xx_shunt_resistor_store(struct device *dev,
 				   BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO), \
 	.scan_index = (_index), \
 	.scan_type = { \
-		.sign = 'u', \
+		.format = 'u', \
 		.realbits = 16, \
 		.storagebits = 16, \
 		.endianness = IIO_LE, \
diff --git a/drivers/iio/adc/ingenic-adc.c b/drivers/iio/adc/ingenic-adc.c
index 1e802c8779a4..129b2b697bda 100644
--- a/drivers/iio/adc/ingenic-adc.c
+++ b/drivers/iio/adc/ingenic-adc.c
@@ -456,7 +456,7 @@ static const struct iio_chan_spec jz4770_channels[] = {
 		.channel = INGENIC_ADC_TOUCH_XP,
 		.scan_index = 0,
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 12,
 			.storagebits = 16,
 		},
@@ -467,7 +467,7 @@ static const struct iio_chan_spec jz4770_channels[] = {
 		.channel = INGENIC_ADC_TOUCH_YP,
 		.scan_index = 1,
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 12,
 			.storagebits = 16,
 		},
@@ -478,7 +478,7 @@ static const struct iio_chan_spec jz4770_channels[] = {
 		.channel = INGENIC_ADC_TOUCH_XN,
 		.scan_index = 2,
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 12,
 			.storagebits = 16,
 		},
@@ -489,7 +489,7 @@ static const struct iio_chan_spec jz4770_channels[] = {
 		.channel = INGENIC_ADC_TOUCH_YN,
 		.scan_index = 3,
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 12,
 			.storagebits = 16,
 		},
@@ -500,7 +500,7 @@ static const struct iio_chan_spec jz4770_channels[] = {
 		.channel = INGENIC_ADC_TOUCH_XD,
 		.scan_index = 4,
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 12,
 			.storagebits = 16,
 		},
@@ -511,7 +511,7 @@ static const struct iio_chan_spec jz4770_channels[] = {
 		.channel = INGENIC_ADC_TOUCH_YD,
 		.scan_index = 5,
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 12,
 			.storagebits = 16,
 		},
diff --git a/drivers/iio/adc/max1027.c b/drivers/iio/adc/max1027.c
index 7e736e77d8bb..270b38b2a1ea 100644
--- a/drivers/iio/adc/max1027.c
+++ b/drivers/iio/adc/max1027.c
@@ -103,7 +103,7 @@ MODULE_DEVICE_TABLE(of, max1027_adc_dt_ids);
 		.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE),	\
 		.scan_index = index + 1,				\
 		.scan_type = {						\
-			.sign = 'u',					\
+			.format = 'u',					\
 			.realbits = depth,				\
 			.storagebits = 16,				\
 			.shift = (depth == 10) ? 2 : 0,			\
@@ -119,7 +119,7 @@ MODULE_DEVICE_TABLE(of, max1027_adc_dt_ids);
 		.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE),	\
 		.scan_index = 0,					\
 		.scan_type = {						\
-			.sign = 'u',					\
+			.format = 'u',					\
 			.realbits = 12,					\
 			.storagebits = 16,				\
 			.endianness = IIO_BE,				\
diff --git a/drivers/iio/adc/max1118.c b/drivers/iio/adc/max1118.c
index 7d7001e8e3d9..34a8eb933991 100644
--- a/drivers/iio/adc/max1118.c
+++ b/drivers/iio/adc/max1118.c
@@ -54,7 +54,7 @@ struct max1118 {
 		.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE),	\
 		.scan_index = ch,					\
 		.scan_type = {						\
-			.sign = 'u',					\
+			.format = 'u',					\
 			.realbits = 8,					\
 			.storagebits = 8,				\
 		},							\
diff --git a/drivers/iio/adc/max11205.c b/drivers/iio/adc/max11205.c
index 6c803df220b6..04faf995ff99 100644
--- a/drivers/iio/adc/max11205.c
+++ b/drivers/iio/adc/max11205.c
@@ -75,7 +75,7 @@ static const struct iio_chan_spec max11205_channels[] = {
 		.type = IIO_VOLTAGE,
 		.indexed = 1,
 		.scan_type = {
-			.sign = 's',
+			.format = 's',
 			.realbits = 16,
 			.storagebits = 16,
 			.endianness = IIO_BE,
diff --git a/drivers/iio/adc/max11410.c b/drivers/iio/adc/max11410.c
index 511b2f14dfaf..46e15608cba9 100644
--- a/drivers/iio/adc/max11410.c
+++ b/drivers/iio/adc/max11410.c
@@ -156,7 +156,7 @@ static const struct iio_chan_spec chanspec_template = {
 	.info_mask_shared_by_all = BIT(IIO_CHAN_INFO_SAMP_FREQ),
 	.info_mask_shared_by_all_available = BIT(IIO_CHAN_INFO_SAMP_FREQ),
 	.scan_type = {
-		.sign = 's',
+		.format = 's',
 		.realbits = 24,
 		.storagebits = 32,
 		.endianness = IIO_LE,
diff --git a/drivers/iio/adc/max1363.c b/drivers/iio/adc/max1363.c
index 9dd547e62b6c..74728dd6ac86 100644
--- a/drivers/iio/adc/max1363.c
+++ b/drivers/iio/adc/max1363.c
@@ -473,7 +473,7 @@ static const struct iio_event_spec max1363_events[] = {
 		.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE),	\
 		.datasheet_name = "AIN"#num,				\
 		.scan_type = {						\
-			.sign = 'u',					\
+			.format = 'u',					\
 			.realbits = bits,				\
 			.storagebits = (bits > 8) ? 16 : 8,		\
 			.endianness = IIO_BE,				\
@@ -496,7 +496,7 @@ static const struct iio_event_spec max1363_events[] = {
 		.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE),	\
 		.datasheet_name = "AIN"#num"-AIN"#num2,			\
 		.scan_type = {						\
-			.sign = 's',					\
+			.format = 's',					\
 			.realbits = bits,				\
 			.storagebits = (bits > 8) ? 16 : 8,		\
 			.endianness = IIO_BE,				\
diff --git a/drivers/iio/adc/mcp3911.c b/drivers/iio/adc/mcp3911.c
index ddc3721f3f68..1c9338594714 100644
--- a/drivers/iio/adc/mcp3911.c
+++ b/drivers/iio/adc/mcp3911.c
@@ -446,7 +446,7 @@ static int mcp3911_calc_scale_table(u32 vref_mv)
 		.info_mask_separate_available =			\
 			BIT(IIO_CHAN_INFO_SCALE),		\
 		.scan_type = {					\
-			.sign = 's',				\
+			.format = 's',				\
 			.realbits = 24,				\
 			.storagebits = 32,			\
 			.endianness = IIO_BE,			\
diff --git a/drivers/iio/adc/mt6359-auxadc.c b/drivers/iio/adc/mt6359-auxadc.c
index f426a289e867..98b11237ca8d 100644
--- a/drivers/iio/adc/mt6359-auxadc.c
+++ b/drivers/iio/adc/mt6359-auxadc.c
@@ -196,7 +196,7 @@ struct mtk_pmic_auxadc_info {
 	.scan_index = PMIC_AUXADC_CHAN_##_ch_idx,				\
 	.datasheet_name = __stringify(_name),					\
 	.scan_type =  {								\
-		.sign = 'u',							\
+		.format = 'u',							\
 		.realbits = _nbits,						\
 		.storagebits = 16,						\
 		.endianness = IIO_CPU						\
diff --git a/drivers/iio/adc/mt6360-adc.c b/drivers/iio/adc/mt6360-adc.c
index e0e4df418612..c2b2b7aa8dd5 100644
--- a/drivers/iio/adc/mt6360-adc.c
+++ b/drivers/iio/adc/mt6360-adc.c
@@ -230,7 +230,7 @@ static const struct iio_info mt6360_adc_iio_info = {
 	.scan_index = MT6360_CHAN_##_idx,			\
 	.datasheet_name = #_idx,				\
 	.scan_type =  {						\
-		.sign = 'u',					\
+		.format = 'u',					\
 		.realbits = 16,					\
 		.storagebits = 16,				\
 		.endianness = IIO_CPU,				\
diff --git a/drivers/iio/adc/mxs-lradc-adc.c b/drivers/iio/adc/mxs-lradc-adc.c
index dda5182a5076..97b04bccc5a8 100644
--- a/drivers/iio/adc/mxs-lradc-adc.c
+++ b/drivers/iio/adc/mxs-lradc-adc.c
@@ -582,7 +582,7 @@ static const struct iio_buffer_setup_ops mxs_lradc_adc_buffer_ops = {
 	.channel = (idx),					\
 	.address = (idx),					\
 	.scan_type = {						\
-		.sign = 'u',					\
+		.format = 'u',					\
 		.realbits = LRADC_RESOLUTION,			\
 		.storagebits = 32,				\
 	},							\
@@ -607,7 +607,7 @@ static const struct iio_chan_spec mx23_lradc_chan_spec[] = {
 				      BIT(IIO_CHAN_INFO_OFFSET) |
 				      BIT(IIO_CHAN_INFO_SCALE),
 		.channel = 8,
-		.scan_type = {.sign = 'u', .realbits = 18, .storagebits = 32,},
+		.scan_type = {.format = 'u', .realbits = 18, .storagebits = 32,},
 		.datasheet_name = "TEMP_DIE",
 	},
 	/* Hidden channel to keep indexes */
@@ -643,7 +643,7 @@ static const struct iio_chan_spec mx28_lradc_chan_spec[] = {
 				      BIT(IIO_CHAN_INFO_OFFSET) |
 				      BIT(IIO_CHAN_INFO_SCALE),
 		.channel = 8,
-		.scan_type = {.sign = 'u', .realbits = 18, .storagebits = 32,},
+		.scan_type = {.format = 'u', .realbits = 18, .storagebits = 32,},
 		.datasheet_name = "TEMP_DIE",
 	},
 	/* Hidden channel to keep indexes */
diff --git a/drivers/iio/adc/nxp-sar-adc.c b/drivers/iio/adc/nxp-sar-adc.c
index 9efa883c277d..2faa4c583167 100644
--- a/drivers/iio/adc/nxp-sar-adc.c
+++ b/drivers/iio/adc/nxp-sar-adc.c
@@ -167,7 +167,7 @@ struct nxp_sar_adc_data {
 				BIT(IIO_CHAN_INFO_SAMP_FREQ),	\
 	.scan_index = (_idx),					\
 	.scan_type = {						\
-		.sign = 'u',					\
+		.format = 'u',					\
 		.realbits = 12,					\
 		.storagebits = 16,				\
 	},							\
diff --git a/drivers/iio/adc/pac1921.c b/drivers/iio/adc/pac1921.c
index a0227b57f238..ec800d2add06 100644
--- a/drivers/iio/adc/pac1921.c
+++ b/drivers/iio/adc/pac1921.c
@@ -937,7 +937,7 @@ static const struct iio_chan_spec pac1921_channels[] = {
 		.address = PAC1921_REG_VBUS,
 		.scan_index = PAC1921_CHAN_VBUS,
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 10,
 			.storagebits = 16,
 			.endianness = IIO_CPU
@@ -960,7 +960,7 @@ static const struct iio_chan_spec pac1921_channels[] = {
 		.address = PAC1921_REG_VSENSE,
 		.scan_index = PAC1921_CHAN_VSENSE,
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 10,
 			.storagebits = 16,
 			.endianness = IIO_CPU
@@ -983,7 +983,7 @@ static const struct iio_chan_spec pac1921_channels[] = {
 		.address = PAC1921_REG_VSENSE,
 		.scan_index = PAC1921_CHAN_CURRENT,
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 10,
 			.storagebits = 16,
 			.endianness = IIO_CPU
@@ -1005,7 +1005,7 @@ static const struct iio_chan_spec pac1921_channels[] = {
 		.address = PAC1921_REG_VPOWER,
 		.scan_index = PAC1921_CHAN_POWER,
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 10,
 			.storagebits = 16,
 			.endianness = IIO_CPU
diff --git a/drivers/iio/adc/pac1934.c b/drivers/iio/adc/pac1934.c
index 712b5e9caba6..ab489739a3a5 100644
--- a/drivers/iio/adc/pac1934.c
+++ b/drivers/iio/adc/pac1934.c
@@ -330,7 +330,7 @@ struct pac1934_chip_info {
 	.info_mask_shared_by_all_available = BIT(IIO_CHAN_INFO_SAMP_FREQ),	\
 	.scan_index = (_si),							\
 	.scan_type = {								\
-		.sign = 'u',							\
+		.format = 'u',							\
 		.realbits = 48,							\
 		.storagebits = 64,						\
 		.endianness = IIO_CPU,						\
@@ -348,7 +348,7 @@ struct pac1934_chip_info {
 	.info_mask_shared_by_all_available = BIT(IIO_CHAN_INFO_SAMP_FREQ),	\
 	.scan_index = (_si),							\
 	.scan_type = {								\
-		.sign = 'u',							\
+		.format = 'u',							\
 		.realbits = 16,							\
 		.storagebits = 16,						\
 		.endianness = IIO_CPU,						\
@@ -366,7 +366,7 @@ struct pac1934_chip_info {
 	.info_mask_shared_by_all_available = BIT(IIO_CHAN_INFO_SAMP_FREQ),	\
 	.scan_index = (_si),							\
 	.scan_type = {								\
-		.sign = 'u',							\
+		.format = 'u',							\
 		.realbits = 16,							\
 		.storagebits = 16,						\
 		.endianness = IIO_CPU,						\
@@ -384,7 +384,7 @@ struct pac1934_chip_info {
 	.info_mask_shared_by_all_available = BIT(IIO_CHAN_INFO_SAMP_FREQ),	\
 	.scan_index = (_si),							\
 	.scan_type = {								\
-		.sign = 'u',							\
+		.format = 'u',							\
 		.realbits = 16,							\
 		.storagebits = 16,						\
 		.endianness = IIO_CPU,						\
@@ -402,7 +402,7 @@ struct pac1934_chip_info {
 	.info_mask_shared_by_all_available = BIT(IIO_CHAN_INFO_SAMP_FREQ),	\
 	.scan_index = (_si),							\
 	.scan_type = {								\
-		.sign = 'u',							\
+		.format = 'u',							\
 		.realbits = 16,							\
 		.storagebits = 16,						\
 		.endianness = IIO_CPU,						\
@@ -420,7 +420,7 @@ struct pac1934_chip_info {
 	.info_mask_shared_by_all_available = BIT(IIO_CHAN_INFO_SAMP_FREQ),	\
 	.scan_index = (_si),							\
 	.scan_type = {								\
-		.sign = 'u',							\
+		.format = 'u',							\
 		.realbits = 28,							\
 		.storagebits = 32,						\
 		.shift = 4,							\
@@ -839,7 +839,7 @@ static int pac1934_read_raw(struct iio_dev *indio_dev,
 		case PAC1934_VBUS_AVG_3_ADDR:
 		case PAC1934_VBUS_AVG_4_ADDR:
 			*val = PAC1934_VOLTAGE_MILLIVOLTS_MAX;
-			if (chan->scan_type.sign == 'u')
+			if (chan->scan_type.format == 'u')
 				*val2 = PAC1934_VOLTAGE_U_RES;
 			else
 				*val2 = PAC1934_VOLTAGE_S_RES;
@@ -858,7 +858,7 @@ static int pac1934_read_raw(struct iio_dev *indio_dev,
 		case PAC1934_VSENSE_AVG_3_ADDR:
 		case PAC1934_VSENSE_AVG_4_ADDR:
 			*val = PAC1934_MAX_VSENSE_RSHIFTED_BY_16B;
-			if (chan->scan_type.sign == 'u')
+			if (chan->scan_type.format == 'u')
 				*val2 = info->shunts[channel];
 			else
 				*val2 = info->shunts[channel] >> 1;
@@ -873,7 +873,7 @@ static int pac1934_read_raw(struct iio_dev *indio_dev,
 		case PAC1934_VPOWER_3_ADDR:
 		case PAC1934_VPOWER_4_ADDR:
 			*val = PAC1934_MAX_VPOWER_RSHIFTED_BY_28B;
-			if (chan->scan_type.sign == 'u')
+			if (chan->scan_type.format == 'u')
 				*val2 = info->shunts[channel];
 			else
 				*val2 = info->shunts[channel] >> 1;
@@ -888,7 +888,7 @@ static int pac1934_read_raw(struct iio_dev *indio_dev,
 			 */
 			*val = PAC1934_SCALE_CONSTANT;
 
-			if (chan->scan_type.sign == 'u')
+			if (chan->scan_type.format == 'u')
 				*val2 = info->shunts[channel];
 			else
 				*val2 = info->shunts[channel] >> 1;
@@ -1393,17 +1393,17 @@ static int pac1934_prep_iio_channels(struct pac1934_chip_info *info, struct iio_
 		 * whole chip rail(channel) is bi-directional
 		 */
 		if (info->bi_dir[cnt]) {
-			ch_sp[PAC1934_CH_ENERGY].scan_type.sign = 's';
+			ch_sp[PAC1934_CH_ENERGY].scan_type.format = 's';
 			ch_sp[PAC1934_CH_ENERGY].scan_type.realbits = 47;
-			ch_sp[PAC1934_CH_POWER].scan_type.sign = 's';
+			ch_sp[PAC1934_CH_POWER].scan_type.format = 's';
 			ch_sp[PAC1934_CH_POWER].scan_type.realbits = 27;
-			ch_sp[PAC1934_CH_VOLTAGE].scan_type.sign = 's';
+			ch_sp[PAC1934_CH_VOLTAGE].scan_type.format = 's';
 			ch_sp[PAC1934_CH_VOLTAGE].scan_type.realbits = 15;
-			ch_sp[PAC1934_CH_CURRENT].scan_type.sign = 's';
+			ch_sp[PAC1934_CH_CURRENT].scan_type.format = 's';
 			ch_sp[PAC1934_CH_CURRENT].scan_type.realbits = 15;
-			ch_sp[PAC1934_CH_VOLTAGE_AVERAGE].scan_type.sign = 's';
+			ch_sp[PAC1934_CH_VOLTAGE_AVERAGE].scan_type.format = 's';
 			ch_sp[PAC1934_CH_VOLTAGE_AVERAGE].scan_type.realbits = 15;
-			ch_sp[PAC1934_CH_CURRENT_AVERAGE].scan_type.sign = 's';
+			ch_sp[PAC1934_CH_CURRENT_AVERAGE].scan_type.format = 's';
 			ch_sp[PAC1934_CH_CURRENT_AVERAGE].scan_type.realbits = 15;
 		}
 		tmp_data += sizeof(pac1934_single_channel);
diff --git a/drivers/iio/adc/rockchip_saradc.c b/drivers/iio/adc/rockchip_saradc.c
index 0f0bf2906af0..44d084b32dee 100644
--- a/drivers/iio/adc/rockchip_saradc.c
+++ b/drivers/iio/adc/rockchip_saradc.c
@@ -221,7 +221,7 @@ static const struct iio_info rockchip_saradc_iio_info = {
 	.datasheet_name = _id,					\
 	.scan_index = _index,					\
 	.scan_type = {						\
-		.sign = 'u',					\
+		.format = 'u',					\
 		.realbits = _res,				\
 		.storagebits = 16,				\
 		.endianness = IIO_CPU,				\
diff --git a/drivers/iio/adc/rtq6056.c b/drivers/iio/adc/rtq6056.c
index 2bf3a09ac6b0..b16e0dc507c1 100644
--- a/drivers/iio/adc/rtq6056.c
+++ b/drivers/iio/adc/rtq6056.c
@@ -127,7 +127,7 @@ static const struct iio_chan_spec rtq6056_channels[RTQ6056_MAX_CHANNEL + 1] = {
 		.info_mask_shared_by_all_available = BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO),
 		.scan_index = 0,
 		.scan_type = {
-			.sign = 's',
+			.format = 's',
 			.realbits = 16,
 			.storagebits = 16,
 			.endianness = IIO_CPU,
@@ -146,7 +146,7 @@ static const struct iio_chan_spec rtq6056_channels[RTQ6056_MAX_CHANNEL + 1] = {
 		.info_mask_shared_by_all_available = BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO),
 		.scan_index = 1,
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 16,
 			.storagebits = 16,
 			.endianness = IIO_CPU,
@@ -164,7 +164,7 @@ static const struct iio_chan_spec rtq6056_channels[RTQ6056_MAX_CHANNEL + 1] = {
 		.info_mask_shared_by_all_available = BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO),
 		.scan_index = 2,
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 16,
 			.storagebits = 16,
 			.endianness = IIO_CPU,
@@ -181,7 +181,7 @@ static const struct iio_chan_spec rtq6056_channels[RTQ6056_MAX_CHANNEL + 1] = {
 		.info_mask_shared_by_all_available = BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO),
 		.scan_index = 3,
 		.scan_type = {
-			.sign = 's',
+			.format = 's',
 			.realbits = 16,
 			.storagebits = 16,
 			.endianness = IIO_CPU,
@@ -210,7 +210,7 @@ static const struct iio_chan_spec rtq6059_channels[RTQ6056_MAX_CHANNEL + 1] = {
 		.info_mask_shared_by_all_available = BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO),
 		.scan_index = 0,
 		.scan_type = {
-			.sign = 's',
+			.format = 's',
 			.realbits = 16,
 			.storagebits = 16,
 			.endianness = IIO_CPU,
@@ -228,7 +228,7 @@ static const struct iio_chan_spec rtq6059_channels[RTQ6056_MAX_CHANNEL + 1] = {
 		.info_mask_shared_by_all_available = BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO),
 		.scan_index = 1,
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 16,
 			.storagebits = 16,
 			.endianness = IIO_CPU,
@@ -246,7 +246,7 @@ static const struct iio_chan_spec rtq6059_channels[RTQ6056_MAX_CHANNEL + 1] = {
 		.info_mask_shared_by_all_available = BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO),
 		.scan_index = 2,
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 16,
 			.storagebits = 16,
 			.endianness = IIO_CPU,
@@ -263,7 +263,7 @@ static const struct iio_chan_spec rtq6059_channels[RTQ6056_MAX_CHANNEL + 1] = {
 		.info_mask_shared_by_all_available = BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO),
 		.scan_index = 3,
 		.scan_type = {
-			.sign = 's',
+			.format = 's',
 			.realbits = 16,
 			.storagebits = 16,
 			.endianness = IIO_CPU,
diff --git a/drivers/iio/adc/sd_adc_modulator.c b/drivers/iio/adc/sd_adc_modulator.c
index 9f7a75168aac..584f9c2d97f9 100644
--- a/drivers/iio/adc/sd_adc_modulator.c
+++ b/drivers/iio/adc/sd_adc_modulator.c
@@ -21,7 +21,7 @@ static const struct iio_chan_spec iio_sd_mod_ch = {
 	.type = IIO_VOLTAGE,
 	.indexed = 1,
 	.scan_type = {
-		.sign = 'u',
+		.format = 'u',
 		.realbits = 1,
 		.shift = 0,
 	},
diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
index 2d7f88459c7c..80499bca915e 100644
--- a/drivers/iio/adc/stm32-adc.c
+++ b/drivers/iio/adc/stm32-adc.c
@@ -2109,7 +2109,7 @@ static void stm32_adc_chan_init_one(struct iio_dev *indio_dev,
 		chan->info_mask_shared_by_all |= BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO);
 		chan->info_mask_shared_by_all_available = BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO);
 	}
-	chan->scan_type.sign = 'u';
+	chan->scan_type.format = 'u';
 	chan->scan_type.realbits = adc->cfg->adc_info->resolutions[adc->res];
 	chan->scan_type.storagebits = 16;
 	chan->ext_info = stm32_adc_ext_info;
@@ -2448,7 +2448,7 @@ static int stm32_adc_chan_fw_init(struct iio_dev *indio_dev, bool timestamping)
 		timestamp->type = IIO_TIMESTAMP;
 		timestamp->channel = -1;
 		timestamp->scan_index = scan_index;
-		timestamp->scan_type.sign = 's';
+		timestamp->scan_type.format = 's';
 		timestamp->scan_type.realbits = 64;
 		timestamp->scan_type.storagebits = 64;
 
diff --git a/drivers/iio/adc/stm32-dfsdm-adc.c b/drivers/iio/adc/stm32-dfsdm-adc.c
index 9664b9bd75d4..7241c443060e 100644
--- a/drivers/iio/adc/stm32-dfsdm-adc.c
+++ b/drivers/iio/adc/stm32-dfsdm-adc.c
@@ -1559,7 +1559,7 @@ static int stm32_dfsdm_adc_chan_init_one(struct iio_dev *indio_dev, struct iio_c
 	} else {
 		ch->scan_type.shift = 8;
 	}
-	ch->scan_type.sign = 's';
+	ch->scan_type.format = 's';
 	ch->scan_type.realbits = 24;
 	ch->scan_type.storagebits = 32;
 
diff --git a/drivers/iio/adc/ti-adc081c.c b/drivers/iio/adc/ti-adc081c.c
index 8ef51c57912d..308e03c08068 100644
--- a/drivers/iio/adc/ti-adc081c.c
+++ b/drivers/iio/adc/ti-adc081c.c
@@ -81,7 +81,7 @@ static int adc081c_read_raw(struct iio_dev *iio,
 	.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE),	\
 	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),		\
 	.scan_type = {						\
-		.sign = 'u',					\
+		.format = 'u',					\
 		.realbits = (_bits),				\
 		.storagebits = 16,				\
 		.shift = 12 - (_bits),				\
diff --git a/drivers/iio/adc/ti-adc0832.c b/drivers/iio/adc/ti-adc0832.c
index cfcdafbe284b..41554d6f1fd9 100644
--- a/drivers/iio/adc/ti-adc0832.c
+++ b/drivers/iio/adc/ti-adc0832.c
@@ -49,7 +49,7 @@ struct adc0832 {
 		.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE),	\
 		.scan_index = chan,					\
 		.scan_type = {						\
-			.sign = 'u',					\
+			.format = 'u',					\
 			.realbits = 8,					\
 			.storagebits = 8,				\
 		},							\
@@ -66,7 +66,7 @@ struct adc0832 {
 		.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE),	\
 		.scan_index = si,					\
 		.scan_type = {						\
-			.sign = 'u',					\
+			.format = 'u',					\
 			.realbits = 8,					\
 			.storagebits = 8,				\
 		},							\
diff --git a/drivers/iio/adc/ti-adc084s021.c b/drivers/iio/adc/ti-adc084s021.c
index a100f770fa1c..0651847bfd70 100644
--- a/drivers/iio/adc/ti-adc084s021.c
+++ b/drivers/iio/adc/ti-adc084s021.c
@@ -46,7 +46,7 @@ struct adc084s021 {
 		.indexed = 1,                                        \
 		.scan_index = (num),                                 \
 		.scan_type = {                                       \
-			.sign = 'u',                                       \
+			.format = 'u',                                     \
 			.realbits = 8,                                     \
 			.storagebits = 16,                                 \
 			.shift = 4,                                        \
diff --git a/drivers/iio/adc/ti-adc108s102.c b/drivers/iio/adc/ti-adc108s102.c
index 7d615e2bbf39..2103ef1b149e 100644
--- a/drivers/iio/adc/ti-adc108s102.c
+++ b/drivers/iio/adc/ti-adc108s102.c
@@ -90,7 +90,7 @@ struct adc108s102_state {
 		.address = index,					\
 		.scan_index = index,					\
 		.scan_type = {						\
-			.sign = 'u',					\
+			.format = 'u',					\
 			.realbits = ADC108S102_BITS,			\
 			.storagebits = 16,				\
 			.endianness = IIO_BE,				\
diff --git a/drivers/iio/adc/ti-adc12138.c b/drivers/iio/adc/ti-adc12138.c
index e5ec4b073daa..368ac836316d 100644
--- a/drivers/iio/adc/ti-adc12138.c
+++ b/drivers/iio/adc/ti-adc12138.c
@@ -67,7 +67,7 @@ struct adc12138 {
 					| BIT(IIO_CHAN_INFO_OFFSET),	\
 		.scan_index = chan,					\
 		.scan_type = {						\
-			.sign = 's',					\
+			.format = 's',					\
 			.realbits = 13,					\
 			.storagebits = 16,				\
 			.shift = 3,					\
@@ -87,7 +87,7 @@ struct adc12138 {
 					| BIT(IIO_CHAN_INFO_OFFSET),	\
 		.scan_index = si,					\
 		.scan_type = {						\
-			.sign = 's',					\
+			.format = 's',					\
 			.realbits = 13,					\
 			.storagebits = 16,				\
 			.shift = 3,					\
diff --git a/drivers/iio/adc/ti-adc161s626.c b/drivers/iio/adc/ti-adc161s626.c
index 28aa6b80160c..2446b0be6716 100644
--- a/drivers/iio/adc/ti-adc161s626.c
+++ b/drivers/iio/adc/ti-adc161s626.c
@@ -38,7 +38,7 @@ static const struct iio_chan_spec ti_adc141s626_channels[] = {
 				      BIT(IIO_CHAN_INFO_OFFSET),
 		.scan_index = 0,
 		.scan_type = {
-			.sign = 's',
+			.format = 's',
 			.realbits = 14,
 			.storagebits = 16,
 		},
@@ -55,7 +55,7 @@ static const struct iio_chan_spec ti_adc161s626_channels[] = {
 				      BIT(IIO_CHAN_INFO_OFFSET),
 		.scan_index = 0,
 		.scan_type = {
-			.sign = 's',
+			.format = 's',
 			.realbits = 16,
 			.storagebits = 16,
 		},
diff --git a/drivers/iio/adc/ti-ads1015.c b/drivers/iio/adc/ti-ads1015.c
index f2a93c63ca14..1a165bc88a46 100644
--- a/drivers/iio/adc/ti-ads1015.c
+++ b/drivers/iio/adc/ti-ads1015.c
@@ -193,7 +193,7 @@ static const struct iio_event_spec ads1015_events[] = {
 				BIT(IIO_CHAN_INFO_SAMP_FREQ),	\
 	.scan_index = _addr,					\
 	.scan_type = {						\
-		.sign = 's',					\
+		.format = 's',					\
 		.realbits = (_realbits),			\
 		.storagebits = FIT_CHECK((_realbits) + (_shift), 16),	\
 		.shift = (_shift),				\
@@ -219,7 +219,7 @@ static const struct iio_event_spec ads1015_events[] = {
 				BIT(IIO_CHAN_INFO_SAMP_FREQ),	\
 	.scan_index = _addr,					\
 	.scan_type = {						\
-		.sign = 's',					\
+		.format = 's',					\
 		.realbits = (_realbits),			\
 		.storagebits = FIT_CHECK((_realbits) + (_shift), 16),	\
 		.shift = (_shift),				\
diff --git a/drivers/iio/adc/ti-ads1018.c b/drivers/iio/adc/ti-ads1018.c
index 6246b3cab71f..b3757657aa4c 100644
--- a/drivers/iio/adc/ti-ads1018.c
+++ b/drivers/iio/adc/ti-ads1018.c
@@ -105,7 +105,7 @@ struct ads1018 {
 	.channel2 = _chan2,							\
 	.scan_index = _index,							\
 	.scan_type = {								\
-		.sign = 's',							\
+		.format = 's',							\
 		.realbits = _realbits,						\
 		.storagebits = 16,						\
 		.shift = 16 - _realbits,					\
@@ -125,7 +125,7 @@ struct ads1018 {
 	.channel = _chan,							\
 	.scan_index = _index,							\
 	.scan_type = {								\
-		.sign = 's',							\
+		.format = 's',							\
 		.realbits = _realbits,						\
 		.storagebits = 16,						\
 		.shift = 16 - _realbits,					\
@@ -143,7 +143,7 @@ struct ads1018 {
 	.type = IIO_TEMP,							\
 	.scan_index = _index,							\
 	.scan_type = {								\
-		.sign = 's',							\
+		.format = 's',							\
 		.realbits = _realbits,						\
 		.storagebits = 16,						\
 		.shift = 16 - _realbits,					\
diff --git a/drivers/iio/adc/ti-ads1100.c b/drivers/iio/adc/ti-ads1100.c
index aa8946063c7d..386d554c7ba1 100644
--- a/drivers/iio/adc/ti-ads1100.c
+++ b/drivers/iio/adc/ti-ads1100.c
@@ -60,7 +60,7 @@ static const struct iio_chan_spec ads1100_channel = {
 	.info_mask_shared_by_all_available =
 	    BIT(IIO_CHAN_INFO_SCALE) | BIT(IIO_CHAN_INFO_SAMP_FREQ),
 	.scan_type = {
-		      .sign = 's',
+		      .format = 's',
 		      .realbits = 16,
 		      .storagebits = 16,
 		      .endianness = IIO_CPU,
diff --git a/drivers/iio/adc/ti-ads1119.c b/drivers/iio/adc/ti-ads1119.c
index c9cedc59cdcd..11a8366597c9 100644
--- a/drivers/iio/adc/ti-ads1119.c
+++ b/drivers/iio/adc/ti-ads1119.c
@@ -586,7 +586,7 @@ static int ads1119_alloc_and_config_channels(struct iio_dev *indio_dev)
 		BIT(IIO_CHAN_INFO_SCALE) |
 		BIT(IIO_CHAN_INFO_SAMP_FREQ),
 		.scan_type = {
-			.sign = 's',
+			.format = 's',
 			.realbits = 16,
 			.storagebits = 16,
 			.endianness = IIO_CPU,
diff --git a/drivers/iio/adc/ti-ads124s08.c b/drivers/iio/adc/ti-ads124s08.c
index 8ea1269f74db..656e5746c1e3 100644
--- a/drivers/iio/adc/ti-ads124s08.c
+++ b/drivers/iio/adc/ti-ads124s08.c
@@ -117,7 +117,7 @@ struct ads124s_private {
 	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),		\
 	.scan_index = index,					\
 	.scan_type = {						\
-		.sign = 'u',					\
+		.format = 'u',					\
 		.realbits = 32,					\
 		.storagebits = 32,				\
 	},							\
diff --git a/drivers/iio/adc/ti-ads1298.c b/drivers/iio/adc/ti-ads1298.c
index ae30b47e4514..3f4d763d02f7 100644
--- a/drivers/iio/adc/ti-ads1298.c
+++ b/drivers/iio/adc/ti-ads1298.c
@@ -149,7 +149,7 @@ struct ads1298_private {
 		BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO),	\
 	.scan_index = index,				\
 	.scan_type = {					\
-		.sign = 's',				\
+		.format = 's',				\
 		.realbits = ADS1298_BITS_PER_SAMPLE,	\
 		.storagebits = 32,			\
 		.endianness = IIO_CPU,			\
diff --git a/drivers/iio/adc/ti-ads131e08.c b/drivers/iio/adc/ti-ads131e08.c
index a585621b0bc3..8e76c224bb13 100644
--- a/drivers/iio/adc/ti-ads131e08.c
+++ b/drivers/iio/adc/ti-ads131e08.c
@@ -768,7 +768,7 @@ static int ads131e08_alloc_channels(struct iio_dev *indio_dev)
 						BIT(IIO_CHAN_INFO_SCALE);
 		channels[i].info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SAMP_FREQ);
 		channels[i].scan_index = channel;
-		channels[i].scan_type.sign = 's';
+		channels[i].scan_type.format = 's';
 		channels[i].scan_type.realbits = 24;
 		channels[i].scan_type.storagebits = 32;
 		channels[i].scan_type.shift = 8;
diff --git a/drivers/iio/adc/ti-ads7950.c b/drivers/iio/adc/ti-ads7950.c
index bbe1ce577789..a16c5de2afcb 100644
--- a/drivers/iio/adc/ti-ads7950.c
+++ b/drivers/iio/adc/ti-ads7950.c
@@ -144,7 +144,7 @@ enum ti_ads7950_id {
 	.datasheet_name = "CH##index",				\
 	.scan_index = index,					\
 	.scan_type = {						\
-		.sign = 'u',					\
+		.format = 'u',					\
 		.realbits = bits,				\
 		.storagebits = 16,				\
 		.shift = 12 - (bits),				\
diff --git a/drivers/iio/adc/ti-ads8688.c b/drivers/iio/adc/ti-ads8688.c
index b0bf46cae0b6..df57fc4021d2 100644
--- a/drivers/iio/adc/ti-ads8688.c
+++ b/drivers/iio/adc/ti-ads8688.c
@@ -157,7 +157,7 @@ static const struct attribute_group ads8688_attribute_group = {
 			      | BIT(IIO_CHAN_INFO_OFFSET),	\
 	.scan_index = index,					\
 	.scan_type = {						\
-		.sign = 'u',					\
+		.format = 'u',					\
 		.realbits = 16,					\
 		.storagebits = 16,				\
 		.endianness = IIO_BE,				\
diff --git a/drivers/iio/adc/ti-lmp92064.c b/drivers/iio/adc/ti-lmp92064.c
index 7e57006a8a12..1f043180383f 100644
--- a/drivers/iio/adc/ti-lmp92064.c
+++ b/drivers/iio/adc/ti-lmp92064.c
@@ -96,7 +96,7 @@ static const struct iio_chan_spec lmp92064_adc_channels[] = {
 			BIT(IIO_CHAN_INFO_RAW) | BIT(IIO_CHAN_INFO_SCALE),
 		.scan_index = TI_LMP92064_CHAN_INC,
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 12,
 			.storagebits = 16,
 		},
@@ -109,7 +109,7 @@ static const struct iio_chan_spec lmp92064_adc_channels[] = {
 			BIT(IIO_CHAN_INFO_RAW) | BIT(IIO_CHAN_INFO_SCALE),
 		.scan_index = TI_LMP92064_CHAN_INV,
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 12,
 			.storagebits = 16,
 		},
diff --git a/drivers/iio/adc/ti-tlc4541.c b/drivers/iio/adc/ti-tlc4541.c
index f67945c62c99..514815f048af 100644
--- a/drivers/iio/adc/ti-tlc4541.c
+++ b/drivers/iio/adc/ti-tlc4541.c
@@ -60,7 +60,7 @@ enum tlc4541_id {
 		.info_mask_separate       = BIT(IIO_CHAN_INFO_RAW),   \
 		.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE), \
 		.scan_type = {                                        \
-			.sign = 'u',                                  \
+			.format = 'u',                                \
 			.realbits = (bits),                           \
 			.storagebits = 16,                            \
 			.shift = (bitshift),                          \
diff --git a/drivers/iio/adc/ti-tsc2046.c b/drivers/iio/adc/ti-tsc2046.c
index aba4b10a17ac..cd891338fe4b 100644
--- a/drivers/iio/adc/ti-tsc2046.c
+++ b/drivers/iio/adc/ti-tsc2046.c
@@ -192,7 +192,7 @@ struct tsc2046_adc_priv {
 	.datasheet_name = "#name",				\
 	.scan_index = index,					\
 	.scan_type = {						\
-		.sign = 'u',					\
+		.format = 'u',					\
 		.realbits = bits,				\
 		.storagebits = 16,				\
 		.endianness = IIO_CPU,				\
diff --git a/drivers/iio/adc/ti_am335x_adc.c b/drivers/iio/adc/ti_am335x_adc.c
index a1a28584de93..8ec440503a6c 100644
--- a/drivers/iio/adc/ti_am335x_adc.c
+++ b/drivers/iio/adc/ti_am335x_adc.c
@@ -417,7 +417,7 @@ static int tiadc_channel_init(struct device *dev, struct iio_dev *indio_dev,
 		chan->info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE);
 		chan->datasheet_name = chan_name_ain[chan->channel];
 		chan->scan_index = i;
-		chan->scan_type.sign = 'u';
+		chan->scan_type.format = 'u';
 		chan->scan_type.realbits = 12;
 		chan->scan_type.storagebits = 16;
 	}
diff --git a/drivers/iio/adc/vf610_adc.c b/drivers/iio/adc/vf610_adc.c
index d7182ed0d2a7..be6f0b4d9ced 100644
--- a/drivers/iio/adc/vf610_adc.c
+++ b/drivers/iio/adc/vf610_adc.c
@@ -515,7 +515,7 @@ static const struct iio_chan_spec_ext_info vf610_ext_info[] = {
 	.ext_info = vf610_ext_info,				\
 	.scan_index = (_idx),			\
 	.scan_type = {					\
-		.sign = 'u',				\
+		.format = 'u',				\
 		.realbits = 12,				\
 		.storagebits = 16,			\
 	},						\
@@ -527,7 +527,7 @@ static const struct iio_chan_spec_ext_info vf610_ext_info[] = {
 	.info_mask_separate = BIT(IIO_CHAN_INFO_PROCESSED),	\
 	.scan_index = (_idx),					\
 	.scan_type = {						\
-		.sign = 'u',					\
+		.format = 'u',					\
 		.realbits = 12,					\
 		.storagebits = 16,				\
 	},							\
diff --git a/drivers/iio/adc/xilinx-ams.c b/drivers/iio/adc/xilinx-ams.c
index 124470c92529..83c5872b04a4 100644
--- a/drivers/iio/adc/xilinx-ams.c
+++ b/drivers/iio/adc/xilinx-ams.c
@@ -1208,7 +1208,7 @@ static int ams_get_ext_chan(struct fwnode_handle *chan_node,
 		memcpy(chan, &ams_pl_channels[ext_chan], sizeof(*channels));
 
 		if (fwnode_property_read_bool(child, "xlnx,bipolar"))
-			chan->scan_type.sign = 's';
+			chan->scan_type.format = 's';
 
 		num_channels++;
 	}
diff --git a/drivers/iio/adc/xilinx-xadc-core.c b/drivers/iio/adc/xilinx-xadc-core.c
index e257c1b94a5f..40c854076e84 100644
--- a/drivers/iio/adc/xilinx-xadc-core.c
+++ b/drivers/iio/adc/xilinx-xadc-core.c
@@ -928,7 +928,7 @@ static int xadc_read_raw(struct iio_dev *indio_dev,
 			return ret;
 
 		val16 >>= chan->scan_type.shift;
-		if (chan->scan_type.sign == 'u')
+		if (chan->scan_type.format == 'u')
 			*val = val16;
 		else
 			*val = sign_extend32(val16, bits - 1);
@@ -1066,7 +1066,7 @@ static const struct iio_event_spec xadc_voltage_events[] = {
 	.num_event_specs = ARRAY_SIZE(xadc_temp_events), \
 	.scan_index = (_scan_index), \
 	.scan_type = { \
-		.sign = 'u', \
+		.format = 'u', \
 		.realbits = (_bits), \
 		.storagebits = 16, \
 		.shift = 16 - (_bits), \
@@ -1086,7 +1086,7 @@ static const struct iio_event_spec xadc_voltage_events[] = {
 	.num_event_specs = (_alarm) ? ARRAY_SIZE(xadc_voltage_events) : 0, \
 	.scan_index = (_scan_index), \
 	.scan_type = { \
-		.sign = ((_addr) == XADC_REG_VREFN) ? 's' : 'u', \
+		.format = ((_addr) == XADC_REG_VREFN) ? 's' : 'u', \
 		.realbits = (_bits), \
 		.storagebits = 16, \
 		.shift = 16 - (_bits), \
@@ -1265,7 +1265,7 @@ static int xadc_parse_dt(struct iio_dev *indio_dev, unsigned int *conf, int irq)
 			continue;
 
 		if (fwnode_property_read_bool(child, "xlnx,bipolar"))
-			chan->scan_type.sign = 's';
+			chan->scan_type.format = 's';
 
 		if (reg == 0) {
 			chan->scan_index = 11;
@@ -1420,7 +1420,7 @@ static int xadc_probe(struct platform_device *pdev)
 
 	bipolar_mask = 0;
 	for (i = 0; i < indio_dev->num_channels; i++) {
-		if (indio_dev->channels[i].scan_type.sign == 's')
+		if (indio_dev->channels[i].scan_type.format == 's')
 			bipolar_mask |= BIT(indio_dev->channels[i].scan_index);
 	}
 
diff --git a/drivers/iio/addac/ad74115.c b/drivers/iio/addac/ad74115.c
index f8b04d86b01f..df3c9ac4c708 100644
--- a/drivers/iio/addac/ad74115.c
+++ b/drivers/iio/addac/ad74115.c
@@ -1280,7 +1280,7 @@ static const struct iio_info ad74115_info = {
 					BIT(IIO_CHAN_INFO_SAMP_FREQ),	\
 		.scan_index = index,					\
 		.scan_type = {						\
-			.sign = 'u',					\
+			.format = 'u',					\
 			.realbits = 16,					\
 			.storagebits = 32,				\
 			.shift = 8,					\
diff --git a/drivers/iio/addac/ad74413r.c b/drivers/iio/addac/ad74413r.c
index a20b4d48c5f7..5b9c1521b1c4 100644
--- a/drivers/iio/addac/ad74413r.c
+++ b/drivers/iio/addac/ad74413r.c
@@ -1120,7 +1120,7 @@ static const struct iio_info ad74413r_info = {
 		.info_mask_separate_available =				\
 					BIT(IIO_CHAN_INFO_SAMP_FREQ),	\
 		.scan_type = {						\
-			.sign = 'u',					\
+			.format = 'u',					\
 			.realbits = 16,					\
 			.storagebits = 32,				\
 			.shift = 8,					\
diff --git a/drivers/iio/chemical/atlas-ezo-sensor.c b/drivers/iio/chemical/atlas-ezo-sensor.c
index 59f3a4fa9e9f..33c6f24c612f 100644
--- a/drivers/iio/chemical/atlas-ezo-sensor.c
+++ b/drivers/iio/chemical/atlas-ezo-sensor.c
@@ -52,7 +52,7 @@ struct atlas_ezo_data {
 			BIT(IIO_CHAN_INFO_RAW) | BIT(IIO_CHAN_INFO_SCALE), \
 		.scan_index = 0, \
 		.scan_type =  { \
-			.sign = 'u', \
+			.format = 'u', \
 			.realbits = 32, \
 			.storagebits = 32, \
 			.endianness = IIO_CPU, \
@@ -74,7 +74,7 @@ static const struct iio_chan_spec atlas_hum_ezo_channels[] = {
 			BIT(IIO_CHAN_INFO_RAW) | BIT(IIO_CHAN_INFO_SCALE),
 		.scan_index = 0,
 		.scan_type =  {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 32,
 			.storagebits = 32,
 			.endianness = IIO_CPU,
diff --git a/drivers/iio/chemical/atlas-sensor.c b/drivers/iio/chemical/atlas-sensor.c
index 8bbba85af699..92876b5cbd89 100644
--- a/drivers/iio/chemical/atlas-sensor.c
+++ b/drivers/iio/chemical/atlas-sensor.c
@@ -118,7 +118,7 @@ static const struct iio_chan_spec atlas_ph_channels[] = {
 			BIT(IIO_CHAN_INFO_RAW) | BIT(IIO_CHAN_INFO_SCALE),
 		.scan_index = 0,
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 32,
 			.storagebits = 32,
 			.endianness = IIO_BE,
@@ -145,7 +145,7 @@ static const struct iio_chan_spec atlas_ph_channels[] = {
 			BIT(IIO_CHAN_INFO_RAW) | BIT(IIO_CHAN_INFO_SCALE), \
 		.scan_index = _idx + 1, \
 		.scan_type = { \
-			.sign = 'u', \
+			.format = 'u', \
 			.realbits = 32, \
 			.storagebits = 32, \
 			.endianness = IIO_BE, \
@@ -160,7 +160,7 @@ static const struct iio_chan_spec atlas_ec_channels[] = {
 			BIT(IIO_CHAN_INFO_RAW) | BIT(IIO_CHAN_INFO_SCALE),
 		.scan_index = 0,
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 32,
 			.storagebits = 32,
 			.endianness = IIO_BE,
@@ -187,7 +187,7 @@ static const struct iio_chan_spec atlas_orp_channels[] = {
 			BIT(IIO_CHAN_INFO_RAW) | BIT(IIO_CHAN_INFO_SCALE),
 		.scan_index = 0,
 		.scan_type = {
-			.sign = 's',
+			.format = 's',
 			.realbits = 32,
 			.storagebits = 32,
 			.endianness = IIO_BE,
@@ -204,7 +204,7 @@ static const struct iio_chan_spec atlas_do_channels[] = {
 			BIT(IIO_CHAN_INFO_RAW) | BIT(IIO_CHAN_INFO_SCALE),
 		.scan_index = 0,
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 32,
 			.storagebits = 32,
 			.endianness = IIO_BE,
@@ -228,7 +228,7 @@ static const struct iio_chan_spec atlas_rtd_channels[] = {
 		.info_mask_separate = BIT(IIO_CHAN_INFO_PROCESSED),
 		.scan_index = 0,
 		.scan_type = {
-			.sign = 's',
+			.format = 's',
 			.realbits = 32,
 			.storagebits = 32,
 			.endianness = IIO_BE,
diff --git a/drivers/iio/chemical/bme680_core.c b/drivers/iio/chemical/bme680_core.c
index 70f81c4a96ba..35910ed963a9 100644
--- a/drivers/iio/chemical/bme680_core.c
+++ b/drivers/iio/chemical/bme680_core.c
@@ -172,7 +172,7 @@ static const struct iio_chan_spec bme680_channels[] = {
 				      BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO),
 		.scan_index = 0,
 		.scan_type = {
-			.sign = 's',
+			.format = 's',
 			.realbits = 16,
 			.storagebits = 16,
 			.endianness = IIO_CPU,
@@ -187,7 +187,7 @@ static const struct iio_chan_spec bme680_channels[] = {
 				      BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO),
 		.scan_index = 1,
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 32,
 			.storagebits = 32,
 			.endianness = IIO_CPU,
@@ -202,7 +202,7 @@ static const struct iio_chan_spec bme680_channels[] = {
 				      BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO),
 		.scan_index = 2,
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 32,
 			.storagebits = 32,
 			.endianness = IIO_CPU,
@@ -213,7 +213,7 @@ static const struct iio_chan_spec bme680_channels[] = {
 		.info_mask_separate = BIT(IIO_CHAN_INFO_PROCESSED),
 		.scan_index = 3,
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 32,
 			.storagebits = 32,
 			.endianness = IIO_CPU,
diff --git a/drivers/iio/chemical/ccs811.c b/drivers/iio/chemical/ccs811.c
index 998c9239c4c7..52f883efeae0 100644
--- a/drivers/iio/chemical/ccs811.c
+++ b/drivers/iio/chemical/ccs811.c
@@ -105,7 +105,7 @@ static const struct iio_chan_spec ccs811_channels[] = {
 				      BIT(IIO_CHAN_INFO_SCALE),
 		.scan_index = 0,
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 16,
 			.storagebits = 16,
 			.endianness = IIO_BE,
@@ -118,7 +118,7 @@ static const struct iio_chan_spec ccs811_channels[] = {
 				       BIT(IIO_CHAN_INFO_SCALE),
 		.scan_index = 1,
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 16,
 			.storagebits = 16,
 			.endianness = IIO_BE,
diff --git a/drivers/iio/chemical/ens160_core.c b/drivers/iio/chemical/ens160_core.c
index bbc96c4c6283..cf12e7230a01 100644
--- a/drivers/iio/chemical/ens160_core.c
+++ b/drivers/iio/chemical/ens160_core.c
@@ -76,7 +76,7 @@ static const struct iio_chan_spec ens160_channels[] = {
 		.address = ENS160_REG_DATA_TVOC,
 		.scan_index = 0,
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 16,
 			.storagebits = 16,
 			.endianness = IIO_LE,
@@ -91,7 +91,7 @@ static const struct iio_chan_spec ens160_channels[] = {
 		.address = ENS160_REG_DATA_ECO2,
 		.scan_index = 1,
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 16,
 			.storagebits = 16,
 			.endianness = IIO_LE,
diff --git a/drivers/iio/chemical/pms7003.c b/drivers/iio/chemical/pms7003.c
index 656d4a12c58f..d74c560cd7ce 100644
--- a/drivers/iio/chemical/pms7003.c
+++ b/drivers/iio/chemical/pms7003.c
@@ -178,7 +178,7 @@ static const struct iio_info pms7003_info = {
 	.info_mask_separate = BIT(IIO_CHAN_INFO_PROCESSED), \
 	.scan_index = _index, \
 	.scan_type = { \
-		.sign = 'u', \
+		.format = 'u', \
 		.realbits = 10, \
 		.storagebits = 16, \
 		.endianness = IIO_CPU, \
diff --git a/drivers/iio/chemical/scd30_core.c b/drivers/iio/chemical/scd30_core.c
index a665fcb78806..2ebe914758d0 100644
--- a/drivers/iio/chemical/scd30_core.c
+++ b/drivers/iio/chemical/scd30_core.c
@@ -455,7 +455,7 @@ static const struct iio_info scd30_info = {
 };
 
 #define SCD30_CHAN_SCAN_TYPE(_sign, _realbits) .scan_type = { \
-	.sign = _sign, \
+	.format = _sign, \
 	.realbits = _realbits, \
 	.storagebits = 32, \
 	.endianness = IIO_CPU, \
diff --git a/drivers/iio/chemical/scd4x.c b/drivers/iio/chemical/scd4x.c
index 23a326fb62a7..f7f999fd593a 100644
--- a/drivers/iio/chemical/scd4x.c
+++ b/drivers/iio/chemical/scd4x.c
@@ -583,7 +583,7 @@ static const struct iio_chan_spec scd4x_channels[] = {
 		.address = SCD4X_CO2,
 		.scan_index = SCD4X_CO2,
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 16,
 			.storagebits = 16,
 			.endianness = IIO_CPU,
@@ -598,7 +598,7 @@ static const struct iio_chan_spec scd4x_channels[] = {
 		.address = SCD4X_TEMP,
 		.scan_index = SCD4X_TEMP,
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 16,
 			.storagebits = 16,
 			.endianness = IIO_CPU,
@@ -611,7 +611,7 @@ static const struct iio_chan_spec scd4x_channels[] = {
 		.address = SCD4X_HR,
 		.scan_index = SCD4X_HR,
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 16,
 			.storagebits = 16,
 			.endianness = IIO_CPU,
diff --git a/drivers/iio/chemical/sps30.c b/drivers/iio/chemical/sps30.c
index a934bf0298dd..a372ce9b58dd 100644
--- a/drivers/iio/chemical/sps30.c
+++ b/drivers/iio/chemical/sps30.c
@@ -299,7 +299,7 @@ static const struct iio_info sps30_info = {
 	.address = _mod, \
 	.scan_index = _index, \
 	.scan_type = { \
-		.sign = 'u', \
+		.format = 'u', \
 		.realbits = 19, \
 		.storagebits = 32, \
 		.endianness = IIO_CPU, \
diff --git a/drivers/iio/common/cros_ec_sensors/cros_ec_activity.c b/drivers/iio/common/cros_ec_sensors/cros_ec_activity.c
index 6e38d115b6fe..d44c026833a8 100644
--- a/drivers/iio/common/cros_ec_sensors/cros_ec_activity.c
+++ b/drivers/iio/common/cros_ec_sensors/cros_ec_activity.c
@@ -283,7 +283,7 @@ static int cros_ec_sensors_probe(struct platform_device *pdev)
 	channel->scan_index = index;
 	channel->type = IIO_TIMESTAMP;
 	channel->channel = -1;
-	channel->scan_type.sign = 's';
+	channel->scan_type.format = 's';
 	channel->scan_type.realbits = 64;
 	channel->scan_type.storagebits = 64;
 
diff --git a/drivers/iio/common/cros_ec_sensors/cros_ec_lid_angle.c b/drivers/iio/common/cros_ec_sensors/cros_ec_lid_angle.c
index 2d3d148b4206..8aa46b9bdb48 100644
--- a/drivers/iio/common/cros_ec_sensors/cros_ec_lid_angle.c
+++ b/drivers/iio/common/cros_ec_sensors/cros_ec_lid_angle.c
@@ -36,7 +36,7 @@ static const struct iio_chan_spec cros_ec_lid_angle_channels[] = {
 		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),
 		.scan_type.realbits = CROS_EC_SENSOR_BITS,
 		.scan_type.storagebits = CROS_EC_SENSOR_BITS,
-		.scan_type.sign = 'u',
+		.scan_type.format = 'u',
 		.type = IIO_ANGL
 	},
 	IIO_CHAN_SOFT_TIMESTAMP(1)
diff --git a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors.c b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors.c
index 82cef4a12442..8eb0d1a411d6 100644
--- a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors.c
+++ b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors.c
@@ -260,7 +260,7 @@ static int cros_ec_sensors_probe(struct platform_device *pdev)
 		channel->ext_info = cros_ec_sensors_ext_info;
 		channel->modified = 1;
 		channel->channel2 = IIO_MOD_X + i;
-		channel->scan_type.sign = 's';
+		channel->scan_type.format = 's';
 
 		/* Sensor specific */
 		switch (state->core.type) {
@@ -283,7 +283,7 @@ static int cros_ec_sensors_probe(struct platform_device *pdev)
 	channel->type = IIO_TIMESTAMP;
 	channel->channel = -1;
 	channel->scan_index = CROS_EC_SENSOR_MAX_AXIS;
-	channel->scan_type.sign = 's';
+	channel->scan_type.format = 's';
 	channel->scan_type.realbits = 64;
 	channel->scan_type.storagebits = 64;
 
diff --git a/drivers/iio/common/scmi_sensors/scmi_iio.c b/drivers/iio/common/scmi_sensors/scmi_iio.c
index 5136ad9ada04..cec652be5fcb 100644
--- a/drivers/iio/common/scmi_sensors/scmi_iio.c
+++ b/drivers/iio/common/scmi_sensors/scmi_iio.c
@@ -425,7 +425,7 @@ static void scmi_iio_set_timestamp_channel(struct iio_chan_spec *iio_chan,
 	iio_chan->type = IIO_TIMESTAMP;
 	iio_chan->channel = -1;
 	iio_chan->scan_index = scan_index;
-	iio_chan->scan_type.sign = 'u';
+	iio_chan->scan_type.format = 'u';
 	iio_chan->scan_type.realbits = 64;
 	iio_chan->scan_type.storagebits = 64;
 }
@@ -443,7 +443,7 @@ static void scmi_iio_set_data_channel(struct iio_chan_spec *iio_chan,
 	iio_chan->info_mask_shared_by_type_available =
 		BIT(IIO_CHAN_INFO_SAMP_FREQ);
 	iio_chan->scan_index = scan_index;
-	iio_chan->scan_type.sign = 's';
+	iio_chan->scan_type.format = 's';
 	iio_chan->scan_type.realbits = 64;
 	iio_chan->scan_type.storagebits = 64;
 	iio_chan->scan_type.endianness = IIO_LE;
diff --git a/drivers/iio/common/ssp_sensors/ssp_iio_sensor.h b/drivers/iio/common/ssp_sensors/ssp_iio_sensor.h
index 4528ab55eb68..b5b188fbeafd 100644
--- a/drivers/iio/common/ssp_sensors/ssp_iio_sensor.h
+++ b/drivers/iio/common/ssp_sensors/ssp_iio_sensor.h
@@ -10,7 +10,7 @@
 		.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SAMP_FREQ),\
 		.scan_index = _index,\
 		.scan_type = {\
-			.sign = 's',\
+			.format = 's',\
 			.realbits = 16,\
 			.storagebits = 16,\
 			.shift = 0,\
@@ -24,7 +24,7 @@
 	.channel = -1,							\
 	.scan_index = _si,						\
 	.scan_type = {							\
-		.sign = 's',						\
+		.format = 's',						\
 		.realbits = 64,						\
 		.storagebits = 64,					\
 		},							\
diff --git a/drivers/iio/dac/ad3552r-hs.c b/drivers/iio/dac/ad3552r-hs.c
index a9578afa7015..00094cbfddda 100644
--- a/drivers/iio/dac/ad3552r-hs.c
+++ b/drivers/iio/dac/ad3552r-hs.c
@@ -766,7 +766,7 @@ static const struct iio_buffer_setup_ops ad3552r_hs_buffer_setup_ops = {
 	.channel = (ch), \
 	.scan_index = (ch), \
 	.scan_type = { \
-		.sign = 'u', \
+		.format = 'u', \
 		.realbits = 16, \
 		.storagebits = 16, \
 		.endianness = IIO_BE, \
diff --git a/drivers/iio/dac/ad3552r.c b/drivers/iio/dac/ad3552r.c
index 93c33bc3e1be..ec93298c574c 100644
--- a/drivers/iio/dac/ad3552r.c
+++ b/drivers/iio/dac/ad3552r.c
@@ -128,7 +128,7 @@ static int ad3552r_update_reg_field(struct ad3552r_desc *dac, u8 addr, u16 mask,
 	.channel = _idx,					\
 	.scan_index = _idx,					\
 	.scan_type = {						\
-		.sign = 'u',					\
+		.format = 'u',					\
 		.realbits = 16,					\
 		.storagebits = 16,				\
 		.endianness = IIO_BE,				\
diff --git a/drivers/iio/dac/ad5064.c b/drivers/iio/dac/ad5064.c
index 84be5174babd..1e83e0b9bc0e 100644
--- a/drivers/iio/dac/ad5064.c
+++ b/drivers/iio/dac/ad5064.c
@@ -402,7 +402,7 @@ static const struct iio_chan_spec_ext_info ltc2617_ext_info[] = {
 	BIT(IIO_CHAN_INFO_SCALE),					\
 	.address = addr,					\
 	.scan_type = {						\
-		.sign = 'u',					\
+		.format = 'u',					\
 		.realbits = (bits),				\
 		.storagebits = 16,				\
 		.shift = (_shift),				\
diff --git a/drivers/iio/dac/ad5360.c b/drivers/iio/dac/ad5360.c
index bd32fa57b1d7..47277097abbe 100644
--- a/drivers/iio/dac/ad5360.c
+++ b/drivers/iio/dac/ad5360.c
@@ -109,7 +109,7 @@ enum ad5360_type {
 		BIT(IIO_CHAN_INFO_CALIBSCALE) |			\
 		BIT(IIO_CHAN_INFO_CALIBBIAS),			\
 	.scan_type = {						\
-		.sign = 'u',					\
+		.format = 'u',					\
 		.realbits = (bits),				\
 		.storagebits = 16,				\
 		.shift = 16 - (bits),				\
diff --git a/drivers/iio/dac/ad5380.c b/drivers/iio/dac/ad5380.c
index 8b813cee7625..52ce975b8c8a 100644
--- a/drivers/iio/dac/ad5380.c
+++ b/drivers/iio/dac/ad5380.c
@@ -258,7 +258,7 @@ static const struct iio_chan_spec_ext_info ad5380_ext_info[] = {
 		BIT(IIO_CHAN_INFO_CALIBBIAS),			\
 	.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE),	\
 	.scan_type = {						\
-		.sign = 'u',					\
+		.format = 'u',					\
 		.realbits = (_bits),				\
 		.storagebits =  16,				\
 		.shift = 14 - (_bits),				\
diff --git a/drivers/iio/dac/ad5421.c b/drivers/iio/dac/ad5421.c
index d9d7031c4432..9ced9a0561ed 100644
--- a/drivers/iio/dac/ad5421.c
+++ b/drivers/iio/dac/ad5421.c
@@ -116,7 +116,7 @@ static const struct iio_chan_spec ad5421_channels[] = {
 		.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE) |
 			BIT(IIO_CHAN_INFO_OFFSET),
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 16,
 			.storagebits = 16,
 		},
diff --git a/drivers/iio/dac/ad5446.h b/drivers/iio/dac/ad5446.h
index 6ba31d98f415..9dbd03700dcd 100644
--- a/drivers/iio/dac/ad5446.h
+++ b/drivers/iio/dac/ad5446.h
@@ -20,7 +20,7 @@ extern const struct iio_chan_spec_ext_info ad5446_ext_info_powerdown[];
 	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW), \
 	.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE), \
 	.scan_type = { \
-		.sign = 'u', \
+		.format = 'u', \
 		.realbits = (bits), \
 		.storagebits = (storage), \
 		.shift = (_shift), \
diff --git a/drivers/iio/dac/ad5449.c b/drivers/iio/dac/ad5449.c
index d8c325260259..2487fda06937 100644
--- a/drivers/iio/dac/ad5449.c
+++ b/drivers/iio/dac/ad5449.c
@@ -203,7 +203,7 @@ static const struct iio_info ad5449_info = {
 		BIT(IIO_CHAN_INFO_SCALE),			\
 	.address = (chan),					\
 	.scan_type = {						\
-		.sign = 'u',					\
+		.format = 'u',					\
 		.realbits = (bits),				\
 		.storagebits = 16,				\
 		.shift = 12 - (bits),				\
diff --git a/drivers/iio/dac/ad5504.c b/drivers/iio/dac/ad5504.c
index 355bcb6a8ba0..c1e52379b970 100644
--- a/drivers/iio/dac/ad5504.c
+++ b/drivers/iio/dac/ad5504.c
@@ -254,7 +254,7 @@ static const struct iio_chan_spec_ext_info ad5504_ext_info[] = {
 	.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE), \
 	.address = AD5504_ADDR_DAC(_chan), \
 	.scan_type = { \
-		.sign = 'u', \
+		.format = 'u', \
 		.realbits = 12, \
 		.storagebits = 16, \
 	}, \
diff --git a/drivers/iio/dac/ad5592r-base.c b/drivers/iio/dac/ad5592r-base.c
index 4720733d66b2..da48cd20c68e 100644
--- a/drivers/iio/dac/ad5592r-base.c
+++ b/drivers/iio/dac/ad5592r-base.c
@@ -480,7 +480,7 @@ static void ad5592r_setup_channel(struct iio_dev *iio_dev,
 	chan->channel = id;
 	chan->info_mask_separate = BIT(IIO_CHAN_INFO_RAW);
 	chan->info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE);
-	chan->scan_type.sign = 'u';
+	chan->scan_type.format = 'u';
 	chan->scan_type.realbits = 12;
 	chan->scan_type.storagebits = 16;
 	chan->ext_info = ad5592r_ext_info;
diff --git a/drivers/iio/dac/ad5624r_spi.c b/drivers/iio/dac/ad5624r_spi.c
index 13aefe769bad..23cba2bc6aa8 100644
--- a/drivers/iio/dac/ad5624r_spi.c
+++ b/drivers/iio/dac/ad5624r_spi.c
@@ -172,7 +172,7 @@ static const struct iio_chan_spec_ext_info ad5624r_ext_info[] = {
 	.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE), \
 	.address = (_chan), \
 	.scan_type = { \
-		.sign = 'u', \
+		.format = 'u', \
 		.realbits = (_bits), \
 		.storagebits = 16, \
 		.shift = 16 - (_bits), \
diff --git a/drivers/iio/dac/ad5686.c b/drivers/iio/dac/ad5686.c
index 4b18498aa074..f0db41452bca 100644
--- a/drivers/iio/dac/ad5686.c
+++ b/drivers/iio/dac/ad5686.c
@@ -197,7 +197,7 @@ static const struct iio_chan_spec_ext_info ad5686_ext_info[] = {
 		.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE),\
 		.address = addr,				\
 		.scan_type = {					\
-			.sign = 'u',				\
+			.format = 'u',				\
 			.realbits = (bits),			\
 			.storagebits = 16,			\
 			.shift = (_shift),			\
diff --git a/drivers/iio/dac/ad5755.c b/drivers/iio/dac/ad5755.c
index d0e5f35462b1..fa3d3727068f 100644
--- a/drivers/iio/dac/ad5755.c
+++ b/drivers/iio/dac/ad5755.c
@@ -534,7 +534,7 @@ static const struct iio_chan_spec_ext_info ad5755_ext_info[] = {
 		BIT(IIO_CHAN_INFO_CALIBSCALE) |			\
 		BIT(IIO_CHAN_INFO_CALIBBIAS),			\
 	.scan_type = {						\
-		.sign = 'u',					\
+		.format = 'u',					\
 		.realbits = (_bits),				\
 		.storagebits = 16,				\
 		.shift = 16 - (_bits),				\
diff --git a/drivers/iio/dac/ad5761.c b/drivers/iio/dac/ad5761.c
index b5d20f04f070..6253390af191 100644
--- a/drivers/iio/dac/ad5761.c
+++ b/drivers/iio/dac/ad5761.c
@@ -257,7 +257,7 @@ static const struct iio_info ad5761_info = {
 	.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE) |	\
 		BIT(IIO_CHAN_INFO_OFFSET),		\
 	.scan_type = {					\
-		.sign = 'u',				\
+		.format = 'u',				\
 		.realbits = (_bits),			\
 		.storagebits = 16,			\
 		.shift = 16 - (_bits),			\
diff --git a/drivers/iio/dac/ad5764.c b/drivers/iio/dac/ad5764.c
index fbbd7105a80c..01db3fe903cd 100644
--- a/drivers/iio/dac/ad5764.c
+++ b/drivers/iio/dac/ad5764.c
@@ -84,7 +84,7 @@ enum ad5764_type {
 		BIT(IIO_CHAN_INFO_CALIBBIAS),			\
 	.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_OFFSET),	\
 	.scan_type = {						\
-		.sign = 'u',					\
+		.format = 'u',					\
 		.realbits = (_bits),				\
 		.storagebits = 16,				\
 		.shift = 16 - (_bits),				\
diff --git a/drivers/iio/dac/ad5766.c b/drivers/iio/dac/ad5766.c
index f6a0a0d84fef..af27a1ad3f5e 100644
--- a/drivers/iio/dac/ad5766.c
+++ b/drivers/iio/dac/ad5766.c
@@ -449,7 +449,7 @@ static const struct iio_chan_spec_ext_info ad5766_ext_info[] = {
 		BIT(IIO_CHAN_INFO_SCALE),				\
 	.scan_index = (_chan),						\
 	.scan_type = {							\
-		.sign = 'u',						\
+		.format = 'u',						\
 		.realbits = (_bits),					\
 		.storagebits = 16,					\
 		.shift = 16 - (_bits),					\
diff --git a/drivers/iio/dac/ad5791.c b/drivers/iio/dac/ad5791.c
index ae7297f08398..3c3740286cba 100644
--- a/drivers/iio/dac/ad5791.c
+++ b/drivers/iio/dac/ad5791.c
@@ -323,7 +323,7 @@ static const struct ad5791_chip_info _name##_chip_info = {		\
 			.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE) |	\
 				BIT(IIO_CHAN_INFO_OFFSET),		\
 			.scan_type = {					\
-				.sign = 'u',				\
+				.format = 'u',				\
 				.realbits = (bits),			\
 				.storagebits = 32,			\
 				.shift = (_shift),			\
@@ -341,7 +341,7 @@ static const struct ad5791_chip_info _name##_chip_info = {		\
 				BIT(IIO_CHAN_INFO_OFFSET),		\
 			.info_mask_shared_by_all = BIT(IIO_CHAN_INFO_SAMP_FREQ),\
 			.scan_type = {					\
-				.sign = 'u',				\
+				.format = 'u',				\
 				.realbits = (bits),			\
 				.storagebits = 32,			\
 				.shift = (_shift),			\
diff --git a/drivers/iio/dac/ad7303.c b/drivers/iio/dac/ad7303.c
index a88cc639047d..7f3e63e1f928 100644
--- a/drivers/iio/dac/ad7303.c
+++ b/drivers/iio/dac/ad7303.c
@@ -185,7 +185,7 @@ static const struct iio_chan_spec_ext_info ad7303_ext_info[] = {
 	.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE),	\
 	.address = (chan),					\
 	.scan_type = {						\
-		.sign = 'u',					\
+		.format = 'u',					\
 		.realbits = 8,					\
 		.storagebits = 8,				\
 		.shift = 0,					\
diff --git a/drivers/iio/dac/ad8460.c b/drivers/iio/dac/ad8460.c
index 6e45686902dd..566977b95b41 100644
--- a/drivers/iio/dac/ad8460.c
+++ b/drivers/iio/dac/ad8460.c
@@ -742,7 +742,7 @@ static const struct iio_event_spec ad8460_events[] = {
 	.channel = 0,						\
 	.scan_index = 0,					\
 	.scan_type = {						\
-		.sign = 'u',					\
+		.format = 'u',					\
 		.realbits = 14,					\
 		.storagebits = 16,				\
 		.endianness = IIO_CPU,				\
diff --git a/drivers/iio/dac/ad9739a.c b/drivers/iio/dac/ad9739a.c
index d77b46d83bd4..96952f2d33fd 100644
--- a/drivers/iio/dac/ad9739a.c
+++ b/drivers/iio/dac/ad9739a.c
@@ -335,7 +335,7 @@ static struct iio_chan_spec ad9739a_channels[] = {
 		.output = 1,
 		.ext_info = ad9739a_ext_info,
 		.scan_type = {
-			.sign = 's',
+			.format = 's',
 			.storagebits = 16,
 			.realbits = 16,
 		},
diff --git a/drivers/iio/dac/ltc1660.c b/drivers/iio/dac/ltc1660.c
index 6e80b49f4665..20c4cbe92ac2 100644
--- a/drivers/iio/dac/ltc1660.c
+++ b/drivers/iio/dac/ltc1660.c
@@ -109,7 +109,7 @@ static int ltc1660_write_raw(struct iio_dev *indio_dev,
 	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),	\
 	.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE),	\
 	.scan_type = {					\
-		.sign = 'u',				\
+		.format = 'u',				\
 		.realbits = (bits),			\
 		.storagebits = 16,			\
 		.shift = 12 - (bits),			\
diff --git a/drivers/iio/dac/max5522.c b/drivers/iio/dac/max5522.c
index 1b8fe6b8d26e..cb180ec476af 100644
--- a/drivers/iio/dac/max5522.c
+++ b/drivers/iio/dac/max5522.c
@@ -45,7 +45,7 @@ struct max5522_state {
 	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW) | \
 			      BIT(IIO_CHAN_INFO_SCALE), \
 	.scan_type = { \
-		.sign = 'u', \
+		.format = 'u', \
 		.realbits = 10, \
 		.storagebits = 16, \
 		.shift = 2, \
diff --git a/drivers/iio/dac/mcp4922.c b/drivers/iio/dac/mcp4922.c
index 74f338afcab9..30a4eb19b515 100644
--- a/drivers/iio/dac/mcp4922.c
+++ b/drivers/iio/dac/mcp4922.c
@@ -41,7 +41,7 @@ struct mcp4922_state {
 	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),	\
 	.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE),	\
 	.scan_type = {					\
-		.sign = 'u',				\
+		.format = 'u',				\
 		.realbits = (bits),			\
 		.storagebits = 16,			\
 		.shift = 12 - (bits),			\
diff --git a/drivers/iio/dac/stm32-dac.c b/drivers/iio/dac/stm32-dac.c
index b860e18d52a1..c2d592358f51 100644
--- a/drivers/iio/dac/stm32-dac.c
+++ b/drivers/iio/dac/stm32-dac.c
@@ -255,7 +255,7 @@ static const struct iio_chan_spec_ext_info stm32_dac_ext_info[] = {
 		BIT(IIO_CHAN_INFO_SCALE),		\
 	/* scan_index is always 0 as num_channels is 1 */ \
 	.scan_type = {					\
-		.sign = 'u',				\
+		.format = 'u',				\
 		.realbits = 12,				\
 		.storagebits = 16,			\
 	},						\
diff --git a/drivers/iio/dummy/iio_simple_dummy.c b/drivers/iio/dummy/iio_simple_dummy.c
index 19fcdbbc11c6..a950f083a1b6 100644
--- a/drivers/iio/dummy/iio_simple_dummy.c
+++ b/drivers/iio/dummy/iio_simple_dummy.c
@@ -128,7 +128,7 @@ static const struct iio_chan_spec iio_dummy_channels[] = {
 		/* The ordering of elements in the buffer via an enum */
 		.scan_index = DUMMY_INDEX_VOLTAGE_0,
 		.scan_type = { /* Description of storage in buffer */
-			.sign = 'u', /* unsigned */
+			.format = 'u', /* unsigned */
 			.realbits = 13, /* 13 bits */
 			.storagebits = 16, /* 16 bits used for storage */
 			.shift = 0, /* zero shift */
@@ -167,7 +167,7 @@ static const struct iio_chan_spec iio_dummy_channels[] = {
 		 */
 		.scan_index = DUMMY_INDEX_DIFFVOLTAGE_1M2,
 		.scan_type = { /* Description of storage in buffer */
-			.sign = 's', /* signed */
+			.format = 's', /* signed */
 			.realbits = 12, /* 12 bits */
 			.storagebits = 16, /* 16 bits used for storage */
 			.shift = 0, /* zero shift */
@@ -185,7 +185,7 @@ static const struct iio_chan_spec iio_dummy_channels[] = {
 		.info_mask_shared_by_dir = BIT(IIO_CHAN_INFO_SAMP_FREQ),
 		.scan_index = DUMMY_INDEX_DIFFVOLTAGE_3M4,
 		.scan_type = {
-			.sign = 's',
+			.format = 's',
 			.realbits = 11,
 			.storagebits = 16,
 			.shift = 0,
@@ -212,7 +212,7 @@ static const struct iio_chan_spec iio_dummy_channels[] = {
 		.info_mask_shared_by_dir = BIT(IIO_CHAN_INFO_SAMP_FREQ),
 		.scan_index = DUMMY_INDEX_ACCELX,
 		.scan_type = { /* Description of storage in buffer */
-			.sign = 's', /* signed */
+			.format = 's', /* signed */
 			.realbits = 16, /* 16 bits */
 			.storagebits = 16, /* 16 bits used for storage */
 			.shift = 0, /* zero shift */
diff --git a/drivers/iio/gyro/adis16136.c b/drivers/iio/gyro/adis16136.c
index 369c7428e1ef..fd3ad9950e08 100644
--- a/drivers/iio/gyro/adis16136.c
+++ b/drivers/iio/gyro/adis16136.c
@@ -361,7 +361,7 @@ static const struct iio_chan_spec adis16136_channels[] = {
 		.address = ADIS16136_REG_GYRO_OUT2,
 		.scan_index = ADIS16136_SCAN_GYRO,
 		.scan_type = {
-			.sign = 's',
+			.format = 's',
 			.realbits = 32,
 			.storagebits = 32,
 			.endianness = IIO_BE,
@@ -375,7 +375,7 @@ static const struct iio_chan_spec adis16136_channels[] = {
 		.address = ADIS16136_REG_TEMP_OUT,
 		.scan_index = ADIS16136_SCAN_TEMP,
 		.scan_type = {
-			.sign = 's',
+			.format = 's',
 			.realbits = 16,
 			.storagebits = 16,
 			.endianness = IIO_BE,
diff --git a/drivers/iio/gyro/adxrs290.c b/drivers/iio/gyro/adxrs290.c
index 3efe385ebedc..2efbc4f49d2c 100644
--- a/drivers/iio/gyro/adxrs290.c
+++ b/drivers/iio/gyro/adxrs290.c
@@ -538,7 +538,7 @@ static irqreturn_t adxrs290_trigger_handler(int irq, void *p)
 	BIT(IIO_CHAN_INFO_HIGH_PASS_FILTER_3DB_FREQUENCY),		\
 	.scan_index = ADXRS290_IDX_##axis,				\
 	.scan_type = {                                                  \
-		.sign = 's',                                            \
+		.format = 's',                                          \
 		.realbits = 16,                                         \
 		.storagebits = 16,                                      \
 		.endianness = IIO_LE,					\
@@ -555,7 +555,7 @@ static const struct iio_chan_spec adxrs290_channels[] = {
 		BIT(IIO_CHAN_INFO_SCALE),
 		.scan_index = ADXRS290_IDX_TEMP,
 		.scan_type = {
-			.sign = 's',
+			.format = 's',
 			.realbits = 12,
 			.storagebits = 16,
 			.endianness = IIO_LE,
diff --git a/drivers/iio/gyro/bmg160_core.c b/drivers/iio/gyro/bmg160_core.c
index 38394b5f3275..7de69d7b7ebd 100644
--- a/drivers/iio/gyro/bmg160_core.c
+++ b/drivers/iio/gyro/bmg160_core.c
@@ -833,7 +833,7 @@ static const struct iio_event_spec bmg160_event = {
 		BIT(IIO_CHAN_INFO_LOW_PASS_FILTER_3DB_FREQUENCY),	\
 	.scan_index = AXIS_##_axis,					\
 	.scan_type = {							\
-		.sign = 's',						\
+		.format = 's',						\
 		.realbits = 16,					\
 		.storagebits = 16,					\
 		.endianness = IIO_LE,					\
diff --git a/drivers/iio/gyro/fxas21002c_core.c b/drivers/iio/gyro/fxas21002c_core.c
index a88670207cec..0773764eed43 100644
--- a/drivers/iio/gyro/fxas21002c_core.c
+++ b/drivers/iio/gyro/fxas21002c_core.c
@@ -696,7 +696,7 @@ static const struct attribute_group fxas21002c_attrs_group = {
 		BIT(IIO_CHAN_INFO_SAMP_FREQ),				\
 	.scan_index = CHANNEL_SCAN_INDEX_##_axis,			\
 	.scan_type = {							\
-		.sign = 's',						\
+		.format = 's',						\
 		.realbits = 16,						\
 		.storagebits = 16,					\
 		.endianness = IIO_BE,					\
diff --git a/drivers/iio/gyro/hid-sensor-gyro-3d.c b/drivers/iio/gyro/hid-sensor-gyro-3d.c
index c43990c518f7..f85122041a67 100644
--- a/drivers/iio/gyro/hid-sensor-gyro-3d.c
+++ b/drivers/iio/gyro/hid-sensor-gyro-3d.c
@@ -86,7 +86,7 @@ static const struct iio_chan_spec gyro_3d_channels[] = {
 static void gyro_3d_adjust_channel_bit_mask(struct iio_chan_spec *channels,
 						int channel, int size)
 {
-	channels[channel].scan_type.sign = 's';
+	channels[channel].scan_type.format = 's';
 	/* Real storage bits will change based on the report desc. */
 	channels[channel].scan_type.realbits = size * 8;
 	/* Maximum size of a sample to capture is u32 */
diff --git a/drivers/iio/gyro/itg3200_core.c b/drivers/iio/gyro/itg3200_core.c
index bfe95ec1abda..1d7df9235d13 100644
--- a/drivers/iio/gyro/itg3200_core.c
+++ b/drivers/iio/gyro/itg3200_core.c
@@ -257,7 +257,7 @@ static const struct iio_chan_spec_ext_info itg3200_ext_info[] = {
 };
 
 #define ITG3200_ST						\
-	{ .sign = 's', .realbits = 16, .storagebits = 16, .endianness = IIO_BE }
+	{ .format = 's', .realbits = 16, .storagebits = 16, .endianness = IIO_BE }
 
 #define ITG3200_GYRO_CHAN(_mod) { \
 	.type = IIO_ANGL_VEL, \
diff --git a/drivers/iio/gyro/mpu3050-core.c b/drivers/iio/gyro/mpu3050-core.c
index ee2fcd20545d..484411bf634a 100644
--- a/drivers/iio/gyro/mpu3050-core.c
+++ b/drivers/iio/gyro/mpu3050-core.c
@@ -697,7 +697,7 @@ static const struct iio_chan_spec_ext_info mpu3050_ext_info[] = {
 		.ext_info = mpu3050_ext_info,				\
 		.scan_index = index,					\
 		.scan_type = {						\
-			.sign = 's',					\
+			.format = 's',					\
 			.realbits = 16,					\
 			.storagebits = 16,				\
 			.endianness = IIO_BE,				\
@@ -713,7 +713,7 @@ static const struct iio_chan_spec mpu3050_channels[] = {
 		.info_mask_shared_by_all = BIT(IIO_CHAN_INFO_SAMP_FREQ),
 		.scan_index = 0,
 		.scan_type = {
-			.sign = 's',
+			.format = 's',
 			.realbits = 16,
 			.storagebits = 16,
 			.endianness = IIO_BE,
diff --git a/drivers/iio/health/afe440x.h b/drivers/iio/health/afe440x.h
index 0adea0047eba..3b1a89f85ed1 100644
--- a/drivers/iio/health/afe440x.h
+++ b/drivers/iio/health/afe440x.h
@@ -87,7 +87,7 @@
 		.address = _index,				\
 		.scan_index = _index,				\
 		.scan_type = {					\
-				.sign = 's',			\
+				.format = 's',			\
 				.realbits = 24,			\
 				.storagebits = 32,		\
 				.endianness = IIO_CPU,		\
diff --git a/drivers/iio/health/max30100.c b/drivers/iio/health/max30100.c
index 7dfdb5eb305e..8b62d7a3546f 100644
--- a/drivers/iio/health/max30100.c
+++ b/drivers/iio/health/max30100.c
@@ -124,7 +124,7 @@ static const struct iio_chan_spec max30100_channels[] = {
 
 		.scan_index = 0,
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 16,
 			.storagebits = 16,
 			.endianness = IIO_BE,
@@ -137,7 +137,7 @@ static const struct iio_chan_spec max30100_channels[] = {
 
 		.scan_index = 1,
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 16,
 			.storagebits = 16,
 			.endianness = IIO_BE,
diff --git a/drivers/iio/health/max30102.c b/drivers/iio/health/max30102.c
index 47da44efd68b..acb38b6dd036 100644
--- a/drivers/iio/health/max30102.c
+++ b/drivers/iio/health/max30102.c
@@ -135,7 +135,7 @@ static const unsigned long max30105_scan_masks[] = {
 		.modified = 1, \
 		.scan_index = _si, \
 		.scan_type = { \
-			.sign = 'u', \
+			.format = 'u', \
 			.shift = 8, \
 			.realbits = 18, \
 			.storagebits = 32, \
diff --git a/drivers/iio/humidity/am2315.c b/drivers/iio/humidity/am2315.c
index 02ca23eb8991..c279309464d9 100644
--- a/drivers/iio/humidity/am2315.c
+++ b/drivers/iio/humidity/am2315.c
@@ -51,7 +51,7 @@ static const struct iio_chan_spec am2315_channels[] = {
 				      BIT(IIO_CHAN_INFO_SCALE),
 		.scan_index = 0,
 		.scan_type = {
-			.sign = 's',
+			.format = 's',
 			.realbits = 16,
 			.storagebits = 16,
 			.endianness = IIO_CPU,
@@ -63,7 +63,7 @@ static const struct iio_chan_spec am2315_channels[] = {
 				      BIT(IIO_CHAN_INFO_SCALE),
 		.scan_index = 1,
 		.scan_type = {
-			.sign = 's',
+			.format = 's',
 			.realbits = 16,
 			.storagebits = 16,
 			.endianness = IIO_CPU,
diff --git a/drivers/iio/humidity/hdc100x.c b/drivers/iio/humidity/hdc100x.c
index c2b36e682e06..8e876cb1c43f 100644
--- a/drivers/iio/humidity/hdc100x.c
+++ b/drivers/iio/humidity/hdc100x.c
@@ -100,7 +100,7 @@ static const struct iio_chan_spec hdc100x_channels[] = {
 			BIT(IIO_CHAN_INFO_OFFSET),
 		.scan_index = 0,
 		.scan_type = {
-			.sign = 's',
+			.format = 's',
 			.realbits = 16,
 			.storagebits = 16,
 			.endianness = IIO_BE,
@@ -114,7 +114,7 @@ static const struct iio_chan_spec hdc100x_channels[] = {
 			BIT(IIO_CHAN_INFO_INT_TIME),
 		.scan_index = 1,
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 16,
 			.storagebits = 16,
 			.endianness = IIO_BE,
diff --git a/drivers/iio/humidity/hid-sensor-humidity.c b/drivers/iio/humidity/hid-sensor-humidity.c
index be2338d5f407..4f258cfe3641 100644
--- a/drivers/iio/humidity/hid-sensor-humidity.c
+++ b/drivers/iio/humidity/hid-sensor-humidity.c
@@ -47,7 +47,7 @@ static const struct iio_chan_spec humidity_channels[] = {
 static void humidity_adjust_channel_bit_mask(struct iio_chan_spec *channels,
 					int channel, int size)
 {
-	channels[channel].scan_type.sign = 's';
+	channels[channel].scan_type.format = 's';
 	/* Real storage bits will change based on the report desc. */
 	channels[channel].scan_type.realbits = size * 8;
 	/* Maximum size of a sample to capture is s32 */
diff --git a/drivers/iio/humidity/hts221_core.c b/drivers/iio/humidity/hts221_core.c
index bfeb0a60d3af..ae07945653e9 100644
--- a/drivers/iio/humidity/hts221_core.c
+++ b/drivers/iio/humidity/hts221_core.c
@@ -100,7 +100,7 @@ static const struct iio_chan_spec hts221_channels[] = {
 		.info_mask_shared_by_all = BIT(IIO_CHAN_INFO_SAMP_FREQ),
 		.scan_index = 0,
 		.scan_type = {
-			.sign = 's',
+			.format = 's',
 			.realbits = 16,
 			.storagebits = 16,
 			.endianness = IIO_LE,
@@ -116,7 +116,7 @@ static const struct iio_chan_spec hts221_channels[] = {
 		.info_mask_shared_by_all = BIT(IIO_CHAN_INFO_SAMP_FREQ),
 		.scan_index = 1,
 		.scan_type = {
-			.sign = 's',
+			.format = 's',
 			.realbits = 16,
 			.storagebits = 16,
 			.endianness = IIO_LE,
diff --git a/drivers/iio/imu/adis.c b/drivers/iio/imu/adis.c
index d160147cce0b..80b82637063b 100644
--- a/drivers/iio/imu/adis.c
+++ b/drivers/iio/imu/adis.c
@@ -482,7 +482,7 @@ int adis_single_conversion(struct iio_dev *indio_dev,
 			return ret;
 	}
 
-	if (chan->scan_type.sign == 's')
+	if (chan->scan_type.format == 's')
 		*val = sign_extend32(uval, chan->scan_type.realbits - 1);
 	else
 		*val = uval & ((1 << chan->scan_type.realbits) - 1);
diff --git a/drivers/iio/imu/adis16400.c b/drivers/iio/imu/adis16400.c
index 36323ad149e0..90b029fbce54 100644
--- a/drivers/iio/imu/adis16400.c
+++ b/drivers/iio/imu/adis16400.c
@@ -653,7 +653,7 @@ static irqreturn_t adis16400_trigger_handler(int irq, void *p)
 	.address = (addr), \
 	.scan_index = (si), \
 	.scan_type = { \
-		.sign = 'u', \
+		.format = 'u', \
 		.realbits = (bits), \
 		.storagebits = 16, \
 		.shift = 0, \
@@ -679,7 +679,7 @@ static irqreturn_t adis16400_trigger_handler(int irq, void *p)
 	.address = addr, \
 	.scan_index = ADIS16400_SCAN_GYRO_ ## mod, \
 	.scan_type = { \
-		.sign = 's', \
+		.format = 's', \
 		.realbits = (bits), \
 		.storagebits = 16, \
 		.shift = 0, \
@@ -699,7 +699,7 @@ static irqreturn_t adis16400_trigger_handler(int irq, void *p)
 	.address = (addr), \
 	.scan_index = ADIS16400_SCAN_ACC_ ## mod, \
 	.scan_type = { \
-		.sign = 's', \
+		.format = 's', \
 		.realbits = (bits), \
 		.storagebits = 16, \
 		.shift = 0, \
@@ -718,7 +718,7 @@ static irqreturn_t adis16400_trigger_handler(int irq, void *p)
 	.address = (addr), \
 	.scan_index = ADIS16400_SCAN_MAGN_ ## mod, \
 	.scan_type = { \
-		.sign = 's', \
+		.format = 's', \
 		.realbits = (bits), \
 		.storagebits = 16, \
 		.shift = 0, \
@@ -744,7 +744,7 @@ static irqreturn_t adis16400_trigger_handler(int irq, void *p)
 	.address = (addr), \
 	.scan_index = ADIS16350_SCAN_TEMP_ ## mod, \
 	.scan_type = { \
-		.sign = 's', \
+		.format = 's', \
 		.realbits = (bits), \
 		.storagebits = 16, \
 		.shift = 0, \
@@ -763,7 +763,7 @@ static irqreturn_t adis16400_trigger_handler(int irq, void *p)
 	.address = (addr), \
 	.scan_index = ADIS16350_SCAN_TEMP_X, \
 	.scan_type = { \
-		.sign = 's', \
+		.format = 's', \
 		.realbits = (bits), \
 		.storagebits = 16, \
 		.shift = 0, \
@@ -781,7 +781,7 @@ static irqreturn_t adis16400_trigger_handler(int irq, void *p)
 	.address = (addr), \
 	.scan_index = ADIS16300_SCAN_INCLI_ ## mod, \
 	.scan_type = { \
-		.sign = 's', \
+		.format = 's', \
 		.realbits = (bits), \
 		.storagebits = 16, \
 		.shift = 0, \
@@ -834,7 +834,7 @@ static const struct iio_chan_spec adis16448_channels[] = {
 		.address = ADIS16448_BARO_OUT,
 		.scan_index = ADIS16400_SCAN_BARO,
 		.scan_type = {
-			.sign = 's',
+			.format = 's',
 			.realbits = 16,
 			.storagebits = 16,
 			.endianness = IIO_BE,
diff --git a/drivers/iio/imu/adis16460.c b/drivers/iio/imu/adis16460.c
index ba1887d36577..e26e83ab4442 100644
--- a/drivers/iio/imu/adis16460.c
+++ b/drivers/iio/imu/adis16460.c
@@ -242,7 +242,7 @@ enum {
 		.address = (_address), \
 		.scan_index = (_si), \
 		.scan_type = { \
-			.sign = 's', \
+			.format = 's', \
 			.realbits = (_bits), \
 			.storagebits = (_bits), \
 			.endianness = IIO_BE, \
@@ -270,7 +270,7 @@ enum {
 		.address = ADIS16460_REG_TEMP_OUT, \
 		.scan_index = ADIS16460_SCAN_TEMP, \
 		.scan_type = { \
-			.sign = 's', \
+			.format = 's', \
 			.realbits = 16, \
 			.storagebits = 16, \
 			.endianness = IIO_BE, \
diff --git a/drivers/iio/imu/adis16475.c b/drivers/iio/imu/adis16475.c
index ab39bea1e729..61b0060e206a 100644
--- a/drivers/iio/imu/adis16475.c
+++ b/drivers/iio/imu/adis16475.c
@@ -671,7 +671,7 @@ static int adis16475_write_raw(struct iio_dev *indio_dev,
 		.address = (_address), \
 		.scan_index = (_si), \
 		.scan_type = { \
-			.sign = 's', \
+			.format = 's', \
 			.realbits = (_r_bits), \
 			.storagebits = (_s_bits), \
 			.endianness = IIO_BE, \
@@ -699,7 +699,7 @@ static int adis16475_write_raw(struct iio_dev *indio_dev,
 		.address = ADIS16475_REG_TEMP_OUT, \
 		.scan_index = ADIS16475_SCAN_TEMP, \
 		.scan_type = { \
-			.sign = 's', \
+			.format = 's', \
 			.realbits = 16, \
 			.storagebits = 16, \
 			.endianness = IIO_BE, \
@@ -717,7 +717,7 @@ static int adis16475_write_raw(struct iio_dev *indio_dev,
 		.address = (_address), \
 		.scan_index = _si, \
 		.scan_type = { \
-			.sign = 's', \
+			.format = 's', \
 			.realbits = (_r_bits), \
 			.storagebits = (_s_bits), \
 			.endianness = IIO_BE, \
diff --git a/drivers/iio/imu/adis16480.c b/drivers/iio/imu/adis16480.c
index 543d5c4bfb11..71bd30a43eb1 100644
--- a/drivers/iio/imu/adis16480.c
+++ b/drivers/iio/imu/adis16480.c
@@ -741,7 +741,7 @@ static int adis16480_write_raw(struct iio_dev *indio_dev,
 		.address = (_address), \
 		.scan_index = (_si), \
 		.scan_type = { \
-			.sign = 's', \
+			.format = 's', \
 			.realbits = (_bits), \
 			.storagebits = (_bits), \
 			.endianness = IIO_BE, \
@@ -798,7 +798,7 @@ static int adis16480_write_raw(struct iio_dev *indio_dev,
 		.address = ADIS16480_REG_BAROM_OUT, \
 		.scan_index = ADIS16480_SCAN_BARO, \
 		.scan_type = { \
-			.sign = 's', \
+			.format = 's', \
 			.realbits = 32, \
 			.storagebits = 32, \
 			.endianness = IIO_BE, \
@@ -816,7 +816,7 @@ static int adis16480_write_raw(struct iio_dev *indio_dev,
 		.address = ADIS16480_REG_TEMP_OUT, \
 		.scan_index = ADIS16480_SCAN_TEMP, \
 		.scan_type = { \
-			.sign = 's', \
+			.format = 's', \
 			.realbits = 16, \
 			.storagebits = 16, \
 			.endianness = IIO_BE, \
diff --git a/drivers/iio/imu/adis16550.c b/drivers/iio/imu/adis16550.c
index 28f0dbd0226c..5e73a756f254 100644
--- a/drivers/iio/imu/adis16550.c
+++ b/drivers/iio/imu/adis16550.c
@@ -706,7 +706,7 @@ static int adis16550_write_raw(struct iio_dev *indio_dev,
 		.address = (_address), \
 		.scan_index = (_si), \
 		.scan_type = { \
-			.sign = 's', \
+			.format = 's', \
 			.realbits = 32, \
 			.storagebits = 32, \
 			.endianness = IIO_BE, \
@@ -731,7 +731,7 @@ static int adis16550_write_raw(struct iio_dev *indio_dev,
 		.address = ADIS16550_REG_TEMP, \
 		.scan_index = ADIS16550_SCAN_TEMP, \
 		.scan_type = { \
-			.sign = 's', \
+			.format = 's', \
 			.realbits = 16, \
 			.storagebits = 32, \
 			.endianness = IIO_BE, \
@@ -748,7 +748,7 @@ static int adis16550_write_raw(struct iio_dev *indio_dev,
 		.address = (_address), \
 		.scan_index = _si, \
 		.scan_type = { \
-			.sign = 's', \
+			.format = 's', \
 			.realbits = 32, \
 			.storagebits = 32, \
 			.endianness = IIO_BE, \
diff --git a/drivers/iio/imu/bmi160/bmi160_core.c b/drivers/iio/imu/bmi160/bmi160_core.c
index 5f47708b4c5d..0a3b7d7c7dd5 100644
--- a/drivers/iio/imu/bmi160/bmi160_core.c
+++ b/drivers/iio/imu/bmi160/bmi160_core.c
@@ -105,7 +105,7 @@
 		BIT(IIO_CHAN_INFO_SAMP_FREQ),			\
 	.scan_index = _index,					\
 	.scan_type = {						\
-		.sign = 's',					\
+		.format = 's',					\
 		.realbits = 16,					\
 		.storagebits = 16,				\
 		.endianness = IIO_LE,				\
diff --git a/drivers/iio/imu/bmi270/bmi270_core.c b/drivers/iio/imu/bmi270/bmi270_core.c
index 2ad230788532..c6a829b8814b 100644
--- a/drivers/iio/imu/bmi270/bmi270_core.c
+++ b/drivers/iio/imu/bmi270/bmi270_core.c
@@ -1275,7 +1275,7 @@ static const struct iio_info bmi270_info = {
 		BIT(IIO_CHAN_INFO_SAMP_FREQ),			\
 	.scan_index = BMI270_SCAN_ACCEL_##_axis,		\
 	.scan_type = {						\
-		.sign = 's',					\
+		.format = 's',					\
 		.realbits = 16,					\
 		.storagebits = 16,				\
 		.endianness = IIO_LE,				\
@@ -1296,7 +1296,7 @@ static const struct iio_info bmi270_info = {
 		BIT(IIO_CHAN_INFO_SAMP_FREQ),			\
 	.scan_index = BMI270_SCAN_GYRO_##_axis,			\
 	.scan_type = {						\
-		.sign = 's',					\
+		.format = 's',					\
 		.realbits = 16,					\
 		.storagebits = 16,				\
 		.endianness = IIO_LE,				\
diff --git a/drivers/iio/imu/bmi323/bmi323_core.c b/drivers/iio/imu/bmi323/bmi323_core.c
index 6bcb9a436581..c7c9184ef6ce 100644
--- a/drivers/iio/imu/bmi323/bmi323_core.c
+++ b/drivers/iio/imu/bmi323/bmi323_core.c
@@ -248,7 +248,7 @@ static const struct iio_event_spec bmi323_accel_event[] = {
 				    BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO), \
 	.scan_index = _index,						\
 	.scan_type = {							\
-		.sign = 's',						\
+		.format = 's',						\
 		.realbits = 16,						\
 		.storagebits = 16,					\
 		.endianness = IIO_LE,					\
@@ -272,7 +272,7 @@ static const struct iio_event_spec bmi323_accel_event[] = {
 				    BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO), \
 	.scan_index = _index,						\
 	.scan_type = {							\
-		.sign = 's',						\
+		.format = 's',						\
 		.realbits = 16,						\
 		.storagebits = 16,					\
 		.endianness = IIO_LE,					\
diff --git a/drivers/iio/imu/bno055/bno055.c b/drivers/iio/imu/bno055/bno055.c
index 303bc308f80a..e74e3e3c5e8c 100644
--- a/drivers/iio/imu/bno055/bno055.c
+++ b/drivers/iio/imu/bno055/bno055.c
@@ -444,7 +444,7 @@ static void bno055_uninit(void *arg)
 	.info_mask_shared_by_type_available = _avail,				\
 	.scan_index = _index,							\
 	.scan_type = {								\
-		.sign = 's',							\
+		.format = 's',							\
 		.realbits = 16,							\
 		.storagebits = 16,						\
 		.endianness = IIO_LE,						\
diff --git a/drivers/iio/imu/inv_icm42600/inv_icm42600_accel.c b/drivers/iio/imu/inv_icm42600/inv_icm42600_accel.c
index 54760d8f92a2..48a8ea89b491 100644
--- a/drivers/iio/imu/inv_icm42600/inv_icm42600_accel.c
+++ b/drivers/iio/imu/inv_icm42600/inv_icm42600_accel.c
@@ -42,7 +42,7 @@
 			BIT(IIO_CHAN_INFO_SAMP_FREQ),			\
 		.scan_index = _index,					\
 		.scan_type = {						\
-			.sign = 's',					\
+			.format = 's',					\
 			.realbits = 16,					\
 			.storagebits = 16,				\
 			.endianness = IIO_BE,				\
diff --git a/drivers/iio/imu/inv_icm42600/inv_icm42600_gyro.c b/drivers/iio/imu/inv_icm42600/inv_icm42600_gyro.c
index 7ef0a25ec74f..59d23fd62254 100644
--- a/drivers/iio/imu/inv_icm42600/inv_icm42600_gyro.c
+++ b/drivers/iio/imu/inv_icm42600/inv_icm42600_gyro.c
@@ -39,7 +39,7 @@
 			BIT(IIO_CHAN_INFO_SAMP_FREQ),			\
 		.scan_index = _index,					\
 		.scan_type = {						\
-			.sign = 's',					\
+			.format = 's',					\
 			.realbits = 16,					\
 			.storagebits = 16,				\
 			.endianness = IIO_BE,				\
diff --git a/drivers/iio/imu/inv_icm42600/inv_icm42600_temp.h b/drivers/iio/imu/inv_icm42600/inv_icm42600_temp.h
index 3941186512fb..a2f58b8982dc 100644
--- a/drivers/iio/imu/inv_icm42600/inv_icm42600_temp.h
+++ b/drivers/iio/imu/inv_icm42600/inv_icm42600_temp.h
@@ -17,7 +17,7 @@
 			BIT(IIO_CHAN_INFO_SCALE),			\
 		.scan_index = _index,					\
 		.scan_type = {						\
-			.sign = 's',					\
+			.format = 's',					\
 			.realbits = 16,					\
 			.storagebits = 16,				\
 		},							\
diff --git a/drivers/iio/imu/inv_icm45600/inv_icm45600.h b/drivers/iio/imu/inv_icm45600/inv_icm45600.h
index c5b5446f6c3b..485287c05493 100644
--- a/drivers/iio/imu/inv_icm45600/inv_icm45600.h
+++ b/drivers/iio/imu/inv_icm45600/inv_icm45600.h
@@ -346,7 +346,7 @@ inv_icm45600_get_mount_matrix(const struct iio_dev *indio_dev,
 			BIT(IIO_CHAN_INFO_SCALE),			\
 		.scan_index = _index,					\
 		.scan_type = {						\
-			.sign = 's',					\
+			.format = 's',					\
 			.realbits = 16,					\
 			.storagebits = 16,				\
 			.endianness = IIO_LE,				\
diff --git a/drivers/iio/imu/inv_icm45600/inv_icm45600_accel.c b/drivers/iio/imu/inv_icm45600/inv_icm45600_accel.c
index efa22e02657f..6235c03fc9bd 100644
--- a/drivers/iio/imu/inv_icm45600/inv_icm45600_accel.c
+++ b/drivers/iio/imu/inv_icm45600/inv_icm45600_accel.c
@@ -52,7 +52,7 @@ static const struct iio_chan_spec_ext_info inv_icm45600_accel_ext_infos[] = {
 			BIT(IIO_CHAN_INFO_SAMP_FREQ),			\
 		.scan_index = _index,					\
 		.scan_type = {						\
-			.sign = 's',					\
+			.format = 's',					\
 			.realbits = 16,					\
 			.storagebits = 16,				\
 			.endianness = IIO_LE,				\
diff --git a/drivers/iio/imu/inv_icm45600/inv_icm45600_gyro.c b/drivers/iio/imu/inv_icm45600/inv_icm45600_gyro.c
index 1e85fd0e4ea9..a374b276d813 100644
--- a/drivers/iio/imu/inv_icm45600/inv_icm45600_gyro.c
+++ b/drivers/iio/imu/inv_icm45600/inv_icm45600_gyro.c
@@ -52,7 +52,7 @@ static const struct iio_chan_spec_ext_info inv_icm45600_gyro_ext_infos[] = {
 			BIT(IIO_CHAN_INFO_SAMP_FREQ),			\
 		.scan_index = _index,					\
 		.scan_type = {						\
-			.sign = 's',					\
+			.format = 's',					\
 			.realbits = 16,					\
 			.storagebits = 16,				\
 			.endianness = IIO_LE,				\
diff --git a/drivers/iio/imu/inv_mpu6050/inv_mpu_core.c b/drivers/iio/imu/inv_mpu6050/inv_mpu_core.c
index b2fa1f4957a5..418a623ab856 100644
--- a/drivers/iio/imu/inv_mpu6050/inv_mpu_core.c
+++ b/drivers/iio/imu/inv_mpu6050/inv_mpu_core.c
@@ -1469,7 +1469,7 @@ static const struct iio_event_spec inv_wom_events[] = {
 				      BIT(IIO_CHAN_INFO_CALIBBIAS),   \
 		.scan_index = _index,                                 \
 		.scan_type = {                                        \
-				.sign = 's',                          \
+				.format = 's',                        \
 				.realbits = 16,                       \
 				.storagebits = 16,                    \
 				.shift = 0,                           \
@@ -1486,7 +1486,7 @@ static const struct iio_event_spec inv_wom_events[] = {
 				| BIT(IIO_CHAN_INFO_SCALE),	\
 		.scan_index = _index,				\
 		.scan_type = {					\
-			.sign = 's',				\
+			.format = 's',				\
 			.realbits = 16,				\
 			.storagebits = 16,			\
 			.shift = 0,				\
@@ -1578,7 +1578,7 @@ static const unsigned long inv_mpu_scan_masks[] = {
 				      BIT(IIO_CHAN_INFO_RAW),		\
 		.scan_index = _index,					\
 		.scan_type = {						\
-			.sign = 's',					\
+			.format = 's',					\
 			.realbits = _bits,				\
 			.storagebits = 16,				\
 			.shift = 0,					\
diff --git a/drivers/iio/imu/kmx61.c b/drivers/iio/imu/kmx61.c
index 3cd91d8a89ee..43c6281da0bd 100644
--- a/drivers/iio/imu/kmx61.c
+++ b/drivers/iio/imu/kmx61.c
@@ -234,7 +234,7 @@ static const struct iio_event_spec kmx61_event = {
 	.address = KMX61_ACC, \
 	.scan_index = KMX61_AXIS_ ## _axis, \
 	.scan_type = { \
-		.sign = 's', \
+		.format = 's', \
 		.realbits = 12, \
 		.storagebits = 16, \
 		.shift = 4, \
@@ -254,7 +254,7 @@ static const struct iio_event_spec kmx61_event = {
 				BIT(IIO_CHAN_INFO_SAMP_FREQ), \
 	.scan_index = KMX61_AXIS_ ## _axis, \
 	.scan_type = { \
-		.sign = 's', \
+		.format = 's', \
 		.realbits = 14, \
 		.storagebits = 16, \
 		.shift = 2, \
diff --git a/drivers/iio/imu/smi240.c b/drivers/iio/imu/smi240.c
index d159ee59acdd..f2a504c69e6a 100644
--- a/drivers/iio/imu/smi240.c
+++ b/drivers/iio/imu/smi240.c
@@ -80,7 +80,7 @@
 		BIT(IIO_CHAN_INFO_LOW_PASS_FILTER_3DB_FREQUENCY),	\
 	.scan_index = _index,						\
 	.scan_type = {							\
-		.sign = 's',						\
+		.format = 's',						\
 		.realbits = 16,						\
 		.storagebits = 16,					\
 		.endianness = IIO_CPU,					\
@@ -96,7 +96,7 @@
 		BIT(IIO_CHAN_INFO_SCALE),		\
 	.scan_index = _index,				\
 	.scan_type = {					\
-		.sign = 's',				\
+		.format = 's',				\
 		.realbits = 16,				\
 		.storagebits = 16,			\
 		.endianness = IIO_CPU,			\
diff --git a/drivers/iio/imu/smi330/smi330_core.c b/drivers/iio/imu/smi330/smi330_core.c
index 7ec5ae7f521a..5d7f6730e2ca 100644
--- a/drivers/iio/imu/smi330/smi330_core.c
+++ b/drivers/iio/imu/smi330/smi330_core.c
@@ -85,7 +85,7 @@
 		BIT(IIO_CHAN_INFO_SAMP_FREQ),				\
 	.scan_index = SMI330_SCAN_ACCEL_##_axis,			\
 	.scan_type = {							\
-		.sign = 's',						\
+		.format = 's',						\
 		.realbits = 16,						\
 		.storagebits = 16,					\
 		.endianness = IIO_LE,					\
@@ -110,7 +110,7 @@
 		BIT(IIO_CHAN_INFO_SAMP_FREQ),				\
 	.scan_index = SMI330_SCAN_GYRO_##_axis,				\
 	.scan_type = {							\
-		.sign = 's',						\
+		.format = 's',						\
 		.realbits = 16,						\
 		.storagebits = 16,					\
 		.endianness = IIO_LE,					\
@@ -124,7 +124,7 @@
 		BIT(IIO_CHAN_INFO_SCALE),		\
 	.scan_index = _index,				\
 	.scan_type = {					\
-		.sign = 's',				\
+		.format = 's',				\
 		.realbits = 16,				\
 		.storagebits = 16,			\
 		.endianness = IIO_LE,			\
diff --git a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx.h b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx.h
index 07b1773c87bd..39d23b9e677c 100644
--- a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx.h
+++ b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx.h
@@ -92,7 +92,7 @@ enum st_lsm6dsx_hw_id {
 	.info_mask_shared_by_all = BIT(IIO_CHAN_INFO_SAMP_FREQ),	\
 	.scan_index = scan_idx,						\
 	.scan_type = {							\
-		.sign = 's',						\
+		.format = 's',						\
 		.realbits = 16,						\
 		.storagebits = 16,					\
 		.endianness = IIO_LE,					\
@@ -113,7 +113,7 @@ enum st_lsm6dsx_hw_id {
 	.info_mask_shared_by_all = BIT(IIO_CHAN_INFO_SAMP_FREQ),	\
 	.scan_index = scan_idx,						\
 	.scan_type = {							\
-		.sign = 's',						\
+		.format = 's',						\
 		.realbits = 16,						\
 		.storagebits = 16,					\
 		.endianness = IIO_LE,					\
diff --git a/drivers/iio/industrialio-buffer.c b/drivers/iio/industrialio-buffer.c
index f15a180dc49e..60f16749c79d 100644
--- a/drivers/iio/industrialio-buffer.c
+++ b/drivers/iio/industrialio-buffer.c
@@ -421,7 +421,7 @@ static ssize_t iio_show_fixed_type(struct device *dev,
 	if (scan_type->repeat > 1)
 		return sysfs_emit(buf, "%s:%c%d/%dX%d>>%u\n",
 		       iio_endian_prefix[type],
-		       scan_type->sign,
+		       scan_type->format,
 		       scan_type->realbits,
 		       scan_type->storagebits,
 		       scan_type->repeat,
@@ -429,7 +429,7 @@ static ssize_t iio_show_fixed_type(struct device *dev,
 	else
 		return sysfs_emit(buf, "%s:%c%d/%d>>%u\n",
 		       iio_endian_prefix[type],
-		       scan_type->sign,
+		       scan_type->format,
 		       scan_type->realbits,
 		       scan_type->storagebits,
 		       scan_type->shift);
diff --git a/drivers/iio/light/acpi-als.c b/drivers/iio/light/acpi-als.c
index d5d1a8b9c035..84626ff5d5bc 100644
--- a/drivers/iio/light/acpi-als.c
+++ b/drivers/iio/light/acpi-als.c
@@ -38,7 +38,7 @@ static const struct iio_chan_spec acpi_als_channels[] = {
 	{
 		.type		= IIO_LIGHT,
 		.scan_type	= {
-			.sign		= 's',
+			.format		= 's',
 			.realbits	= 32,
 			.storagebits	= 32,
 		},
diff --git a/drivers/iio/light/adjd_s311.c b/drivers/iio/light/adjd_s311.c
index edb3d9dc8bed..377bbd821870 100644
--- a/drivers/iio/light/adjd_s311.c
+++ b/drivers/iio/light/adjd_s311.c
@@ -152,7 +152,7 @@ static irqreturn_t adjd_s311_trigger_handler(int irq, void *p)
 	.channel2 = (IIO_MOD_LIGHT_##_color), \
 	.scan_index = (_scan_idx), \
 	.scan_type = { \
-		.sign = 'u', \
+		.format = 'u', \
 		.realbits = 10, \
 		.storagebits = 16, \
 		.endianness = IIO_CPU, \
diff --git a/drivers/iio/light/apds9960.c b/drivers/iio/light/apds9960.c
index 785c5dbe2d08..f227ff629628 100644
--- a/drivers/iio/light/apds9960.c
+++ b/drivers/iio/light/apds9960.c
@@ -278,7 +278,7 @@ static const struct iio_event_spec apds9960_als_event_spec[] = {
 	.scan_index = _si, \
 	.indexed = 1, \
 	.scan_type = { \
-		.sign = 'u', \
+		.format = 'u', \
 		.realbits = 8, \
 		.storagebits = 8, \
 	}, \
diff --git a/drivers/iio/light/as73211.c b/drivers/iio/light/as73211.c
index 32719f584c47..e41aa5a89684 100644
--- a/drivers/iio/light/as73211.c
+++ b/drivers/iio/light/as73211.c
@@ -142,7 +142,7 @@ struct as73211_data {
 	.address = _addr, \
 	.scan_index = _si, \
 	.scan_type = { \
-		.sign = 'u', \
+		.format = 'u', \
 		.realbits = 16, \
 		.storagebits = 16, \
 		.endianness = IIO_LE, \
@@ -194,7 +194,7 @@ static const struct iio_chan_spec as73211_channels[] = {
 		.address = AS73211_OUT_TEMP,
 		.scan_index = AS73211_SCAN_INDEX_TEMP,
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 16,
 			.storagebits = 16,
 			.endianness = IIO_LE,
@@ -216,7 +216,7 @@ static const struct iio_chan_spec as7331_channels[] = {
 		.address = AS73211_OUT_TEMP,
 		.scan_index = AS73211_SCAN_INDEX_TEMP,
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 16,
 			.storagebits = 16,
 			.endianness = IIO_LE,
diff --git a/drivers/iio/light/bh1745.c b/drivers/iio/light/bh1745.c
index 10b00344bbed..d13b58db8c40 100644
--- a/drivers/iio/light/bh1745.c
+++ b/drivers/iio/light/bh1745.c
@@ -207,7 +207,7 @@ static const struct iio_event_spec bh1745_event_spec[] = {
 		.channel2 = IIO_MOD_LIGHT_##_colour, .address = _addr,  \
 		.scan_index = _si,                                      \
 		.scan_type = {                                          \
-			.sign = 'u',                                    \
+			.format = 'u',                                  \
 			.realbits = 16,                                 \
 			.storagebits = 16,                              \
 			.endianness = IIO_CPU,                          \
diff --git a/drivers/iio/light/cros_ec_light_prox.c b/drivers/iio/light/cros_ec_light_prox.c
index 815806ceb5c8..2178ab3f2936 100644
--- a/drivers/iio/light/cros_ec_light_prox.c
+++ b/drivers/iio/light/cros_ec_light_prox.c
@@ -200,7 +200,7 @@ static int cros_ec_light_prox_probe(struct platform_device *pdev)
 	channel->scan_type.shift = 0;
 	channel->scan_index = 0;
 	channel->ext_info = cros_ec_sensors_ext_info;
-	channel->scan_type.sign = 'u';
+	channel->scan_type.format = 'u';
 
 	/* Sensor specific */
 	switch (state->core.type) {
@@ -228,7 +228,7 @@ static int cros_ec_light_prox_probe(struct platform_device *pdev)
 	channel->type = IIO_TIMESTAMP;
 	channel->channel = -1;
 	channel->scan_index = 1;
-	channel->scan_type.sign = 's';
+	channel->scan_type.format = 's';
 	channel->scan_type.realbits = 64;
 	channel->scan_type.storagebits = 64;
 
diff --git a/drivers/iio/light/gp2ap020a00f.c b/drivers/iio/light/gp2ap020a00f.c
index c7df4b258e2c..d493819376ba 100644
--- a/drivers/iio/light/gp2ap020a00f.c
+++ b/drivers/iio/light/gp2ap020a00f.c
@@ -1327,7 +1327,7 @@ static const struct iio_chan_spec gp2ap020a00f_channels[] = {
 		.modified = 1,
 		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 24,
 			.shift = 0,
 			.storagebits = 32,
@@ -1344,7 +1344,7 @@ static const struct iio_chan_spec gp2ap020a00f_channels[] = {
 		.modified = 1,
 		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 24,
 			.shift = 0,
 			.storagebits = 32,
@@ -1358,7 +1358,7 @@ static const struct iio_chan_spec gp2ap020a00f_channels[] = {
 		.modified = 0,
 		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 16,
 			.shift = 0,
 			.storagebits = 16,
diff --git a/drivers/iio/light/hid-sensor-als.c b/drivers/iio/light/hid-sensor-als.c
index 384572844162..631602f865e6 100644
--- a/drivers/iio/light/hid-sensor-als.c
+++ b/drivers/iio/light/hid-sensor-als.c
@@ -121,7 +121,7 @@ static const struct iio_chan_spec als_channels[] = {
 static void als_adjust_channel_bit_mask(struct iio_chan_spec *channels,
 					int channel, int size)
 {
-	channels[channel].scan_type.sign = 's';
+	channels[channel].scan_type.format = 's';
 	/* Real storage bits will change based on the report desc. */
 	channels[channel].scan_type.realbits = size * 8;
 	/* Maximum size of a sample to capture is u32 */
diff --git a/drivers/iio/light/hid-sensor-prox.c b/drivers/iio/light/hid-sensor-prox.c
index efa904a70d0e..f4506c9fe2f0 100644
--- a/drivers/iio/light/hid-sensor-prox.c
+++ b/drivers/iio/light/hid-sensor-prox.c
@@ -71,7 +71,7 @@ static const struct iio_chan_spec prox_channels[] = {
 static void prox_adjust_channel_bit_mask(struct iio_chan_spec *channels,
 					int channel, int size)
 {
-	channels[channel].scan_type.sign = 's';
+	channels[channel].scan_type.format = 's';
 	/* Real storage bits will change based on the report desc. */
 	channels[channel].scan_type.realbits = size * 8;
 	/* Maximum size of a sample to capture is u32 */
diff --git a/drivers/iio/light/isl29125.c b/drivers/iio/light/isl29125.c
index 3acb8a4f1d12..8dec5ab93055 100644
--- a/drivers/iio/light/isl29125.c
+++ b/drivers/iio/light/isl29125.c
@@ -61,7 +61,7 @@ struct isl29125_data {
 	.channel2 = IIO_MOD_LIGHT_##_color, \
 	.scan_index = _si, \
 	.scan_type = { \
-		.sign = 'u', \
+		.format = 'u', \
 		.realbits = 16, \
 		.storagebits = 16, \
 		.endianness = IIO_CPU, \
diff --git a/drivers/iio/light/ltr501.c b/drivers/iio/light/ltr501.c
index 022e0693983b..889ce4fa8d44 100644
--- a/drivers/iio/light/ltr501.c
+++ b/drivers/iio/light/ltr501.c
@@ -585,7 +585,7 @@ static const struct iio_event_spec ltr501_pxs_event_spec[] = {
 	.info_mask_shared_by_type = (_shared), \
 	.scan_index = (_idx), \
 	.scan_type = { \
-		.sign = 'u', \
+		.format = 'u', \
 		.realbits = 16, \
 		.storagebits = 16, \
 		.endianness = IIO_CPU, \
@@ -617,7 +617,7 @@ static const struct iio_chan_spec ltr501_channels[] = {
 			BIT(IIO_CHAN_INFO_SCALE),
 		.scan_index = 2,
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 11,
 			.storagebits = 16,
 			.endianness = IIO_CPU,
diff --git a/drivers/iio/light/max44000.c b/drivers/iio/light/max44000.c
index 039d45af3a7f..eacb20c9c945 100644
--- a/drivers/iio/light/max44000.c
+++ b/drivers/iio/light/max44000.c
@@ -135,7 +135,7 @@ static const struct iio_chan_spec max44000_channels[] = {
 					    BIT(IIO_CHAN_INFO_INT_TIME),
 		.scan_index = MAX44000_SCAN_INDEX_ALS,
 		.scan_type = {
-			.sign		= 'u',
+			.format		= 'u',
 			.realbits	= 14,
 			.storagebits	= 16,
 		}
@@ -145,7 +145,7 @@ static const struct iio_chan_spec max44000_channels[] = {
 		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),
 		.scan_index = MAX44000_SCAN_INDEX_PRX,
 		.scan_type = {
-			.sign		= 'u',
+			.format		= 'u',
 			.realbits	= 8,
 			.storagebits	= 16,
 		}
diff --git a/drivers/iio/light/opt4060.c b/drivers/iio/light/opt4060.c
index d6e915ab355d..584ecf30082a 100644
--- a/drivers/iio/light/opt4060.c
+++ b/drivers/iio/light/opt4060.c
@@ -534,7 +534,7 @@ static void opt4060_chip_off_action(void *chip)
 	.address = OPT4060_##_color##_MSB,					\
 	.scan_index = OPT4060_##_color,						\
 	.scan_type = {								\
-		.sign = 'u',							\
+		.format = 'u',							\
 		.realbits = 32,							\
 		.storagebits = 32,						\
 		.endianness = IIO_CPU,						\
@@ -558,7 +558,7 @@ static void opt4060_chip_off_action(void *chip)
 	.info_mask_shared_by_all_available = BIT(IIO_CHAN_INFO_INT_TIME),	\
 	.scan_index = OPT4060_##_channel,					\
 	.scan_type = {								\
-		.sign = 'u',							\
+		.format = 'u',							\
 		.realbits = 32,							\
 		.storagebits = 32,						\
 		.endianness = IIO_CPU,						\
diff --git a/drivers/iio/light/rohm-bu27034.c b/drivers/iio/light/rohm-bu27034.c
index 28d111ac8c0a..800bf2ed51b9 100644
--- a/drivers/iio/light/rohm-bu27034.c
+++ b/drivers/iio/light/rohm-bu27034.c
@@ -158,7 +158,7 @@ static const struct iio_itime_sel_mul bu27034_itimes[] = {
 	.address = BU27034_REG_##_name##_LO,				\
 	.scan_index = BU27034_CHAN_##_name,				\
 	.scan_type = {							\
-		.sign = 'u',						\
+		.format = 'u',						\
 		.realbits = 16,						\
 		.storagebits = 16,					\
 		.endianness = IIO_LE,					\
@@ -174,7 +174,7 @@ static const struct iio_chan_spec bu27034_channels[] = {
 		.channel = BU27034_CHAN_ALS,
 		.scan_index = BU27034_CHAN_ALS,
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 32,
 			.storagebits = 32,
 			.endianness = IIO_CPU,
diff --git a/drivers/iio/light/rpr0521.c b/drivers/iio/light/rpr0521.c
index 9341c1d58cbe..f40950750239 100644
--- a/drivers/iio/light/rpr0521.c
+++ b/drivers/iio/light/rpr0521.c
@@ -249,7 +249,7 @@ static const struct iio_chan_spec rpr0521_channels[] = {
 		.info_mask_shared_by_all = BIT(IIO_CHAN_INFO_SAMP_FREQ),
 		.scan_index = RPR0521_CHAN_INDEX_PXS,
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 16,
 			.storagebits = 16,
 			.endianness = IIO_LE,
@@ -265,7 +265,7 @@ static const struct iio_chan_spec rpr0521_channels[] = {
 		.info_mask_shared_by_all = BIT(IIO_CHAN_INFO_SAMP_FREQ),
 		.scan_index = RPR0521_CHAN_INDEX_BOTH,
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 16,
 			.storagebits = 16,
 			.endianness = IIO_LE,
@@ -281,7 +281,7 @@ static const struct iio_chan_spec rpr0521_channels[] = {
 		.info_mask_shared_by_all = BIT(IIO_CHAN_INFO_SAMP_FREQ),
 		.scan_index = RPR0521_CHAN_INDEX_IR,
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 16,
 			.storagebits = 16,
 			.endianness = IIO_LE,
diff --git a/drivers/iio/light/si1145.c b/drivers/iio/light/si1145.c
index ef0abc4499b7..78c1cc320d38 100644
--- a/drivers/iio/light/si1145.c
+++ b/drivers/iio/light/si1145.c
@@ -793,7 +793,7 @@ static int si1145_write_raw(struct iio_dev *indio_dev,
 }
 
 #define SI1145_ST { \
-	.sign = 'u', \
+	.format = 'u', \
 	.realbits = 16, \
 	.storagebits = 16, \
 	.endianness = IIO_LE, \
diff --git a/drivers/iio/light/st_uvis25_core.c b/drivers/iio/light/st_uvis25_core.c
index bcd729a9924e..a18fbf791a90 100644
--- a/drivers/iio/light/st_uvis25_core.c
+++ b/drivers/iio/light/st_uvis25_core.c
@@ -43,7 +43,7 @@ static const struct iio_chan_spec st_uvis25_channels[] = {
 		.info_mask_separate = BIT(IIO_CHAN_INFO_PROCESSED),
 		.scan_index = 0,
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 8,
 			.storagebits = 8,
 		},
diff --git a/drivers/iio/light/tcs3414.c b/drivers/iio/light/tcs3414.c
index 5be461e6dbdb..9b4c8184af8f 100644
--- a/drivers/iio/light/tcs3414.c
+++ b/drivers/iio/light/tcs3414.c
@@ -65,7 +65,7 @@ struct tcs3414_data {
 	.address = _addr, \
 	.scan_index = _si, \
 	.scan_type = { \
-		.sign = 'u', \
+		.format = 'u', \
 		.realbits = 16, \
 		.storagebits = 16, \
 		.endianness = IIO_CPU, \
diff --git a/drivers/iio/light/tcs3472.c b/drivers/iio/light/tcs3472.c
index 12429a3261b3..7328631876fb 100644
--- a/drivers/iio/light/tcs3472.c
+++ b/drivers/iio/light/tcs3472.c
@@ -93,7 +93,7 @@ static const struct iio_event_spec tcs3472_events[] = {
 	.address = _addr, \
 	.scan_index = _si, \
 	.scan_type = { \
-		.sign = 'u', \
+		.format = 'u', \
 		.realbits = 16, \
 		.storagebits = 16, \
 		.endianness = IIO_CPU, \
diff --git a/drivers/iio/light/vcnl4000.c b/drivers/iio/light/vcnl4000.c
index a36c23813679..29e719a392ef 100644
--- a/drivers/iio/light/vcnl4000.c
+++ b/drivers/iio/light/vcnl4000.c
@@ -1809,7 +1809,7 @@ static const struct iio_chan_spec vcnl4010_channels[] = {
 		.num_event_specs = ARRAY_SIZE(vcnl4000_event_spec),
 		.ext_info = vcnl4000_ext_info,
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 16,
 			.storagebits = 16,
 			.endianness = IIO_CPU,
diff --git a/drivers/iio/light/vcnl4035.c b/drivers/iio/light/vcnl4035.c
index 963747927425..976383b72ac0 100644
--- a/drivers/iio/light/vcnl4035.c
+++ b/drivers/iio/light/vcnl4035.c
@@ -378,7 +378,7 @@ static const struct iio_chan_spec vcnl4035_channels[] = {
 		.num_event_specs = ARRAY_SIZE(vcnl4035_event_spec),
 		.scan_index = VCNL4035_CHAN_INDEX_LIGHT,
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 16,
 			.storagebits = 16,
 			.endianness = IIO_LE,
@@ -392,7 +392,7 @@ static const struct iio_chan_spec vcnl4035_channels[] = {
 		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),
 		.scan_index = VCNL4035_CHAN_INDEX_WHITE_LED,
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 16,
 			.storagebits = 16,
 			.endianness = IIO_LE,
diff --git a/drivers/iio/light/veml6030.c b/drivers/iio/light/veml6030.c
index 6bcacae3863c..a1c63ad52246 100644
--- a/drivers/iio/light/veml6030.c
+++ b/drivers/iio/light/veml6030.c
@@ -285,7 +285,7 @@ static const struct iio_chan_spec veml6030_channels[] = {
 		.num_event_specs = ARRAY_SIZE(veml6030_event_spec),
 		.scan_index = VEML6030_SCAN_ALS,
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 16,
 			.storagebits = 16,
 			.endianness = IIO_CPU,
@@ -303,7 +303,7 @@ static const struct iio_chan_spec veml6030_channels[] = {
 						     BIT(IIO_CHAN_INFO_SCALE),
 		.scan_index = VEML6030_SCAN_WH,
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 16,
 			.storagebits = 16,
 			.endianness = IIO_CPU,
@@ -324,7 +324,7 @@ static const struct iio_chan_spec veml7700_channels[] = {
 						     BIT(IIO_CHAN_INFO_SCALE),
 		.scan_index = VEML6030_SCAN_ALS,
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 16,
 			.storagebits = 16,
 			.endianness = IIO_CPU,
@@ -342,7 +342,7 @@ static const struct iio_chan_spec veml7700_channels[] = {
 						     BIT(IIO_CHAN_INFO_SCALE),
 		.scan_index = VEML6030_SCAN_WH,
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 16,
 			.storagebits = 16,
 			.endianness = IIO_CPU,
diff --git a/drivers/iio/light/veml6046x00.c b/drivers/iio/light/veml6046x00.c
index e60f24d46e7b..692cdedd202d 100644
--- a/drivers/iio/light/veml6046x00.c
+++ b/drivers/iio/light/veml6046x00.c
@@ -329,7 +329,7 @@ static const struct iio_chan_spec veml6046x00_channels[] = {
 						     BIT(IIO_CHAN_INFO_SCALE),
 		.scan_index = VEML6046X00_SCAN_R,
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 16,
 			.storagebits = 16,
 			.endianness = IIO_LE,
@@ -347,7 +347,7 @@ static const struct iio_chan_spec veml6046x00_channels[] = {
 						     BIT(IIO_CHAN_INFO_SCALE),
 		.scan_index = VEML6046X00_SCAN_G,
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 16,
 			.storagebits = 16,
 			.endianness = IIO_LE,
@@ -365,7 +365,7 @@ static const struct iio_chan_spec veml6046x00_channels[] = {
 						     BIT(IIO_CHAN_INFO_SCALE),
 		.scan_index = VEML6046X00_SCAN_B,
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 16,
 			.storagebits = 16,
 			.endianness = IIO_LE,
@@ -383,7 +383,7 @@ static const struct iio_chan_spec veml6046x00_channels[] = {
 						     BIT(IIO_CHAN_INFO_SCALE),
 		.scan_index = VEML6046X00_SCAN_IR,
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 16,
 			.storagebits = 16,
 			.endianness = IIO_LE,
diff --git a/drivers/iio/light/vl6180.c b/drivers/iio/light/vl6180.c
index c1314b144367..3aebeea6ece9 100644
--- a/drivers/iio/light/vl6180.c
+++ b/drivers/iio/light/vl6180.c
@@ -281,7 +281,7 @@ static const struct iio_chan_spec vl6180_channels[] = {
 		.address = VL6180_ALS,
 		.scan_index = VL6180_ALS,
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 16,
 			.storagebits = 16,
 		},
@@ -295,7 +295,7 @@ static const struct iio_chan_spec vl6180_channels[] = {
 		.address = VL6180_RANGE,
 		.scan_index = VL6180_RANGE,
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 8,
 			.storagebits = 8,
 		},
@@ -307,7 +307,7 @@ static const struct iio_chan_spec vl6180_channels[] = {
 		.address = VL6180_PROX,
 		.scan_index = VL6180_PROX,
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 16,
 			.storagebits = 16,
 		},
diff --git a/drivers/iio/magnetometer/af8133j.c b/drivers/iio/magnetometer/af8133j.c
index b1768c3aa8f3..cac53f85a6e6 100644
--- a/drivers/iio/magnetometer/af8133j.c
+++ b/drivers/iio/magnetometer/af8133j.c
@@ -84,7 +84,7 @@ static const struct iio_chan_spec_ext_info af8133j_ext_info[] = {
 	.ext_info = af8133j_ext_info, \
 	.scan_index = _si, \
 	.scan_type = { \
-		.sign = 's', \
+		.format = 's', \
 		.realbits = 16, \
 		.storagebits = 16, \
 		.endianness = IIO_LE, \
diff --git a/drivers/iio/magnetometer/ak8974.c b/drivers/iio/magnetometer/ak8974.c
index 68ece700c7ce..000429798b9e 100644
--- a/drivers/iio/magnetometer/ak8974.c
+++ b/drivers/iio/magnetometer/ak8974.c
@@ -716,7 +716,7 @@ static const struct iio_chan_spec_ext_info ak8974_ext_info[] = {
 		.address = index,					\
 		.scan_index = index,					\
 		.scan_type = {						\
-			.sign = 's',					\
+			.format = 's',					\
 			.realbits = bits,				\
 			.storagebits = 16,				\
 			.endianness = IIO_LE				\
diff --git a/drivers/iio/magnetometer/ak8975.c b/drivers/iio/magnetometer/ak8975.c
index d30315ad85de..d0414ab6a155 100644
--- a/drivers/iio/magnetometer/ak8975.c
+++ b/drivers/iio/magnetometer/ak8975.c
@@ -830,7 +830,7 @@ static const struct iio_chan_spec_ext_info ak8975_ext_info[] = {
 		.address = index,					\
 		.scan_index = index,					\
 		.scan_type = {						\
-			.sign = 's',					\
+			.format = 's',					\
 			.realbits = 16,					\
 			.storagebits = 16,				\
 			.endianness = IIO_CPU				\
diff --git a/drivers/iio/magnetometer/als31300.c b/drivers/iio/magnetometer/als31300.c
index 2a2677428ed5..26b2c791eb8f 100644
--- a/drivers/iio/magnetometer/als31300.c
+++ b/drivers/iio/magnetometer/als31300.c
@@ -261,7 +261,7 @@ static irqreturn_t als31300_trigger_handler(int irq, void *p)
 		.address = index,					     \
 		.scan_index = index,					     \
 		.scan_type = {						     \
-			.sign = 's',					     \
+			.format = 's',					     \
 			.realbits = 12,					     \
 			.storagebits = 16,				     \
 			.endianness = IIO_CPU,				     \
@@ -277,7 +277,7 @@ static const struct iio_chan_spec als31300_channels[] = {
 		.address = TEMPERATURE,
 		.scan_index = TEMPERATURE,
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 16,
 			.storagebits = 16,
 			.endianness = IIO_CPU,
diff --git a/drivers/iio/magnetometer/bmc150_magn.c b/drivers/iio/magnetometer/bmc150_magn.c
index a022e1805dff..52669027c63b 100644
--- a/drivers/iio/magnetometer/bmc150_magn.c
+++ b/drivers/iio/magnetometer/bmc150_magn.c
@@ -633,7 +633,7 @@ static const struct attribute_group bmc150_magn_attrs_group = {
 				    BIT(IIO_CHAN_INFO_SCALE),		\
 	.scan_index = AXIS_##_axis,					\
 	.scan_type = {							\
-		.sign = 's',						\
+		.format = 's',						\
 		.realbits = 32,						\
 		.storagebits = 32,					\
 		.endianness = IIO_LE					\
diff --git a/drivers/iio/magnetometer/hid-sensor-magn-3d.c b/drivers/iio/magnetometer/hid-sensor-magn-3d.c
index c673f9323e47..177236c60ce5 100644
--- a/drivers/iio/magnetometer/hid-sensor-magn-3d.c
+++ b/drivers/iio/magnetometer/hid-sensor-magn-3d.c
@@ -136,7 +136,7 @@ static const struct iio_chan_spec magn_3d_channels[] = {
 static void magn_3d_adjust_channel_bit_mask(struct iio_chan_spec *channels,
 						int channel, int size)
 {
-	channels[channel].scan_type.sign = 's';
+	channels[channel].scan_type.format = 's';
 	/* Real storage bits will change based on the report desc. */
 	channels[channel].scan_type.realbits = size * 8;
 	/* Maximum size of a sample to capture is u32 */
diff --git a/drivers/iio/magnetometer/hmc5843_core.c b/drivers/iio/magnetometer/hmc5843_core.c
index fc16ebd314f7..876653ec3f68 100644
--- a/drivers/iio/magnetometer/hmc5843_core.c
+++ b/drivers/iio/magnetometer/hmc5843_core.c
@@ -471,7 +471,7 @@ static irqreturn_t hmc5843_trigger_handler(int irq, void *p)
 			BIT(IIO_CHAN_INFO_SAMP_FREQ),			\
 		.scan_index = idx,					\
 		.scan_type = {						\
-			.sign = 's',					\
+			.format = 's',					\
 			.realbits = 16,					\
 			.storagebits = 16,				\
 			.endianness = IIO_BE,				\
@@ -489,7 +489,7 @@ static irqreturn_t hmc5843_trigger_handler(int irq, void *p)
 			BIT(IIO_CHAN_INFO_SAMP_FREQ),			\
 		.scan_index = idx,					\
 		.scan_type = {						\
-			.sign = 's',					\
+			.format = 's',					\
 			.realbits = 16,					\
 			.storagebits = 16,				\
 			.endianness = IIO_BE,				\
diff --git a/drivers/iio/magnetometer/mag3110.c b/drivers/iio/magnetometer/mag3110.c
index ff09250a06e7..4d7bdd74318e 100644
--- a/drivers/iio/magnetometer/mag3110.c
+++ b/drivers/iio/magnetometer/mag3110.c
@@ -422,7 +422,7 @@ static irqreturn_t mag3110_trigger_handler(int irq, void *p)
 		BIT(IIO_CHAN_INFO_SCALE), \
 	.scan_index = idx, \
 	.scan_type = { \
-		.sign = 's', \
+		.format = 's', \
 		.realbits = 16, \
 		.storagebits = 16, \
 		.endianness = IIO_BE, \
@@ -439,7 +439,7 @@ static const struct iio_chan_spec mag3110_channels[] = {
 			BIT(IIO_CHAN_INFO_SCALE),
 		.scan_index = 3,
 		.scan_type = {
-			.sign = 's',
+			.format = 's',
 			.realbits = 8,
 			.storagebits = 8,
 			},
diff --git a/drivers/iio/magnetometer/rm3100-core.c b/drivers/iio/magnetometer/rm3100-core.c
index 2b2884425746..498520dc514f 100644
--- a/drivers/iio/magnetometer/rm3100-core.c
+++ b/drivers/iio/magnetometer/rm3100-core.c
@@ -237,7 +237,7 @@ static int rm3100_read_mag(struct rm3100_data *data, int idx, int *val)
 			BIT(IIO_CHAN_INFO_SAMP_FREQ),			\
 		.scan_index = idx,					\
 		.scan_type = {						\
-			.sign = 's',					\
+			.format = 's',					\
 			.realbits = 24,					\
 			.storagebits = 32,				\
 			.shift = 8,					\
diff --git a/drivers/iio/magnetometer/tlv493d.c b/drivers/iio/magnetometer/tlv493d.c
index ec53fd40277b..6731088a0320 100644
--- a/drivers/iio/magnetometer/tlv493d.c
+++ b/drivers/iio/magnetometer/tlv493d.c
@@ -379,7 +379,7 @@ static irqreturn_t tlv493d_trigger_handler(int irq, void *ptr)
 		.address = index,				\
 		.scan_index = index,				\
 		.scan_type = {					\
-			.sign = 's',				\
+			.format = 's',				\
 			.realbits = 12,				\
 			.storagebits = 16,			\
 			.endianness = IIO_CPU,			\
@@ -398,7 +398,7 @@ static const struct iio_chan_spec tlv493d_channels[] = {
 		.address = TLV493D_TEMPERATURE,
 		.scan_index = TLV493D_TEMPERATURE,
 		.scan_type = {
-			.sign = 's',
+			.format = 's',
 			.realbits = 12,
 			.storagebits = 16,
 			.endianness = IIO_CPU,
diff --git a/drivers/iio/magnetometer/tmag5273.c b/drivers/iio/magnetometer/tmag5273.c
index 2adc3c036ab4..61790147bdea 100644
--- a/drivers/iio/magnetometer/tmag5273.c
+++ b/drivers/iio/magnetometer/tmag5273.c
@@ -405,7 +405,7 @@ static int tmag5273_write_raw(struct iio_dev *indio_dev,
 		.address = index,					     \
 		.scan_index = index,					     \
 		.scan_type = {						     \
-			.sign = 's',					     \
+			.format = 's',					     \
 			.realbits = 16,					     \
 			.storagebits = 16,				     \
 			.endianness = IIO_CPU,				     \
@@ -421,7 +421,7 @@ static const struct iio_chan_spec tmag5273_channels[] = {
 		.address = TEMPERATURE,
 		.scan_index = TEMPERATURE,
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 16,
 			.storagebits = 16,
 			.endianness = IIO_CPU,
@@ -441,7 +441,7 @@ static const struct iio_chan_spec tmag5273_channels[] = {
 		.address = ANGLE,
 		.scan_index = ANGLE,
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 16,
 			.storagebits = 16,
 			.endianness = IIO_CPU,
@@ -457,7 +457,7 @@ static const struct iio_chan_spec tmag5273_channels[] = {
 		.address = MAGNITUDE,
 		.scan_index = MAGNITUDE,
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 16,
 			.storagebits = 16,
 			.endianness = IIO_CPU,
diff --git a/drivers/iio/magnetometer/yamaha-yas530.c b/drivers/iio/magnetometer/yamaha-yas530.c
index d49e37edcbed..f836c7cc6790 100644
--- a/drivers/iio/magnetometer/yamaha-yas530.c
+++ b/drivers/iio/magnetometer/yamaha-yas530.c
@@ -713,7 +713,7 @@ static const struct iio_chan_spec_ext_info yas5xx_ext_info[] = {
 		.address = index,					\
 		.scan_index = index,					\
 		.scan_type = {						\
-			.sign = 's',					\
+			.format = 's',					\
 			.realbits = 32,					\
 			.storagebits = 32,				\
 			.endianness = IIO_CPU,				\
@@ -727,7 +727,7 @@ static const struct iio_chan_spec yas5xx_channels[] = {
 		.address = 0,
 		.scan_index = 0,
 		.scan_type = {
-			.sign = 's',
+			.format = 's',
 			.realbits = 32,
 			.storagebits = 32,
 			.endianness = IIO_CPU,
diff --git a/drivers/iio/orientation/hid-sensor-incl-3d.c b/drivers/iio/orientation/hid-sensor-incl-3d.c
index 4e23a598a3fb..577b4a5bad34 100644
--- a/drivers/iio/orientation/hid-sensor-incl-3d.c
+++ b/drivers/iio/orientation/hid-sensor-incl-3d.c
@@ -89,7 +89,7 @@ static const struct iio_chan_spec incl_3d_channels[] = {
 static void incl_3d_adjust_channel_bit_mask(struct iio_chan_spec *chan,
 						int size)
 {
-	chan->scan_type.sign = 's';
+	chan->scan_type.format = 's';
 	/* Real storage bits will change based on the report desc. */
 	chan->scan_type.realbits = size * 8;
 	/* Maximum size of a sample to capture is u32 */
diff --git a/drivers/iio/orientation/hid-sensor-rotation.c b/drivers/iio/orientation/hid-sensor-rotation.c
index e759f91a710a..dddf8dfc328b 100644
--- a/drivers/iio/orientation/hid-sensor-rotation.c
+++ b/drivers/iio/orientation/hid-sensor-rotation.c
@@ -54,7 +54,7 @@ static const struct iio_chan_spec dev_rot_channels[] = {
 static void dev_rot_adjust_channel_bit_mask(struct iio_chan_spec *chan,
 						int size)
 {
-	chan->scan_type.sign = 's';
+	chan->scan_type.format = 's';
 	/* Real storage bits will change based on the report desc. */
 	chan->scan_type.realbits = size * 8;
 	/* Maximum size of a sample to capture is u32 */
diff --git a/drivers/iio/position/hid-sensor-custom-intel-hinge.c b/drivers/iio/position/hid-sensor-custom-intel-hinge.c
index a26d391661fd..fb4e38dbdb89 100644
--- a/drivers/iio/position/hid-sensor-custom-intel-hinge.c
+++ b/drivers/iio/position/hid-sensor-custom-intel-hinge.c
@@ -65,7 +65,7 @@ static const struct iio_chan_spec hinge_channels[] = {
 			BIT(IIO_CHAN_INFO_SAMP_FREQ) | BIT(IIO_CHAN_INFO_HYSTERESIS),
 		.scan_index = CHANNEL_SCAN_INDEX_HINGE_ANGLE,
 		.scan_type = {
-			.sign = 's',
+			.format = 's',
 			.storagebits = 32,
 		},
 	}, {
@@ -78,7 +78,7 @@ static const struct iio_chan_spec hinge_channels[] = {
 			BIT(IIO_CHAN_INFO_SAMP_FREQ) | BIT(IIO_CHAN_INFO_HYSTERESIS),
 		.scan_index = CHANNEL_SCAN_INDEX_SCREEN_ANGLE,
 		.scan_type = {
-			.sign = 's',
+			.format = 's',
 			.storagebits = 32,
 		},
 	}, {
@@ -91,7 +91,7 @@ static const struct iio_chan_spec hinge_channels[] = {
 			BIT(IIO_CHAN_INFO_SAMP_FREQ) | BIT(IIO_CHAN_INFO_HYSTERESIS),
 		.scan_index = CHANNEL_SCAN_INDEX_KEYBOARD_ANGLE,
 		.scan_type = {
-			.sign = 's',
+			.format = 's',
 			.storagebits = 32,
 		},
 	},
diff --git a/drivers/iio/potentiostat/lmp91000.c b/drivers/iio/potentiostat/lmp91000.c
index eccc2a34358f..4bd06ada903d 100644
--- a/drivers/iio/potentiostat/lmp91000.c
+++ b/drivers/iio/potentiostat/lmp91000.c
@@ -85,7 +85,7 @@ static const struct iio_chan_spec lmp91000_channels[] = {
 				      BIT(IIO_CHAN_INFO_SCALE),
 		.scan_index = 0,
 		.scan_type = {
-			.sign = 's',
+			.format = 's',
 			.realbits = 32,
 			.storagebits = 32,
 		},
diff --git a/drivers/iio/pressure/abp2030pa.c b/drivers/iio/pressure/abp2030pa.c
index 4ca056a73cef..734cdaa4b252 100644
--- a/drivers/iio/pressure/abp2030pa.c
+++ b/drivers/iio/pressure/abp2030pa.c
@@ -426,7 +426,7 @@ static const struct iio_chan_spec abp2_channels[] = {
 					BIT(IIO_CHAN_INFO_OFFSET),
 		.scan_index = 0,
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 24,
 			.storagebits = 32,
 			.endianness = IIO_CPU,
@@ -439,7 +439,7 @@ static const struct iio_chan_spec abp2_channels[] = {
 				      BIT(IIO_CHAN_INFO_OFFSET),
 		.scan_index = 1,
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 24,
 			.storagebits = 32,
 			.endianness = IIO_CPU,
diff --git a/drivers/iio/pressure/bmp280-core.c b/drivers/iio/pressure/bmp280-core.c
index d983ce9c0b99..59e04154cfe2 100644
--- a/drivers/iio/pressure/bmp280-core.c
+++ b/drivers/iio/pressure/bmp280-core.c
@@ -161,7 +161,7 @@ static const struct iio_chan_spec bmp280_channels[] = {
 				      BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO),
 		.scan_index = 0,
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 32,
 			.storagebits = 32,
 			.endianness = IIO_CPU,
@@ -176,7 +176,7 @@ static const struct iio_chan_spec bmp280_channels[] = {
 				      BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO),
 		.scan_index = 1,
 		.scan_type = {
-			.sign = 's',
+			.format = 's',
 			.realbits = 32,
 			.storagebits = 32,
 			.endianness = IIO_CPU,
@@ -195,7 +195,7 @@ static const struct iio_chan_spec bme280_channels[] = {
 				      BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO),
 		.scan_index = 0,
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 32,
 			.storagebits = 32,
 			.endianness = IIO_CPU,
@@ -210,7 +210,7 @@ static const struct iio_chan_spec bme280_channels[] = {
 				      BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO),
 		.scan_index = 1,
 		.scan_type = {
-			.sign = 's',
+			.format = 's',
 			.realbits = 32,
 			.storagebits = 32,
 			.endianness = IIO_CPU,
@@ -225,7 +225,7 @@ static const struct iio_chan_spec bme280_channels[] = {
 				      BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO),
 		.scan_index = 2,
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 32,
 			.storagebits = 32,
 			.endianness = IIO_CPU,
@@ -246,7 +246,7 @@ static const struct iio_chan_spec bmp380_channels[] = {
 					   BIT(IIO_CHAN_INFO_LOW_PASS_FILTER_3DB_FREQUENCY),
 		.scan_index = 0,
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 32,
 			.storagebits = 32,
 			.endianness = IIO_CPU,
@@ -263,7 +263,7 @@ static const struct iio_chan_spec bmp380_channels[] = {
 					   BIT(IIO_CHAN_INFO_LOW_PASS_FILTER_3DB_FREQUENCY),
 		.scan_index = 1,
 		.scan_type = {
-			.sign = 's',
+			.format = 's',
 			.realbits = 32,
 			.storagebits = 32,
 			.endianness = IIO_CPU,
@@ -284,7 +284,7 @@ static const struct iio_chan_spec bmp580_channels[] = {
 					   BIT(IIO_CHAN_INFO_LOW_PASS_FILTER_3DB_FREQUENCY),
 		.scan_index = 0,
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 24,
 			.storagebits = 32,
 			.endianness = IIO_LE,
@@ -301,7 +301,7 @@ static const struct iio_chan_spec bmp580_channels[] = {
 					   BIT(IIO_CHAN_INFO_LOW_PASS_FILTER_3DB_FREQUENCY),
 		.scan_index = 1,
 		.scan_type = {
-			.sign = 's',
+			.format = 's',
 			.realbits = 24,
 			.storagebits = 32,
 			.endianness = IIO_LE,
diff --git a/drivers/iio/pressure/cros_ec_baro.c b/drivers/iio/pressure/cros_ec_baro.c
index c6b950c596c1..d1d722089521 100644
--- a/drivers/iio/pressure/cros_ec_baro.c
+++ b/drivers/iio/pressure/cros_ec_baro.c
@@ -158,7 +158,7 @@ static int cros_ec_baro_probe(struct platform_device *pdev)
 	channel->scan_type.shift = 0;
 	channel->scan_index = 0;
 	channel->ext_info = cros_ec_sensors_ext_info;
-	channel->scan_type.sign = 'u';
+	channel->scan_type.format = 'u';
 
 	/* Sensor specific */
 	switch (state->core.type) {
@@ -175,7 +175,7 @@ static int cros_ec_baro_probe(struct platform_device *pdev)
 	channel->type = IIO_TIMESTAMP;
 	channel->channel = -1;
 	channel->scan_index = 1;
-	channel->scan_type.sign = 's';
+	channel->scan_type.format = 's';
 	channel->scan_type.realbits = 64;
 	channel->scan_type.storagebits = 64;
 
diff --git a/drivers/iio/pressure/dlhl60d.c b/drivers/iio/pressure/dlhl60d.c
index 46feb27fe632..5fb02cdfac39 100644
--- a/drivers/iio/pressure/dlhl60d.c
+++ b/drivers/iio/pressure/dlhl60d.c
@@ -214,7 +214,7 @@ static const struct iio_chan_spec dlh_channels[] = {
 			BIT(IIO_CHAN_INFO_OFFSET),
 		.scan_index = 0,
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = DLH_NUM_PR_BITS,
 			.storagebits = 32,
 			.shift = 8,
@@ -229,7 +229,7 @@ static const struct iio_chan_spec dlh_channels[] = {
 			BIT(IIO_CHAN_INFO_OFFSET),
 		.scan_index = 1,
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = DLH_NUM_TEMP_BITS,
 			.storagebits = 32,
 			.shift = 8,
diff --git a/drivers/iio/pressure/hid-sensor-press.c b/drivers/iio/pressure/hid-sensor-press.c
index 5f1d6abda3e4..5248f8390c8e 100644
--- a/drivers/iio/pressure/hid-sensor-press.c
+++ b/drivers/iio/pressure/hid-sensor-press.c
@@ -57,7 +57,7 @@ static const struct iio_chan_spec press_channels[] = {
 static void press_adjust_channel_bit_mask(struct iio_chan_spec *channels,
 					int channel, int size)
 {
-	channels[channel].scan_type.sign = 's';
+	channels[channel].scan_type.format = 's';
 	/* Real storage bits will change based on the report desc. */
 	channels[channel].scan_type.realbits = size * 8;
 	/* Maximum size of a sample to capture is u32 */
diff --git a/drivers/iio/pressure/hsc030pa.c b/drivers/iio/pressure/hsc030pa.c
index 2d00c0656259..914513f2ca99 100644
--- a/drivers/iio/pressure/hsc030pa.c
+++ b/drivers/iio/pressure/hsc030pa.c
@@ -410,7 +410,7 @@ static const struct iio_chan_spec hsc_channels[] = {
 				      BIT(IIO_CHAN_INFO_OFFSET),
 		.scan_index = 0,
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 14,
 			.storagebits = 16,
 			.endianness = IIO_BE,
@@ -423,7 +423,7 @@ static const struct iio_chan_spec hsc_channels[] = {
 				      BIT(IIO_CHAN_INFO_OFFSET),
 		.scan_index = 1,
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 11,
 			.storagebits = 16,
 			.shift = 5,
diff --git a/drivers/iio/pressure/mpl3115.c b/drivers/iio/pressure/mpl3115.c
index aeac1586f12e..4f73f2a80298 100644
--- a/drivers/iio/pressure/mpl3115.c
+++ b/drivers/iio/pressure/mpl3115.c
@@ -341,7 +341,7 @@ static const struct iio_chan_spec mpl3115_channels[] = {
 			BIT(IIO_CHAN_INFO_SAMP_FREQ),
 		.scan_index = 0,
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 20,
 			.storagebits = 32,
 			.shift = 12,
@@ -359,7 +359,7 @@ static const struct iio_chan_spec mpl3115_channels[] = {
 			BIT(IIO_CHAN_INFO_SAMP_FREQ),
 		.scan_index = 1,
 		.scan_type = {
-			.sign = 's',
+			.format = 's',
 			.realbits = 12,
 			.storagebits = 16,
 			.shift = 4,
diff --git a/drivers/iio/pressure/mprls0025pa.c b/drivers/iio/pressure/mprls0025pa.c
index e8c495f336ff..515b7d5c01e3 100644
--- a/drivers/iio/pressure/mprls0025pa.c
+++ b/drivers/iio/pressure/mprls0025pa.c
@@ -166,7 +166,7 @@ static const struct iio_chan_spec mpr_channels[] = {
 					BIT(IIO_CHAN_INFO_OFFSET),
 		.scan_index = 0,
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 24,
 			.storagebits = 32,
 			.endianness = IIO_CPU,
diff --git a/drivers/iio/pressure/ms5611_core.c b/drivers/iio/pressure/ms5611_core.c
index bdac27bd5a5d..89705f578cc2 100644
--- a/drivers/iio/pressure/ms5611_core.c
+++ b/drivers/iio/pressure/ms5611_core.c
@@ -347,7 +347,7 @@ static const struct iio_chan_spec ms5611_channels[] = {
 			BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO),
 		.scan_index = 0,
 		.scan_type = {
-			.sign = 's',
+			.format = 's',
 			.realbits = 32,
 			.storagebits = 32,
 			.endianness = IIO_CPU,
@@ -360,7 +360,7 @@ static const struct iio_chan_spec ms5611_channels[] = {
 			BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO),
 		.scan_index = 1,
 		.scan_type = {
-			.sign = 's',
+			.format = 's',
 			.realbits = 32,
 			.storagebits = 32,
 			.endianness = IIO_CPU,
diff --git a/drivers/iio/pressure/rohm-bm1390.c b/drivers/iio/pressure/rohm-bm1390.c
index dac27fd359ad..fc6f9e66baed 100644
--- a/drivers/iio/pressure/rohm-bm1390.c
+++ b/drivers/iio/pressure/rohm-bm1390.c
@@ -176,7 +176,7 @@ static const struct iio_chan_spec bm1390_channels[] = {
 		.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE),
 		.scan_index = BM1390_CHAN_PRESSURE,
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 22,
 			.storagebits = 32,
 			.endianness = IIO_LE,
@@ -188,7 +188,7 @@ static const struct iio_chan_spec bm1390_channels[] = {
 		.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE),
 		.scan_index = BM1390_CHAN_TEMP,
 		.scan_type = {
-			.sign = 's',
+			.format = 's',
 			.realbits = 16,
 			.storagebits = 16,
 			.endianness = IIO_BE,
diff --git a/drivers/iio/pressure/st_pressure_core.c b/drivers/iio/pressure/st_pressure_core.c
index b70d1cee82f3..d74cc65986e6 100644
--- a/drivers/iio/pressure/st_pressure_core.c
+++ b/drivers/iio/pressure/st_pressure_core.c
@@ -127,7 +127,7 @@ static const struct iio_chan_spec st_press_1_channels[] = {
 		.address = ST_PRESS_1_OUT_XL_ADDR,
 		.scan_index = 0,
 		.scan_type = {
-			.sign = 's',
+			.format = 's',
 			.realbits = 24,
 			.storagebits = 32,
 			.endianness = IIO_LE,
@@ -141,7 +141,7 @@ static const struct iio_chan_spec st_press_1_channels[] = {
 		.address = ST_TEMP_1_OUT_L_ADDR,
 		.scan_index = 1,
 		.scan_type = {
-			.sign = 's',
+			.format = 's',
 			.realbits = 16,
 			.storagebits = 16,
 			.endianness = IIO_LE,
@@ -161,7 +161,7 @@ static const struct iio_chan_spec st_press_lps001wp_channels[] = {
 		.address = ST_PRESS_LPS001WP_OUT_L_ADDR,
 		.scan_index = 0,
 		.scan_type = {
-			.sign = 's',
+			.format = 's',
 			.realbits = 16,
 			.storagebits = 16,
 			.endianness = IIO_LE,
@@ -175,7 +175,7 @@ static const struct iio_chan_spec st_press_lps001wp_channels[] = {
 		.address = ST_TEMP_LPS001WP_OUT_L_ADDR,
 		.scan_index = 1,
 		.scan_type = {
-			.sign = 's',
+			.format = 's',
 			.realbits = 16,
 			.storagebits = 16,
 			.endianness = IIO_LE,
@@ -193,7 +193,7 @@ static const struct iio_chan_spec st_press_lps22hb_channels[] = {
 		.address = ST_PRESS_1_OUT_XL_ADDR,
 		.scan_index = 0,
 		.scan_type = {
-			.sign = 's',
+			.format = 's',
 			.realbits = 24,
 			.storagebits = 32,
 			.endianness = IIO_LE,
@@ -208,7 +208,7 @@ static const struct iio_chan_spec st_press_lps22hb_channels[] = {
 		.address = ST_TEMP_1_OUT_L_ADDR,
 		.scan_index = 1,
 		.scan_type = {
-			.sign = 's',
+			.format = 's',
 			.realbits = 16,
 			.storagebits = 16,
 			.endianness = IIO_LE,
diff --git a/drivers/iio/pressure/zpa2326.c b/drivers/iio/pressure/zpa2326.c
index 4923a558a26a..99ce1961a493 100644
--- a/drivers/iio/pressure/zpa2326.c
+++ b/drivers/iio/pressure/zpa2326.c
@@ -1545,7 +1545,7 @@ static const struct iio_chan_spec zpa2326_channels[] = {
 		.type                    = IIO_PRESSURE,
 		.scan_index              = 0,
 		.scan_type               = {
-			.sign                   = 'u',
+			.format                 = 'u',
 			.realbits               = 24,
 			.storagebits            = 32,
 			.endianness             = IIO_LE,
@@ -1558,7 +1558,7 @@ static const struct iio_chan_spec zpa2326_channels[] = {
 		.type                    = IIO_TEMP,
 		.scan_index              = 1,
 		.scan_type               = {
-			.sign                   = 's',
+			.format                 = 's',
 			.realbits               = 16,
 			.storagebits            = 16,
 			.endianness             = IIO_LE,
diff --git a/drivers/iio/proximity/as3935.c b/drivers/iio/proximity/as3935.c
index f1018b14aecf..ee8d2ea2fa3b 100644
--- a/drivers/iio/proximity/as3935.c
+++ b/drivers/iio/proximity/as3935.c
@@ -77,7 +77,7 @@ static const struct iio_chan_spec as3935_channels[] = {
 			BIT(IIO_CHAN_INFO_SCALE),
 		.scan_index     = 0,
 		.scan_type = {
-			.sign           = 'u',
+			.format         = 'u',
 			.realbits       = 6,
 			.storagebits    = 8,
 		},
diff --git a/drivers/iio/proximity/hx9023s.c b/drivers/iio/proximity/hx9023s.c
index 2918dfc0df54..7de66a823cf0 100644
--- a/drivers/iio/proximity/hx9023s.c
+++ b/drivers/iio/proximity/hx9023s.c
@@ -248,7 +248,7 @@ static const struct iio_event_spec hx9023s_events[] = {
 	.num_event_specs = ARRAY_SIZE(hx9023s_events),		\
 	.scan_index = idx,					\
 	.scan_type = {						\
-		.sign = 's',					\
+		.format = 's',					\
 		.realbits = 16,					\
 		.storagebits = 16,				\
 		.endianness = IIO_BE,				\
diff --git a/drivers/iio/proximity/irsd200.c b/drivers/iio/proximity/irsd200.c
index 65af31d43453..93e2e5c4218c 100644
--- a/drivers/iio/proximity/irsd200.c
+++ b/drivers/iio/proximity/irsd200.c
@@ -844,7 +844,7 @@ static const struct iio_chan_spec irsd200_channels[] = {
 		.event_spec = irsd200_event_spec,
 		.num_event_specs = ARRAY_SIZE(irsd200_event_spec),
 		.scan_type = {
-			.sign = 's',
+			.format = 's',
 			.realbits = 16,
 			.storagebits = 16,
 			.endianness = IIO_CPU,
diff --git a/drivers/iio/proximity/isl29501.c b/drivers/iio/proximity/isl29501.c
index f69db6f2f380..03ea16bfdd4d 100644
--- a/drivers/iio/proximity/isl29501.c
+++ b/drivers/iio/proximity/isl29501.c
@@ -496,7 +496,7 @@ static const struct iio_chan_spec isl29501_channels[] = {
 			BIT(IIO_CHAN_INFO_SCALE) |
 			BIT(IIO_CHAN_INFO_CALIBBIAS),
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 16,
 			.storagebits = 16,
 			.endianness = IIO_CPU,
diff --git a/drivers/iio/proximity/mb1232.c b/drivers/iio/proximity/mb1232.c
index 34b49c54e68b..eb786eeaf9f8 100644
--- a/drivers/iio/proximity/mb1232.c
+++ b/drivers/iio/proximity/mb1232.c
@@ -166,7 +166,7 @@ static const struct iio_chan_spec mb1232_channels[] = {
 				      BIT(IIO_CHAN_INFO_SCALE),
 		.scan_index = 0,
 		.scan_type = {
-			.sign = 's',
+			.format = 's',
 			.realbits = 16,
 			.storagebits = 16,
 			.endianness = IIO_CPU,
diff --git a/drivers/iio/proximity/pulsedlight-lidar-lite-v2.c b/drivers/iio/proximity/pulsedlight-lidar-lite-v2.c
index 21336b8f122a..c011f18f256b 100644
--- a/drivers/iio/proximity/pulsedlight-lidar-lite-v2.c
+++ b/drivers/iio/proximity/pulsedlight-lidar-lite-v2.c
@@ -52,7 +52,7 @@ static const struct iio_chan_spec lidar_channels[] = {
 			BIT(IIO_CHAN_INFO_RAW) | BIT(IIO_CHAN_INFO_SCALE),
 		.scan_index = 0,
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 16,
 			.storagebits = 16,
 		},
diff --git a/drivers/iio/proximity/srf08.c b/drivers/iio/proximity/srf08.c
index d7e4cc48cfbf..63896279ca1f 100644
--- a/drivers/iio/proximity/srf08.c
+++ b/drivers/iio/proximity/srf08.c
@@ -417,7 +417,7 @@ static const struct iio_chan_spec srf08_channels[] = {
 				BIT(IIO_CHAN_INFO_SCALE),
 		.scan_index = 0,
 		.scan_type = {
-			.sign = 's',
+			.format = 's',
 			.realbits = 16,
 			.storagebits = 16,
 			.endianness = IIO_CPU,
diff --git a/drivers/iio/proximity/sx9310.c b/drivers/iio/proximity/sx9310.c
index fb02eac78ed4..088c33ae9ffd 100644
--- a/drivers/iio/proximity/sx9310.c
+++ b/drivers/iio/proximity/sx9310.c
@@ -151,7 +151,7 @@ static_assert(SX9310_NUM_CHANNELS <= SX_COMMON_MAX_NUM_CHANNELS);
 	.num_event_specs = ARRAY_SIZE(sx_common_events),	 \
 	.scan_index = idx,					 \
 	.scan_type = {						 \
-		.sign = 's',					 \
+		.format = 's',					 \
 		.realbits = 12,					 \
 		.storagebits = 16,				 \
 		.endianness = IIO_BE,				 \
diff --git a/drivers/iio/proximity/sx9324.c b/drivers/iio/proximity/sx9324.c
index c7b2d03c23bc..9b26d0675957 100644
--- a/drivers/iio/proximity/sx9324.c
+++ b/drivers/iio/proximity/sx9324.c
@@ -222,7 +222,7 @@ static const struct iio_chan_spec_ext_info sx9324_channel_ext_info[] = {
 	.num_event_specs = ARRAY_SIZE(sx_common_events),	 \
 	.scan_index = idx,					 \
 	.scan_type = {						 \
-		.sign = 's',					 \
+		.format = 's',					 \
 		.realbits = 12,					 \
 		.storagebits = 16,				 \
 		.endianness = IIO_BE,				 \
diff --git a/drivers/iio/proximity/sx9360.c b/drivers/iio/proximity/sx9360.c
index 4448988d4e7e..02b7dad3686d 100644
--- a/drivers/iio/proximity/sx9360.c
+++ b/drivers/iio/proximity/sx9360.c
@@ -138,7 +138,7 @@ static const struct iio_chan_spec sx9360_channels[] = {
 		.channel = 0,
 		.scan_index = 0,
 		.scan_type = {
-			.sign = 's',
+			.format = 's',
 			.realbits = 12,
 			.storagebits = 16,
 			.endianness = IIO_BE,
@@ -160,7 +160,7 @@ static const struct iio_chan_spec sx9360_channels[] = {
 		.channel = 1,
 		.scan_index = 1,
 		.scan_type = {
-			.sign = 's',
+			.format = 's',
 			.realbits = 12,
 			.storagebits = 16,
 			.endianness = IIO_BE,
diff --git a/drivers/iio/proximity/sx9500.c b/drivers/iio/proximity/sx9500.c
index 6c67bae7488c..536ac37934c0 100644
--- a/drivers/iio/proximity/sx9500.c
+++ b/drivers/iio/proximity/sx9500.c
@@ -114,7 +114,7 @@ static const struct iio_event_spec sx9500_events[] = {
 		.num_event_specs = ARRAY_SIZE(sx9500_events),	\
 		.scan_index = idx,				\
 		.scan_type = {					\
-			.sign = 'u',				\
+			.format = 'u',				\
 			.realbits = 16,				\
 			.storagebits = 16,			\
 			.shift = 0,				\
diff --git a/drivers/iio/proximity/vl53l0x-i2c.c b/drivers/iio/proximity/vl53l0x-i2c.c
index ad3e46d47fa8..eb35694beb98 100644
--- a/drivers/iio/proximity/vl53l0x-i2c.c
+++ b/drivers/iio/proximity/vl53l0x-i2c.c
@@ -202,7 +202,7 @@ static const struct iio_chan_spec vl53l0x_channels[] = {
 				      BIT(IIO_CHAN_INFO_SCALE),
 		.scan_index = 0,
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 12,
 			.storagebits = 16,
 		},
diff --git a/drivers/iio/resolver/ad2s1210.c b/drivers/iio/resolver/ad2s1210.c
index 06d9c784f93e..2fa3c48702d0 100644
--- a/drivers/iio/resolver/ad2s1210.c
+++ b/drivers/iio/resolver/ad2s1210.c
@@ -925,7 +925,7 @@ static const struct iio_chan_spec ad2s1210_channels[] = {
 		.channel = 0,
 		.scan_index = 0,
 		.scan_type = {
-			.sign = 'u',
+			.format = 'u',
 			.realbits = 16,
 			.storagebits = 16,
 			.endianness = IIO_BE,
@@ -941,7 +941,7 @@ static const struct iio_chan_spec ad2s1210_channels[] = {
 		.channel = 0,
 		.scan_index = 1,
 		.scan_type = {
-			.sign = 's',
+			.format = 's',
 			.realbits = 16,
 			.storagebits = 16,
 			.endianness = IIO_BE,
diff --git a/drivers/iio/temperature/hid-sensor-temperature.c b/drivers/iio/temperature/hid-sensor-temperature.c
index 9f628a8e5cfb..2d631cb516af 100644
--- a/drivers/iio/temperature/hid-sensor-temperature.c
+++ b/drivers/iio/temperature/hid-sensor-temperature.c
@@ -47,7 +47,7 @@ static const struct iio_chan_spec temperature_channels[] = {
 static void temperature_adjust_channel_bit_mask(struct iio_chan_spec *channels,
 					int channel, int size)
 {
-	channels[channel].scan_type.sign = 's';
+	channels[channel].scan_type.format = 's';
 	/* Real storage bits will change based on the report desc. */
 	channels[channel].scan_type.realbits = size * 8;
 	/* Maximum size of a sample to capture is s32 */
diff --git a/drivers/iio/temperature/maxim_thermocouple.c b/drivers/iio/temperature/maxim_thermocouple.c
index 205939680fd4..cf07fc7a6925 100644
--- a/drivers/iio/temperature/maxim_thermocouple.c
+++ b/drivers/iio/temperature/maxim_thermocouple.c
@@ -45,7 +45,7 @@ static const struct iio_chan_spec max6675_channels[] = {
 			BIT(IIO_CHAN_INFO_THERMOCOUPLE_TYPE),
 		.scan_index = 0,
 		.scan_type = {
-			.sign = 's',
+			.format = 's',
 			.realbits = 13,
 			.storagebits = 16,
 			.shift = 3,
@@ -64,7 +64,7 @@ static const struct iio_chan_spec max31855_channels[] = {
 			BIT(IIO_CHAN_INFO_THERMOCOUPLE_TYPE),
 		.scan_index = 0,
 		.scan_type = {
-			.sign = 's',
+			.format = 's',
 			.realbits = 14,
 			.storagebits = 16,
 			.shift = 2,
@@ -80,7 +80,7 @@ static const struct iio_chan_spec max31855_channels[] = {
 			BIT(IIO_CHAN_INFO_RAW) | BIT(IIO_CHAN_INFO_SCALE),
 		.scan_index = 1,
 		.scan_type = {
-			.sign = 's',
+			.format = 's',
 			.realbits = 12,
 			.storagebits = 16,
 			.shift = 4,
diff --git a/drivers/iio/temperature/tmp006.c b/drivers/iio/temperature/tmp006.c
index d8d8c8936d17..1ca6273a7d9e 100644
--- a/drivers/iio/temperature/tmp006.c
+++ b/drivers/iio/temperature/tmp006.c
@@ -183,7 +183,7 @@ static const struct iio_chan_spec tmp006_channels[] = {
 		.info_mask_shared_by_all = BIT(IIO_CHAN_INFO_SAMP_FREQ),
 		.scan_index = 0,
 		.scan_type = {
-			.sign = 's',
+			.format = 's',
 			.realbits = 16,
 			.storagebits = 16,
 			.endianness = IIO_BE,
@@ -196,7 +196,7 @@ static const struct iio_chan_spec tmp006_channels[] = {
 		.info_mask_shared_by_all = BIT(IIO_CHAN_INFO_SAMP_FREQ),
 		.scan_index = 1,
 		.scan_type = {
-			.sign = 's',
+			.format = 's',
 			.realbits = 14,
 			.storagebits = 16,
 			.shift = TMP006_TAMBIENT_SHIFT,
diff --git a/include/linux/iio/common/st_sensors.h b/include/linux/iio/common/st_sensors.h
index f9ae5cdd884f..10a85626854e 100644
--- a/include/linux/iio/common/st_sensors.h
+++ b/include/linux/iio/common/st_sensors.h
@@ -61,7 +61,7 @@
 	.channel2 = ch2, \
 	.address = addr, \
 	.scan_type = { \
-		.sign = s, \
+		.format = s, \
 		.realbits = rbits, \
 		.shift = sbits - rbits, \
 		.storagebits = sbits, \
diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
index a9ecff191bd9..7e41dd92b06a 100644
--- a/include/linux/iio/iio.h
+++ b/include/linux/iio/iio.h
@@ -178,7 +178,7 @@ struct iio_event_spec {
 
 /**
  * struct iio_scan_type - specification for channel data format in buffer
- * @sign:		's' or 'u' to specify signed or unsigned
+ * @format:		(signed or unsigned) integer, or floating point
  * @realbits:		Number of valid bits of data
  * @storagebits:	Realbits + padding
  * @shift:		Shift right by this before masking out realbits.
@@ -189,7 +189,7 @@ struct iio_event_spec {
  * @endianness:		little or big endian
  */
 struct iio_scan_type {
-	char	sign;
+	char	format;
 	u8	realbits;
 	u8	storagebits;
 	u8	shift;
@@ -332,7 +332,7 @@ static inline bool iio_channel_has_available(const struct iio_chan_spec *chan,
 	.channel = -1,							\
 	.scan_index = _si,						\
 	.scan_type = {							\
-		.sign = 's',						\
+		.format = 's',						\
 		.realbits = 64,					\
 		.storagebits = 64,					\
 		},							\
diff --git a/include/linux/iio/imu/adis.h b/include/linux/iio/imu/adis.h
index bfb6df68e6c9..c4c178799859 100644
--- a/include/linux/iio/imu/adis.h
+++ b/include/linux/iio/imu/adis.h
@@ -468,7 +468,7 @@ int adis_single_conversion(struct iio_dev *indio_dev,
 	.address = (addr), \
 	.scan_index = (si), \
 	.scan_type = { \
-		.sign = 'u', \
+		.format = 'u', \
 		.realbits = (bits), \
 		.storagebits = 16, \
 		.endianness = IIO_BE, \
@@ -492,7 +492,7 @@ int adis_single_conversion(struct iio_dev *indio_dev,
 	.address = (addr), \
 	.scan_index = (si), \
 	.scan_type = { \
-		.sign = 'u', \
+		.format = 'u', \
 		.realbits = (bits), \
 		.storagebits = 16, \
 		.endianness = IIO_BE, \
@@ -510,7 +510,7 @@ int adis_single_conversion(struct iio_dev *indio_dev,
 	.address = (addr), \
 	.scan_index = (si), \
 	.scan_type = { \
-		.sign = 's', \
+		.format = 's', \
 		.realbits = (bits), \
 		.storagebits = 16, \
 		.endianness = IIO_BE, \
-- 
2.39.5


